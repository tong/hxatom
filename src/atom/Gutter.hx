package atom;

/**
	Represents a gutter within a {TextEditor}.
	
	See {TextEditor::addGutter} for information on creating a gutter. 
	@see <https://github.com/atom/atom/blob/v1.22.1/src/gutter.coffee#L10>

**/
@:require(js, atom) @:jsRequire("atom", "Gutter") extern class Gutter {
	/**
		Destroys the gutter. 
	**/
	function destroy():Void;
	/**
		Calls your `callback` when the gutter's visibility changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the gutter is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		Determine whether the gutter is visible.Returns a `Boolean`.
	**/
	function isVisible():Bool;
	/**
		Add a decoration that tracks a {DisplayMarker}. When the marker moves,
		is invalidated, or is destroyed, the decoration will be updated to reflect
		the marker's state.Returns a `Decoration` object
	**/
	function decorateMarker(marker:DisplayMarker, decorationParams:Dynamic):Decoration;
}