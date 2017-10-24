package atom;

/**
	Represents a selection in the {TextEditor}. 
**/
@:require(js, atom) @:jsRequire("atom", "Selection") extern class Selection {
	/**
		Calls your `callback` when the selection was moved.
	**/
	function onDidChangeRange(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the selection was destroyed
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns the screen {Range} for the selection.
	**/
	function getScreenRange():Range;
	/**
		Modifies the screen range for the selection.
	**/
	function setScreenRange(screenRange:Range, ?options:Dynamic):Void;
	/**
		Returns the buffer {Range} for the selection.
	**/
	function getBufferRange():Range;
	/**
		Modifies the buffer {Range} for the selection.
	**/
	function setBufferRange(bufferRange:Range, ?options:Dynamic):Void;
	/**
		Returns the starting and ending buffer rows the selection is
		highlighting.
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
	/**
		Returns whether the selection is a single line or not.
	**/
	function isSingleScreenLine():Dynamic;
	/**
		Returns the text in the selection.
	**/
	function getText():Dynamic;
	/**
		Identifies if a selection intersects with a given buffer range.
	**/
	function intersectsBufferRange(bufferRange:Range):Bool;
	/**
		Identifies if a selection intersects with another selection.
	**/
	function intersectsWith(otherSelection:Selection):Bool;
	/**
		Clears the selection, moving the marker to the head.
	**/
	function clear(?options:Dynamic):Void;
	/**
		Selects the text from the current cursor position to a given screen
		position.
	**/
	function selectToScreenPosition(position:Point):Void;
	/**
		Selects the text from the current cursor position to a given buffer
		position.
	**/
	function selectToBufferPosition(position:Point):Void;
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
	function selectWord():Range;
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
	function insertText(text:String, ?options:Dynamic):Void;
	/**
		Removes the first character before the selection if the selection
		is empty otherwise it deletes the selection. 
	**/
	function backspace():Void;
	/**
		Removes the selection or, if nothing is selected, then all
		characters from the start of the selection back to the previous word
		boundary. 
	**/
	function deleteToPreviousWordBoundary():Void;
	/**
		Removes the selection or, if nothing is selected, then all
		characters from the start of the selection up to the next word
		boundary. 
	**/
	function deleteToNextWordBoundary():Void;
	/**
		Removes from the start of the selection to the beginning of the
		current word if the selection is empty otherwise it deletes the selection. 
	**/
	function deleteToBeginningOfWord():Void;
	/**
		Removes from the beginning of the line which the selection begins on
		all the way through to the end of the selection. 
	**/
	function deleteToBeginningOfLine():Void;
	/**
		Removes the selection or the next character after the start of the
		selection if the selection is empty. 
	**/
	function delete():Void;
	/**
		If the selection is empty, removes all text from the cursor to the
		end of the line. If the cursor is already at the end of the line, it
		removes the following newline. If the selection isn't empty, only deletes
		the contents of the selection. 
	**/
	function deleteToEndOfLine():Void;
	/**
		Removes the selection or all characters from the start of the
		selection to the end of the current word if nothing is selected. 
	**/
	function deleteToEndOfWord():Void;
	/**
		Removes the selection or all characters from the start of the
		selection to the end of the current word if nothing is selected. 
	**/
	function deleteToBeginningOfSubword():Void;
	/**
		Removes the selection or all characters from the start of the
		selection to the end of the current word if nothing is selected. 
	**/
	function deleteToEndOfSubword():Void;
	/**
		Removes only the selected text. 
	**/
	function deleteSelectedText():Void;
	/**
		Removes the line at the beginning of the selection if the selection
		is empty unless the selection spans multiple lines in which case all lines
		are removed. 
	**/
	function deleteLine():Void;
	/**
		Joins the current line with the one below it. Lines will
		be separated by a single space.
		
		If there selection spans more than one line, all the lines are joined together. 
	**/
	function joinLines():Void;
	/**
		Removes one level of indent from the currently selected rows. 
	**/
	function outdentSelectedRows():Void;
	/**
		Sets the indentation level of all selected rows to values suggested
		by the relevant grammars. 
	**/
	function autoIndentSelectedRows():Void;
	/**
		Wraps the selected lines in comments if they aren't currently part
		of a comment.
		
		Removes the comment if they are currently wrapped in a comment. 
	**/
	function toggleLineComments():Void;
	/**
		Cuts the selection until the end of the screen line. 
	**/
	function cutToEndOfLine():Void;
	/**
		Cuts the selection until the end of the buffer line. 
	**/
	function cutToEndOfBufferLine():Void;
	/**
		Copies the selection to the clipboard and then deletes it.
	**/
	function cut(maintainClipboard:Bool, fullLine:Bool):Void;
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
	function indentSelectedRows():Void;
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
	function merge(otherSelection:Selection, ?options:Dynamic):Void;
	/**
		Compare this selection's buffer range to another selection's buffer
		range.
		
		See {Range::compare} for more details.
	**/
	function compare(otherSelection:Selection):Void;
}