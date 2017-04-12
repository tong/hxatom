package atom;

/**
	History manager for remembering which projects have been opened.
**/
@:require(js, atom) @:jsRequire("atom", "HistoryManager") extern class HistoryManager {
	/**
		Obtain a list of previously opened projects.
	**/
	function getProjects():Array<Dynamic>;
	/**
		Clear all projects from the history.
		
		Note: This is not a privacy function - other traces will still exist,
		e.g. window state.
	**/
	function clearProjects():Void;
	/**
		Invoke the given callback when the list of projects changes.
	**/
	function onDidChangeProjects(callback:haxe.Constraints.Function):Disposable;
}