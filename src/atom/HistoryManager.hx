package atom;

/**
	History manager for remembering which projects have been opened.
	
	An instance of this class is always available as the `atom.history` global.
	
	The project history is used to enable the 'Reopen Project' menu.
	@see <https://github.com/atom/atom/blob/v1.27.2/src/history-manager.js#L8>

**/
@:require(js, atom) @:jsRequire("atom", "HistoryManager") extern class HistoryManager {
	/**
		Obtain a list of previously opened projects.Returns an `Array` of {HistoryProject} objects, most recent first.
	**/
	function getProjects():Array<Dynamic>;
	/**
		Clear all projects from the history.
		
		Note: This is not a privacy function - other traces will still exist,
		e.g. window state.
		
		Return a `Promise` that resolves when the history has been successfully
		cleared.
	**/
	function clearProjects():Void;
	/**
		Invoke the given callback when the list of projects changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeProjects(callback:haxe.Constraints.Function):Disposable;
}