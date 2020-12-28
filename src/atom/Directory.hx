package atom;
/**
	Represents a directory on disk that can be watched for changes. 
	
	@see https://github.com/atom/node-pathwatcher/blob/v8.1.0/src/directory.coffee#L13
**/
@:jsRequire("atom", "Directory") extern class Directory {
	/**
		Configures a new Directory instance, no files are accessed.
	**/
	function new(directoryPath:String, ?symlink:Bool):Void;
	/**
		Creates the directory on disk that corresponds to `::getPath()` if
		no such directory already exists.
	**/
	function create(?mode:Float):js.lib.Promise<Any>;
	/**
		Invoke the given callback when the directory's contents change.
	**/
	function onDidChange(callback:haxe.Constraints.Function):atom.Disposable;
	function isFile():Bool;
	function isDirectory():Bool;
	function isSymbolicLink():Bool;
	function exists():Bool;
	function existsSync():Bool;
	/**
		Return a `Boolean`, true if this `Directory` is the root directory
		of the filesystem, or false if it isn't. 
	**/
	function isRoot():Void;
	/**
		
		
		This may include unfollowed symlinks or relative directory entries. Or it
		may be fully resolved, it depends on what you give it. 
	**/
	function getPath():String;
	/**
		
		
		All relative directory entries are removed and symlinks are resolved to
		their final destination. 
	**/
	function getRealPathSync():String;
	function getBaseName():String;
	function relativize():String;
	/**
		Traverse to the parent directory.
	**/
	function getParent():atom.Directory;
	/**
		Traverse within this Directory to a child File. This method doesn't
		actually check to see if the File exists, it just creates the File object.
	**/
	function getFile(filename:String):atom.File;
	/**
		Traverse within this a Directory to a child Directory. This method
		doesn't actually check to see if the Directory exists, it just creates the
		Directory object.
	**/
	function getSubdirectory(dirname:String):atom.Directory;
	/**
		Reads file entries in this directory from disk synchronously.
	**/
	function getEntriesSync():Array<Any>;
	/**
		Reads file entries in this directory from disk asynchronously.
	**/
	function getEntries(callback:haxe.Constraints.Function):Void;
	/**
		Determines if the given path (real or symbolic) is inside this
		directory. This method does not actually check if the path exists, it just
		checks if the path is under this directory.
	**/
	function contains(pathToCheck:String):Bool;
}