package atom;
/**
	The `Cursor` class represents the little blinking line identifying
	where text can be inserted.
	
	Cursors belong to {TextEditor}s and have some metadata attached in the form
	of a {DisplayMarker}.
	
	@see https://github.com/atom/atom/blob/v1.29.0/src/cursor.js#L14
**/
@:jsRequire("atom", "Cursor") extern class Cursor {
	/**
		Calls your `callback` when the cursor has been moved.
	**/
	function onDidChangePosition(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Calls your `callback` when the cursor is destroyed
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Moves a cursor to a given screen position.
	**/
	function setScreenPosition(screenPosition:Array<Any>, ?options:{ /**
		A Boolean which, if `true`, scrolls the {TextEditor} to wherever the cursor moves to.
	**/
	var autoscroll : atom.TextEditor; }):Void;
	function getScreenPosition():atom.Point;
	/**
		Moves a cursor to a given buffer position.
	**/
	function setBufferPosition(bufferPosition:Array<Any>, ?options:{ /**
		`Boolean` indicating whether to autoscroll to the new position. Defaults to `true` if this is the most recently added cursor, `false` otherwise.
	**/
	var autoscroll : Bool; }):Void;
	function getBufferPosition():Dynamic;
	function getScreenRow():Dynamic;
	function getScreenColumn():Dynamic;
	/**
		Retrieves the cursor's current buffer row.
	**/
	function getBufferRow():Void;
	function getBufferColumn():Dynamic;
	function getCurrentBufferLine():Dynamic;
	function isAtBeginningOfLine():Dynamic;
	function isAtEndOfLine():Dynamic;
	function getMarker():atom.DisplayMarker;
	/**
		Identifies if the cursor is surrounded by whitespace.
		
		"Surrounded" here means that the character directly before and after the
		cursor are both whitespace.
	**/
	function isSurroundedByWhitespace():Bool;
	/**
		
		
		This method returns false if the character before or after the cursor is
		whitespace.
	**/
	function isBetweenWordAndNonWord():Dynamic;
	/**
		
		
		
	**/
	function isInsideWord(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; }):Dynamic;
	function getIndentLevel():Dynamic;
	/**
		Retrieves the scope descriptor for the cursor's current position.
	**/
	function getScopeDescriptor():atom.ScopeDescriptor;
	function hasPrecedingCharactersOnLine():Dynamic;
	/**
		Identifies if this cursor is the last in the {TextEditor}.
		
		"Last" is defined as the most recently added cursor.
	**/
	function isLastCursor():Bool;
	/**
		Moves the cursor up one screen row.
	**/
	function moveUp(?rowCount:Float, ?options:{ /**
		if true, move to the left of the selection if a selection exists.
	**/
	var moveToEndOfSelection : Dynamic; }):Void;
	/**
		Moves the cursor down one screen row.
	**/
	function moveDown(?rowCount:Float, ?options:{ /**
		if true, move to the left of the selection if a selection exists.
	**/
	var moveToEndOfSelection : Dynamic; }):Void;
	/**
		Moves the cursor left one screen column.
	**/
	function moveLeft(?columnCount:Float, ?options:{ /**
		if true, move to the left of the selection if a selection exists.
	**/
	var moveToEndOfSelection : Dynamic; }):Void;
	/**
		Moves the cursor right one screen column.
	**/
	function moveRight(?columnCount:Float, ?options:{ /**
		if true, move to the right of the selection if a selection exists.
	**/
	var moveToEndOfSelection : Dynamic; }):Void;
	/**
		Moves the cursor to the top of the buffer.
	**/
	function moveToTop():Void;
	/**
		Moves the cursor to the bottom of the buffer.
	**/
	function moveToBottom():Void;
	/**
		Moves the cursor to the beginning of the line.
	**/
	function moveToBeginningOfScreenLine():Void;
	/**
		Moves the cursor to the beginning of the buffer line.
	**/
	function moveToBeginningOfLine():Void;
	/**
		Moves the cursor to the beginning of the first character in the
		line.
	**/
	function moveToFirstCharacterOfLine():Void;
	/**
		Moves the cursor to the end of the line.
	**/
	function moveToEndOfScreenLine():Void;
	/**
		Moves the cursor to the end of the buffer line.
	**/
	function moveToEndOfLine():Void;
	/**
		Moves the cursor to the beginning of the word.
	**/
	function moveToBeginningOfWord():Void;
	/**
		Moves the cursor to the end of the word.
	**/
	function moveToEndOfWord():Void;
	/**
		Moves the cursor to the beginning of the next word.
	**/
	function moveToBeginningOfNextWord():Void;
	/**
		Moves the cursor to the previous word boundary.
	**/
	function moveToPreviousWordBoundary():Void;
	/**
		Moves the cursor to the next word boundary.
	**/
	function moveToNextWordBoundary():Void;
	/**
		Moves the cursor to the previous subword boundary.
	**/
	function moveToPreviousSubwordBoundary():Void;
	/**
		Moves the cursor to the next subword boundary.
	**/
	function moveToNextSubwordBoundary():Void;
	/**
		Moves the cursor to the beginning of the buffer line, skipping all
		whitespace.
	**/
	function skipLeadingWhitespace():Void;
	/**
		Moves the cursor to the beginning of the next paragraph
	**/
	function moveToBeginningOfNextParagraph():Void;
	/**
		Moves the cursor to the beginning of the previous paragraph
	**/
	function moveToBeginningOfPreviousParagraph():Void;
	/**
		
		
		
	**/
	function getPreviousWordBoundaryBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word"  (default: {::wordRegExp})
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		
		
		
	**/
	function getNextWordBoundaryBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word"  (default: {::wordRegExp})
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		Retrieves the buffer position of where the current word starts.
	**/
	function getBeginningOfCurrentWordBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; /**
		A `Boolean` indicating whether to include non-word characters in the default word regex. Has no effect if wordRegex is set.
	**/
	var includeNonWordCharacters : Bool; /**
		A `Boolean` indicating whether the beginning of the previous word can be returned.
	**/
	var allowPrevious : Bool; }):atom.Range;
	/**
		Retrieves the buffer position of where the current word ends.
	**/
	function getEndOfCurrentWordBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word"  (default: {::wordRegExp})
	**/
	var wordRegex : EReg; /**
		A Boolean indicating whether to include non-word characters in the default word regex. Has no effect if wordRegex is set.
	**/
	var includeNonWordCharacters : Dynamic; }):atom.Range;
	/**
		Retrieves the buffer position of where the next word starts.
	**/
	function getBeginningOfNextWordBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; }):atom.Range;
	/**
		
		
		
	**/
	function getCurrentWordBufferRange(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		
		
		
	**/
	function getCurrentLineBufferRange(?options:{ /**
		A `Boolean` which controls whether the Range should include the newline.
	**/
	var includeNewline : Bool; }):Dynamic;
	/**
		Retrieves the range for the current paragraph.
		
		A paragraph is defined as a block of text surrounded by empty lines or comments.
	**/
	function getCurrentParagraphBufferRange():atom.Range;
	function getCurrentWordPrefix():Dynamic;
	/**
		Compare this cursor's buffer position to another cursor's buffer position.
		
		See `Point.compare` for more details.
	**/
	function compare(otherCursor:atom.Cursor):Void;
	/**
		Deselects the current selection.
	**/
	function clearSelection():Void;
	/**
		Get the RegExp used by the cursor to determine what a "word" is.
	**/
	function wordRegExp(?options:{ /**
		A `Boolean` indicating whether to include non-word characters in the regex. (default: true)
	**/
	var includeNonWordCharacters : Bool; }):EReg;
	/**
		Get the RegExp used by the cursor to determine what a "subword" is.
	**/
	function subwordRegExp(?options:{ /**
		A `Boolean` indicating whether to look forwards or backwards for the next subword. (default: false)
	**/
	var backwards : Bool; }):EReg;
}