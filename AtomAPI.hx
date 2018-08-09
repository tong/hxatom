
#if macro

import haxe.Json;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import sys.FileSystem;
import sys.io.File;

using StringTools;
using haxe.macro.TypeTools;
using haxe.macro.ComplexTypeTools;

class AtomAPI {

	static var KWDS = ['class','switch'];
	static var addDocumentation : Bool;

	static function generate( apiFile = 'atom-api.json', destination = 'src', addDocumentation = true ) {

		if( !FileSystem.exists( apiFile ) ) {
			Context.fatalError( 'API description file [$apiFile] not found', Context.currentPos() );
		}

		AtomAPI.addDocumentation = addDocumentation;
		var json = Json.parse( File.getContent( apiFile ) ).classes;
		var classes : Array<Dynamic> = [for(f in Reflect.fields( json )) Reflect.field( json, f ) ];
		var types = build( classes );
		var printer = new haxe.macro.Printer();

		for( type in types ) {
			var code = printer.printTypeDefinition( type );
			var dir = destination+'/'+type.pack.join('/');
			if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
			File.saveContent( '$dir/${type.name}.hx', code );
		}

		copyDirectory(  'extra/types', destination ); // Copy extra types
	}

	static function copyDirectory( src : String, dst : String ) {
		for( f in FileSystem.readDirectory( src ) ) {
            var s = '$src/$f';
            var d = '$dst/$f' ;
            if( FileSystem.isDirectory( s ) ) {
               if( !FileSystem.exists( d ) ) FileSystem.createDirectory( d );
               copyDirectory( s, d );
            } else File.copy( s, d );
        }
	}

	static function build( classes : Array<Dynamic> ) {

		var types = new Array<TypeDefinition>();

		// TODO HACK
		types.push( { pack: ['atom'], name: 'Marker', kind: TDAlias(macro : Any), fields: [], pos: null } );
		types.push( { pack: [], name: 'Atom', kind: TDAlias(macro : atom.AtomEnvironment), fields: [], pos: null, doc: 'Alias for atom.AtomEnvironment' } );

		for( cl in classes ) {

			// TODO pre patch
			switch cl.name {
			case 'File':
				for( m in (cast (cl.instanceMethods,Array<Dynamic>)) ) {
					switch m.name {
					case 'constructor': m.arguments[1].isOptional = true;
					case 'getBaseName': m.returnValues = [{ type: 'String', description: m.description }];
					case 'getParent': m.returnValues = [{ type: 'Directory', description: m.description }];
					}
				}
			}

			var sup = null;
			//TODO Model is not defined
			if( cl.superClass != null && cl.superClass != "Model"  ) {
				sup = { pack: ["atom"], name: cl.superClass };
			}

			var fields = new Array<Field>();
			var isStaticField = (cl.name == 'AtomEnvironment');
			for( f in (cast (cl.classProperties,Array<Dynamic>)) ) fields.push( createVarField( f, true ) );
			for( f in (cast (cl.classMethods,Array<Dynamic>)) ) fields.push( createMethodField( f, true ) );
			for( f in (cast (cl.instanceProperties,Array<Dynamic>)) ) fields.push( createVarField( f, isStaticField ) );
			for( f in (cast (cl.instanceMethods,Array<Dynamic>)) ) fields.push( createMethodField( f, isStaticField ) );

			var meta = new Array<MetadataEntry>();
			switch cl.name {
			case 'AtomEnvironment': meta.push( { name: ':native', params: [macro "atom"], pos: null } );
			case _: meta.push( { name: ':jsRequire', params: [macro "atom",macro $v{cl.name}], pos: null } );
			}

			var doc = if( addDocumentation ) {
				getDoc( cl.description )+'\n\n@see '+cl.srcUrl;
			} else null;

			types.push( {
				pack: ["atom"],
				name: cl.name,
				isExtern: true,
				kind: TDClass( sup ),
				fields: fields,
				meta: meta,
				doc: doc,
				pos: null
			} );
		}

		return types;
	}

	static function createVarField( v, isStatic = false ) : Field {
		var name = v.name;
		var access = [];
		if( isStatic ) access.push( AStatic );
		return createField( name, FVar( macro : Dynamic ), access, v.description );
	}

	static function createMethodField( m, isStatic = false ) : Field {

		var name = m.name;
		var access = [];
		var ret : ComplexType = null;

		switch name {
		case 'constructor':
			name = 'new';
			ret = macro : Void;
		default:
			if( isStatic ) access.push( AStatic );
			ret = (m.returnValues == null) ? macro : Void : getComplexType( m.returnValues );
		}

		//TODO
		var args = new Array<FunctionArg>();
		function createArgs( arguments : Array<Dynamic>) {
			for( arg in arguments ) {
				var type = getComplexType( arg.type, arg.children );
				var name : String = arg.name;
				if( name.startsWith( '...' ) ) {
					name = name.substr( 3 );
					type = macro : haxe.extern.Rest<$type>;
				}
				args.push({ name: name, type: type, opt: arg.isOptional });
			}
		}
		if( m.arguments != null ) createArgs( m.arguments );
		/*
		if( m.titledArguments != null ) {
			for( ta in cast(m.titledArguments,Array<Dynamic>) ) {
				//trace(ta);
				createArgs( ta.arguments );
			}
			//var targs : Array<Dynamic> = m.titledArguments;
			//for( a in targs ) createArgs( targs.arguments );
			//createArgs( targs );
			//for( targ in cast(m.titledArguments,Array<Dynamic>) ) createArgs( m.titledArguments.arguments );
		}
		*/

		return createField( name, FFun( { args: args, expr: null, ret: ret } ), access, m.description );
	}

	static function createField( name : String, kind : FieldType, ?access : Array<Access>, ?doc : String ) : Field {
		if( KWDS.indexOf( name ) != -1 ) {
			//TODO
			trace("INVALID FIELD NAME "+name );
			name = name+'_';
		}
		return { access: access, name: name, kind: kind, doc: getDoc( doc ), pos: null };
	}

	static function getComplexType( type, ?children : Array<Dynamic>, isOptional = false ) : ComplexType {
		var t : ComplexType = switch type {
			//case null: macro : Void;
			case null: macro : Dynamic;
			case 'Array':
				// TODO parse array type from description (?)
				macro : Array<Any>;
			case 'Boolean': macro : Bool;
			case 'Double','Float','Number': macro : Float;
			case 'Function':
				//TODO type parameters
				macro : haxe.Constraints.Function;
			case 'HTMLElement': macro : js.html.HtmlElement;
			case 'Object':
				if( children == null || children.length == 0 ) macro : Dynamic else {
					var fields = new Array<Field>();
					for( c in children ) {
						var _type = getComplexType( c.type, null, c.isOptional );
						var _name = c.name;
						var meta = new Array<MetadataEntry>();
						if( c.isOptional ) meta.push( { name: ':optional', pos: null } );
						if( KWDS.indexOf( _name ) != -1 ) {
							meta.push( { name: ':native', params: [macro $v{_name}], pos: null } );
							_name = _name+'_';
						}
						fields.push({
							name: _name,
							kind: FVar( _type ),
							meta: meta,
							doc: getDoc( c.description ),
							pos: null
						});
					}
					TAnonymous( fields );
				}
			case 'Promise': macro : js.Promise<Any>;
			case 'ReadStream': macro : js.node.fs.ReadStream;
			case 'RegExp': macro : EReg;
			case 'String': macro : String;
			case 'WriteStream': macro : js.node.fs.WriteStream;
			case _ if( Std.is( type, Array ) ):
				var types : Array<Dynamic> = cast type;
				if( types.length == 1 ) getComplexType( types[0].type ) else macro : Dynamic;
			default:
				//trace(type);
				TPath( { pack: ["atom"], name: type } );
		}
		//if( isOptional ) t = TOptional(t);
		return t;
	}

	static function getDoc( str : String ) : String {
		if( !addDocumentation || str == null || str.length == 0 )
			return null;
		//TODO
		var ereg = ~/\{[A-Z]+[a-z0-9_]*(::[a-zA-z]+)?\}/g;
        return ereg.map( str, function(r){
            var s = r.matched( 0 ).replace( '::', '.' );
            s = s.substr( 1, s.length - 2 );
            return '`$s`';
        });
	}

}

#end
