package atom;

/**
	Represents a project that's opened in Atom.
**/
@:require(js, atom) @:jsRequire("atom", "Project") extern class Project {
	/**
		Invoke the given callback when the project paths change.
	**/
	function onDidChangePaths(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a text buffer is added to the
		project.
	**/
	function onDidAddBuffer(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future text
		buffers in the project.
	**/
	function observeBuffers(callback:haxe.Constraints.Function):Disposable;
	/**
		Get an {Array} of {GitRepository}s associated with the project's
		directories.
		
		This method will be removed in 2.0 because it does synchronous I/O.
		Prefer the following, which evaluates to a {Promise} that resolves to an
		{Array} of {Repository} objects:
		
		```
		Promise.all(atom.project.getDirectories().map(
		    atom.project.repositoryForDirectory.bind(atom.project)))
		```
	**/
	function getRepositories():Void;
	/**
		Get the repository for a given directory asynchronously.
	**/
	function repositoryForDirectory(directory:Directory):js.Promise<Dynamic>;
	/**
		Get an {Array} of {String}s containing the paths of the project's
		directories. 
	**/
	function getPaths():Void;
	/**
		Set the paths of the project's directories.
	**/
	function setPaths(projectPaths:Array<Dynamic>):Void;
	/**
		Add a path to the project's list of root paths
	**/
	function addPath(projectPath:String):Void;
	/**
		remove a path from the project's list of root paths.
	**/
	function removePath(projectPath:String):Void;
	/**
		Get an {Array} of {Directory}s associated with this project. 
	**/
	function getDirectories():Void;
	/**
		Get the path to the project directory that contains the given path,
		and the relative path from that project directory to the given path.
	**/
	function relativizePath(fullPath:String):Array<Dynamic>;
	/**
		Determines whether the given path (real or symbolic) is inside the
		project's directory.
		
		This method does not actually check if the path exists, it just checks their
		locations relative to each other.
	**/
	function contains(pathToCheck:String):Dynamic;
}