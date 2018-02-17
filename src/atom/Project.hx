package atom;

/**
	Represents a project that's opened in Atom.
	
	An instance of this class is always available as the `atom.project` global.
	@see <https://github.com/atom/atom/blob/v1.24.0/src/project.js#L17>

**/
@:require(js, atom) @:jsRequire("atom", "Project") extern class Project {
	/**
		Invoke the given callback when the project paths change.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangePaths(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a text buffer is added to the
		project.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddBuffer(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future text
		buffers in the project.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeBuffers(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke a callback when a filesystem change occurs within any open
		project path.
		
		```js
		const disposable = atom.project.onDidChangeFiles(events => {
		  for (const event of events) {
		    // "created", "modified", "deleted", or "renamed"
		    console.log(`Event action: ${event.type}`)
		
		    // absolute path to the filesystem entry that was touched
		    console.log(`Event path: ${event.path}`)
		
		    if (event.type === 'renamed') {
		      console.log(`.. renamed from: ${event.oldPath}`)
		    }
		  }
		}
		
		disposable.dispose()
		```
		
		To watch paths outside of open projects, use the `watchPaths` function instead; see {PathWatcher}.
		
		When writing tests against functionality that uses this method, be sure to wait for the
		`Promise` returned by {getWatcherPromise()} before manipulating the filesystem to ensure that
		the watcher is receiving events.Returns a `Disposable` to manage this event subscription.
	**/
	function onDidChangeFiles(callback:haxe.Constraints.Function):Disposable;
	/**
		Get an `Array` of {GitRepository}s associated with the project's
		directories.
		
		This method will be removed in 2.0 because it does synchronous I/O.
		Prefer the following, which evaluates to a `Promise` that resolves to an
		`Array` of {GitRepository} objects:
		
		```
		Promise.all(atom.project.getDirectories().map(
		    atom.project.repositoryForDirectory.bind(atom.project)))
		```
	**/
	function getRepositories():Void;
	/**
		Get the repository for a given directory asynchronously.Returns a `Promise` that resolves with either:
		
		* {GitRepository} if a repository can be created for the given directory
		* `null` if no repository can be created for the given directory.
	**/
	function repositoryForDirectory(directory:Directory):js.Promise<Dynamic>;
	/**
		Get an `Array` of `String`s containing the paths of the project's
		directories.Get an `Array` of `String`s containing the paths of the project's
		directories.
	**/
	function getPaths():Array<String>;
	/**
		Set the paths of the project's directories.
	**/
	function setPaths(projectPaths:Array<Dynamic>, options:Dynamic):Void;
	/**
		Add a path to the project's list of root paths
	**/
	function addPath(projectPath:String, options:Dynamic):Void;
	/**
		Access a `Promise` that resolves when the filesystem watcher associated with a project
		root directory is ready to begin receiving events.
		
		This is especially useful in test cases, where it's important to know that the watcher is
		ready before manipulating the filesystem to produce events.Returns a `Promise` that resolves with the {PathWatcher} associated with this project root
		once it has initialized and is ready to start sending events. The Promise will reject with
		an error instead if `projectPath` is not currently a root directory.
	**/
	function getWatcherPromise(projectPath:String):js.Promise<Dynamic>;
	/**
		remove a path from the project's list of root paths.
	**/
	function removePath(projectPath:String):Void;
	/**
		Get an `Array` of `Directory`s associated with this project.
	**/
	function getDirectories():Void;
	/**
		Get the path to the project directory that contains the given path,
		and the relative path from that project directory to the given path.Get the path to the project directory that contains the given path,
		and the relative path from that project directory to the given path.
	**/
	function relativizePath(fullPath:String):Array<String>;
	/**
		Determines whether the given path (real or symbolic) is inside the
		project's directory.
		
		This method does not actually check if the path exists, it just checks their
		locations relative to each other.Returns whether the path is inside the project's root directory.
	**/
	function contains(pathToCheck:String):Dynamic;
}