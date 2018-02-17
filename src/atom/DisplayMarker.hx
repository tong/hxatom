package atom;

/**
	Represents a buffer annotation that remains logically stationary
	even as the buffer changes. This is used to represent cursors, folds, snippet
	targets, misspelled words, and anything else that needs to track a logical
	location in the buffer over time.
	
	### DisplayMarker Creation
	
	Use {DisplayMarkerLayer::markBufferRange} or {DisplayMarkerLayer::markScreenRange}
	rather than creating Markers directly.
	
	### Head and Tail
	
	Markers always have a *head* and sometimes have a *tail*. If you think of a
	marker as an editor selection, the tail is the part that's stationary and the
	head is the part that moves when the mouse is moved. A marker without a tail
	always reports an empty range at the head position. A marker with a head position
	greater than the tail is in a "normal" orientation. If the head precedes the
	tail the marker is in a "reversed" orientation.
	
	### Validity
	
	Markers are considered *valid* when they are first created. Depending on the
	invalidation strategy you choose, certain changes to the buffer can cause a
	marker to become invalid, for example if the text surrounding the marker is
	deleted. The strategies, in order of descending fragility:
	
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
	
	See {TextBuffer::markRange} for usage. 
	@see <https://github.com/atom/text-buffer/blob/v13.9.3/src/display-marker.coffee#L43>

**/
@:require(js, atom) @:jsRequire("atom", "DisplayMarker") extern class DisplayMarker {
	/**
		Destroys the marker, causing it to emit the 'destroyed' event. Once
		destroyed, a marker cannot be restored by undo/redo operations. 
	**/
	function destroy():Void;
	/**
		Creates and returns a new {DisplayMarker} with the same properties as
		this marker.
		
		`Selection` markers (markers with a custom property `type: "selection"`)
		should be copied with a different `type` value, for example with
		`marker.copy({type: null})`. Otherwise, the new marker's selection will
		be merged with this marker's selection, and a `null` value will be
		returned.Returns a {DisplayMarker}.
	**/
	function copy(?properties:Dynamic):DisplayMarker;
	/**
		Invoke the given callback when the state of the marker changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the marker is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns a `Boolean` indicating whether the marker is valid.
		Markers can be invalidated when a region surrounding them in the buffer is
		changed.
	**/
	function isValid():Bool;
	/**
		Returns a `Boolean` indicating whether the marker has been
		destroyed. A marker can be invalid without being destroyed, in which case
		undoing the invalidating operation would restore the marker. Once a marker
		is destroyed by calling {DisplayMarker::destroy}, no undo/redo operation
		can ever bring it back.
	**/
	function isDestroyed():Bool;
	/**
		Returns a `Boolean` indicating whether the head precedes the tail.
	**/
	function isReversed():Bool;
	/**
		Returns a `Boolean` indicating whether changes that occur exactly
		at the marker's head or tail cause it to move.
	**/
	function isExclusive():Bool;
	/**
		Get the invalidation strategy for this marker.
		
		Valid values include: `never`, `surround`, `overlap`, `inside`, and `touch`.Returns a `String`.
	**/
	function getInvalidationStrategy():String;
	/**
		Returns an `Object` containing any custom properties associated with
		the marker.
	**/
	function getProperties():Dynamic;
	/**
		Merges an `Object` containing new properties into the marker's
		existing properties.
	**/
	function setProperties(properties:Dynamic):Void;
	/**
		Returns whether this marker matches the given parameters. The
		parameters are the same as {DisplayMarkerLayer::findMarkers}.
	**/
	function matchesProperties():Dynamic;
	/**
		Compares this marker to another based on their ranges.Returns a `Number`
	**/
	function compare(other:DisplayMarker):Float;
	/**
		Returns a `Boolean` indicating whether this marker is equivalent to
		another marker, meaning they have the same range and options.
	**/
	function isEqual(other:DisplayMarker):Bool;
	/**
		Gets the buffer range of this marker.Returns a `Range`.
	**/
	function getBufferRange():Range;
	/**
		Gets the screen range of this marker.Returns a `Range`.
	**/
	function getScreenRange():Range;
	/**
		Modifies the buffer range of this marker.
	**/
	function setBufferRange(bufferRange:Range, ?properties:Dynamic):Void;
	/**
		Modifies the screen range of this marker.
	**/
	function setScreenRange(screenRange:Range, ?options:Dynamic):Void;
	/**
		Retrieves the buffer position of the marker's head.Returns a `Point`.
	**/
	function getHeadBufferPosition():Point;
	/**
		Sets the buffer position of the marker's head.
	**/
	function setHeadBufferPosition(bufferPosition:Point):Void;
	/**
		Retrieves the screen position of the marker's head.Returns a `Point`.
	**/
	function getHeadScreenPosition(?options:Dynamic):Point;
	/**
		Sets the screen position of the marker's head.
	**/
	function setHeadScreenPosition(screenPosition:Point, ?options:Dynamic):Void;
	/**
		Retrieves the buffer position of the marker's tail.Returns a `Point`.
	**/
	function getTailBufferPosition():Point;
	/**
		Sets the buffer position of the marker's tail.
	**/
	function setTailBufferPosition(bufferPosition:Point):Void;
	/**
		Retrieves the screen position of the marker's tail.Returns a `Point`.
	**/
	function getTailScreenPosition(?options:Dynamic):Point;
	/**
		Sets the screen position of the marker's tail.
	**/
	function setTailScreenPosition(screenPosition:Point, ?options:Dynamic):Void;
	/**
		Retrieves the buffer position of the marker's start. This will always be
		less than or equal to the result of {DisplayMarker::getEndBufferPosition}.Returns a `Point`.
	**/
	function getStartBufferPosition():Point;
	/**
		Retrieves the screen position of the marker's start. This will always be
		less than or equal to the result of {DisplayMarker::getEndScreenPosition}.Returns a `Point`.
	**/
	function getStartScreenPosition(?options:Dynamic):Point;
	/**
		Retrieves the buffer position of the marker's end. This will always be
		greater than or equal to the result of {DisplayMarker::getStartBufferPosition}.Returns a `Point`.
	**/
	function getEndBufferPosition():Point;
	/**
		Retrieves the screen position of the marker's end. This will always be
		greater than or equal to the result of {DisplayMarker::getStartScreenPosition}.Returns a `Point`.
	**/
	function getEndScreenPosition(?options:Dynamic):Point;
	/**
		Returns a `Boolean` indicating whether the marker has a tail.
	**/
	function hasTail():Bool;
	/**
		Plants the marker's tail at the current head position. After calling
		the marker's tail position will be its head position at the time of the
		call, regardless of where the marker's head is moved. 
	**/
	function plantTail():Void;
	/**
		Removes the marker's tail. After calling the marker's head position
		will be reported as its current tail position until the tail is planted
		again. 
	**/
	function clearTail():Void;
}