package atom;

/**
	Represents an individual file that can be watched, read from, and
	written to. 
	@see <https://github.com/atom/node-pathwatcher/blob/v8.0.1/src/file.coffee#L17>

**/
@:require(js, atom) @:jsRequire("atom", "File") extern class File {
	/**
		Configures a new File instance, no files are accessed.
	**/
	function new(filePath:String, ?symlink:Bool):Void;
	/**
		Creates the file on disk that corresponds to `::getPath()` if no
		such file already exists.Returns a `Promise` that resolves once the file is created on disk. It
		resolves to a boolean value that is true if the file was created or false if
		it already existed.
	**/
	function create():js.Promise<Dynamic>;
	/**
		Invoke the given callback when the file's contents change.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the file's path changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRename(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the file is deleted.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDelete(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when there is an error with the watch.
		When your callback has been invoked, the file will have unsubscribed from
		the file watches.
	**/
	function onWillThrowWatchError(callback:haxe.Constraints.Function):Void;
	/**
		Returns a `Boolean`, always true.
	**/
	function isFile():Bool;
	/**
		Returns a `Boolean`, always false.
	**/
	function isDirectory():Bool;
	/**
		Returns a `Boolean` indicating whether or not this is a symbolic link
	**/
	function isSymbolicLink():Bool;
	/**
		Returns a promise that resolves to a `Boolean`, true if the file
		exists, false otherwise.
	**/
	function exists():Bool;
	/**
		Returns a `Boolean`, true if the file exists, false otherwise.
	**/
	function existsSync():Bool;
	/**
		Get the SHA-1 digest of this fileReturns a promise that resolves to a `String`.
	**/
	function getDigest():String;
	/**
		Get the SHA-1 digest of this fileReturns a `String`.
	**/
	function getDigestSync():String;
	/**
		Sets the file's character set encoding name.
	**/
	function setEncoding(encoding:String):Void;
	/**
		Returns the `String` encoding name for this file (default: 'utf8').
	**/
	function getEncoding():String;
	/**
		Returns the `String` path for the file.
	**/
	function getPath():String;
	/**
		Returns this file's completely resolved `String` path.
	**/
	function getRealPathSync():String;
	/**
		Returns a promise that resolves to the file's completely resolved `String` path.
	**/
	function getRealPath():String;
	/**
		Return the `String` filename without any directory information. Return the `String` filename without any directory information. 
	**/
	function getBaseName():String;
	/**
		Return the `Directory` that contains this file. Return the `Directory` that contains this file. 
	**/
	function getParent():Directory;
	/**
		Reads the contents of the file.Returns a promise that resolves to a String.
	**/
	function read(flushCache:Bool):Dynamic;
	/**
		Returns a stream to read the content of the file.
	**/
	function createReadStream():Dynamic;
	/**
		Overwrites the file with the given text.Returns a `Promise` that resolves when the file has been written.
	**/
	function write(text:String):js.Promise<Dynamic>;
	/**
		Returns a stream to write content to the file.
	**/
	function createWriteStream():Dynamic;
	/**
		Overwrites the file with the given text.Returns .
	**/
	function writeSync(text:String):Dynamic;
}