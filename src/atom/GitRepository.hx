package atom;

/**
	Represents the underlying git operations performed by Atom.
	
	This class shouldn't be instantiated directly but instead by accessing the
	`atom.project` global and calling `getRepositories()`. Note that this will
	only be available when the project is backed by a Git repository.
	
	This class handles submodules automatically by taking a `path` argument to many
	of the methods.  This `path` argument will determine which underlying
	repository is used.
	
	For a repository with submodules this would have the following outcome:
	
	```coffee
	repo = atom.project.getRepositories()[0]
	repo.getShortHead() # 'master'
	repo.getShortHead('vendor/path/to/a/submodule') # 'dead1234'
	```
	@see <https://github.com/atom/atom/blob/v1.28.2/src/git-repository.js#L42>

**/
@:require(js, atom) @:jsRequire("atom", "GitRepository") extern class GitRepository {
	/**
		Creates a new GitRepository instance.Returns a {GitRepository} instance or `null` if the repository could not be opened.
	**/
	static function open(path:String, options:{ /**
		A {Boolean}, `true` to refresh the index and statuses when the window is focused.
	**/
	var refreshOnWindowFocus : Bool; }):GitRepository;
	/**
		Destroy this {GitRepository} object.
		
		This destroys any tasks and subscriptions and releases the underlying
		libgit2 repository handle. This method is idempotent.
	**/
	function destroy():Void;
	/**
		Returns a `Boolean` indicating if this repository has been destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Invoke the given callback when this GitRepository's destroy() method
		is invoked.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a specific file's status has
		changed. When a file is updated, reloaded, etc, and the status changes, this
		will be fired.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeStatus(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a multiple files' statuses have
		changed. For example, on window focus, the status of all the paths in the
		repo is checked. If any of them have changed, this will be fired. Call
		{::getPathStatus(path)} to get the status for your path of choice.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeStatuses(callback:haxe.Constraints.Function):Disposable;
	/**
		A `String` indicating the type of version control system used by
		this repository.Returns `"git"`.
	**/
	function getType():Dynamic;
	/**
		Returns the `String` path of the repository.
	**/
	function getPath():String;
	/**
		Returns the `String` working directory path of the repository.
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
		characters.Returns a `String`.
	**/
	function getShortHead(path:String):String;
	/**
		Is the given path a submodule in the repository?Returns a `Boolean`.
	**/
	function isSubmodule(path:String):Bool;
	/**
		
		
		Returns the number of commits behind the current branch is from the
		its upstream remote branch.
	**/
	function getAheadBehindCount(reference:String, path:String):Dynamic;
	/**
		Get the cached ahead/behind commit counts for the current branch's
		upstream branch.Returns an `Object` with the following keys:
		
		* `ahead`  The `Number` of commits ahead.
		* `behind` The `Number` of commits behind.
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
		Gets all the local and remote references.Returns an `Object` with the following keys:
		
		* `heads`   An `Array` of head reference names.
		* `remotes` An `Array` of remote reference names.
		* `tags`    An `Array` of tag reference names.
	**/
	function getReferences(path:String):Dynamic;
	/**
		
		
		Returns the current `String` SHA for the given reference.
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
		Is the given path ignored?Returns a `Boolean` that's true if the `path` is ignored.
	**/
	function isPathIgnored(path:String):Bool;
	/**
		Get the status of a directory in the repository's working directory.Returns a `Number` representing the status. This value can be passed to
		{::isStatusModified} or {::isStatusNew} to get more information.
	**/
	function getDirectoryStatus(path:String):Float;
	/**
		Get the status of a single path in the repository.Returns a `Number` representing the status. This value can be passed to
		{::isStatusModified} or {::isStatusNew} to get more information.
	**/
	function getPathStatus(path:String):Float;
	/**
		Get the cached status for the given path.Returns a status `Number` or null if the path is not in the cache.
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
		version.Returns an `Object` with the following keys:
		
		* `added` The `Number` of added lines.
		* `deleted` The `Number` of deleted lines.
	**/
	function getDiffStats(path:String):Dynamic;
	/**
		Retrieves the line diffs comparing the `HEAD` version of the given
		path and the given text.Returns an `Array` of hunk `Object`s with the following keys:
		
		* `oldStart` The line `Number` of the old hunk.
		* `newStart` The line `Number` of the new hunk.
		* `oldLines` The `Number` of lines in the old hunk.
		* `newLines` The `Number` of lines in the new hunk
	**/
	function getLineDiffs(path:String, text:String):Array<Dynamic>;
	/**
		Restore the contents of a path in the working directory and index
		to the version at `HEAD`.
		
		This is essentially the same as running:
		
		```sh
		  git reset HEAD -- <path>
		  git checkout HEAD -- <path>
		```Returns a `Boolean` that's true if the method was successful.
	**/
	function checkoutHead(path:String):Bool;
	/**
		Checks out a branch in your repository.Returns a Boolean that's true if the method was successful.
	**/
	function checkoutReference(reference:String, create:Bool):Dynamic;
}