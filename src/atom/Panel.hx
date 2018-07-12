package atom;

/**
	A container representing a panel on the edges of the editor window.
	You should not create a `Panel` directly, instead use {Workspace::addTopPanel}
	and friends to add panels.
	
	Examples: [status-bar](https://github.com/atom/status-bar)
	and [find-and-replace](https://github.com/atom/find-and-replace) both use
	panels.
	@see <https://github.com/atom/atom/blob/v1.28.1/src/panel.js#L11>

**/
@:require(js, atom) @:jsRequire("atom", "Panel") extern class Panel {
	/**
		Destroy and remove this panel from the UI.
	**/
	function destroy():Void;
	/**
		Invoke the given callback when the pane hidden or shown.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the pane is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns the panel's item.
	**/
	function getItem():Dynamic;
	/**
		Returns a `Number` indicating this panel's priority.
	**/
	function getPriority():Float;
	/**
		Returns a `Boolean` true when the panel is visible.
	**/
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