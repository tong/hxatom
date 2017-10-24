package atom;

/**
	A container representing a panel on the edges of the editor window.
	You should not create a `Panel` directly, instead use {Workspace::addTopPanel}
	and friends to add panels.
**/
@:require(js, atom) @:jsRequire("atom", "Panel") extern class Panel {
	/**
		Destroy and remove this panel from the UI.
	**/
	function destroy():Void;
	/**
		Invoke the given callback when the pane hidden or shown.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the pane is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns the panel's item.
	**/
	function getItem():Dynamic;
	/**
		Returns a {Number} indicating this panel's priority.
	**/
	function getPriority():Float;
	/**
		Returns a {Boolean} true when the panel is visible.
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