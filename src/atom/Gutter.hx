package atom;

/**
	Represents a gutter within a {TextEditor}.
**/
@:require(js, atom) @:jsRequire("atom", "Gutter") extern class Gutter {
	/**
		Destroys the gutter. 
	**/
	function destroy():Void;
	/**
		Calls your `callback` when the gutter's visibility changes.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the gutter is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Hide the gutter. 
	**/
	function hide():Void;
	/**
		Show the gutter. 
	**/
	function show():Void;
	/**
		Determine whether the gutter is visible.
	**/
	function isVisible():Bool;
	/**
		Add a decoration that tracks a {DisplayMarker}. When the marker moves,
		is invalidated, or is destroyed, the decoration will be updated to reflect
		the marker's state.
	**/
	function decorateMarker(marker:DisplayMarker, decorationParams:Dynamic):Decoration;
}