package atom;
/**
	A container representing a panel on the edges of the editor window.
	You should not create a `Panel` directly, instead use `Workspace.addTopPanel`
	and friends to add panels.
	
	Examples: [status-bar](https://github.com/atom/status-bar)
	and [find-and-replace](https://github.com/atom/find-and-replace) both use
	panels.
	
	@see https://github.com/atom/atom/blob/v1.32.2/src/panel.js#L11
**/
@:jsRequire("atom", "Panel") extern class Panel {
	/**
		Destroy and remove this panel from the UI.
	**/
	function destroy():Void;
	/**
		Invoke the given callback when the pane hidden or shown.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the pane is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):atom.Disposable;
	function getItem():Dynamic;
	function getPriority():Float;
	function isVisible():Bool;
	/**
		Hide this panel
	**/
	function hide():Void;
	/**
		Show this panel
	**/
	function show():Void;
}