
import AtomAPI;
import haxe.Json;
import haxe.format.JsonPrinter;
import haxe.io.Eof;
import haxe.macro.Expr;
import sys.FileSystem;
import sys.io.File;
import sys.io.Process;

using haxe.io.Path;

class Run {

	static inline var API_SOURCE_FILE = 'atom-api.json';

	static function get( ?args : Array<String> ) : String {
		var proc = new Process( 'curl', args );
		var buf = new StringBuf();
		while( true ) try buf.add( proc.stdout.readLine() ) catch(e:Eof) break;
		var code = proc.exitCode();
		proc.close();
		return switch code {
		case 0: buf.toString();
		default: null;
		}
	}

	static function downloadFile( url : String, ?dst : String ) : String {
		var content = get( ['-L',url] );
		if( dst != null ) {
			var dir = dst.directory();
			var str = '';
			for( part in dir.split('/') ) {
				str += part+'/';
				if( !FileSystem.exists( str ) ) FileSystem.createDirectory( str );
			}
			var ext = dst.extension();
			switch ext {
			case 'json': content = JsonPrinter.print( Json.parse( content ), '  ' );
			}
			File.saveContent( dst, content );
		}
		return content;
	}

	static function build( api : Array<APIClass>, path : String ) : Array<TypeDefinition> {

		if( !FileSystem.exists( path ) ) FileSystem.createDirectory( path );

		var types = AtomAPI.build( api );
        var printer = new haxe.macro.Printer();

        for( type in types ) {

            var modulePath = type.pack.join( '.' );
            var moduleName = type.name;
            var code = printer.printTypeDefinition( type );

			var doc = '\n\n/**\n';
            var def : APIClass = Reflect.field( api, moduleName );
            if( def != null ) {
				var str = if( def.description != null && def.description.length > 0 )
					def.description
				else if( def.summary != null && def.summary.length > 0 )
					def.summary;
				else "";
				str = StringTools.replace( str, '\n', '\n\t' );
				doc += '\t'+str;
				if( def.srcUrl != null ) doc += '\n\t@see <'+def.srcUrl+'>\n';
            }
            doc += '\n**/\n';
            var lines = code.split( '\n' );
            code = lines.shift() + doc + lines.join( '\n' );

            if( !FileSystem.exists( '$path/$modulePath' ) ) FileSystem.createDirectory( '$path/$modulePath' );

            var filePath = '$path/$modulePath/$moduleName.hx';
            File.saveContent( filePath, code );
        }

        return types;
    }

	static function main() {

		var args = Sys.args();
		if( Sys.getEnv( 'HAXELIB_RUN' ) == '1' ) args.pop();

		switch args[0] {

		case 'build', null:

			var file = args[1];
			if( file == null ) file = API_SOURCE_FILE;
			if( !FileSystem.exists( file ) ) throw 'file not found [$file]';

			var api : Array<APIClass> = Json.parse( File.getContent( file ) ).classes;
			var out = 'src';
			var types = build( api, out );
			Sys.println( 'Generated [${types.length}] modules into [$out]' );

		case 'update':
			downloadFile( 'https://api.github.com/repos/atom/atom/releases', 'api/releases.json' );
			var latest = Json.parse( downloadFile( 'https://api.github.com/repos/atom/atom/releases/latest', 'api/latest.json' ) );
			var version = latest.tag_name;
			downloadFile( 'https://github.com/atom/atom/releases/download/$version/atom-api.json', 'api/atom-api-$version.json' );

		}
	}

}
