
import haxe.macro.Expr;

using StringTools;
using haxe.macro.ComplexTypeTools;

@:enum abstract APIVisibility(String) from String {
    var Public = "Public";
    var Extended = "Extended";
    var Essential = "Essential";
}

typedef APIProperty = {
    var name : String;
    var sectionName : String;
    var srcUrl : String;
    var visibility : APIVisibility;
    var summary : String;
    var description : String;
}

typedef APIArgument = {
    var name : String;
    var description : String;
    var type : String;
    var isOptional : Bool;
    var children : Array<Dynamic>;
}

typedef APITitledArgument = {
    var title : String;
    var description : String;
    var arguments : Array<APIArgument>;
}

typedef APIReturnValue = {
    var type : String;
    var description : String;
}

typedef APISection = {
    var name : String;
    var description : String;
}

typedef APIMethod = {
    var name : String;
    var sectionName : String;
    var srcUrl : String;
    var visibility : APIVisibility;
    var summary : String;
    var description : String;
    @:optional var arguments : Array<APIArgument>;
    @:optional var titledArguments : Array<APITitledArgument>;
    @:optional var returnValues : Array<APIReturnValue>;
}

typedef APIClass = {
    var name : String;
    var superClass : String;
    var filename : String;
    var srcUrl : String;
    var sections : Array<APISection>;
    var classMethods : Array<APIMethod>;
    var instanceMethods : Array<APIMethod>;
    var classProperties : Array<APIProperty>;
    var instanceProperties : Array<APIProperty>;
    var visibility : APIVisibility;
    var summary : String;
    var description : String;
    var examples : Array<APIExample>;
}

typedef APIExample = {
    var description : String;
    var lang : String;
    var code : String;
    var raw : Bool;
}

/**/
class AtomAPI {

    static var KWDS(default,null) = ['class','switch'];

    static var pos = #if macro null #else { min: 0, max: 0, file: '' } #end;

    public static function create( api : Array<APIClass> ) : Array<TypeDefinition> {

        var types = new Array<TypeDefinition>();

        for( f in Reflect.fields( api ) ) {

            var cl : APIClass = Reflect.field( api, f );
            //if( cl.name != 'ContextMenuManager' ) continue;
            //trace('#############################'+cl.name);

            // PRE PATCH
            switch cl.name {
            case 'Workspace':
                for( m in cl.instanceMethods ) {
                    if( m.name == 'hide' )
                        m.returnValues[0].type = 'Boolean';
                }
            case 'Project':
                for( m in cl.instanceMethods ) {
                    switch m.name {
                    case 'getPaths':
                        m.returnValues = [ { type: 'Array<String>', description: m.description } ];
                    case 'relativizePath':
                        m.returnValues = [ { type: 'Array<String>', description: m.description } ];
                    }
                }
            case 'File':
                for( m in cl.instanceMethods ) {
                    switch m.name {
                    case 'constructor':
                        m.arguments[1].isOptional = true;
                    case 'getBaseName':
                        m.returnValues = [ { type: 'String', description: m.description } ];
                    case 'getParent':
                        //trace(m);
                        m.returnValues = [ { type: 'Directory', description: m.description } ];
                    }
                }
            }

            var clTypes = convertClass( cl );
            types = types.concat( clTypes );
        }

        ///////////////////////////// TODO HACK

        types.push( {
            pack: ['atom'],
            name: 'JQuery',
            kind: TDAlias( macro: js.jquery.JQuery ),
            pos: pos,
            fields: []
        } );
        types.push( {
			pack: ['atom'],
			name: 'Marker',
            kind: TDAlias( macro: Any ),
            pos: pos,
            fields: [],
            //isExtern: true
		} );

        ///////////////////////////////////

        return types;
    }

    static function escapeTypeName( name : String ) : String {
        return name.charAt( 0 ).toUpperCase() + name.substr( 1 );
    }

    /*
    static function escapeFieldName( field : Field ) : Field {
        return null;
    }
    */

    static function escapeName( name : String ) : String {
        //TODO HACK
        //if( name == null ) return null;
        if( name == 'args...' ) name = 'args';
        else if( name.startsWith( '...' ) ) name = name.substr(3);
        return (KWDS.indexOf( name ) != -1) ? name + '_' : name;
    }

    static function escapeDoc( str : String ) : String {
        var ereg = ~/\{[A-Z]+[a-z0-9_]*(::[a-zA-z]+)?\}/g;
        return ereg.map( str, function(r){
            var s = r.matched( 0 ).replace( '::', '.' );
            s = s.substr( 1, s.length - 2 );
            return '`'+s+'`';
        });
    }

    static function getTypeForName( name : String ) : ComplexType {
        return switch name {
        case 'Object': macro: Dynamic;
        case 'Boolean': macro : Bool;
        case 'Double','Float','Number': macro : Float;
        case 'RegExp': macro : EReg;
        case 'String': macro : String;
        case 'Promise': macro : js.Promise<Dynamic>;
        case 'ReadStream': macro : js.node.fs.ReadStream;
        case 'WriteStream': macro : js.node.fs.WriteStream;
        case 'HTMLElement': macro : js.html.HtmlElement;
        case 'Function':
            //TODO
            //trace(">>>",name);
            macro : haxe.Constraints.Function;
        case 'Array':
            // TODO parse array type from description (?)
            macro : Array<Dynamic>;
        case null:
            macro : Dynamic;
        case 'TextEditorRegistry': macro : Dynamic; // HACK
        case _:
            /*
            for( t in types ) {
                if( (name==t.name) ) {
                    trace( 'FOUND: '+name );
                }
                //trace(name,t.name,(name==t.name));
                switch t.kind {
                case TDClass(sup,interfaces,isInterface):
                    trace(name);
                default:
                    trace('?');
                }
            }
            */
            TPath( { pack: [], name: escapeTypeName( name ) } );
        }
    }

    static function convertProperty( prop : APIProperty, isStatic = false ) : Field {

        var name = prop.name;
        if( name == 'args...' ) name = 'args';
        else if( name.startsWith( '...' ) ) name = name.substr(3);
        else {
            //trace( name, KWDS.indexOf( name ) );
        }

        /*
        //trace(">>>>>> "+name);
        var meta = new Array<MetadataEntry>();
        if( KWDS.indexOf( name ) != -1 ) {
            trace(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
            var ename = name+'_';
            meta.push( { name: ':native', params: [ macro $i{'js'}, macro $i{'atom'} ], pos: pos } );
            name = ename;
        }
        */

        // HACK
        // instanceProperties type names should be specified.
        // This hack gets the name from the first occurence of {NAME} in summary
        var expr = ~/\{([A-Z][a-zA-Z]+)\}.*/;
        var doc = prop.summary;
        if( doc == null || doc.length == 0 ) doc = prop.description;
        doc = doc.trim();

        var ctype = if( expr.match( doc ) ) {
            getTypeForName( expr.matched( 1 ) );
        } else {
            macro : Dynamic;
        }

        var field : Field = {
            name: prop.name,
            access: [],
            pos: pos,
            kind: FVar( ctype ),
            doc: escapeDoc( prop.description )
        };

        if( isStatic ) field.access.push( AStatic );

        return field;
    }

    static function convertMethod( method : APIMethod, isStatic = false ) : Field {

        var access = [];
        if( isStatic ) access.push( AStatic );

        var name = switch method.name {
            case 'constructor': 'new';
            //case _: escapeName( method.name );
            case _: method.name;
        }

        var args = new Array<FunctionArg>();
        var methodArgs = method.arguments;
        if( methodArgs == null ) {
            if( method.titledArguments != null ) {
                methodArgs = method.titledArguments[0].arguments;
            }
        }
        if( methodArgs != null ) {
            for( arg in methodArgs ) {
                var type = switch arg.name {
                case 'args...':
                    macro : haxe.extern.Rest<Dynamic>;
                default:
                    var type = getTypeForName( arg.type );
                    switch arg.type {
                    case 'Object':
                        if( arg.children != null ) {
                            var fields = new Array<Field>();
                            for( child in arg.children ) {
                                var name = child.name;
                                var meta = new Array<MetadataEntry>();
                                if( KWDS.indexOf( name ) != -1 ) {
                                    var ename = name+'_';
                                    meta.push(
                                        {
                                            name: ':native',
                                            params: [ { expr: EConst( CString( name ) ), pos: pos } ],
                                            pos: pos
                                        }
                                    );
                                    name = ename;
                                }
                                if( child.isOptional ) meta.push( { name: ":optional", pos: pos } );
                                fields.push( {
                                    name: name,
                                    doc: child.description,
                                    kind: FVar( getTypeForName( child.type ) ),
                                    meta: meta,
                                    pos: pos
                                } );
                            }
                            type = TAnonymous( fields );
                        }
                    }
                    if( arg.name != null ) {
                        if( arg.name.startsWith( '...' ) ) {
                            type = TPath( { pack: ['haxe','extern'], name : 'Rest', params: [TPType(type)] });
                        }
                    }
                    if( type == null ) {
                        type = macro : Dynamic;
                    }
                    type;
                }

                args.push({
                    opt: arg.isOptional,
                    name: escapeName( arg.name ),
                    type: type
                });
            }
        }

        var ret : ComplexType = null;
        var doc = method.description;
        if( doc == null ) doc = '';

        if( method.returnValues != null ) {
            //TODO
            //trace(method.name+'>>>>>>>>>>>');
            var retval = method.returnValues[0];
            //var retval = null; // = method.returnValues[0];
            /*
            for( rv in method.returnValues ) {
                if( rv.type == null )
                    continue;
                retval = rv;
                break;
            }
            if( retval == null )
                trace(method);
                */
            if( retval == null )
                ret = macro : Void;
            else {
                ret = getTypeForName( retval.type );
                //var _doc = escapeDoc( retval.description );
                var _doc = retval.description;
                //var _doc = '';
                //if( retval.type != null ) _doc += '@return `'+retval.type+'`';//_doc;
                doc += _doc;
            }
        } else {
            ret = macro : Void;
        }

        return {
            access: access,
            name: name,
            kind: FFun( { args: args, expr: null, ret: ret } ),
            doc: escapeDoc( doc ),
            pos: pos
        };
    }

    static function convertClass( cl : APIClass ) : Array<TypeDefinition> {

        var types = new Array<TypeDefinition>();
        //var extraTypes = new Array<TypeDefinition>();

        var sup = null;
        if( cl.superClass != null && cl.superClass != "Model" ) {
            sup = { pack: ["atom"], name: escapeTypeName( cl.superClass ) };
        }

        var fields = new Array<Field>();

        for( f in cl.classProperties ) {
            trace( f );
        }
        for( f in cl.instanceProperties ) {
            fields.push( convertProperty( f, (cl.name == 'AtomEnvironment') ) );
        }
        for( f in cl.classMethods ) {
            fields.push( convertMethod( f, true ) );
        }
        for( f in cl.instanceMethods ) {
            fields.push( convertMethod( f, (cl.name == 'AtomEnvironment')  ) );
        }

        var meta = [
            { name: ':require', params: [ macro $i{'js'}, macro $i{'atom'} ], pos: pos }
        ];

        ///////////////////////////// TODO HACK
        var clName = cl.name;
        switch cl.name {
        case 'AtomEnvironment':
            meta.push( { name: ':native', params: [macro 'atom'], pos: pos } );
        //case 'Emitter','File','CompositeDisposable':
        case _:
            meta.push({
                name: ":jsRequire",
                params: [
                    macro 'atom',
                    { expr: EConst( CString( cl.name ) ), pos: pos }
                ],
                pos: pos
            });
        }

        types.push({
            meta: meta,
            isExtern: true,
            pack: ['atom'],
            name: cl.name,
            fields: fields,
            kind: TDClass( sup ),
            pos: pos
        });

        //return types.concat( extraTypes );
        return types;
    }

}
