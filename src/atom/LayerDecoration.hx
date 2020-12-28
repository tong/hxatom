package atom;
/**
	Represents a decoration that applies to every marker on a given
	layer. Created via {TextEditor::decorateMarkerLayer}. 
	
	@see https://github.com/atom/atom/blob/v1.53.0/src/layer-decoration.coffee#L7
**/
@:jsRequire("atom", "LayerDecoration") extern class LayerDecoration {
	/**
		Destroys the decoration. 
	**/
	function destroy():Void;
	/**
		Determine whether this decoration is destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Get this decoration's properties.
	**/
	function getProperties():Dynamic;
	/**
		Set this decoration's properties.
	**/
	function setProperties(newProperties:Dynamic):Void;
	/**
		Override the decoration properties for a specific marker.
	**/
	function setPropertiesForMarker(marker:atom.DisplayMarker, properties:Dynamic):Void;
}