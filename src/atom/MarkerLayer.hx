package atom;

/**
	*Experimental:* A container for a related set of markers.
	
	This API is experimental and subject to change on any release. 
	@see <https://github.com/atom/text-buffer/blob/v13.5.10/src/marker-layer.coffee#L15>

**/
@:require(js, atom) @:jsRequire("atom", "MarkerLayer") extern class MarkerLayer {
	/**
		Create a copy of this layer with markers in the same state and
		locations. 
	**/
	function copy():Void;
	/**
		Destroy this layer. 
	**/
	function destroy():Void;
	/**
		Remove all markers from this layer. 
	**/
	function clear():Void;
	/**
		Determine whether this layer has been destroyed. 
	**/
	function isDestroyed():Void;
	/**
		Get an existing marker by its id.Returns a `Marker`.
	**/
	function getMarker():Marker;
	/**
		Get all existing markers on the marker layer.Returns an `Array` of `Marker`s.
	**/
	function getMarkers():Array<Dynamic>;
	/**
		Get the number of markers in the marker layer.Returns a `Number`.
	**/
	function getMarkerCount():Float;
	/**
		Find markers in the layer conforming to the given parameters.
		
		See the documentation for {TextBuffer::findMarkers}. 
	**/
	function findMarkers():Void;
	/**
		Create a marker with the given range.Returns a `Marker`.
	**/
	function markRange(range:Range, options:Dynamic):Marker;
	/**
		Create a marker at with its head at the given position with no tail.Returns a `Marker`.
	**/
	function markPosition(position:Point, ?options:Dynamic):Marker;
	/**
		Subscribe to be notified asynchronously whenever markers are
		created, updated, or destroyed on this layer. *Prefer this method for
		optimal performance when interacting with layers that could contain large
		numbers of markers.*
		
		Subscribers are notified once, asynchronously when any number of changes
		occur in a given tick of the event loop. You should re-query the layer
		to determine the state of markers in which you're interested in. It may
		be counter-intuitive, but this is much more efficient than subscribing to
		events on individual markers, which are expensive to deliver.Returns a `Disposable`.
	**/
	function onDidUpdate(callback:haxe.Constraints.Function):Disposable;
	/**
		Subscribe to be notified synchronously whenever markers are created
		on this layer. *Avoid this method for optimal performance when interacting
		with layers that could contain large numbers of markers.*
		
		You should prefer {onDidUpdate} when synchronous notifications aren't
		absolutely necessary.Returns a `Disposable`.
	**/
	function onDidCreateMarker(callback:haxe.Constraints.Function):Disposable;
	/**
		Subscribe to be notified synchronously when this layer is destroyed.Returns a `Disposable`.
	**/
	function onDidDestroy():Disposable;
}