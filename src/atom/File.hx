package atom;

/**
	Represents an individual file that can be watched, read from, and
	written to. 
**/
@:require(js, atom) @:jsRequire("atom", "File") extern class File {
	/**
		Configures a new File instance, no files are accessed.
	**/
	function new(filePath:String, ?symlink:Bool):Void;
	/**
		Creates the file on disk that corresponds to `::getPath()` if no
		such file already exists.
	**/
	function create():js.Promise<Dynamic>;
	/**
		Invoke the given callback when the file's contents change.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the file's path changes.
	**/
	function onDidRename(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the file is deleted.
	**/
	function onDidDelete(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when there is an error with the watch.
		When your callback has been invoked, the file will have unsubscribed from
		the file watches.
	**/
	function onWillThrowWatchError(callback:haxe.Constraints.Function):Void;
	/**
		Returns a {Boolean}, always true.
	**/
	function isFile():Bool;
	/**
		Returns a {Boolean}, always false.
	**/
	function isDirectory():Bool;
	/**
		Returns a {Boolean} indicating whether or not this is a symbolic link
	**/
	function isSymbolicLink():Bool;
	/**
		Returns a promise that resolves to a {Boolean}, true if the file
		exists, false otherwise.
	**/
	function exists():Bool;
	/**
		Returns a {Boolean}, true if the file exists, false otherwise.
	**/
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
	/**
		Returns the {String} encoding name for this file (default: 'utf8').
	**/
	function getEncoding():String;
	/**
		Returns the {String} path for the file.
	**/
	function getPath():String;
	/**
		Returns this file's completely resolved {String} path.
	**/
	function getRealPathSync():String;
	/**
		Returns a promise that resolves to the file's completely resolved {String} path.
	**/
	function getRealPath():String;
	/**
		Return the {String} filename without any directory information. 
	**/
	function getBaseName():String;
	/**
		Return the {Directory} that contains this file. 
	**/
	function getParent():Directory;
	/**
		Reads the contents of the file.
	**/
	function read(flushCache:Bool):Dynamic;
	/**
		Returns a stream to read the content of the file.
	**/
	function createReadStream():Dynamic;
	/**
		Overwrites the file with the given text.
	**/
	function write(text:String):js.Promise<Dynamic>;
	/**
		Returns a stream to write content to the file.
	**/
	function createWriteStream():Dynamic;
	/**
		Overwrites the file with the given text.
	**/
	function writeSync(text:String):Dynamic;
}