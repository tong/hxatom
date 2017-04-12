
import haxe.macro.Expr;
import haxe.Json;
import sys.FileSystem;
import sys.io.File;
import AtomAPI;

class Run {

	static inline var API_SOURCE_FILE = 'atom-api.json';

	static function main() {

		var file = Sys.args()[0];
		if( file == null ) file = API_SOURCE_FILE;
		if( !FileSystem.exists( file ) ) throw 'file not found [$file]';

		var api = Json.parse( File.getContent( file ) );
		var types = AtomAPI.build( api.classes );

		var out = 'src';
		if( !FileSystem.exists( out ) ) FileSystem.createDirectory( out );

		var printer = new haxe.macro.Printer();

		for( type in types ) {

			var modulePath = type.pack.join( '.' );
			var moduleName = type.name;

			var code = printer.printTypeDefinition( type );

			var doc = '\n\n/**\n';
			var def : APIClass = Reflect.field( api.classes, moduleName );
			if( def != null ) {
				if( def.summary != null && def.summary.length > 0 ) {
					doc += '\t'+StringTools.replace( def.summary, '\n', '\n\t' );
				}
			}
			doc += '\n**/\n';

			var lines = code.split( '\n' );
			code = lines.shift() + doc + lines.join( '\n' );

			if( !FileSystem.exists( '$out/$modulePath' ) ) FileSystem.createDirectory( '$out/$modulePath' );
			var filePath = '$out/$modulePath/$moduleName.hx';
			File.saveContent( filePath, code );
		}

		Sys.println( 'Generated [${types.length}] modules into [$out]' );
	}

}
