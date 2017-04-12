package atom;

/**
	*Experimental:* A container for a related set of markers at the
	{DisplayLayer} level. Wraps an underlying {MarkerLayer} on the {TextBuffer}.
**/
@:require(js, atom) @:jsRequire("atom", "DisplayMarkerLayer") extern class DisplayMarkerLayer {
	/**
		Destroy this layer. 
	**/
	function destroy():Void;
	/**
		Destroy all markers in this layer. 
	**/
	function clear():Void;
	/**
		Determine whether this layer has been destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Subscribe to be notified synchronously when this layer is destroyed.
	**/
	function onDidDestroy():Disposable;
	/**
		Subscribe to be notified asynchronously whenever markers are
		created, updated, or destroyed on this layer. *Prefer this method for
		optimal performance when interacting with layers that could contain large
		numbers of markers.*
		
		Subscribers are notified once, asynchronously when any number of changes
		occur in a given tick of the event loop. You should re-query the layer
		to determine the state of markers in which you're interested in. It may
		be counter-intuitive, but this is much more efficient than subscribing to
		events on individual markers, which are expensive to deliver.
	**/
	function onDidUpdate(callback:haxe.Constraints.Function):Disposable;
	/**
		Subscribe to be notified synchronously whenever markers are created
		on this layer. *Avoid this method for optimal performance when interacting
		with layers that could contain large numbers of markers.*
		
		You should prefer {onDidUpdate} when synchronous notifications aren't
		absolutely necessary.
	**/
	function onDidCreateMarker(callback:haxe.Constraints.Function):Disposable;
	/**
		Create a marker with the given screen range.
	**/
	function markScreenRange(range:Range, options:Dynamic):DisplayMarker;
	/**
		Create a marker on this layer with its head at the given screen
		position and no tail.
	**/
	function markScreenPosition(screenPosition:Point, ?options:Dynamic):DisplayMarker;
	/**
		Create a marker with the given buffer range.
	**/
	function markBufferRange(range:Range, options:Dynamic):DisplayMarker;
	/**
		Create a marker on this layer with its head at the given buffer
		position and no tail.
	**/
	function markBufferPosition(bufferPosition:Point, ?options:Dynamic):DisplayMarker;
	/**
		Get an existing marker by its id.
	**/
	function getMarker():DisplayMarker;
	/**
		Get all markers in the layer.
	**/
	function getMarkers():Array<Dynamic>;
	/**
		Get the number of markers in the marker layer.
	**/
	function getMarkerCount():Float;
	/**
		Find markers in the layer conforming to the given parameters.
		
		This method finds markers based on the given properties. Markers can be
		associated with custom properties that will be compared with basic equality.
		In addition, there are several special properties that will be compared
		with the range of the markers rather than their properties.
	**/
	function findMarkers(properties:Dynamic):Array<Dynamic>;
}