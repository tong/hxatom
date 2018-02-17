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
	@see <https://github.com/atom/text-buffer/blob/v13.9.3/src/text-buffer.coffee#L112>

**/
@:require(js, atom) @:jsRequire("atom", "TextBuffer") extern class TextBuffer {
	/**
		Create a new buffer backed by the given file path.Returns a `Promise` that resolves with a {TextBuffer} instance.
	**/
	static function load(source:String, params:Dynamic):js.Promise<Dynamic>;
	/**
		Create a new buffer backed by the given file path. For better
		performance, use {TextBuffer.load} instead.Returns a {TextBuffer} instance.
	**/
	static function loadSync(filePath:String, params:Dynamic):TextBuffer;
	/**
		Restore a {TextBuffer} based on an earlier state created using
		the {TextBuffer::serialize} method.Returns a `Promise` that resolves with a {TextBuffer} instance.
	**/
	static function deserialize(params:Dynamic):js.Promise<Dynamic>;
	/**
		Create a new buffer with the given params.
	**/
	function new(params:Dynamic):Void;
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
		Get the text of the line at the given row, without its line ending.Returns a `String`.
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
	function setTextInRange(range:Range, text:String, ?options:Dynamic):Range;
	/**
		Insert text at the given position.Returns the `Range` of the inserted text.
	**/
	function insert(position:Point, text:String, ?options:Dynamic):Range;
	/**
		Append text to the end of the buffer.Returns the `Range` of the inserted text
	**/
	function append(text:String, ?options:Dynamic):Range;
	/**
		Delete the text in the given range.Returns an empty `Range` starting at the start of deleted range.
	**/
	function delete(range:Range):Range;
	/**
		Delete the line associated with a specified row.Returns the `Range` of the deleted text.
	**/
	function deleteRow(row:Float):Range;
	/**
		Delete the lines associated with the specified row range.
		
		If the row range is out of bounds, it will be clipped. If the startRow is
		greater than the end row, they will be reordered.Returns the `Range` of the deleted text.
	**/
	function deleteRows(startRow:Float, endRow:Float):Range;
	/**
		Create a layer to contain a set of related markers.Returns a {MarkerLayer}.
	**/
	function addMarkerLayer(options:Dynamic):MarkerLayer;
	/**
		Get a {MarkerLayer} by id.Returns a {MarkerLayer} or `` if no layer exists with the given
		id.
	**/
	function getMarkerLayer(id:Dynamic):MarkerLayer;
	/**
		Get the default {MarkerLayer}.
		
		All marker APIs not tied to an explicit layer interact with this default
		layer.Returns a {MarkerLayer}.
	**/
	function getDefaultMarkerLayer():MarkerLayer;
	/**
		Create a marker with the given range in the default marker layer.
		This marker will maintain its logical location as the buffer is changed, so
		if you mark a particular word, the marker will remain over that word even if
		the word's location in the buffer changes.Returns a `Marker`.
	**/
	function markRange(range:Range, properties:Dynamic):Marker;
	/**
		Create a marker at the given position with no tail in the default
		marker layer.Returns a `Marker`.
	**/
	function markPosition(position:Point, ?options:Dynamic):Marker;
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
		Undo the last operation. If a transaction is in progress, aborts it. 
	**/
	function undo():Void;
	/**
		Redo the last operation 
	**/
	function redo():Void;
	/**
		Batch multiple operations as a single undo/redo step.
		
		Any group of operations that are logically grouped from the perspective of
		undoing and redoing should be performed in a transaction. If you want to
		abort the transaction, call {::abortTransaction} to terminate the function's
		execution and revert any changes performed up to the abortion.
	**/
	function transact(?groupingInterval:Float, fn:haxe.Constraints.Function):Void;
	/**
		Clear the undo stack. 
	**/
	function clearUndoStack():Void;
	/**
		Create a pointer to the current state of the buffer for use
		with {::revertToCheckpoint} and {::groupChangesSinceCheckpoint}.Returns a checkpoint value.
	**/
	function createCheckpoint():Dynamic;
	/**
		Revert the buffer to the state it was in when the given
		checkpoint was created.
		
		The redo stack will be empty following this operation, so changes since the
		checkpoint will be lost. If the given checkpoint is no longer present in the
		undo history, no changes will be made to the buffer and this method will
		return `false`.Returns a `Boolean` indicating whether the operation succeeded.
	**/
	function revertToCheckpoint():Bool;
	/**
		Group all changes since the given checkpoint into a single
		transaction for purposes of undo/redo.
		
		If the given checkpoint is no longer present in the undo history, no
		grouping will be performed and this method will return `false`.Returns a `Boolean` indicating whether the operation succeeded.
	**/
	function groupChangesSinceCheckpoint():Bool;
	/**
		
		
		If the given checkpoint is no longer present in the undo history, this
		method will return an empty `Array`.Returns a list of changes since the given checkpoint.
	**/
	function getChangesSinceCheckpoint():Dynamic;
	/**
		Scan regular expression matches in the entire buffer, calling the
		given iterator function on each match.
		
		If you're programmatically modifying the results, you may want to try
		{::backwardsScan} to avoid tripping over your own changes.
	**/
	function scan(regex:EReg, ?options:Dynamic, iterator:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in the entire buffer in reverse
		order, calling the given iterator function on each match.
	**/
	function backwardsScan(regex:EReg, ?options:Dynamic, iterator:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in a given range , calling the given
		iterator function on each match.
	**/
	function scanInRange(regex:EReg, range:Range, ?options:Dynamic, callback:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in a given range in reverse order,
		calling the given iterator function on each match.
	**/
	function backwardsScanInRange(regex:EReg, range:Range, ?options:Dynamic, iterator:haxe.Constraints.Function):Void;
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
	function loadSync(filePath:String, params:Dynamic):TextBuffer;
	/**
		Create a new buffer backed by the given file path.Returns a `Promise` that resolves with a {TextBuffer} instance.
	**/
	function load(source:String, params:Dynamic):js.Promise<Dynamic>;
}