package atom;
/**
	Represents a gutter within a {TextEditor}.
	
	See {TextEditor::addGutter} for information on creating a gutter.
	
	@see https://github.com/atom/atom/blob/v1.31.2/src/gutter.js#L8
**/
@:jsRequire("atom", "Gutter") extern class Gutter {
	/**
		Destroys the gutter.
	**/
	function destroy():Void;
	/**
		Calls your `callback` when the gutter's visibility changes.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Calls your `callback` when the gutter is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):atom.Disposable;
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
	function decorateMarker(marker:atom.DisplayMarker, decorationParams:{ /**
		__Caveat__: set to `'line-number'` if this is the line-number gutter, `'gutter'` otherwise. This cannot be overridden.
	**/
	var type : Dynamic; }):atom.Decoration;
}