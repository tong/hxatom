package atom;

/**
	Represents a decoration that follows a {DisplayMarker}. A decoration is
	basically a visual representation of a marker. It allows you to add CSS
	classes to line numbers in the gutter, lines, and add selection-line regions
	around marked ranges of text.
	
	{Decoration} objects are not meant to be created directly, but created with
	{TextEditor::decorateMarker}. eg.
	
	```coffee
	range = editor.getSelectedBufferRange() # any range you like
	marker = editor.markBufferRange(range)
	decoration = editor.decorateMarker(marker, {type: 'line', class: 'my-line-class'})
	```
	
	Best practice for destroying the decoration is by destroying the {DisplayMarker}.
	
	```coffee
	marker.destroy()
	```
	
	You should only use {Decoration::destroy} when you still need or do not own
	the marker.
	@see <https://github.com/atom/atom/blob/v1.27.0-beta1/src/decoration.js#L38>

**/
@:require(js, atom) @:jsRequire("atom", "Decoration") extern class Decoration {
	/**
		Destroy this marker decoration.
		
		You can also destroy the marker if you own it, which will destroy this
		decoration.
	**/
	function destroy():Void;
	/**
		When the `Decoration` is updated via `Decoration.update`.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeProperties(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the `Decoration` is destroyedReturns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		An id unique across all `Decoration` objects
	**/
	function getId():Void;
	/**
		Returns the marker associated with this `Decoration`
	**/
	function getMarker():Decoration;
	/**
		Check if this decoration is of type `type`Returns `Boolean`
	**/
	function isType(type:String):Bool;
	/**
		Returns the `Decoration`'s properties.
	**/
	function getProperties():Decoration;
	/**
		Update the marker with new Properties. Allows you to change the decoration's class.
	**/
	function setProperties(newProperties:Dynamic):Void;
}