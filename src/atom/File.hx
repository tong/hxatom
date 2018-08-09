package atom;
/**
	Represents an individual file that can be watched, read from, and
	written to. 
	
	@see https://github.com/atom/node-pathwatcher/blob/v8.0.1/src/file.coffee#L17
**/
@:jsRequire("atom", "File") extern class File {
	/**
		Configures a new File instance, no files are accessed.
	**/
	function new(filePath:String, ?symlink:Bool):Void;
	/**
		Creates the file on disk that corresponds to `::getPath()` if no
		such file already exists.
	**/
	function create():js.Promise<Any>;
	/**
		Invoke the given callback when the file's contents change.
	**/
	function onDidChange(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the file's path changes.
	**/
	function onDidRename(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the file is deleted.
	**/
	function onDidDelete(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when there is an error with the watch.
		When your callback has been invoked, the file will have unsubscribed from
		the file watches.
	**/
	function onWillThrowWatchError(callback:haxe.Constraints.Function):Void;
	function isFile():Bool;
	function isDirectory():Bool;
	function isSymbolicLink():Bool;
	function exists():Bool;
	function existsSync():Bool;
	/**
		Get the SHA-1 digest of this file
	**/
	function getDigest():String;
	/**
		Get the SHA-1 digest of this file
	**/
	function getDigestSync():String;
	/**
		Sets the file's character set encoding name.
	**/
	function setEncoding(encoding:String):Void;
	function getEncoding():String;
	function getPath():String;
	function getRealPathSync():String;
	function getRealPath():String;
	/**
		Return the `String` filename without any directory information. 
	**/
	function getBaseName():String;
	/**
		Return the `Directory` that contains this file. 
	**/
	function getParent():atom.Directory;
	/**
		Reads the contents of the file.
	**/
	function read(flushCache:Bool):Dynamic;
	function createReadStream():Dynamic;
	/**
		Overwrites the file with the given text.
	**/
	function write(text:String):js.Promise<Any>;
	function createWriteStream():Dynamic;
	/**
		Overwrites the file with the given text.
	**/
	function writeSync(text:String):Dynamic;
}