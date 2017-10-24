package atom;

/**
	Represents the underlying git operations performed by Atom.
**/
@:require(js, atom) @:jsRequire("atom", "GitRepository") extern class GitRepository {
	/**
		Creates a new GitRepository instance.
	**/
	static function open(path:String, options:Dynamic):GitRepository;
	/**
		Destroy this {GitRepository} object.
		
		This destroys any tasks and subscriptions and releases the underlying
		libgit2 repository handle. This method is idempotent.
	**/
	function destroy():Void;
	/**
		Returns a {Boolean} indicating if this repository has been destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Invoke the given callback when this GitRepository's destroy() method
		is invoked.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a specific file's status has
		changed. When a file is updated, reloaded, etc, and the status changes, this
		will be fired.
	**/
	function onDidChangeStatus(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a multiple files' statuses have
		changed. For example, on window focus, the status of all the paths in the
		repo is checked. If any of them have changed, this will be fired. Call
		{::getPathStatus(path)} to get the status for your path of choice.
	**/
	function onDidChangeStatuses(callback:haxe.Constraints.Function):Disposable;
	/**
		A {String} indicating the type of version control system used by
		this repository.
	**/
	function getType():Dynamic;
	/**
		Returns the {String} path of the repository.
	**/
	function getPath():String;
	/**
		Returns the {String} working directory path of the repository.
	**/
	function getWorkingDirectory():String;
	/**
		Returns true if at the root, false if in a subfolder of the
		repository.
	**/
	function isProjectAtRoot():Dynamic;
	/**
		Makes a path relative to the repository's working directory.
	**/
	function relativize():Void;
	/**
		Returns true if the given branch exists.
	**/
	function hasBranch():Dynamic;
	/**
		Retrieves a shortened version of the HEAD reference value.
		
		This removes the leading segments of `refs/heads`, `refs/tags`, or
		`refs/remotes`.  It also shortens the SHA-1 of a detached `HEAD` to 7
		characters.
	**/
	function getShortHead(path:String):String;
	/**
		Is the given path a submodule in the repository?
	**/
	function isSubmodule(path:String):Bool;
	/**
		Returns the number of commits behind the current branch is from the
		its upstream remote branch.
	**/
	function getAheadBehindCount(reference:String, path:String):Dynamic;
	/**
		Get the cached ahead/behind commit counts for the current branch's
		upstream branch.
	**/
	function getCachedUpstreamAheadBehindCount(path:String):Dynamic;
	/**
		Returns the git configuration value specified by the key.
	**/
	function getConfigValue(key:String, path:String):Dynamic;
	/**
		Returns the origin url of the repository.
	**/
	function getOriginURL(?path:String):Dynamic;
	/**
		Returns the upstream branch for the current HEAD, or null if there
		is no upstream branch for the current HEAD.
	**/
	function getUpstreamBranch(path:String):Dynamic;
	/**
		Gets all the local and remote references.
	**/
	function getReferences(path:String):Dynamic;
	/**
		Returns the current {String} SHA for the given reference.
	**/
	function getReferenceTarget(reference:String, path:String):String;
	/**
		Returns true if the given path is modified.
	**/
	function isPathModified(path:String):Dynamic;
	/**
		Returns true if the given path is new.
	**/
	function isPathNew(path:String):Dynamic;
	/**
		Is the given path ignored?
	**/
	function isPathIgnored(path:String):Bool;
	/**
		Get the status of a directory in the repository's working directory.
	**/
	function getDirectoryStatus(path:String):Float;
	/**
		Get the status of a single path in the repository.
	**/
	function getPathStatus(path:String):Float;
	/**
		Get the cached status for the given path.
	**/
	function getCachedPathStatus(path:String):Float;
	/**
		Returns true if the given status indicates modification.
	**/
	function isStatusModified(status:Float):Dynamic;
	/**
		Returns true if the given status indicates a new path.
	**/
	function isStatusNew(status:Float):Dynamic;
	/**
		Retrieves the number of lines added and removed to a path.
		
		This compares the working directory contents of the path to the `HEAD`
		version.
	**/
	function getDiffStats(path:String):Dynamic;
	/**
		Retrieves the line diffs comparing the `HEAD` version of the given
		path and the given text.
	**/
	function getLineDiffs(path:String, text:String):Array<Dynamic>;
	/**
		Restore the contents of a path in the working directory and index
		to the version at `HEAD`.
		
		This is essentially the same as running:
		
		```sh
		  git reset HEAD -- <path>
		  git checkout HEAD -- <path>
		```
	**/
	function checkoutHead(path:String):Bool;
	/**
		Checks out a branch in your repository.
	**/
	function checkoutReference(reference:String, create:Bool):Dynamic;
}