package atom;

/**
	This class represents all essential editing state for a single
	{TextBuffer}, including cursor and selection positions, folds, and soft wraps.
	If you're manipulating the state of an editor, use this class.
	
	A single {TextBuffer} can belong to multiple editors. For example, if the
	same file is open in two different panes, Atom creates a separate editor for
	each pane. If the buffer is manipulated the changes are reflected in both
	editors, but each maintains its own cursor position, folded lines, etc.
	
	## Accessing TextEditor Instances
	
	The easiest way to get hold of `TextEditor` objects is by registering a callback
	with `::observeTextEditors` on the `atom.workspace` global. Your callback will
	then be called with all current editor instances and also when any editor is
	created in the future.
	
	```js
	atom.workspace.observeTextEditors(editor => {
	  editor.insertText('Hello World')
	})
	```
	
	## Buffer vs. Screen Coordinates
	
	Because editors support folds and soft-wrapping, the lines on screen don't
	always match the lines in the buffer. For example, a long line that soft wraps
	twice renders as three lines on screen, but only represents one line in the
	buffer. Similarly, if rows 5-10 are folded, then row 6 on screen corresponds
	to row 11 in the buffer.
	
	Your choice of coordinates systems will depend on what you're trying to
	achieve. For example, if you're writing a command that jumps the cursor up or
	down by 10 lines, you'll want to use screen coordinates because the user
	probably wants to skip lines *on screen*. However, if you're writing a package
	that jumps between method definitions, you'll want to work in buffer
	coordinates.
	
	**When in doubt, just default to buffer coordinates**, then experiment with
	soft wraps and folds to ensure your code interacts with them correctly.
	@see <https://github.com/atom/atom/blob/v1.28.1/src/text-editor.js#L69>

**/
@:require(js, atom) @:jsRequire("atom", "TextEditor") extern class TextEditor {
	/**
		Calls your `callback` when the buffer's title has changed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeTitle(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the buffer's path, and therefore title, has changed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangePath(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback synchronously when the content of the
		buffer changes.
		
		Because observers are invoked synchronously, it's important not to perform
		any expensive operations via this method. Consider {::onDidStopChanging} to
		delay expensive operations until after changes stop occurring.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChange(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke `callback` when the buffer's contents change. It is
		emit asynchronously 300ms after the last buffer change. This is a good place
		to handle changes to the buffer without compromising typing performance.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidStopChanging(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Cursor` is moved. If there are
		multiple cursors, your callback will be called for each cursor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeCursorPosition(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a selection's screen range changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeSelectionRange(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when soft wrap was enabled or disabled.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeSoftWrapped(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the buffer's encoding has changed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeEncoding(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the grammar that interprets and
		colorizes the text has been changed. Immediately calls your callback with
		the current grammar.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the grammar that interprets and
		colorizes the text has been changed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the result of {::isModified} changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeModified(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the buffer's underlying file changes on
		disk at a moment when the result of {::isModified} is true.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidConflict(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` before text has been inserted.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillInsertText(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` after text has been inserted.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidInsertText(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback after the buffer is saved to disk.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidSave(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the editor is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Cursor` is added to the editor.
		Immediately calls your callback for each existing cursor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeCursors(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Cursor` is added to the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddCursor(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Cursor` is removed from the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRemoveCursor(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Selection` is added to the editor.
		Immediately calls your callback for each existing selection.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeSelections(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Selection` is added to the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddSelection(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Selection` is removed from the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRemoveSelection(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` with each `Decoration` added to the editor.
		Calls your `callback` immediately for any existing decorations.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeDecorations(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Decoration` is added to the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddDecoration(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Decoration` is removed from the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRemoveDecoration(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the placeholder text is changed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangePlaceholderText(callback:haxe.Constraints.Function):Disposable;
	/**
		Retrieves the current {TextBuffer}.
	**/
	function getBuffer():Void;
	/**
		Calls your `callback` when a `Gutter` is added to the editor.
		Immediately calls your callback for each existing gutter.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeGutters(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Gutter` is added to the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddGutter(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when a `Gutter` is removed from the editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRemoveGutter(callback:haxe.Constraints.Function):Disposable;
	/**
		Get the editor's title for display in other parts of the
		UI such as the tabs.
		
		If the editor's buffer is saved, its title is the file name. If it is
		unsaved, its title is "untitled".Returns a `String`.
	**/
	function getTitle():String;
	/**
		Get unique title for display in other parts of the UI, such as
		the window title.
		
		If the editor's buffer is unsaved, its title is "untitled"
		If the editor's buffer is saved, its unique title is formatted as one
		of the following,
		
		* "<filename>" when it is the only editing buffer with this file name.
		* "<filename> — <unique-dir-prefix>" when other buffers have this file name.Returns a `String`
	**/
	function getLongTitle():String;
	/**
		Returns the `String` path of this editor's text buffer.
	**/
	function getPath():String;
	/**
		Returns the `String` character set encoding of this editor's text
		buffer.
	**/
	function getEncoding():String;
	/**
		Set the character set encoding to use in this editor's text
		buffer.
	**/
	function setEncoding(encoding:String):Void;
	/**
		Returns `Boolean` `true` if this editor has been modified.
	**/
	function isModified():Bool;
	/**
		Returns `Boolean` `true` if this editor has no content.
	**/
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
	/**
		Returns a `String` representing the entire contents of the editor.
	**/
	function getText():String;
	/**
		Get the text in the given `Range` in buffer coordinates.Returns a `String`.
	**/
	function getTextInBufferRange(range:Range):String;
	/**
		Returns a `Number` representing the number of lines in the buffer.
	**/
	function getLineCount():Float;
	/**
		Returns a `Number` representing the number of screen lines in the
		editor. This accounts for folds.
	**/
	function getScreenLineCount():Float;
	/**
		Returns a `Number` representing the last zero-indexed buffer row
		number of the editor.
	**/
	function getLastBufferRow():Float;
	/**
		Returns a `Number` representing the last zero-indexed screen row
		number of the editor.
	**/
	function getLastScreenRow():Float;
	/**
		
		
		Returns a `String` representing the contents of the line at the
		given buffer row.
	**/
	function lineTextForBufferRow(bufferRow:Float):String;
	/**
		
		
		Returns a `String` representing the contents of the line at the
		given screen row.
	**/
	function lineTextForScreenRow(screenRow:Float):String;
	/**
		Get the `Range` of the paragraph surrounding the most recently added
		cursor.Returns a `Range`.
	**/
	function getCurrentParagraphBufferRange():Range;
	/**
		Replaces the entire contents of the buffer with the given `String`.
	**/
	function setText(text:String, ?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Set the text in the given `Range` in buffer coordinates.Returns the `Range` of the newly-inserted text.
	**/
	function setTextInBufferRange(range:Range, text:String, ?options:{ /**
		{Boolean} (default: true)
	**/
	@:optional
	var normalizeLineEndings : Bool; /**
		*Deprecated* {String} 'skip' will skip the undo system. This property is deprecated. Call groupLastChanges() on the {TextBuffer} afterward instead.
	**/
	@:optional
	var undo : String; /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Range;
	/**
		For each selection, replace the selected text with the given text.Returns a `Range` when the text has been inserted.
	**/
	function insertText(text:String, ?options:Dynamic):Range;
	/**
		For each selection, replace the selected text with a newline.
	**/
	function insertNewline(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete the character
		following the cursor. Otherwise delete the selected text.
	**/
	function delete(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete the character
		preceding the cursor. Otherwise delete the selected text.
	**/
	function backspace(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Mutate the text of all the selections in a single transaction.
		
		All the changes made inside the given `Function` can be reverted with a
		single call to {::undo}.
	**/
	function mutateSelectedText(fn:haxe.Constraints.Function):Void;
	/**
		For each selection, transpose the selected text.
		
		If the selection is empty, the characters preceding and following the cursor
		are swapped. Otherwise, the selected characters are reversed.
	**/
	function transpose(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Convert the selected text to upper case.
		
		For each selection, if the selection is empty, converts the containing word
		to upper case. Otherwise convert the selected text to upper case.
	**/
	function upperCase(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Convert the selected text to lower case.
		
		For each selection, if the selection is empty, converts the containing word
		to upper case. Otherwise convert the selected text to upper case.
	**/
	function lowerCase(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Toggle line comments for rows intersecting selections.
		
		If the current grammar doesn't support comments, does nothing.
	**/
	function toggleLineCommentsInSelection(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each cursor, insert a newline at beginning the following line.
	**/
	function insertNewlineBelow(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each cursor, insert a newline at the end of the preceding line.
	**/
	function insertNewlineAbove(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing word that precede the cursor. Otherwise delete the
		selected text.
	**/
	function deleteToBeginningOfWord(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Similar to {::deleteToBeginningOfWord}, but deletes only back to the
		previous word boundary.
	**/
	function deleteToPreviousWordBoundary(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Similar to {::deleteToEndOfWord}, but deletes only up to the
		next word boundary.
	**/
	function deleteToNextWordBoundary(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing subword following the cursor. Otherwise delete the selected
		text.
	**/
	function deleteToBeginningOfSubword(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing subword following the cursor. Otherwise delete the selected
		text.
	**/
	function deleteToEndOfSubword(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing line that precede the cursor. Otherwise delete the
		selected text.
	**/
	function deleteToBeginningOfLine(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is not empty, deletes the
		selection; otherwise, deletes all characters of the containing line
		following the cursor. If the cursor is already at the end of the line,
		deletes the following newline.
	**/
	function deleteToEndOfLine(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, delete all characters
		of the containing word following the cursor. Otherwise delete the selected
		text.
	**/
	function deleteToEndOfWord(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Delete all lines intersecting selections.
	**/
	function deleteLine(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Undo the last change.
	**/
	function undo(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Redo the last change.
	**/
	function redo(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
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
	function revertToCheckpoint(checkpoint:Dynamic):Bool;
	/**
		Group all changes since the given checkpoint into a single
		transaction for purposes of undo/redo.
		
		If the given checkpoint is no longer present in the undo history, no
		grouping will be performed and this method will return `false`.Returns a `Boolean` indicating whether the operation succeeded.
	**/
	function groupChangesSinceCheckpoint(checkpoint:Dynamic):Bool;
	/**
		Convert a position in buffer-coordinates to screen-coordinates.
		
		The position is clipped via {::clipBufferPosition} prior to the conversion.
		The position is also clipped via {::clipScreenPosition} following the
		conversion, which only makes a difference when `options` are supplied.Returns a `Point`.
	**/
	function screenPositionForBufferPosition(bufferPosition:Point, ?options:Dynamic):Point;
	/**
		Convert a position in screen-coordinates to buffer-coordinates.
		
		The position is clipped via {::clipScreenPosition} prior to the conversion.Returns a `Point`.
	**/
	function bufferPositionForScreenPosition(bufferPosition:Point, ?options:Dynamic):Point;
	/**
		Convert a range in buffer-coordinates to screen-coordinates.Returns a `Range`.
	**/
	function screenRangeForBufferRange(bufferRange:Range):Range;
	/**
		Convert a range in screen-coordinates to buffer-coordinates.Returns a `Range`.
	**/
	function bufferRangeForScreenRange(screenRange:Range):Range;
	/**
		Clip the given `Point` to a valid position in the buffer.
		
		If the given `Point` describes a position that is actually reachable by the
		cursor based on the current contents of the buffer, it is returned
		unchanged. If the `Point` does not describe a valid position, the closest
		valid position is returned instead.Returns a `Point`.
	**/
	function clipBufferPosition(bufferPosition:Point):Point;
	/**
		Clip the start and end of the given range to valid positions in the
		buffer. See {::clipBufferPosition} for more information.Returns a `Range`.
	**/
	function clipBufferRange(range:Range):Range;
	/**
		Clip the given `Point` to a valid position on screen.
		
		If the given `Point` describes a position that is actually reachable by the
		cursor based on the current contents of the screen, it is returned
		unchanged. If the `Point` does not describe a valid position, the closest
		valid position is returned instead.Returns a `Point`.
	**/
	function clipScreenPosition(screenPosition:Point, ?options:{ /**
		{String} If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`.
	**/
	var clipDirection : String; }):Point;
	/**
		Clip the start and end of the given range to valid positions on screen.
		See {::clipScreenPosition} for more information.Returns a `Range`.
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
		* __gutter__: A decoration that tracks a {DisplayMarker} in a `Gutter`. Gutter
		    decorations are created by calling `Gutter.decorateMarker` on the
		    desired `Gutter` instance.
		* __block__: Positions the view associated with the given item before or
		    after the row of the given `TextEditorMarker`.Returns a `Decoration` object
	**/
	function decorateMarker(marker:DisplayMarker, decorationParams:{ /**
		There are several supported decoration types. The behavior of the types are as follows:
	**/
	var type : Dynamic; /**
		This CSS class will be applied to the decorated line number, line, text spans, highlight regions, cursors, or overlay.
	**/
	@:native("class")
	var class_ : Dynamic; /**
		An {Object} containing CSS style properties to apply to the relevant DOM node. Currently this only works with a `type` of `cursor` or `text`.
	**/
	var style : Dynamic; /**
		An {HTMLElement} or a model {Object} with a corresponding view registered. Only applicable to the `gutter`, `overlay` and `block` decoration types.
	**/
	@:optional
	var item : js.html.HtmlElement; /**
		If `true`, the decoration will only be applied to the head of the `DisplayMarker`. Only applicable to the `line` and `line-number` decoration types.
	**/
	@:optional
	var onlyHead : Dynamic; /**
		If `true`, the decoration will only be applied if the associated `DisplayMarker` is empty. Only applicable to the `gutter`, `line`, and `line-number` decoration types.
	**/
	@:optional
	var onlyEmpty : Dynamic; /**
		If `true`, the decoration will only be applied if the associated `DisplayMarker` is non-empty. Only applicable to the `gutter`, `line`, and `line-number` decoration types.
	**/
	@:optional
	var onlyNonEmpty : Dynamic; /**
		If `false`, the decoration will be applied to the last row of a non-empty range, even if it ends at column 0. Defaults to `true`. Only applicable to the `gutter`, `line`, and `line-number` decoration types.
	**/
	@:optional
	var omitEmptyLastRow : Dynamic; /**
		Only applicable to decorations of type `overlay` and `block`. Controls where the view is positioned relative to the `TextEditorMarker`. Values can be `'head'` (the default) or `'tail'` for overlay decorations, and `'before'` (the default) or `'after'` for block decorations.
	**/
	@:optional
	var position : Dynamic; /**
		Only applicable to decorations of type  `overlay`. Determines whether the decoration adjusts its horizontal or  vertical position to remain fully visible when it would otherwise  overflow the editor. Defaults to `true`.
	**/
	@:optional
	var avoidOverflow : Dynamic; }):Decoration;
	/**
		Add a decoration to every marker in the given marker layer. Can
		be used to decorate a large number of markers without having to create and
		manage many individual decorations.Returns a {LayerDecoration}.
	**/
	function decorateMarkerLayer(markerLayer:DisplayMarkerLayer, decorationParams:Dynamic):LayerDecoration;
	/**
		Get all decorations.Returns an `Array` of `Decoration`s.
	**/
	function getDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'line'.Returns an `Array` of `Decoration`s.
	**/
	function getLineDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'line-number'.Returns an `Array` of `Decoration`s.
	**/
	function getLineNumberDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'highlight'.Returns an `Array` of `Decoration`s.
	**/
	function getHighlightDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Get all decorations of type 'overlay'.Returns an `Array` of `Decoration`s.
	**/
	function getOverlayDecorations(?propertyFilter:Dynamic):Array<Dynamic>;
	/**
		Create a marker on the default marker layer with the given range
		in buffer coordinates. This marker will maintain its logical location as the
		buffer is changed, so if you mark a particular word, the marker will remain
		over that word even if the word's location in the buffer changes.Returns a {DisplayMarker}.
	**/
	function markBufferRange(range:Range, properties:Dynamic):DisplayMarker;
	/**
		Create a marker on the default marker layer with the given range
		in screen coordinates. This marker will maintain its logical location as the
		buffer is changed, so if you mark a particular word, the marker will remain
		over that word even if the word's location in the buffer changes.Returns a {DisplayMarker}.
	**/
	function markScreenRange(range:Range, properties:Dynamic):DisplayMarker;
	/**
		Create a marker on the default marker layer with the given buffer
		position and no tail. To group multiple markers together in their own
		private layer, see {::addMarkerLayer}.Returns a {DisplayMarker}.
	**/
	function markBufferPosition(bufferPosition:Point, ?options:{ /**
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
	var invalidate : String; }):DisplayMarker;
	/**
		Create a marker on the default marker layer with the given screen
		position and no tail. To group multiple markers together in their own
		private layer, see {::addMarkerLayer}.Returns a {DisplayMarker}.
	**/
	function markScreenPosition(screenPosition:Point, ?options:{ /**
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
		{String} If `'backward'`, returns the first valid position preceding an invalid position. If `'forward'`, returns the first valid position following an invalid position. If `'closest'`, returns the first valid position closest to an invalid position. Defaults to `'closest'`.
	**/
	var clipDirection : String; }):DisplayMarker;
	/**
		Find all {DisplayMarker}s on the default marker layer that
		match the given properties.
		
		This method finds markers based on the given properties. Markers can be
		associated with custom properties that will be compared with basic equality.
		In addition, there are several special properties that will be compared
		with the range of the markers rather than their properties.Returns an `Array` of {DisplayMarker}s
	**/
	function findMarkers(properties:{ /**
		Only include markers starting at this row in buffer   coordinates.
	**/
	var startBufferRow : Dynamic; /**
		Only include markers ending at this row in buffer   coordinates.
	**/
	var endBufferRow : Dynamic; /**
		Only include markers containing this {Range} or   in range-compatible {Array} in buffer coordinates.
	**/
	var containsBufferRange : Range; /**
		Only include markers containing this {Point}   or {Array} of `[row, column]` in buffer coordinates.
	**/
	var containsBufferPosition : Point; }):Array<Dynamic>;
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
		Get the number of markers in the default marker layer.Returns a `Number`.
	**/
	function getMarkerCount():Float;
	/**
		Create a marker layer to group related markers.Returns a {DisplayMarkerLayer}.
	**/
	function addMarkerLayer(options:{ /**
		A {Boolean} indicating whether marker state should be restored on undo/redo. Defaults to `false`.
	**/
	var maintainHistory : Bool; /**
		A {Boolean} indicating whether or not this marker layer should be serialized and deserialized along with the rest of the buffer. Defaults to `false`. If `true`, the marker layer's id will be maintained across the serialization boundary, allowing you to retrieve it via {::getMarkerLayer}.
	**/
	var persistent : Bool; }):DisplayMarkerLayer;
	/**
		Get a {DisplayMarkerLayer} by id.Returns a {DisplayMarkerLayer} or `undefined` if no layer exists with the
		given id.
	**/
	function getMarkerLayer(id:Dynamic):DisplayMarkerLayer;
	/**
		Get the default {DisplayMarkerLayer}.
		
		All marker APIs not tied to an explicit layer interact with this default
		layer.Returns a {DisplayMarkerLayer}.
	**/
	function getDefaultMarkerLayer():DisplayMarkerLayer;
	/**
		Get the position of the most recently added cursor in buffer
		coordinates.Returns a `Point`
	**/
	function getCursorBufferPosition():Point;
	/**
		Get the position of all the cursor positions in buffer coordinates.Returns `Array` of `Point`s in the order they were added
	**/
	function getCursorBufferPositions():Array<Dynamic>;
	/**
		Move the cursor to the given position in buffer coordinates.
		
		If there are multiple cursors, they will be consolidated to a single cursor.
	**/
	function setCursorBufferPosition(position:Point, ?options:{ /**
		Determines whether the editor scrolls to the new cursor's position. Defaults to true.
	**/
	var autoscroll : Dynamic; }):Void;
	/**
		Get a `Cursor` at given screen coordinates `Point`Returns the first matched `Cursor` or undefined
	**/
	function getCursorAtScreenPosition(position:Point):Cursor;
	/**
		Get the position of the most recently added cursor in screen
		coordinates.Returns a `Point`.
	**/
	function getCursorScreenPosition():Point;
	/**
		Get the position of all the cursor positions in screen coordinates.Returns `Array` of `Point`s in the order the cursors were added
	**/
	function getCursorScreenPositions():Array<Dynamic>;
	/**
		Move the cursor to the given position in screen coordinates.
		
		If there are multiple cursors, they will be consolidated to a single cursor.
	**/
	function setCursorScreenPosition(position:Point, ?options:{ /**
		Determines whether the editor scrolls to the new cursor's position. Defaults to true.
	**/
	var autoscroll : Dynamic; }):Void;
	/**
		Add a cursor at the given position in buffer coordinates.Returns a `Cursor`.
	**/
	function addCursorAtBufferPosition(bufferPosition:Point):Cursor;
	/**
		Add a cursor at the position in screen coordinates.Returns a `Cursor`.
	**/
	function addCursorAtScreenPosition(screenPosition:Point):Cursor;
	/**
		Returns `Boolean` indicating whether or not there are multiple cursors.
	**/
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
	/**
		Returns the most recently added `Cursor`
	**/
	function getLastCursor():Cursor;
	/**
		
		
		Returns the word surrounding the most recently added cursor.
	**/
	function getWordUnderCursor(?options:Dynamic):Dynamic;
	/**
		Get an Array of all `Cursor`s.
	**/
	function getCursors():Void;
	/**
		Get all `Cursor`s, ordered by their position in the buffer
		instead of the order in which they were added.Returns an `Array` of `Selection`s.
	**/
	function getCursorsOrderedByBufferPosition():Array<Dynamic>;
	/**
		Get the selected text of the most recently added selection.Returns a `String`.
	**/
	function getSelectedText():String;
	/**
		Get the `Range` of the most recently added selection in buffer
		coordinates.Returns a `Range`.
	**/
	function getSelectedBufferRange():Range;
	/**
		Get the `Range`s of all selections in buffer coordinates.
		
		The ranges are sorted by when the selections were added. Most recent at the end.Returns an `Array` of `Range`s.
	**/
	function getSelectedBufferRanges():Array<Dynamic>;
	/**
		Set the selected range in buffer coordinates. If there are multiple
		selections, they are reduced to a single selection with the given range.
	**/
	function setSelectedBufferRange(bufferRange:Range, ?options:{ /**
		A {Boolean} indicating whether to create the selection in a reversed orientation.
	**/
	var reversed : Bool; /**
		A {Boolean}, which if `true` preserves the fold settings after the selection is set.
	**/
	var preserveFolds : Bool; }):Void;
	/**
		Set the selected ranges in buffer coordinates. If there are multiple
		selections, they are replaced by new selections with the given ranges.
	**/
	function setSelectedBufferRanges(bufferRanges:Array<Dynamic>, ?options:{ /**
		A {Boolean} indicating whether to create the selection in a reversed orientation.
	**/
	var reversed : Bool; /**
		A {Boolean}, which if `true` preserves the fold settings after the selection is set.
	**/
	var preserveFolds : Bool; }):Void;
	/**
		Get the `Range` of the most recently added selection in screen
		coordinates.Returns a `Range`.
	**/
	function getSelectedScreenRange():Range;
	/**
		Get the `Range`s of all selections in screen coordinates.
		
		The ranges are sorted by when the selections were added. Most recent at the end.Returns an `Array` of `Range`s.
	**/
	function getSelectedScreenRanges():Array<Dynamic>;
	/**
		Set the selected range in screen coordinates. If there are multiple
		selections, they are reduced to a single selection with the given range.
	**/
	function setSelectedScreenRange(screenRange:Range, ?options:{ /**
		A {Boolean} indicating whether to create the selection in a reversed orientation.
	**/
	var reversed : Bool; }):Void;
	/**
		Set the selected ranges in screen coordinates. If there are multiple
		selections, they are replaced by new selections with the given ranges.
	**/
	function setSelectedScreenRanges(screenRanges:Array<Dynamic>, ?options:{ /**
		A {Boolean} indicating whether to create the selection in a reversed orientation.
	**/
	var reversed : Bool; }):Void;
	/**
		Add a selection for the given range in buffer coordinates.Returns the added `Selection`.
	**/
	function addSelectionForBufferRange(bufferRange:Range, ?options:{ /**
		A {Boolean} indicating whether to create the selection in a reversed orientation.
	**/
	var reversed : Bool; /**
		A {Boolean}, which if `true` preserves the fold settings after the selection is set.
	**/
	var preserveFolds : Bool; }):Selection;
	/**
		Add a selection for the given range in screen coordinates.
	**/
	function addSelectionForScreenRange(screenRange:Range, ?options:{ /**
		A {Boolean} indicating whether to create the selection in a reversed orientation.
	**/
	var reversed : Bool; /**
		A {Boolean}, which if `true` preserves the fold settings after the selection is set. Returns the added {Selection}.
	**/
	var preserveFolds : Bool; }):Void;
	/**
		Select from the current cursor position to the given position in
		buffer coordinates.
		
		This method may merge selections that end up intersecting.
	**/
	function selectToBufferPosition(position:Point):Void;
	/**
		Select from the current cursor position to the given position in
		screen coordinates.
		
		This method may merge selections that end up intersecting.
	**/
	function selectToScreenPosition(position:Point):Void;
	/**
		Move the cursor of each selection one character upward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intersecting.
	**/
	function selectUp(?rowCount:Float):Void;
	/**
		Move the cursor of each selection one character downward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intersecting.
	**/
	function selectDown(?rowCount:Float):Void;
	/**
		Move the cursor of each selection one character leftward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intersecting.
	**/
	function selectLeft(?columnCount:Float):Void;
	/**
		Move the cursor of each selection one character rightward while
		preserving the selection's tail position.
		
		This method may merge selections that end up intersecting.
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
		
		This method may merge selections that end up intersecting.
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
		For each selection, select the syntax node that contains
		that selection.
	**/
	function selectLargerSyntaxNode():Void;
	/**
		Undo the effect a preceding call to {::selectLargerSyntaxNode}.
	**/
	function selectSmallerSyntaxNode():Void;
	/**
		Select the range of the given marker if it is valid.Returns the selected `Range` or `undefined` if the marker is invalid.
	**/
	function selectMarker(marker:DisplayMarker):Range;
	/**
		Get the most recently added `Selection`.Returns a `Selection`.
	**/
	function getLastSelection():Selection;
	/**
		Get current `Selection`s.Returns: An `Array` of `Selection`s.
	**/
	function getSelections():Array<Dynamic>;
	/**
		Get all `Selection`s, ordered by their position in the buffer
		instead of the order in which they were added.Returns an `Array` of `Selection`s.
	**/
	function getSelectionsOrderedByBufferPosition():Array<Dynamic>;
	/**
		Determine if a given range in buffer coordinates intersects a
		selection.Returns a `Boolean`.
	**/
	function selectionIntersectsBufferRange(bufferRange:Range):Bool;
	/**
		Scan regular expression matches in the entire buffer, calling the
		given iterator function on each match.
		
		`::scan` functions as the replace method as well via the `replace`
		
		If you're programmatically modifying the results, you may want to try
		{::backwardsScanInBufferRange} to avoid tripping over your own changes.
	**/
	function scan(regex:EReg, ?options:{ /**
		{Number} default `0`; The number of lines  before the matched line to include in the results object.
	**/
	var leadingContextLineCount : Float; /**
		{Number} default `0`; The number of lines  after the matched line to include in the results object.
	**/
	var trailingContextLineCount : Float; }, iterator:haxe.Constraints.Function):Void;
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
	/**
		Returns a `Boolean` indicating whether softTabs are enabled for this
		editor.
	**/
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
		Get the on-screen length of tab characters.Returns a `Number`.
	**/
	function getTabLength():Float;
	/**
		Set the on-screen length of tab characters. Setting this to a
		`Number` This will override the `editor.tabLength` setting.
	**/
	function setTabLength(tabLength:Float):Void;
	/**
		Determine if the buffer uses hard or soft tabs.Returns `true` if the first non-comment line with leading whitespace starts
		with a space character.
	**/
	function usesSoftTabs():Dynamic;
	/**
		Get the text representing a single level of indent.
		
		If soft tabs are enabled, the text is composed of N spaces, where N is the
		tab length. Otherwise the text is a tab character (`\t`).Returns a `String`.
	**/
	function getTabText():String;
	/**
		Determine whether lines in this editor are soft-wrapped.Returns a `Boolean`.
	**/
	function isSoftWrapped():Bool;
	/**
		Enable or disable soft wrapping for this editor.Returns a `Boolean`.
	**/
	function setSoftWrapped(softWrapped:Bool):Bool;
	/**
		Toggle soft wrapping for this editorReturns a `Boolean`.
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
		level of 2.Returns a `Number`.
	**/
	function indentationForBufferRow(bufferRow:Float):Float;
	/**
		Set the indentation level for the given buffer row.
		
		Inserts or removes hard tabs or spaces based on the soft tabs and tab length
		settings of this editor in order to bring it to the given indentation level.
		Note that if soft tabs are enabled and the tab length is 2, a row with 4
		leading spaces would have an indentation level of 2.
	**/
	function setIndentationForBufferRow(bufferRow:Float, newLevel:Float, ?options:{ /**
		`true` to preserve any whitespace already at  the beginning of the line (default: false).
	**/
	var preserveLeadingWhitespace : Dynamic; }):Void;
	/**
		Indent rows intersecting selections by one level.
	**/
	function indentSelectedRows(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Outdent rows intersecting selections by one level.
	**/
	function outdentSelectedRows(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Get the indentation level of the given line of text.
		
		Determines how deeply the given line is indented based on the soft tabs and
		tab length settings of this editor. Note that if soft tabs are enabled and
		the tab length is 2, a row with 4 leading spaces would have an indentation
		level of 2.Returns a `Number`.
	**/
	function indentLevelForLine(line:String):Float;
	/**
		Indent rows intersecting selections based on the grammar's suggested
		indent level.
	**/
	function autoIndentSelectedRows(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Get the current `Grammar` of this editor.
	**/
	function getGrammar():Void;
	/**
		Returns a {ScopeDescriptor} that includes this editor's language.
		e.g. `['.source.ruby']`, or `['.source.coffee']`. You can use this with
		`Config.get` to get language specific config values.
	**/
	function getRootScopeDescriptor():ScopeDescriptor;
	/**
		Get the syntactic {ScopeDescriptor} for the given position in buffer
		coordinates. Useful with `Config.get`.
		
		For example, if called with a position inside the parameter list of an
		anonymous CoffeeScript function, this method returns a {ScopeDescriptor} with
		the following scopes array:
		`["source.coffee", "meta.function.inline.coffee", "meta.parameters.coffee", "variable.parameter.function.coffee"]`Returns a {ScopeDescriptor}.
	**/
	function scopeDescriptorForBufferPosition(bufferPosition:Point):ScopeDescriptor;
	/**
		Get the range in buffer coordinates of all tokens surrounding the
		cursor that match the given scope selector.
		
		For example, if you wanted to find the string surrounding the cursor, you
		could call `editor.bufferRangeForScopeAtCursor(".string.quoted")`.Returns a `Range`.
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
	function cutSelectedText(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
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
	function cutToEndOfLine(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		For each selection, if the selection is empty, cut all characters
		of the containing buffer line following the cursor. Otherwise cut the
		selected text.
	**/
	function cutToEndOfBufferLine(?options:{ /**
		{Boolean} Must be `true` to modify a read-only editor.
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
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
		
		A *foldable* row is a row that *starts* a row range that can be folded.Returns a `Boolean`.
	**/
	function isFoldableAtBufferRow(bufferRow:Float):Bool;
	/**
		Determine whether the given row in screen coordinates is foldable.
		
		A *foldable* row is a row that *starts* a row range that can be folded.Returns a `Boolean`.
	**/
	function isFoldableAtScreenRow(bufferRow:Float):Bool;
	/**
		Fold the given buffer row if it isn't currently folded, and unfold
		it otherwise.
	**/
	function toggleFoldAtBufferRow():Void;
	/**
		Determine whether the most recently added cursor's row is folded.Returns a `Boolean`.
	**/
	function isFoldedAtCursorRow():Bool;
	/**
		Determine whether the given row in buffer coordinates is folded.Returns a `Boolean`.
	**/
	function isFoldedAtBufferRow(bufferRow:Float):Bool;
	/**
		Determine whether the given row in screen coordinates is folded.Returns a `Boolean`.
	**/
	function isFoldedAtScreenRow(screenRow:Float):Bool;
	/**
		Add a custom `Gutter`.Returns the newly-created `Gutter`.
	**/
	function addGutter(options:{ /**
		(required) A unique {String} to identify this gutter.
	**/
	var name : String; /**
		A {Number} that determines stacking order between   gutters. Lower priority items are forced closer to the edges of the   window. (default: -100)
	**/
	@:optional
	var priority : Float; /**
		{Boolean} specifying whether the gutter is visible   initially after being created. (default: true)
	**/
	@:optional
	var visible : Bool; }):Gutter;
	/**
		Get this editor's gutters.Returns an `Array` of `Gutter`s.
	**/
	function getGutters():Array<Dynamic>;
	/**
		Get the gutter with the given name.Returns a `Gutter`, or `null` if no gutter exists for the given name.
	**/
	function gutterWithName():Gutter;
	/**
		Scroll the editor to reveal the most recently added cursor if it is
		off-screen.
	**/
	function scrollToCursorPosition(?options:{ /**
		Center the editor around the cursor if possible. (default: true)
	**/
	var center : Dynamic; }):Void;
	/**
		Scrolls the editor to the given buffer position.
	**/
	function scrollToBufferPosition(bufferPosition:Dynamic, ?options:{ /**
		Center the editor around the position if possible. (default: false)
	**/
	var center : Dynamic; }):Void;
	/**
		Scrolls the editor to the given screen position.
	**/
	function scrollToScreenPosition(screenPosition:Dynamic, ?options:{ /**
		Center the editor around the position if possible. (default: false)
	**/
	var center : Dynamic; }):Void;
	/**
		Retrieves the greyed out placeholder of a mini editor.Returns a `String`.
	**/
	function getPlaceholderText():String;
	/**
		Set the greyed out placeholder of a mini editor. Placeholder text
		will be displayed when the editor has no content.
	**/
	function setPlaceholderText(placeholderText:String):Void;
}