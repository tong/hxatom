package atom;
/**
	Represents a selection in the {TextEditor}.
	
	@see https://github.com/atom/atom/blob/v1.33.0/src/selection.js#L10
**/
@:jsRequire("atom", "Selection") extern class Selection {
	/**
		Calls your `callback` when the selection was moved.
	**/
	function onDidChangeRange(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Calls your `callback` when the selection was destroyed
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):atom.Disposable;
	function getScreenRange():atom.Range;
	/**
		Modifies the screen range for the selection.
	**/
	function setScreenRange(screenRange:atom.Range, ?options:Dynamic):Void;
	function getBufferRange():atom.Range;
	/**
		Modifies the buffer `Range` for the selection.
	**/
	function setBufferRange(bufferRange:atom.Range, ?options:{ /**
		if `true`, the fold settings are preserved after the selection moves.
	**/
	var preserveFolds : Dynamic; /**
		`Boolean` indicating whether to autoscroll to the new range. Defaults to `true` if this is the most recently added selection, `false` otherwise.
	**/
	var autoscroll : Bool; }):Void;
	/**
		
		
		
	**/
	function getBufferRowRange():Dynamic;
	/**
		Determines if the selection contains anything.
	**/
	function isEmpty():Void;
	/**
		Determines if the ending position of a marker is greater than the
		starting position.
		
		This can happen when, for example, you highlight text "up" in a {TextBuffer}.
	**/
	function isReversed():Void;
	function isSingleScreenLine():Dynamic;
	function getText():Dynamic;
	/**
		Identifies if a selection intersects with a given buffer range.
	**/
	function intersectsBufferRange(bufferRange:atom.Range):Bool;
	/**
		Identifies if a selection intersects with another selection.
	**/
	function intersectsWith(otherSelection:atom.Selection):Bool;
	/**
		Clears the selection, moving the marker to the head.
	**/
	function clear(?options:{ /**
		`Boolean` indicating whether to autoscroll to the new range. Defaults to `true` if this is the most recently added selection, `false` otherwise.
	**/
	var autoscroll : Bool; }):Void;
	/**
		Selects the text from the current cursor position to a given screen
		position.
	**/
	function selectToScreenPosition(position:atom.Point):Void;
	/**
		Selects the text from the current cursor position to a given buffer
		position.
	**/
	function selectToBufferPosition(position:atom.Point):Void;
	/**
		Selects the text one position right of the cursor.
	**/
	function selectRight(?columnCount:Float):Void;
	/**
		Selects the text one position left of the cursor.
	**/
	function selectLeft(?columnCount:Float):Void;
	/**
		Selects all the text one position above the cursor.
	**/
	function selectUp(?rowCount:Float):Void;
	/**
		Selects all the text one position below the cursor.
	**/
	function selectDown(?rowCount:Float):Void;
	/**
		Selects all the text from the current cursor position to the top of
		the buffer.
	**/
	function selectToTop():Void;
	/**
		Selects all the text from the current cursor position to the bottom
		of the buffer.
	**/
	function selectToBottom():Void;
	/**
		Selects all the text in the buffer.
	**/
	function selectAll():Void;
	/**
		Selects all the text from the current cursor position to the
		beginning of the line.
	**/
	function selectToBeginningOfLine():Void;
	/**
		Selects all the text from the current cursor position to the first
		character of the line.
	**/
	function selectToFirstCharacterOfLine():Void;
	/**
		Selects all the text from the current cursor position to the end of
		the screen line.
	**/
	function selectToEndOfLine():Void;
	/**
		Selects all the text from the current cursor position to the end of
		the buffer line.
	**/
	function selectToEndOfBufferLine():Void;
	/**
		Selects all the text from the current cursor position to the
		beginning of the word.
	**/
	function selectToBeginningOfWord():Void;
	/**
		Selects all the text from the current cursor position to the end of
		the word.
	**/
	function selectToEndOfWord():Void;
	/**
		Selects all the text from the current cursor position to the
		beginning of the next word.
	**/
	function selectToBeginningOfNextWord():Void;
	/**
		Selects text to the previous word boundary.
	**/
	function selectToPreviousWordBoundary():Void;
	/**
		Selects text to the next word boundary.
	**/
	function selectToNextWordBoundary():Void;
	/**
		Selects text to the previous subword boundary.
	**/
	function selectToPreviousSubwordBoundary():Void;
	/**
		Selects text to the next subword boundary.
	**/
	function selectToNextSubwordBoundary():Void;
	/**
		Selects all the text from the current cursor position to the
		beginning of the next paragraph.
	**/
	function selectToBeginningOfNextParagraph():Void;
	/**
		Selects all the text from the current cursor position to the
		beginning of the previous paragraph.
	**/
	function selectToBeginningOfPreviousParagraph():Void;
	/**
		Modifies the selection to encompass the current word.
	**/
	function selectWord():atom.Range;
	/**
		Expands the newest selection to include the entire word on which
		the cursors rests.
	**/
	function expandOverWord():Void;
	/**
		Selects an entire line in the buffer.
	**/
	function selectLine(row:Float):Void;
	/**
		Expands the newest selection to include the entire line on which
		the cursor currently rests.
		
		It also includes the newline character.
	**/
	function expandOverLine():Void;
	/**
		Replaces text at the current selection.
	**/
	function insertText(text:String, ?options:{ /**
		If `true`, selects the newly added text.
	**/
	var select : Dynamic; /**
		If `true`, indents all inserted text appropriately.
	**/
	var autoIndent : Dynamic; /**
		If `true`, indent newline appropriately.
	**/
	var autoIndentNewline : Dynamic; /**
		If `true`, decreases indent level appropriately (for example, when a closing bracket is inserted).
	**/
	var autoDecreaseIndent : Dynamic; /**
		By default, when pasting multiple lines, Atom attempts to preserve the relative indent level between the first line and trailing lines, even if the indent level of the first line has changed from the copied text. If this option is `true`, this behavior is suppressed. level between the first lines and the trailing lines.
	**/
	var preserveTrailingLineIndentation : Dynamic; /**
		`Boolean` (default: true)
	**/
	@:optional
	var normalizeLineEndings : Bool; /**
		*Deprecated* If `skip`, skips the undo stack for this operation. This property is deprecated. Call groupLastChanges() on the {TextBuffer} afterward instead.
	**/
	var undo : atom.TextBuffer; /**
		`Boolean` Must be `true` to modify a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the first character before the selection if the selection
		is empty otherwise it deletes the selection.
	**/
	function backspace(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the selection or, if nothing is selected, then all
		characters from the start of the selection back to the previous word
		boundary.
	**/
	function deleteToPreviousWordBoundary(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the selection or, if nothing is selected, then all
		characters from the start of the selection up to the next word
		boundary.
	**/
	function deleteToNextWordBoundary(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes from the start of the selection to the beginning of the
		current word if the selection is empty otherwise it deletes the selection.
	**/
	function deleteToBeginningOfWord(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes from the beginning of the line which the selection begins on
		all the way through to the end of the selection.
	**/
	function deleteToBeginningOfLine(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the selection or the next character after the start of the
		selection if the selection is empty.
	**/
	function delete(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		If the selection is empty, removes all text from the cursor to the
		end of the line. If the cursor is already at the end of the line, it
		removes the following newline. If the selection isn't empty, only deletes
		the contents of the selection.
	**/
	function deleteToEndOfLine(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the selection or all characters from the start of the
		selection to the end of the current word if nothing is selected.
	**/
	function deleteToEndOfWord(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the selection or all characters from the start of the
		selection to the end of the current word if nothing is selected.
	**/
	function deleteToBeginningOfSubword(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the selection or all characters from the start of the
		selection to the end of the current word if nothing is selected.
	**/
	function deleteToEndOfSubword(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes only the selected text.
	**/
	function deleteSelectedText(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes the line at the beginning of the selection if the selection
		is empty unless the selection spans multiple lines in which case all lines
		are removed.
	**/
	function deleteLine(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Joins the current line with the one below it. Lines will
		be separated by a single space.
		
		If there selection spans more than one line, all the lines are joined together.
	**/
	function joinLines(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Removes one level of indent from the currently selected rows.
	**/
	function outdentSelectedRows(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Sets the indentation level of all selected rows to values suggested
		by the relevant grammars.
	**/
	function autoIndentSelectedRows(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Wraps the selected lines in comments if they aren't currently part
		of a comment.
		
		Removes the comment if they are currently wrapped in a comment.
	**/
	function toggleLineComments(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Cuts the selection until the end of the screen line.
	**/
	function cutToEndOfLine(maintainClipboard:Bool, ?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Cuts the selection until the end of the buffer line.
	**/
	function cutToEndOfBufferLine(maintainClipboard:Bool, ?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Copies the selection to the clipboard and then deletes it.
	**/
	function cut(maintainClipboard:Bool, fullLine:Bool, bypassReadOnly:Bool):Void;
	/**
		Copies the current selection to the clipboard.
	**/
	function copy(maintainClipboard:Bool, fullLine:Bool):Void;
	/**
		Creates a fold containing the current selection.
	**/
	function fold():Void;
	/**
		If the selection spans multiple rows, indent all of them.
	**/
	function indentSelectedRows(?options:{ /**
		`Boolean` Must be `true` to modify text within a read-only editor. (default: false)
	**/
	@:optional
	var bypassReadOnly : Bool; }):Void;
	/**
		Moves the selection down one row.
	**/
	function addSelectionBelow():Void;
	/**
		Moves the selection up one row.
	**/
	function addSelectionAbove():Void;
	/**
		Combines the given selection into this selection and then destroys
		the given selection.
	**/
	function merge(otherSelection:atom.Selection, ?options:Dynamic):Void;
	/**
		Compare this selection's buffer range to another selection's buffer
		range.
		
		See `Range.compare` for more details.
	**/
	function compare(otherSelection:atom.Selection):Void;
}