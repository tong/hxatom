package atom;

/**
	This class represents all essential editing state for a single
	{TextBuffer}, including cursor and selection positions, folds, and soft wraps.
	If you're manipulating the state of an editor, use this class.
**/
@:require(js, atom) @:jsRequire("atom", "TextEditor") extern class TextEditor {
	/**
		Calls your `callback` when the buffer's title has changed.
	**/
	function onDidChangeTitle(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the buffer's path, and therefore title, has changed.
	**/
	function onDidChangePath(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback synchronously when the content of the
		buffer changes.
		
		Because observers are invoked synchronously, it's important not to perform
		any expensive operations via this method. Consider {::onDidStopChanging} to
		delay expensive operations until after changes stop occurring.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke `callback` when the buffer's contents change. It is
		emit asynchronously 300ms after the last buffer change. This is a good place
		to handle changes to the buffer without compromising typing performance.
	**/
	function onDidStopChanging(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Cursor} is moved. If there are
		multiple cursors, your callback will be called for each cursor.
	**/
	function onDidChangeCursorPosition(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a selection's screen range changes.
	**/
	function onDidChangeSelectionRange(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when soft wrap was enabled or disabled.
	**/
	function onDidChangeSoftWrapped(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the buffer's encoding has changed.
	**/
	function onDidChangeEncoding(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the grammar that interprets and
		colorizes the text has been changed. Immediately calls your callback with
		the current grammar.
	**/
	function observeGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the grammar that interprets and
		colorizes the text has been changed.
	**/
	function onDidChangeGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the result of {::isModified} changes.
	**/
	function onDidChangeModified(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the buffer's underlying file changes on
		disk at a moment when the result of {::isModified} is true.
	**/
	function onDidConflict(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` before text has been inserted.
	**/
	function onWillInsertText(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` after text has been inserted.
	**/
	function onDidInsertText(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback after the buffer is saved to disk.
	**/
	function onDidSave(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the editor is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Cursor} is added to the editor.
		Immediately calls your callback for each existing cursor.
	**/
	function observeCursors(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Cursor} is added to the editor.
	**/
	function onDidAddCursor(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Cursor} is removed from the editor.
	**/
	function onDidRemoveCursor(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Selection} is added to the editor.
		Immediately calls your callback for each existing selection.
	**/
	function observeSelections(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Selection} is added to the editor.
	**/
	function onDidAddSelection(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Selection} is removed from the editor.
	**/
	function onDidRemoveSelection(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` with each {Decoration} added to the editor.
		Calls your `callback` immediately for any existing decorations.
	**/
	function observeDecorations(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Decoration} is added to the editor.
	**/
	function onDidAddDecoration(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Decoration} is removed from the editor.
	**/
	function onDidRemoveDecoration(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the placeholder text is changed.
	**/
	function onDidChangePlaceholderText(callback:haxe.Constraints.Function):Disposable;
	/**
		Retrieves the current {TextBuffer}. 
	**/
	function getBuffer():Void;
	/**
		Calls your `callback` when a {Gutter} is added to the editor.
		Immediately calls your callback for each existing gutter.
	**/
	function observeGutters(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Gutter} is added to the editor.
	**/
	function onDidAddGutter(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a {Gutter} is removed from the editor.
	**/
	function onDidRemoveGutter(callback:haxe.Constraints.Function):Disposable;
	/**
		Get the editor's title for display in other parts of the
		UI such as the tabs.
		
		If the editor's buffer is saved, its title is the file name. If it is
		unsaved, its title is "untitled".
	**/
	function getTitle():String;
	/**
		Get unique title for display in other parts of the UI, such as
		the window title.
		
		If the editor's buffer is unsaved, its title is "untitled"
		If the editor's buffer is saved, its unique title is formatted as one
		of the following,
		
		* "<filename>" when it is the only editing buffer with this file name.
		* "<filename> — <unique-dir-prefix>" when other buffers have this file name.
	**/
	function getLongTitle():String;
	function getPath():String;
	function getEncoding():String;
	/**
		Set the character set encoding to use in this editor's text
		buffer.
	**/
	function setEncoding(encoding:String):Void;
	function isModified():Bool;
	function isEmpty():Bool;
	/**
		Saves the editor's text buffer.
		
		See {TextBuffer::save} for more details. 
	**/
	function save():Void;
	/**
		Saves the editor's text buffer as the given path.
		
		See {TextBuffer::saveAs} for more details.
	**/
	function saveAs(filePath:String):Void;
	function getText():String;
	/**
		Get the text in the given {Range} in buffer coordinates.
	**/
	function getTextInBufferRange(range:Range):String;
	function getLineCount():Float;
	function getScreenLineCount():Float;
	function getLastBufferRow():Float;
	function getLastScreenRow():Float;
	function lineTextForBufferRow(bufferRow:Float):String;
	function lineTextForScreenRow(screenRow:Float):String;
	/**
		Get the {Range} of the paragraph surrounding the most recently added
		cursor.
	**/
	function getCurrentParagraphBufferRange():Range;
	/**
		Replaces the entire contents of the buffer with the given {String}.
	**/
	function setText(text:String):Void;
	/**
		Set the text in the given {Range} in buffer coordinates.
	**/
	function setTextInBufferRange(range:Range, text:String, ?options:Dynamic):Range;
	/**
		For each selection, replace the selected text with the given text.
	**/
	function insertText(text:String, ?options:Dynamic):Range;
	/**
		For each selection, replace the selected text with a newline. 
	**/
	function insertNewline():Void;
	/**
		For each selection, if the selection is empty, delete the character
		following the cursor. Otherwise delete the selected text. 
	**/
	function delete():Void;
	/**
		For each selection, if the selection is empty, delete the character
		preceding the cursor. Otherwise delete the selected text. 
	**/
	function backspace():Void;
	/**
		Mutate the text of all the selections in a single transaction.
		
		All the changes made inside the given {Function} can be reverted with a
		single call to {::undo}.
	**/
	function mutateSelectedText(fn:haxe.Constraints.Function):Void;
	/**
		For each selection, transpose the selected text.
		
		If the selection is empty, the characters preceding and following the cursor
		are swapped. Otherwise, the selected characters are reversed. 
	**/
	function transpose():Void;
	/**
		Convert the selected text to upper case.
		
		For each selection, if the selection is empty, converts the containing word
		to upper case. Otherwise convert the selected text to upper case. 
	**/
	function upperCase():Void;
	/**
		Convert the selected text to lower case.
		
		For each selection, if the selection is empty, converts the containing word
		to upper case. Otherwise convert the selected text to upper case. 
	**/
	function lowerCase():Void;
	/**
		Toggle line comments for rows intersecting selections.
		
		If the current grammar doesn't support comments, does nothing. 
	**/
	function toggleLineCommentsInSelection():Void;
	/**
		For each cursor, insert a newline at beginning the following line. 
	**/
	function insertNewlineBelow():Void;
	/**
		For each cursor, insert a newline at the end of the preceding line. 
	**/
	function insertNewlineAbove():Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing word that precede the cursor. Otherwise delete the
		selected text. 
	**/
	function deleteToBeginningOfWord():Void;
	/**
		Similar to {::deleteToBeginningOfWord}, but deletes only back to the
		previous word boundary. 
	**/
	function deleteToPreviousWordBoundary():Void;
	/**
		Similar to {::deleteToEndOfWord}, but deletes only up to the
		next word boundary. 
	**/
	function deleteToNextWordBoundary():Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing subword following the cursor. Otherwise delete the selected
		text. 
	**/
	function deleteToBeginningOfSubword():Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing subword following the cursor. Otherwise delete the selected
		text. 
	**/
	function deleteToEndOfSubword():Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing line that precede the cursor. Otherwise delete the
		selected text. 
	**/
	function deleteToBeginningOfLine():Void;
	/**
		For each selection, if the selection is not empty, deletes the
		selection; otherwise, deletes all characters of the containing line
		following the cursor. If the cursor is already at the end of the line,
		deletes the following newline. 
	**/
	function deleteToEndOfLine():Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing word following the cursor. Otherwise delete the selected
		text. 
	**/
	function deleteToEndOfWord():Void;
	/**
		Delete all lines intersecting selections. 
	**/
	function deleteLine():Void;
	/**
		Undo the last change. 
	**/
	function undo():Void;
	/**
		Redo the last change. 
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
		Abort an open transaction, undoing any operations performed so far
		within the transaction. 
	**/
	function abortTransaction():Void;
	/**
		Create a pointer to the current state of the buffer for use
		with {::revertToCheckpoint} and {::groupChangesSinceCheckpoint}.
	**/
	function createCheckpoint():Dynamic;
	/**
		Revert the buffer to the state it was in when the given
		checkpoint was created.
		
		The redo stack will be empty following this operation, so changes since the
		checkpoint will be lost. If the given checkpoint is no longer present in the
		undo history, no changes will be made to the buffer and this method will
		return `false`.
	**/
	function revertToCheckpoint():Bool;
	/**
		Group all changes since the given checkpoint into a single
		transaction for purposes of undo/redo.
		
		If the given checkpoint is no longer present in the undo history, no
		grouping will be performed and this method will return `false`.
	**/
	function groupChangesSinceCheckpoint():Bool;
	/**
		Convert a position in buffer-coordinates to screen-coordinates.
		
		The position is clipped via {::clipBufferPosition} prior to the conversion.
		The position is also clipped via {::clipScreenPosition} following the
		conversion, which only makes a difference when `options` are supplied.
	**/
	function screenPositionForBufferPosition(bufferPosition:Point, ?options:Dynamic):Point;
	/**
		Convert a position in screen-coordinates to buffer-coordinates.
		
		The position is clipped via {::clipScreenPosition} prior to the conversion.
	**/
	function bufferPositionForScreenPosition(bufferPosition:Point, ?options:Dynamic):Point;
	/**
		Convert a range in buffer-coordinates to screen-coordinates.
	**/
	function screenRangeForBufferRange(bufferRange:Range):Range;
	/**
		Convert a range in screen-coordinates to buffer-coordinates.
	**/
	function bufferRangeForScreenRange(screenRange:Range):Range;
	/**
		Clip the given {Point} to a valid position in the buffer.
		
		If the given {Point} describes a position that is actually reachable by the
		cursor based on the current contents of the buffer, it is returned
		unchanged. If the {Point} does not describe a valid position, the closest
		valid position is returned instead.
	**/
	function clipBufferPosition(bufferPosition:Point):Point;
	/**
		Clip the start and end of the given range to valid positions in the
		buffer. See {::clipBufferPosition} for more information.
	**/
	function clipBufferRange(range:Range):Range;
	/**
		Clip the given {Point} to a valid position on screen.
		
		If the given {Point} describes a position that is actually reachable by the
		cursor based on the current contents of the screen, it is returned
		unchanged. If the {Point} does not describe a valid position, the closest
		valid position is returned instead.
	**/
	function clipScreenPosition(screenPosition:Point, ?options:Dynamic):Point;
	/**
		Clip the start and end of the given range to valid positions on screen.
		See {::clipScreenPosition} for more information.
	**/
	function clipScreenRange(range:Range, ?options:Dynamic):Range;
	/**
		Add a decoration that tracks a {DisplayMarker}. When the
		marker moves, is invalidated, or is destroyed, the decoration will be
		updated to reflect the marker's state.
		
		The following are the supported decorations types:
		
		* __line__: Adds your CSS `class` to the line nodes within the range
		    marked by the marker
		* __line-number__: Adds your CSS `class` to the line number nodes within the
		    range marked by the marker
		* __highlight__: Adds a new highlight div to the editor surrounding the
		    range marked by the marker. When the user selects text, the selection is
		    visualized with a highlight decoration internally. The structure of this
		    highlight will be
		  ```html
		    <div class="highlight <your-class>">
		      <!-- Will be one region for each row in the range. Spans 2 lines? There will be 2 regions. -->
		      <div class="region"></div>
		    </div>
		  ```
		* __overlay__: Positions the view associated with the given item at the head
		    or tail of the given `DisplayMarker`.
		* __gutter__: A decoration that tracks a {DisplayMarker} in a {Gutter}. Gutter
		    decorations are created by calling {Gutter::decorateMarker} on the
		    desired `Gutter` instance.
		* __block__: Positions the view associated with the given item before or
		    after the row of the given `TextEditorMarker`.
	**/
	function decorateMarker(marker:DisplayMarker, decorationParams:Dynamic):Decoration;
	/**
		Add a decoration to every marker in the given marker layer. Can
		be used to decorate a large number of markers without having to create and
		manage many individual decorations.
	**/
	function decorateMarkerLayer(markerLayer:DisplayMarkerLayer, decorationParams:Dynamic):LayerDecoration;
	/**
		Get all decorations.
	**/
	function getDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'line'.
	**/
	function getLineDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'line-number'.
	**/
	function getLineNumberDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'highlight'.
	**/
	function getHighlightDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'overlay'.
	**/
	function getOverlayDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Create a marker on the default marker layer with the given range
		in buffer coordinates. This marker will maintain its logical location as the
		buffer is changed, so if you mark a particular word, the marker will remain
		over that word even if the word's location in the buffer changes.
	**/
	function markBufferRange(range:Range, properties:Dynamic):DisplayMarker;
	/**
		Create a marker on the default marker layer with the given range
		in screen coordinates. This marker will maintain its logical location as the
		buffer is changed, so if you mark a particular word, the marker will remain
		over that word even if the word's location in the buffer changes.
	**/
	function markScreenRange(range:Range, properties:Dynamic):DisplayMarker;
	/**
		Create a marker on the default marker layer with the given buffer
		position and no tail. To group multiple markers together in their own
		private layer, see {::addMarkerLayer}.
	**/
	function markBufferPosition(bufferPosition:Point, ?options:Dynamic):DisplayMarker;
	/**
		Create a marker on the default marker layer with the given screen
		position and no tail. To group multiple markers together in their own
		private layer, see {::addMarkerLayer}.
	**/
	function markScreenPosition(screenPosition:Point, ?options:Dynamic):DisplayMarker;
	/**
		Find all {DisplayMarker}s on the default marker layer that
		match the given properties.
		
		This method finds markers based on the given properties. Markers can be
		associated with custom properties that will be compared with basic equality.
		In addition, there are several special properties that will be compared
		with the range of the markers rather than their properties.
	**/
	function findMarkers(properties:Dynamic):Array<Dynamic>;
	/**
		Get the {DisplayMarker} on the default layer for the given
		marker id.
	**/
	function getMarker(id:Float):Void;
	/**
		Get all {DisplayMarker}s on the default marker layer. Consider
		using {::findMarkers} 
	**/
	function getMarkers():Void;
	/**
		Get the number of markers in the default marker layer.
	**/
	function getMarkerCount():Float;
	/**
		Create a marker layer to group related markers.
	**/
	function addMarkerLayer(options:Dynamic):DisplayMarkerLayer;
	/**
		Get a {DisplayMarkerLayer} by id.
	**/
	function getMarkerLayer(id:Dynamic):DisplayMarkerLayer;
	/**
		Get the default {DisplayMarkerLayer}.
		
		All marker APIs not tied to an explicit layer interact with this default
		layer.
	**/
	function getDefaultMarkerLayer():DisplayMarkerLayer;
	/**
		Get the position of the most recently added cursor in buffer
		coordinates.
	**/
	function getCursorBufferPosition():Point;
	/**
		Get the position of all the cursor positions in buffer coordinates.
	**/
	function getCursorBufferPositions():Array<Dynamic>;
	/**
		Move the cursor to the given position in buffer coordinates.
		
		If there are multiple cursors, they will be consolidated to a single cursor.
	**/
	function setCursorBufferPosition(position:Point, ?options:Dynamic):Void;
	/**
		Get a {Cursor} at given screen coordinates {Point}
	**/
	function getCursorAtScreenPosition(position:Point):Cursor;
	/**
		Get the position of the most recently added cursor in screen
		coordinates.
	**/
	function getCursorScreenPosition():Point;
	/**
		Get the position of all the cursor positions in screen coordinates.
	**/
	function getCursorScreenPositions():Array<Dynamic>;
	/**
		Move the cursor to the given position in screen coordinates.
		
		If there are multiple cursors, they will be consolidated to a single cursor.
	**/
	function setCursorScreenPosition(position:Point, ?options:Dynamic):Void;
	/**
		Add a cursor at the given position in buffer coordinates.
	**/
	function addCursorAtBufferPosition(bufferPosition:Point):Cursor;
	/**
		Add a cursor at the position in screen coordinates.
	**/
	function addCursorAtScreenPosition(screenPosition:Point):Cursor;
	function hasMultipleCursors():Bool;
	/**
		Move every cursor up one row in screen coordinates.
	**/
	function moveUp(?lineCount:Float):Void;
	/**
		Move every cursor down one row in screen coordinates.
	**/
	function moveDown(?lineCount:Float):Void;
	/**
		Move every cursor left one column.
	**/
	function moveLeft(?columnCount:Float):Void;
	/**
		Move every cursor right one column.
	**/
	function moveRight(?columnCount:Float):Void;
	/**
		Move every cursor to the beginning of its line in buffer coordinates. 
	**/
	function moveToBeginningOfLine():Void;
	/**
		Move every cursor to the beginning of its line in screen coordinates. 
	**/
	function moveToBeginningOfScreenLine():Void;
	/**
		Move every cursor to the first non-whitespace character of its line. 
	**/
	function moveToFirstCharacterOfLine():Void;
	/**
		Move every cursor to the end of its line in buffer coordinates. 
	**/
	function moveToEndOfLine():Void;
	/**
		Move every cursor to the end of its line in screen coordinates. 
	**/
	function moveToEndOfScreenLine():Void;
	/**
		Move every cursor to the beginning of its surrounding word. 
	**/
	function moveToBeginningOfWord():Void;
	/**
		Move every cursor to the end of its surrounding word. 
	**/
	function moveToEndOfWord():Void;
	/**
		Move every cursor to the top of the buffer.
		
		If there are multiple cursors, they will be merged into a single cursor. 
	**/
	function moveToTop():Void;
	/**
		Move every cursor to the bottom of the buffer.
		
		If there are multiple cursors, they will be merged into a single cursor. 
	**/
	function moveToBottom():Void;
	/**
		Move every cursor to the beginning of the next word. 
	**/
	function moveToBeginningOfNextWord():Void;
	/**
		Move every cursor to the previous word boundary. 
	**/
	function moveToPreviousWordBoundary():Void;
	/**
		Move every cursor to the next word boundary. 
	**/
	function moveToNextWordBoundary():Void;
	/**
		Move every cursor to the previous subword boundary. 
	**/
	function moveToPreviousSubwordBoundary():Void;
	/**
		Move every cursor to the next subword boundary. 
	**/
	function moveToNextSubwordBoundary():Void;
	/**
		Move every cursor to the beginning of the next paragraph. 
	**/
	function moveToBeginningOfNextParagraph():Void;
	/**
		Move every cursor to the beginning of the previous paragraph. 
	**/
	function moveToBeginningOfPreviousParagraph():Void;
	function getLastCursor():Cursor;
	function getWordUnderCursor(?options:Dynamic):Dynamic;
	/**
		Get an Array of all {Cursor}s. 
	**/
	function getCursors():Void;
	/**
		Get all {Cursors}s, ordered by their position in the buffer
		instead of the order in which they were added.
	**/
	function getCursorsOrderedByBufferPosition():Array<Dynamic>;
	/**
		Get the selected text of the most recently added selection.
	**/
	function getSelectedText():String;
	/**
		Get the {Range} of the most recently added selection in buffer
		coordinates.
	**/
	function getSelectedBufferRange():Range;
	/**
		Get the {Range}s of all selections in buffer coordinates.
		
		The ranges are sorted by when the selections were added. Most recent at the end.
	**/
	function getSelectedBufferRanges():Array<Dynamic>;
	/**
		Set the selected range in buffer coordinates. If there are multiple
		selections, they are reduced to a single selection with the given range.
	**/
	function setSelectedBufferRange(bufferRange:Range, ?options:Dynamic):Void;
	/**
		Set the selected ranges in buffer coordinates. If there are multiple
		selections, they are replaced by new selections with the given ranges.
	**/
	function setSelectedBufferRanges(bufferRanges:Array<Dynamic>, ?options:Dynamic):Void;
	/**
		Get the {Range} of the most recently added selection in screen
		coordinates.
	**/
	function getSelectedScreenRange():Range;
	/**
		Get the {Range}s of all selections in screen coordinates.
		
		The ranges are sorted by when the selections were added. Most recent at the end.
	**/
	function getSelectedScreenRanges():Array<Dynamic>;
	/**
		Set the selected range in screen coordinates. If there are multiple
		selections, they are reduced to a single selection with the given range.
	**/
	function setSelectedScreenRange(screenRange:Range, ?options:Dynamic):Void;
	/**
		Set the selected ranges in screen coordinates. If there are multiple
		selections, they are replaced by new selections with the given ranges.
	**/
	function setSelectedScreenRanges(screenRanges:Array<Dynamic>, ?options:Dynamic):Void;
	/**
		Add a selection for the given range in buffer coordinates.
	**/
	function addSelectionForBufferRange(bufferRange:Range, ?options:Dynamic):Selection;
	/**
		Add a selection for the given range in screen coordinates.
	**/
	function addSelectionForScreenRange(screenRange:Range, ?options:Dynamic):Void;
	/**
		Select from the current cursor position to the given position in
		buffer coordinates.
		
		This method may merge selections that end up intesecting.
	**/
	function selectToBufferPosition(position:Point):Void;
	/**
		Select from the current cursor position to the given position in
		screen coordinates.
		
		This method may merge selections that end up intesecting.
	**/
	function selectToScreenPosition(position:Point):Void;
	/**
		Move the cursor of each selection one character upward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intesecting. 
	**/
	function selectUp(?rowCount:Float):Void;
	/**
		Move the cursor of each selection one character downward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intesecting. 
	**/
	function selectDown(?rowCount:Float):Void;
	/**
		Move the cursor of each selection one character leftward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intesecting. 
	**/
	function selectLeft(?columnCount:Float):Void;
	/**
		Move the cursor of each selection one character rightward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intesecting. 
	**/
	function selectRight(?columnCount:Float):Void;
	/**
		Select from the top of the buffer to the end of the last selection
		in the buffer.
		
		This method merges multiple selections into a single selection. 
	**/
	function selectToTop():Void;
	/**
		Selects from the top of the first selection in the buffer to the end
		of the buffer.
		
		This method merges multiple selections into a single selection. 
	**/
	function selectToBottom():Void;
	/**
		Select all text in the buffer.
		
		This method merges multiple selections into a single selection. 
	**/
	function selectAll():Void;
	/**
		Move the cursor of each selection to the beginning of its line
		while preserving the selection's tail position.
		
		This method may merge selections that end up intesecting. 
	**/
	function selectToBeginningOfLine():Void;
	/**
		Move the cursor of each selection to the first non-whitespace
		character of its line while preserving the selection's tail position. If the
		cursor is already on the first character of the line, move it to the
		beginning of the line.
		
		This method may merge selections that end up intersecting. 
	**/
	function selectToFirstCharacterOfLine():Void;
	/**
		Move the cursor of each selection to the end of its line while
		preserving the selection's tail position.
		
		This method may merge selections that end up intersecting. 
	**/
	function selectToEndOfLine():Void;
	/**
		Expand selections to the beginning of their containing word.
		
		Operates on all selections. Moves the cursor to the beginning of the
		containing word while preserving the selection's tail position. 
	**/
	function selectToBeginningOfWord():Void;
	/**
		Expand selections to the end of their containing word.
		
		Operates on all selections. Moves the cursor to the end of the containing
		word while preserving the selection's tail position. 
	**/
	function selectToEndOfWord():Void;
	/**
		For each selection, move its cursor to the preceding subword
		boundary while maintaining the selection's tail position.
		
		This method may merge selections that end up intersecting. 
	**/
	function selectToPreviousSubwordBoundary():Void;
	/**
		For each selection, move its cursor to the next subword boundary
		while maintaining the selection's tail position.
		
		This method may merge selections that end up intersecting. 
	**/
	function selectToNextSubwordBoundary():Void;
	/**
		For each cursor, select the containing line.
		
		This method merges selections on successive lines. 
	**/
	function selectLinesContainingCursors():Void;
	/**
		Select the word surrounding each cursor. 
	**/
	function selectWordsContainingCursors():Void;
	/**
		For each selection, move its cursor to the preceding word boundary
		while maintaining the selection's tail position.
		
		This method may merge selections that end up intersecting. 
	**/
	function selectToPreviousWordBoundary():Void;
	/**
		For each selection, move its cursor to the next word boundary while
		maintaining the selection's tail position.
		
		This method may merge selections that end up intersecting. 
	**/
	function selectToNextWordBoundary():Void;
	/**
		Expand selections to the beginning of the next word.
		
		Operates on all selections. Moves the cursor to the beginning of the next
		word while preserving the selection's tail position. 
	**/
	function selectToBeginningOfNextWord():Void;
	/**
		Expand selections to the beginning of the next paragraph.
		
		Operates on all selections. Moves the cursor to the beginning of the next
		paragraph while preserving the selection's tail position. 
	**/
	function selectToBeginningOfNextParagraph():Void;
	/**
		Expand selections to the beginning of the next paragraph.
		
		Operates on all selections. Moves the cursor to the beginning of the next
		paragraph while preserving the selection's tail position. 
	**/
	function selectToBeginningOfPreviousParagraph():Void;
	/**
		Select the range of the given marker if it is valid.
	**/
	function selectMarker(marker:DisplayMarker):Range;
	/**
		Get the most recently added {Selection}.
	**/
	function getLastSelection():Selection;
	/**
		Get current {Selection}s.
	**/
	function getSelections():Array<Dynamic>;
	/**
		Get all {Selection}s, ordered by their position in the buffer
		instead of the order in which they were added.
	**/
	function getSelectionsOrderedByBufferPosition():Array<Dynamic>;
	/**
		Determine if a given range in buffer coordinates intersects a
		selection.
	**/
	function selectionIntersectsBufferRange(bufferRange:Range):Bool;
	/**
		Scan regular expression matches in the entire buffer, calling the
		given iterator function on each match.
		
		`::scan` functions as the replace method as well via the `replace`
		
		If you're programmatically modifying the results, you may want to try
		{::backwardsScanInBufferRange} to avoid tripping over your own changes.
	**/
	function scan(regex:EReg, iterator:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in a given range, calling the given
		iterator function on each match.
	**/
	function scanInBufferRange(regex:EReg, range:Range, iterator:haxe.Constraints.Function):Void;
	/**
		Scan regular expression matches in a given range in reverse order,
		calling the given iterator function on each match.
	**/
	function backwardsScanInBufferRange(regex:EReg, range:Range, iterator:haxe.Constraints.Function):Void;
	function getSoftTabs():Bool;
	/**
		Enable or disable soft tabs for this editor.
	**/
	function setSoftTabs(softTabs:Bool):Void;
	/**
		Toggle soft tabs for this editor 
	**/
	function toggleSoftTabs():Void;
	/**
		Get the on-screen length of tab characters.
	**/
	function getTabLength():Float;
	/**
		Set the on-screen length of tab characters. Setting this to a
		{Number} This will override the `editor.tabLength` setting.
	**/
	function setTabLength(tabLength:Float):Void;
	/**
		Determine if the buffer uses hard or soft tabs.
	**/
	function usesSoftTabs():Dynamic;
	/**
		Get the text representing a single level of indent.
		
		If soft tabs are enabled, the text is composed of N spaces, where N is the
		tab length. Otherwise the text is a tab character (`\t`).
	**/
	function getTabText():String;
	/**
		Determine whether lines in this editor are soft-wrapped.
	**/
	function isSoftWrapped():Bool;
	/**
		Enable or disable soft wrapping for this editor.
	**/
	function setSoftWrapped(softWrapped:Bool):Bool;
	/**
		Toggle soft wrapping for this editor
	**/
	function toggleSoftWrapped():Bool;
	/**
		Gets the column at which column will soft wrap 
	**/
	function getSoftWrapColumn():Void;
	/**
		Get the indentation level of the given buffer row.
		
		Determines how deeply the given row is indented based on the soft tabs and
		tab length settings of this editor. Note that if soft tabs are enabled and
		the tab length is 2, a row with 4 leading spaces would have an indentation
		level of 2.
	**/
	function indentationForBufferRow(bufferRow:Float):Float;
	/**
		Set the indentation level for the given buffer row.
		
		Inserts or removes hard tabs or spaces based on the soft tabs and tab length
		settings of this editor in order to bring it to the given indentation level.
		Note that if soft tabs are enabled and the tab length is 2, a row with 4
		leading spaces would have an indentation level of 2.
	**/
	function setIndentationForBufferRow(bufferRow:Float, newLevel:Float, ?options:Dynamic):Void;
	/**
		Indent rows intersecting selections by one level. 
	**/
	function indentSelectedRows():Void;
	/**
		Outdent rows intersecting selections by one level. 
	**/
	function outdentSelectedRows():Void;
	/**
		Get the indentation level of the given line of text.
		
		Determines how deeply the given line is indented based on the soft tabs and
		tab length settings of this editor. Note that if soft tabs are enabled and
		the tab length is 2, a row with 4 leading spaces would have an indentation
		level of 2.
	**/
	function indentLevelForLine(line:String):Float;
	/**
		Indent rows intersecting selections based on the grammar's suggested
		indent level. 
	**/
	function autoIndentSelectedRows():Void;
	/**
		Get the current {Grammar} of this editor. 
	**/
	function getGrammar():Void;
	/**
		Set the current {Grammar} of this editor.
		
		Assigning a grammar will cause the editor to re-tokenize based on the new
		grammar.
	**/
	function setGrammar(grammar:Grammar):Void;
	function getRootScopeDescriptor():ScopeDescriptor;
	/**
		Get the syntactic scopeDescriptor for the given position in buffer
		coordinates. Useful with {Config::get}.
		
		For example, if called with a position inside the parameter list of an
		anonymous CoffeeScript function, the method returns the following array:
		`["source.coffee", "meta.inline.function.coffee", "variable.parameter.function.coffee"]`
	**/
	function scopeDescriptorForBufferPosition(bufferPosition:Point):ScopeDescriptor;
	/**
		Get the range in buffer coordinates of all tokens surrounding the
		cursor that match the given scope selector.
		
		For example, if you wanted to find the string surrounding the cursor, you
		could call `editor.bufferRangeForScopeAtCursor(".string.quoted")`.
	**/
	function bufferRangeForScopeAtCursor(scopeSelector:String):Range;
	/**
		Determine if the given row is entirely a comment 
	**/
	function isBufferRowCommented():Void;
	/**
		For each selection, copy the selected text. 
	**/
	function copySelectedText():Void;
	/**
		For each selection, cut the selected text. 
	**/
	function cutSelectedText():Void;
	/**
		For each selection, replace the selected text with the contents of
		the clipboard.
		
		If the clipboard contains the same number of selections as the current
		editor, each selection will be replaced with the content of the
		corresponding clipboard selection text.
	**/
	function pasteText(?options:Dynamic):Void;
	/**
		For each selection, if the selection is empty, cut all characters
		of the containing screen line following the cursor. Otherwise cut the selected
		text. 
	**/
	function cutToEndOfLine():Void;
	/**
		For each selection, if the selection is empty, cut all characters
		of the containing buffer line following the cursor. Otherwise cut the
		selected text. 
	**/
	function cutToEndOfBufferLine():Void;
	/**
		Fold the most recent cursor's row based on its indentation level.
		
		The fold will extend from the nearest preceding line with a lower
		indentation level up to the nearest following row with a lower indentation
		level. 
	**/
	function foldCurrentRow():Void;
	/**
		Unfold the most recent cursor's row by one level. 
	**/
	function unfoldCurrentRow():Void;
	/**
		Fold the given row in buffer coordinates based on its indentation
		level.
		
		If the given row is foldable, the fold will begin there. Otherwise, it will
		begin at the first foldable row preceding the given row.
	**/
	function foldBufferRow(bufferRow:Float):Void;
	/**
		Unfold all folds containing the given row in buffer coordinates.
	**/
	function unfoldBufferRow(bufferRow:Float):Void;
	/**
		For each selection, fold the rows it intersects. 
	**/
	function foldSelectedLines():Void;
	/**
		Fold all foldable lines. 
	**/
	function foldAll():Void;
	/**
		Unfold all existing folds. 
	**/
	function unfoldAll():Void;
	/**
		Fold all foldable lines at the given indent level.
	**/
	function foldAllAtIndentLevel(level:Float):Void;
	/**
		Determine whether the given row in buffer coordinates is foldable.
		
		A *foldable* row is a row that *starts* a row range that can be folded.
	**/
	function isFoldableAtBufferRow(bufferRow:Float):Bool;
	/**
		Determine whether the given row in screen coordinates is foldable.
		
		A *foldable* row is a row that *starts* a row range that can be folded.
	**/
	function isFoldableAtScreenRow(bufferRow:Float):Bool;
	/**
		Fold the given buffer row if it isn't currently folded, and unfold
		it otherwise. 
	**/
	function toggleFoldAtBufferRow():Void;
	/**
		Determine whether the most recently added cursor's row is folded.
	**/
	function isFoldedAtCursorRow():Bool;
	/**
		Determine whether the given row in buffer coordinates is folded.
	**/
	function isFoldedAtBufferRow(bufferRow:Float):Bool;
	/**
		Determine whether the given row in screen coordinates is folded.
	**/
	function isFoldedAtScreenRow(screenRow:Float):Bool;
	/**
		Add a custom {Gutter}.
	**/
	function addGutter(options:Dynamic):Gutter;
	/**
		Get this editor's gutters.
	**/
	function getGutters():Array<Dynamic>;
	/**
		Get the gutter with the given name.
	**/
	function gutterWithName():Gutter;
	/**
		Scroll the editor to reveal the most recently added cursor if it is
		off-screen.
	**/
	function scrollToCursorPosition(?options:Dynamic):Void;
	/**
		Scrolls the editor to the given buffer position.
	**/
	function scrollToBufferPosition(bufferPosition:Dynamic, ?options:Dynamic):Void;
	/**
		Scrolls the editor to the given screen position.
	**/
	function scrollToScreenPosition(screenPosition:Dynamic, ?options:Dynamic):Void;
	/**
		Retrieves the greyed out placeholder of a mini editor.
	**/
	function getPlaceholderText():String;
	/**
		Set the greyed out placeholder of a mini editor. Placeholder text
		will be displayed when the editor has no content.
	**/
	function setPlaceholderText(placeholderText:String):Void;
}