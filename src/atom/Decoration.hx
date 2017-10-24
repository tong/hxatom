package atom;

/**
	Represents a decoration that follows a {DisplayMarker}. A decoration is
	basically a visual representation of a marker. It allows you to add CSS
	classes to line numbers in the gutter, lines, and add selection-line regions
	around marked ranges of text.
**/
@:require(js, atom) @:jsRequire("atom", "Decoration") extern class Decoration {
	/**
		Destroy this marker decoration.
		
		You can also destroy the marker if you own it, which will destroy this
		decoration. 
	**/
	function destroy():Void;
	/**
		When the {Decoration} is updated via {Decoration::update}.
	**/
	function onDidChangeProperties(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the {Decoration} is destroyed
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		An id unique across all {Decoration} objects 
	**/
	function getId():Void;
	/**
		Returns the marker associated with this {Decoration}
	**/
	function getMarker():Decoration;
	/**
		Returns the {Decoration}'s properties.
	**/
	function getProperties():Decoration;
	/**
		Update the marker with new Properties. Allows you to change the decoration's class.
	**/
	function setProperties(newProperties:Dynamic):Void;
}