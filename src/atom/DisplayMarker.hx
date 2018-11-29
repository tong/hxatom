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
	
	@see https://github.com/atom/text-buffer/blob/v13.15.0/src/display-marker.coffee#L43
**/
@:jsRequire("atom", "DisplayMarker") extern class DisplayMarker {
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
		returned.
	**/
	function copy(?properties:Dynamic):atom.DisplayMarker;
	/**
		Invoke the given callback when the state of the marker changes.
	**/
	function onDidChange(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the marker is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):atom.Disposable;
	function isValid():Bool;
	function isDestroyed():Bool;
	function isReversed():Bool;
	function isExclusive():Bool;
	/**
		Get the invalidation strategy for this marker.
		
		Valid values include: `never`, `surround`, `overlap`, `inside`, and `touch`.
	**/
	function getInvalidationStrategy():String;
	function getProperties():Dynamic;
	/**
		Merges an `Object` containing new properties into the marker's
		existing properties.
	**/
	function setProperties(properties:Dynamic):Void;
	function matchesProperties():Dynamic;
	/**
		Compares this marker to another based on their ranges.
	**/
	function compare(other:atom.DisplayMarker):Float;
	/**
		
		
		
	**/
	function isEqual(other:atom.DisplayMarker):Bool;
	/**
		Gets the buffer range of this marker.
	**/
	function getBufferRange():atom.Range;
	/**
		Gets the screen range of this marker.
	**/
	function getScreenRange():atom.Range;
	/**
		Modifies the buffer range of this marker.
	**/
	function setBufferRange(bufferRange:atom.Range, ?properties:{ /**
		`Boolean` If true, the marker will to be in a reversed orientation. 
	**/
	var reversed : Bool; }):Void;
	/**
		Modifies the screen range of this marker.
	**/
	function setScreenRange(screenRange:atom.Range, ?options:{ /**
		`Boolean` If true, the marker will to be in a reversed orientation.
	**/
	var reversed : Bool; /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range. 
	**/
	var clipDirection : String; }):Void;
	/**
		Retrieves the buffer position of the marker's head.
	**/
	function getHeadBufferPosition():atom.Point;
	/**
		Sets the buffer position of the marker's head.
	**/
	function setHeadBufferPosition(bufferPosition:atom.Point):Void;
	/**
		Retrieves the screen position of the marker's head.
	**/
	function getHeadScreenPosition(?options:{ /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range.
	**/
	var clipDirection : String; }):atom.Point;
	/**
		Sets the screen position of the marker's head.
	**/
	function setHeadScreenPosition(screenPosition:atom.Point, ?options:{ /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range. 
	**/
	var clipDirection : String; }):Void;
	/**
		Retrieves the buffer position of the marker's tail.
	**/
	function getTailBufferPosition():atom.Point;
	/**
		Sets the buffer position of the marker's tail.
	**/
	function setTailBufferPosition(bufferPosition:atom.Point):Void;
	/**
		Retrieves the screen position of the marker's tail.
	**/
	function getTailScreenPosition(?options:{ /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range.
	**/
	var clipDirection : String; }):atom.Point;
	/**
		Sets the screen position of the marker's tail.
	**/
	function setTailScreenPosition(screenPosition:atom.Point, ?options:{ /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range. 
	**/
	var clipDirection : String; }):Void;
	/**
		Retrieves the buffer position of the marker's start. This will always be
		less than or equal to the result of {DisplayMarker::getEndBufferPosition}.
	**/
	function getStartBufferPosition():atom.Point;
	/**
		Retrieves the screen position of the marker's start. This will always be
		less than or equal to the result of {DisplayMarker::getEndScreenPosition}.
	**/
	function getStartScreenPosition(?options:{ /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range.
	**/
	var clipDirection : String; }):atom.Point;
	/**
		Retrieves the buffer position of the marker's end. This will always be
		greater than or equal to the result of {DisplayMarker::getStartBufferPosition}.
	**/
	function getEndBufferPosition():atom.Point;
	/**
		Retrieves the screen position of the marker's end. This will always be
		greater than or equal to the result of {DisplayMarker::getStartScreenPosition}.
	**/
	function getEndScreenPosition(?options:{ /**
		`String` If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`. Applies to the start and end of the given range.
	**/
	var clipDirection : String; }):atom.Point;
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