package atom;
/**
	*Experimental:* A container for a related set of markers at the
	{DisplayLayer} level. Wraps an underlying {MarkerLayer} on the {TextBuffer}.
	
	This API is experimental and subject to change on any release. 
	
	@see https://github.com/atom/text-buffer/blob/v13.14.10/src/display-marker-layer.coffee#L11
**/
@:jsRequire("atom", "DisplayMarkerLayer") extern class DisplayMarkerLayer {
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
	function onDidDestroy():atom.Disposable;
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
		Create a marker with the given screen range.
	**/
	function markScreenRange(range:atom.Range, options:Dynamic):atom.DisplayMarker;
	/**
		Create a marker on this layer with its head at the given screen
		position and no tail.
	**/
	function markScreenPosition(screenPosition:atom.Point, ?options:{ /**
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
	var exclusive : Bool; /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`.
	**/
	var clipDirection : String; }):atom.DisplayMarker;
	/**
		Create a marker with the given buffer range.
	**/
	function markBufferRange(range:atom.Range, options:Dynamic):atom.DisplayMarker;
	/**
		Create a marker on this layer with its head at the given buffer
		position and no tail.
	**/
	function markBufferPosition(bufferPosition:atom.Point, ?options:{ /**
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
	var exclusive : Bool; }):atom.DisplayMarker;
	/**
		Get an existing marker by its id.
	**/
	function getMarker():atom.DisplayMarker;
	/**
		Get all markers in the layer.
	**/
	function getMarkers():Array<Any>;
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
	function findMarkers(properties:{ /**
		Only include markers starting at this `Point` in buffer coordinates.
	**/
	var startBufferPosition : atom.Point; /**
		Only include markers ending at this `Point` in buffer coordinates.
	**/
	var endBufferPosition : atom.Point; /**
		Only include markers starting at this `Point` in screen coordinates.
	**/
	var startScreenPosition : atom.Point; /**
		Only include markers ending at this `Point` in screen coordinates.
	**/
	var endScreenPosition : atom.Point; /**
		Only include markers starting inside this `Range` in buffer coordinates.
	**/
	var startsInBufferRange : atom.Range; /**
		Only include markers ending inside this `Range` in buffer coordinates.
	**/
	var endsInBufferRange : atom.Range; /**
		Only include markers starting inside this `Range` in screen coordinates.
	**/
	var startsInScreenRange : atom.Range; /**
		Only include markers ending inside this `Range` in screen coordinates.
	**/
	var endsInScreenRange : atom.Range; /**
		Only include markers starting at this row in buffer coordinates.
	**/
	var startBufferRow : Dynamic; /**
		Only include markers ending at this row in buffer coordinates.
	**/
	var endBufferRow : Dynamic; /**
		Only include markers starting at this row in screen coordinates.
	**/
	var startScreenRow : Dynamic; /**
		Only include markers ending at this row in screen coordinates.
	**/
	var endScreenRow : Dynamic; /**
		Only include markers intersecting this `Array`  of `[startRow, endRow]` in buffer coordinates.
	**/
	var intersectsBufferRowRange : Array<Any>; /**
		Only include markers intersecting this `Array`  of `[startRow, endRow]` in screen coordinates.
	**/
	var intersectsScreenRowRange : Array<Any>; /**
		Only include markers containing this `Range` in buffer coordinates.
	**/
	var containsBufferRange : atom.Range; /**
		Only include markers containing this `Point` in buffer coordinates.
	**/
	var containsBufferPosition : atom.Point; /**
		Only include markers contained in this `Range` in buffer coordinates.
	**/
	var containedInBufferRange : atom.Range; /**
		Only include markers contained in this `Range` in screen coordinates.
	**/
	var containedInScreenRange : atom.Range; /**
		Only include markers intersecting this `Range` in buffer coordinates.
	**/
	var intersectsBufferRange : atom.Range; /**
		Only include markers intersecting this `Range` in screen coordinates.
	**/
	var intersectsScreenRange : atom.Range; }):Array<Any>;
}