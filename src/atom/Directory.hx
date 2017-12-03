package atom;

/**
	Represents a directory on disk that can be watched for changes. 
	@see <https://github.com/atom/node-pathwatcher/blob/v8.0.1/src/directory.coffee#L13>

**/
@:require(js, atom) @:jsRequire("atom", "Directory") extern class Directory {
	/**
		Configures a new Directory instance, no files are accessed.
	**/
	function new(directoryPath:String, ?symlink:Bool):Void;
	/**
		Creates the directory on disk that corresponds to `::getPath()` if
		no such directory already exists.Returns a `Promise` that resolves once the directory is created on disk. It
		resolves to a boolean value that is true if the directory was created or
		false if it already existed.
	**/
	function create(?mode:Float):js.Promise<Dynamic>;
	/**
		Invoke the given callback when the directory's contents change.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns a `Boolean`, always false.
	**/
	function isFile():Bool;
	/**
		Returns a `Boolean`, always true.
	**/
	function isDirectory():Bool;
	/**
		Returns a `Boolean` indicating whether or not this is a symbolic link
	**/
	function isSymbolicLink():Bool;
	/**
		Returns a promise that resolves to a `Boolean`, true if the
		directory exists, false otherwise.
	**/
	function exists():Bool;
	/**
		Returns a `Boolean`, true if the directory exists, false otherwise.
	**/
	function existsSync():Bool;
	/**
		Return a `Boolean`, true if this `Directory` is the root directory
		of the filesystem, or false if it isn't. 
	**/
	function isRoot():Void;
	/**
		
		
		This may include unfollowed symlinks or relative directory entries. Or it
		may be fully resolved, it depends on what you give it. Returns the directory's `String` path.
	**/
	function getPath():String;
	/**
		
		
		All relative directory entries are removed and symlinks are resolved to
		their final destination. Returns this directory's completely resolved `String` path.
	**/
	function getRealPathSync():String;
	/**
		Returns the `String` basename of the directory.
	**/
	function getBaseName():String;
	/**
		Returns the relative `String` path to the given path from this
		directory.
	**/
	function relativize():String;
	/**
		Traverse to the parent directory.Returns a `Directory`.
	**/
	function getParent():Directory;
	/**
		Traverse within this Directory to a child File. This method doesn't
		actually check to see if the File exists, it just creates the File object.Returns a `File`.
	**/
	function getFile(filename:String):File;
	/**
		Traverse within this a Directory to a child Directory. This method
		doesn't actually check to see if the Directory exists, it just creates the
		Directory object.Returns a `Directory`.
	**/
	function getSubdirectory(dirname:String):Directory;
	/**
		Reads file entries in this directory from disk synchronously.Returns an `Array` of `File` and `Directory` objects.
	**/
	function getEntriesSync():Array<Dynamic>;
	/**
		Reads file entries in this directory from disk asynchronously.
	**/
	function getEntries(callback:haxe.Constraints.Function):Void;
	/**
		Determines if the given path (real or symbolic) is inside this
		directory. This method does not actually check if the path exists, it just
		checks if the path is under this directory.Returns a `Boolean` whether the given path is inside this directory.
	**/
	function contains(pathToCheck:String):Bool;
}