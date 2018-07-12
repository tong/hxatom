package atom;

/**
	Represents a decoration that applies to every marker on a given
	layer. Created via {TextEditor::decorateMarkerLayer}. 
	@see <https://github.com/atom/atom/blob/v1.28.1/src/layer-decoration.coffee#L7>

**/
@:require(js, atom) @:jsRequire("atom", "LayerDecoration") extern class LayerDecoration {
	/**
		Destroys the decoration. 
	**/
	function destroy():Void;
	/**
		Determine whether this decoration is destroyed.Returns a `Boolean`.
	**/
	function isDestroyed():Bool;
	/**
		Get this decoration's properties.Returns an `Object`.
	**/
	function getProperties():Dynamic;
	/**
		Set this decoration's properties.
	**/
	function setProperties(newProperties:Dynamic):Void;
	/**
		Override the decoration properties for a specific marker.
	**/
	function setPropertiesForMarker(marker:DisplayMarker, properties:Dynamic):Void;
}