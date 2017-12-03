
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

class AtomAPI {

    public static function build( api : Array<APIClass> ) : Array<TypeDefinition> {

        var KWDS = ['class','switch'];
        var pos = #if macro null #else { min: 0, max: 0, file: '' } #end;

        function escapeTypeName( name : String ) : String {
            return name.charAt( 0 ).toUpperCase() + name.substr( 1 );
        }

        function escapeName( name : String ) : String {
            //TODO HACK
            if( name == 'args...' ) name = 'args';
            else if( name.startsWith( '...' ) ) name = name.substr(3);
            return (KWDS.indexOf( name ) != -1) ? name + '_' : name;
        }

        function escapeDoc( str : String ) : String {
            var ereg = ~/\{[A-Z]+[a-z0-9_]*(::[a-zA-z]+)?\}/g;
            return ereg.map( str, function(r){
                var s = r.matched( 0 ).replace( '::', '.' );
                s = s.substr( 1, s.length - 2 );
                return '`'+s+'`';
            });
        }

        function getTypeForName( name : String ) : ComplexType {
            return switch name {
            case 'Object':
                macro: Dynamic;
            case 'Boolean': macro: Bool;
            case 'Double','Float','Number': macro: Float;
            case 'RegExp': macro: EReg;
            case 'String': macro: String;
            case 'Promise': macro: js.Promise<Dynamic>;
            case 'ReadStream': macro: js.node.fs.ReadStream;
            case 'WriteStream': macro: js.node.fs.WriteStream;
            case 'Function':
                //TODO
                macro : haxe.Constraints.Function;
            case 'Array':
                macro: Array<Dynamic>; //TODO
            case null:
                macro: Dynamic;
            case _:
                TPath( { pack: [], name: escapeTypeName( name ) } );
            }
        }

        function convertProperty( prop : APIProperty, isStatic = false ) : Field {
            var access = [];
            if( isStatic ) access.push( AStatic );
            var name = switch prop.name {
                case _: escapeName( prop.name );
            }
            // TODO HACK
            // instanceProperties type names should be specified.
            // This hack gets the name from the first occurence of {NAME} in summary
            var summary = prop.summary.trim();
            var expr = ~/.+ *\{([A-Z]+[a-z0-9_]*)\} *.+\.$/;
            var ctype = if( expr.match( summary ) ) {
                var name = expr.matched(1);
                getTypeForName( name );
            } else
                macro: Dynamic;
            return {
                access: access,
                name: name,
                kind: FVar( ctype ),
                pos: pos,
                doc: escapeDoc( prop.description )
            };
        }

        function convertMethod( method : APIMethod, isStatic = false ) : Field {

            var access = [];
            if( isStatic ) access.push( AStatic );

            var name = switch method.name {
                case 'constructor': 'new';
                case _: escapeName( method.name );
            }

            var args = new Array<FunctionArg>();
            if( method.arguments != null ) {
                for( arg in method.arguments ) {
                    var type = switch arg.name {
                    case 'args...':
                        macro : haxe.extern.Rest<Dynamic>;
                    default:
                        var t = getTypeForName( arg.type );
                        if( arg.name.startsWith( '...' ) ) {
                            t = TPath( { name : 'Rest', pack: ['haxe','extern'], params:[TPType(t)] });
                        }
                        t;
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
                //trace(method.name+'>>>>>>>>>>>');
                var retVal = method.returnValues[0];
                //var retVal = null; // = method.returnValues[0];
                /*
                for( rv in method.returnValues ) {
                    if( rv.type == null )
                        continue;
                    retVal = rv;
                    break;
                }
                if( retVal == null )
                    trace(method);
                    */
                if( retVal == null )
                    ret = macro: Void;
                else {
                    ret = getTypeForName( retVal.type );
                    //var _doc = escapeDoc( retVal.description );
                    var _doc = retVal.description;
                    //var _doc = '';
                    //if( retVal.type != null ) _doc += '@return `'+retVal.type+'`';//_doc;
                    doc += _doc;
                }
            } else {
                ret = macro: Void;
            }

            return {
                access: access,
                name: name,
                kind: FFun({
                    args: args,
                    expr: null,
                    ret: ret
                }),
                pos: pos,
                doc: escapeDoc( doc )
            };
        }

        var types = new Array<TypeDefinition>();

        for( f in Reflect.fields( api ) ) {

            var cl : APIClass = Reflect.field( api, f );
            //if( cl.name != 'CompositeDisposable' ) continue;
            //trace('#############################'+cl.name);

            switch cl.name {
            // TODO PATCH
            case 'Workspace':
                for( m in cl.instanceMethods ) {
                    if( m.name == 'hide' )
                        m.returnValues[0].type = 'Boolean';
                }
            // TODO PATCH
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

}
