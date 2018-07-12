package atom;

/**
	A mutable text container with undo/redo support and the ability to
	annotate logical regions in the text.
	
	## Observing Changes
	
	You can observe changes in a {TextBuffer} using methods like {::onDidChange},
	{::onDidStopChanging}, and {::getChangesSinceCheckpoint}. These methods report
	aggregated buffer updates as arrays of change objects containing the following
	fields: `oldRange`, `newRange`, `oldText`, and `newText`. The `oldText`,
	`newText`, and `newRange` fields are self-explanatory, but the interepretation
	of `oldRange` is more nuanced:
	
	The reported `oldRange` is the range of the replaced text in the original
	contents of the buffer *irrespective of the spatial impact of any other
	reported change*. So, for example, if you wanted to apply all the changes made
	in a transaction to a clone of the observed buffer, the easiest approach would
	be to apply the changes in reverse:
	
	```js
	buffer1.onDidChange(({changes}) => {
	  for (const {oldRange, newText} of changes.reverse()) {
	    buffer2.setTextInRange(oldRange, newText)
	  }
	})
	```
	
	If you needed to apply the changes in the forwards order, you would need to
	incorporate the impact of preceding changes into the range passed to
	{::setTextInRange}, as follows:
	
	```js
	buffer1.onDidChange(({changes}) => {
	  for (const {oldRange, newRange, newText} of changes) {
	    const rangeToReplace = Range(
	      newRange.start,
	      newRange.start.traverse(oldRange.getExtent())
	    )
	    buffer2.setTextInRange(rangeToReplace, newText)
	  }
	})
	```
	@see <https://github.com/atom/text-buffer/blob/v13.14.2/src/text-buffer.coffee#L112>

**/
@:require(js, atom) @:jsRequire("atom", "TextBuffer") extern class TextBuffer {
	/**
		Create a new buffer backed by the given file path.Returns a `Promise` that resolves with a {TextBuffer} instance.
	**/
	static function load(source:String, params:{ /**
		{String} The file's encoding.
	**/
	@:optional
	var encoding : String; /**
		A {Function} that returns a {Boolean} indicating whether the buffer should be destroyed if its file is deleted.
	**/
	@:optional
	var shouldDestroyOnFileDelete : haxe.Constraints.Function; }):js.Promise<Dynamic>;
	/**
		Create a new buffer backed by the given file path. For better
		performance, use {TextBuffer.load} instead.Returns a {TextBuffer} instance.
	**/
	static function loadSync(filePath:String, params:{ /**
		{String} The file's encoding.
	**/
	@:optional
	var encoding : String; /**
		A {Function} that returns a {Boolean} indicating whether the buffer should be destroyed if its file is deleted.
	**/
	@:optional
	var shouldDestroyOnFileDelete : haxe.Constraints.Function; }):TextBuffer;
	/**
		Restore a {TextBuffer} based on an earlier state created using
		the {TextBuffer::serialize} method.Returns a `Promise` that resolves with a {TextBuffer} instance.
	**/
	static function deserialize(params:Dynamic):js.Promise<Dynamic>;
	/**
		Create a new buffer with the given params.
	**/
	function new(params:{ /**
		The initial {String} text of the buffer.
	**/
	var text : String; /**
		A {Function} that returns a {Boolean} indicating whether the buffer should be destroyed if its file is deleted. 
	**/
	var shouldDestroyOnFileDelete : haxe.Constraints.Function; }):Void;
	/**
		Invoke the given callback synchronously _before_ the content of the
		buffer changes.
		
		Because observers are invoked synchronously, it's important not to perform
		any expensive operations via this method.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback synchronously when a transaction finishes
		with a list of all the changes in the transaction.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		This is now identical to {::onDidChange}. 
	**/
	function onDidChangeText():Void;
	/**
		Invoke the given callback asynchronously following one or more
		changes after {::getStoppedChangingDelay} milliseconds elapse without an
		additional change.
		
		This method can be used to perform potentially expensive operations that
		don't need to be performed synchronously. If you need to run your callback
		synchronously, use {::onDidChange} instead.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidStopChanging(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the in-memory contents of the
		buffer become in conflict with the contents of the file on disk.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidConflict(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback if the value of {::isModified} changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeModified(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when all marker `::onDidChange`
		observers have been notified following a change to the buffer.
		
		The order of events following a buffer change is as follows:
		
		* The text of the buffer is changed
		* All markers are updated accordingly, but their `::onDidChange` observers
		  are not notified.
		* `TextBuffer::onDidChange` observers are notified.
		* `Marker::onDidChange` observers are notified.
		* `TextBuffer::onDidUpdateMarkers` observers are notified.
		
		Basically, this method gives you a way to take action after both a buffer
		change and all associated marker changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidUpdateMarkers(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a marker is created.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidCreateMarker(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the value of {::getPath} changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangePath(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the value of {::getEncoding} changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeEncoding(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before the buffer is saved to disk.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillSave(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback after the buffer is saved to disk.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidSave(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback after the file backing the buffer is
		deleted.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDelete(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before the buffer is reloaded from the
		contents of its file on disk.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillReload(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback after the buffer is reloaded from the
		contents of its file on disk.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidReload(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the buffer is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when there is an error in watching the
		file.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillThrowWatchError(callback:haxe.Constraints.Function):Disposable;
	/**
		Get the number of milliseconds that will elapse without a change
		before {::onDidStopChanging} observers are invoked following a change.Returns a `Number`.
	**/
	function getStoppedChangingDelay():Float;
	/**
		Determine if the in-memory contents of the buffer differ from its
		contents on disk.
		
		If the buffer is unsaved, always returns `true` unless the buffer is empty.Returns a `Boolean`.
	**/
	function isModified():Bool;
	/**
		Determine if the in-memory contents of the buffer conflict with the
		on-disk contents of its associated file.Returns a `Boolean`.
	**/
	function isInConflict():Bool;
	/**
		Get the path of the associated file.Returns a `String`.
	**/
	function getPath():String;
	/**
		Set the path for the buffer's associated file.
	**/
	function setPath(filePath:String):Void;
	/**
		Sets the character set encoding for this buffer.
	**/
	function setEncoding(encoding:String):Void;
	/**
		Returns the `String` encoding of this buffer.
	**/
	function getEncoding():String;
	/**
		Get the path of the associated file.Returns a `String`.
	**/
	function getUri():String;
	/**
		Determine whether the buffer is empty.Returns a `Boolean`.
	**/
	function isEmpty():Bool;
	/**
		Get the entire text of the buffer.Returns a `String`.
	**/
	function getText():String;
	/**
		Get the text in a range.Returns a `String`
	**/
	function getTextInRange(range:Range):String;
	/**
		Get the text of all lines in the buffer, without their line endings.Returns an `Array` of `String`s.
	**/
	function getLines():Array<Dynamic>;
	/**
		Get the text of the last line of the buffer, without its line
		ending.Returns a `String`.
	**/
	function getLastLine():String;
	/**
		Get the text of the line at the given 0-indexed row, without its
		line ending.Returns a `String`.
	**/
	function lineForRow(row:Float):String;
	/**
		Get the line ending for the given 0-indexed row.Returns a `String`. The returned newline is represented as a literal string:
		`'\n'`, `'\r\n'`, or `''` for the last line of the buffer, which
		doesn't end in a newline.
	**/
	function lineEndingForRow(row:Float):String;
	/**
		Get the length of the line for the given 0-indexed row, without its
		line ending.Returns a `Number`.
	**/
	function lineLengthForRow(row:Float):Float;
	/**
		Determine if the given row contains only whitespace.Returns a `Boolean`.
	**/
	function isRowBlank(row:Float):Bool;
	/**
		Given a row, find the first preceding row that's not blank.Returns a `Number` or `null` if there's no preceding non-blank row.
	**/
	function previousNonBlankRow(startRow:Float):Float;
	/**
		Given a row, find the next row that's not blank.Returns a `Number` or `null` if there's no next non-blank row.
	**/
	function nextNonBlankRow(startRow:Float):Float;
	/**
		Return true if the buffer contains any astral-plane Unicode characters that
		are encoded as surrogate pairs.Returns a `Boolean`.
	**/
	function hasAstral():Bool;
	/**
		Replace the entire contents of the buffer with the given text.Returns a `Range` spanning the new buffer contents.
	**/
	function setText(text:String):Range;
	/**
		Replace the current buffer contents by applying a diff based on the
		given text.
	**/
	function setTextViaDiff(text:String):Void;
	/**
		Set the text in the given range.Returns the `Range` of the inserted text.
	**/
	function setTextInRange(range:Range, text:String, ?options:{ /**
		{Boolean} (default: true)
	**/
	@:optional
	var normalizeLineEndings : Bool; /**
		*Deprecated* {String} 'skip' will cause this change to be grouped with the preceding change for the purposes of undo and redo. This property is deprecated. Call groupLastChanges() on the buffer after instead.
	**/
	@:optional
	var undo : String; }):Range;
	/**
		Insert text at the given position.Returns the `Range` of the inserted text.
	**/
	function insert(position:Point, text:String, ?options:{ /**
		{Boolean} (default: true)
	**/
	@:optional
	var normalizeLineEndings : Bool; /**
		*Deprecated* {String} 'skip' will skip the undo system. This property is deprecated. Call groupLastChanges() on the {TextBuffer} afterward instead.
	**/
	@:optional
	var undo : String; }):Range;
	/**
		Append text to the end of the buffer.Returns the `Range` of the inserted text
	**/
	function append(text:String, ?options:{ /**
		{Boolean} (default: true)
	**/
	@:optional
	var normalizeLineEndings : Bool; /**
		*Deprecated* {String} 'skip' will skip the undo system. This property is deprecated. Call groupLastChanges() on the {TextBuffer} afterward instead.
	**/
	@:optional
	var undo : String; }):Range;
	/**
		Delete the text in the given range.Returns an empty `Range` starting at the start of deleted range.
	**/
	function delete(range:Range):Range;
	/**
		Delete the line associated with a specified 0-indexed row.Returns the `Range` of the deleted text.
	**/
	function deleteRow(row:Float):Range;
	/**
		Delete the lines associated with the specified 0-indexed row range.
		
		If the row range is out of bounds, it will be clipped. If the `startRow` is
		greater than the `endRow`, they will be reordered.Returns the `Range` of the deleted text.
	**/
	function deleteRows(startRow:Float, endRow:Float):Range;
	/**
		Create a layer to contain a set of related markers.Returns a {MarkerLayer}.
	**/
	function addMarkerLayer(?options:{ /**
		A {Boolean} indicating whether or not the state of this layer should be restored on undo/redo operations. Defaults to `false`.
	**/
	@:optional
	var maintainHistory : Bool; /**
		A {Boolean} indicating whether or not this marker layer should be serialized and deserialized along with the rest of the buffer. Defaults to `false`. If `true`, the marker layer's id will be maintained across the serialization boundary, allowing you to retrieve it via {::getMarkerLayer}.
	**/
	@:optional
	var persistent : Bool; /**
		A {String} indicating role of this marker layer
	**/
	@:optional
	var role : String; }):MarkerLayer;
	/**
		Get a {MarkerLayer} by id.Returns a {MarkerLayer} or `` if no layer exists with the given
		id.
	**/
	function getMarkerLayer(id:Dynamic):MarkerLayer;
	/**
		Get the default {MarkerLayer}.
		
		All `Marker` APIs not tied to an explicit layer interact with this default
		layer.Returns a {MarkerLayer}.
	**/
	function getDefaultMarkerLayer():MarkerLayer;
	/**
		Create a `Marker` with the given range in the default {MarkerLayer}.
		This marker will maintain its logical location as the buffer is changed,
		so if you mark a particular word, the marker will remain over that word
		even if the word's location in the buffer changes.Returns a `Marker`.
	**/
	function markRange(range:Range, ?properties:Dynamic):Marker;
	/**
		Create a `Marker` at the given position with no tail in the default
		marker layer.Returns a `Marker`.
	**/
	function markPosition(position:Point, ?options:{ /**
		{String} Determines the rules by which changes to the buffer *invalidate* the marker. (default: 'overlap') It can be any of the following strategies, in order of fragility:
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
		{Boolean} indicating whether insertions at the start or end of the marked range should be interpreted as happening *outside* the marker. Defaults to `false`, except when using the `inside` invalidation strategy or when when the marker has no tail, in which case it defaults to true. Explicitly assigning this option overrides behavior in all circumstances.
	**/
	@:optional
	var exclusive : Bool; }):Marker;
	/**
		Get all existing markers on the default marker layer.Returns an `Array` of `Marker`s.
	**/
	function getMarkers():Array<Dynamic>;
	/**
		Get an existing marker by its id from the default marker layer.Returns a `Marker`.
	**/
	function getMarker(id:Float):Marker;
	/**
		Find markers conforming to the given parameters in the default
		marker layer.
		
		Markers are sorted based on their position in the buffer. If two markers
		start at the same position, the larger marker comes first.Returns an `Array` of `Marker`s.
	**/
	function findMarkers(params:Dynamic):Array<Dynamic>;
	/**
		Get the number of markers in the default marker layer.Returns a `Number`.
	**/
	function getMarkerCount():Float;
	/**
		Undo the last operation. If a transaction is in progress, aborts it.Returns a `Boolean` of whether or not a change was made.
	**/
	function undo(?options:{ /**
		Restore snapshot of selections marker layer to given selectionsMarkerLayer.
	**/
	@:optional
	var selectionsMarkerLayer : Dynamic; }):Bool;
	/**
		Redo the last operationReturns a `Boolean` of whether or not a change was made.
	**/
	function redo(?options:{ /**
		Restore snapshot of selections marker layer to given selectionsMarkerLayer.
	**/
	@:optional
	var selectionsMarkerLayer : Dynamic; }):Bool;
	/**
		Batch multiple operations as a single undo/redo step.
		
		Any group of operations that are logically grouped from the perspective of
		undoing and redoing should be performed in a transaction. If you want to
		abort the transaction, call {::abortTransaction} to terminate the function's
		execution and revert any changes performed up to the abortion.
	**/
	function transact(?options:{ /**
		The {Number} of milliseconds for which this transaction should be considered 'open for grouping' after it begins. If a transaction with a positive `groupingInterval` is committed while the previous transaction is still open for grouping, the two transactions are merged with respect to undo and redo.
	**/
	@:optional
	var groupingInterval : Float; /**
		When provided, skip taking snapshot for other selections markerLayers except given one.
	**/
	@:optional
	var selectionsMarkerLayer : Dynamic; }, ?groupingInterval:Float, fn:haxe.Constraints.Function):Void;
	/**
		Abort the currently running transaction
		
		Only intended to be called within the `fn` option to {::transact} 
	**/
	function abortTransaction():Void;
	/**
		Clear the undo stack. 
	**/
	function clearUndoStack():Void;
	/**
		Create a pointer to the current state of the buffer for use
		with {::revertToCheckpoint} and {::groupChangesSinceCheckpoint}.Returns a checkpoint id value.
	**/
	function createCheckpoint(?options:{ /**
		When provided, skip taking snapshot for other selections markerLayers except given one.
	**/
	@:optional
	var selectionsMarkerLayer : Dynamic; }):Dynamic;
	/**
		Revert the buffer to the state it was in when the given
		checkpoint was created.
		
		The redo stack will be empty following this operation, so changes since the
		checkpoint will be lost. If the given checkpoint is no longer present in the
		undo history, no changes will be made to the buffer and this method will
		return `false`.Returns a `Boolean` indicating whether the operation succeeded.
	**/
	function revertToCheckpoint(checkpoint:Float, ?options:{ /**
		Restore snapshot of selections marker layer to given selectionsMarkerLayer.
	**/
	@:optional
	var selectionsMarkerLayer : Dynamic; }):Bool;
	/**
		Group all changes since the given checkpoint into a single
		transaction for purposes of undo/redo.
		
		If the given checkpoint is no longer present in the undo history, no
		grouping will be performed and this method will return `false`.Returns a `Boolean` indicating whether the operation succeeded.
	**/
	function groupChangesSinceCheckpoint(checkpoint:Float, ?options:{ /**
		When provided, skip taking snapshot for other selections markerLayers except given one.
	**/
	@:optional
	var selectionsMarkerLayer : Dynamic; }):Bool;
	/**
		Group the last two text changes for purposes of undo/redo.
		
		This operation will only succeed if there are two changes on the undo
		stack. It will not group past the beginning of an open transaction.Returns a `Boolean` indicating whether the operation succeeded.
	**/
	function groupLastChanges():Bool;
	/**
		
		
		If the given checkpoint is no longer present in the undo history, this
		method will return an empty `Array`.Returns a list of changes since the given checkpoint.
	**/
	function getChangesSinceCheckpoint(checkpoint:Float):Dynamic;
	/**
		Scan regular expression matches in the entire buffer, calling the
		given iterator function on each match.
		
		If you're programmatically modifying the results, you may want to try
		{::backwardsScan} to avoid tripping over your own changes.
	**/
	function scan(regex:EReg, ?options:{ /**
		{Number} default `0`; The number of lines before the  matched line to include in the results object.
	**/
	var leadingContextLineCount : Float; /**
		{Number} default `0`; The number of lines after the  matched line to include in the results object.
	**/
	var trailingContextLineCount : Float; }, iterator:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in the entire buffer in reverse
		order, calling the given iterator function on each match.
	**/
	function backwardsScan(regex:EReg, ?options:{ /**
		{Number} default `0`; The number of lines before the  matched line to include in the results object.
	**/
	var leadingContextLineCount : Float; /**
		{Number} default `0`; The number of lines after the  matched line to include in the results object.
	**/
	var trailingContextLineCount : Float; }, iterator:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in a given range , calling the given
		iterator function on each match.
	**/
	function scanInRange(regex:EReg, range:Range, ?options:{ /**
		{Number} default `0`; The number of lines before the  matched line to include in the results object.
	**/
	var leadingContextLineCount : Float; /**
		{Number} default `0`; The number of lines after the  matched line to include in the results object.
	**/
	var trailingContextLineCount : Float; }, callback:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in a given range in reverse order,
		calling the given iterator function on each match.
	**/
	function backwardsScanInRange(regex:EReg, range:Range, ?options:{ /**
		{Number} default `0`; The number of lines before the  matched line to include in the results object.
	**/
	var leadingContextLineCount : Float; /**
		{Number} default `0`; The number of lines after the  matched line to include in the results object.
	**/
	var trailingContextLineCount : Float; }, iterator:haxe.Constraints.Function):Void;
	/**
		Replace all regular expression matches in the entire buffer.Returns a `Number` representing the number of replacements made.
	**/
	function replace(regex:EReg, replacementText:String):Float;
	/**
		Get the range spanning from `[0, 0]` to {::getEndPosition}.Returns a `Range`.
	**/
	function getRange():Range;
	/**
		Get the number of lines in the buffer.Returns a `Number`.
	**/
	function getLineCount():Float;
	/**
		Get the last 0-indexed row in the buffer.Returns a `Number`.
	**/
	function getLastRow():Float;
	/**
		Get the first position in the buffer, which is always `[0, 0]`.Returns a `Point`.
	**/
	function getFirstPosition():Point;
	/**
		Get the maximal position in the buffer, where new text would be
		appended.Returns a `Point`.
	**/
	function getEndPosition():Point;
	/**
		Get the length of the buffer's text. 
	**/
	function getLength():Void;
	/**
		Get the length of the buffer in characters.Returns a `Number`.
	**/
	function getMaxCharacterIndex():Float;
	/**
		Get the range for the given rowReturns a `Range`.
	**/
	function rangeForRow(row:Float, includeNewline:Bool):Range;
	/**
		Convert a position in the buffer in row/column coordinates to an
		absolute character offset, inclusive of line ending characters.
		
		The position is clipped prior to translating.Returns a `Number`.
	**/
	function characterIndexForPosition(position:Point):Float;
	/**
		Convert an absolute character offset, inclusive of newlines, to a
		position in the buffer in row/column coordinates.
		
		The offset is clipped prior to translating.Returns a `Point`.
	**/
	function positionForCharacterIndex(offset:Float):Point;
	/**
		Clip the given range so it starts and ends at valid positions.
		
		For example, the position `[1, 100]` is out of bounds if the line at row 1 is
		only 10 characters long, and it would be clipped to `(1, 10)`.Returns the given `Range` if it is already in bounds, or a new clipped
		`Range` if the given range is out-of-bounds.
	**/
	function clipRange(range:Range):Range;
	/**
		Clip the given point so it is at a valid position in the buffer.
		
		For example, the position (1, 100) is out of bounds if the line at row 1 is
		only 10 characters long, and it would be clipped to (1, 10)Returns a new `Point` if the given position is invalid, otherwise returns
		the given position.
	**/
	function clipPosition(position:Point):Point;
	/**
		Save the buffer.Returns a `Promise` that resolves when the save has completed.
	**/
	function save():js.Promise<Dynamic>;
	/**
		Save the buffer at a specific path.Returns a `Promise` that resolves when the save has completed.
	**/
	function saveAs(filePath:Dynamic):js.Promise<Dynamic>;
	/**
		Reload the file's content from disk.Returns a `Promise` that resolves when the load is complete.
	**/
	function reload():js.Promise<Dynamic>;
	/**
		Create a new buffer backed by the given file path. For better
		performance, use {TextBuffer.load} instead.Returns a {TextBuffer} instance.
	**/
	function loadSync(filePath:String, params:{ /**
		{String} The file's encoding.
	**/
	@:optional
	var encoding : String; /**
		A {Function} that returns a {Boolean} indicating whether the buffer should be destroyed if its file is deleted.
	**/
	@:optional
	var shouldDestroyOnFileDelete : haxe.Constraints.Function; }):TextBuffer;
	/**
		Create a new buffer backed by the given file path.Returns a `Promise` that resolves with a {TextBuffer} instance.
	**/
	function load(source:String, params:{ /**
		{String} The file's encoding.
	**/
	@:optional
	var encoding : String; /**
		A {Function} that returns a {Boolean} indicating whether the buffer should be destroyed if its file is deleted.
	**/
	@:optional
	var shouldDestroyOnFileDelete : haxe.Constraints.Function; }):js.Promise<Dynamic>;
}