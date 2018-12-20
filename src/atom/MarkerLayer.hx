package atom;
/**
	*Experimental:* A container for a related set of markers.
	
	This API is experimental and subject to change on any release. 
	
	@see https://github.com/atom/text-buffer/blob/v13.15.1/src/marker-layer.coffee#L15
**/
@:jsRequire("atom", "MarkerLayer") extern class MarkerLayer {
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
		Get an existing marker by its id.
	**/
	function getMarker():atom.Marker;
	/**
		Get all existing markers on the marker layer.
	**/
	function getMarkers():Array<Any>;
	/**
		Get the number of markers in the marker layer.
	**/
	function getMarkerCount():Float;
	/**
		Find markers in the layer conforming to the given parameters.
		
		See the documentation for {TextBuffer::findMarkers}. 
	**/
	function findMarkers():Void;
	/**
		Get the role of the marker layer e.g. `atom.selection`.
	**/
	function getRole():String;
	/**
		Create a marker with the given range.
	**/
	function markRange(range:atom.Range, options:Dynamic):atom.Marker;
	/**
		Create a marker at with its head at the given position with no tail.
	**/
	function markPosition(position:atom.Point, ?options:{ /**
		`String` Determines the rules by which changes to the buffer *invalidate* the marker. (default: 'overlap') It can be any of the following strategies, in order of fragility:
		* __never__: The marker is never marked as invalid. This is a good choice for
		  markers representing selections in an editor.
		* __surround__: The marker is invalidated by changes that completely surround it.
		* __overlap__: The marker is invalidated by changes that surround the
		  start or end of the marker. This is the default.
		* __inside__: The marker is invalidated by changes that extend into the
		  inside of the marker. Changes that end at the marker's start or
		  start at the marker's end do not invalidate the marker.
		* __touch__: The marker is invalidated by a change that touches the marked
		  region in any way, including changes that end at the marker's
		  start or start at the marker's end. This is the most fragile strategy.
	**/
	@:optional
	var invalidate : String; /**
		`Boolean` indicating whether insertions at the start or end of the marked range should be interpreted as happening *outside* the marker. Defaults to `false`, except when using the `inside` invalidation strategy or when when the marker has no tail, in which case it defaults to true. Explicitly assigning this option overrides behavior in all circumstances.
	**/
	var exclusive : Bool; }):atom.Marker;
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
	function onDidUpdate(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Subscribe to be notified synchronously whenever markers are created
		on this layer. *Avoid this method for optimal performance when interacting
		with layers that could contain large numbers of markers.*
		
		You should prefer {::onDidUpdate} when synchronous notifications aren't
		absolutely necessary.
	**/
	function onDidCreateMarker(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Subscribe to be notified synchronously when this layer is destroyed.
	**/
	function onDidDestroy():atom.Disposable;
}