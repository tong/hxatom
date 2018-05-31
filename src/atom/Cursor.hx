package atom;

/**
	The `Cursor` class represents the little blinking line identifying
	where text can be inserted.
	
	Cursors belong to {TextEditor}s and have some metadata attached in the form
	of a {DisplayMarker}.
	@see <https://github.com/atom/atom/blob/v1.27.2/src/cursor.js#L14>

**/
@:require(js, atom) @:jsRequire("atom", "Cursor") extern class Cursor {
	/**
		Calls your `callback` when the cursor has been moved.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangePosition(callback:haxe.Constraints.Function):Disposable;
	/**
		Calls your `callback` when the cursor is destroyedReturns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Moves a cursor to a given screen position.
	**/
	function setScreenPosition(screenPosition:Array<Dynamic>, ?options:{ /**
		A Boolean which, if `true`, scrolls the {TextEditor} to wherever the cursor moves to.
	**/
	var autoscroll : TextEditor; }):Void;
	/**
		Returns the screen position of the cursor as a `Point`.
	**/
	function getScreenPosition():Point;
	/**
		Moves a cursor to a given buffer position.
	**/
	function setBufferPosition(bufferPosition:Array<Dynamic>, ?options:{ /**
		{Boolean} indicating whether to autoscroll to the new position. Defaults to `true` if this is the most recently added cursor, `false` otherwise.
	**/
	var autoscroll : Bool; }):Void;
	/**
		Returns the current buffer position as an Array.
	**/
	function getBufferPosition():Dynamic;
	/**
		Returns the cursor's current screen row.
	**/
	function getScreenRow():Dynamic;
	/**
		Returns the cursor's current screen column.
	**/
	function getScreenColumn():Dynamic;
	/**
		Retrieves the cursor's current buffer row.
	**/
	function getBufferRow():Void;
	/**
		Returns the cursor's current buffer column.
	**/
	function getBufferColumn():Dynamic;
	/**
		Returns the cursor's current buffer row of text excluding its line
		ending.
	**/
	function getCurrentBufferLine():Dynamic;
	/**
		Returns whether the cursor is at the start of a line.
	**/
	function isAtBeginningOfLine():Dynamic;
	/**
		Returns whether the cursor is on the line return character.
	**/
	function isAtEndOfLine():Dynamic;
	/**
		Returns the underlying {DisplayMarker} for the cursor.
		Useful with overlay `Decoration`s.
	**/
	function getMarker():DisplayMarker;
	/**
		Identifies if the cursor is surrounded by whitespace.
		
		"Surrounded" here means that the character directly before and after the
		cursor are both whitespace.Returns a `Boolean`.
	**/
	function isSurroundedByWhitespace():Bool;
	/**
		
		
		This method returns false if the character before or after the cursor is
		whitespace.Returns whether the cursor is currently between a word and non-word
		character. The non-word characters are defined by the
		`editor.nonWordCharacters` config value.
	**/
	function isBetweenWordAndNonWord():Dynamic;
	/**
		
		
		Returns whether this cursor is between a word's start and end.
	**/
	function isInsideWord(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		Returns the indentation level of the current line.
	**/
	function getIndentLevel():Dynamic;
	/**
		Retrieves the scope descriptor for the cursor's current position.Returns a {ScopeDescriptor}
	**/
	function getScopeDescriptor():ScopeDescriptor;
	/**
		Returns true if this cursor has no non-whitespace characters before
		its current position.
	**/
	function hasPrecedingCharactersOnLine():Dynamic;
	/**
		Identifies if this cursor is the last in the {TextEditor}.
		
		"Last" is defined as the most recently added cursor.Returns a `Boolean`.
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
		
		
		Returns buffer position of previous word boundary. It might be on
		the current word, or the previous word.
	**/
	function getPreviousWordBoundaryBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word"  (default: {::wordRegExp})
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		
		
		Returns buffer position of the next word boundary. It might be on
		the current word, or the previous word.
	**/
	function getNextWordBoundaryBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word"  (default: {::wordRegExp})
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		Retrieves the buffer position of where the current word starts.Returns a `Range`.
	**/
	function getBeginningOfCurrentWordBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; /**
		A {Boolean} indicating whether to include non-word characters in the default word regex. Has no effect if wordRegex is set.
	**/
	var includeNonWordCharacters : Bool; /**
		A {Boolean} indicating whether the beginning of the previous word can be returned.
	**/
	var allowPrevious : Bool; }):Range;
	/**
		Retrieves the buffer position of where the current word ends.Returns a `Range`.
	**/
	function getEndOfCurrentWordBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word"  (default: {::wordRegExp})
	**/
	var wordRegex : EReg; /**
		A Boolean indicating whether to include non-word characters in the default word regex. Has no effect if wordRegex is set.
	**/
	var includeNonWordCharacters : Dynamic; }):Range;
	/**
		Retrieves the buffer position of where the next word starts.Returns a `Range`
	**/
	function getBeginningOfNextWordBufferPosition(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; }):Range;
	/**
		
		
		Returns the buffer Range occupied by the word located under the cursor.
	**/
	function getCurrentWordBufferRange(?options:{ /**
		A {RegExp} indicating what constitutes a "word" (default: {::wordRegExp}).
	**/
	var wordRegex : EReg; }):Dynamic;
	/**
		
		
		Returns the buffer Range for the current line.
	**/
	function getCurrentLineBufferRange(?options:{ /**
		A {Boolean} which controls whether the Range should include the newline.
	**/
	var includeNewline : Bool; }):Dynamic;
	/**
		Retrieves the range for the current paragraph.
		
		A paragraph is defined as a block of text surrounded by empty lines or comments.Returns a `Range`.
	**/
	function getCurrentParagraphBufferRange():Range;
	/**
		Returns the characters preceding the cursor in the current word.
	**/
	function getCurrentWordPrefix():Dynamic;
	/**
		Compare this cursor's buffer position to another cursor's buffer position.
		
		See `Point.compare` for more details.
	**/
	function compare(otherCursor:Cursor):Void;
	/**
		Deselects the current selection.
	**/
	function clearSelection():Void;
	/**
		Get the RegExp used by the cursor to determine what a "word" is.Returns a {RegExp}.
	**/
	function wordRegExp(?options:{ /**
		A {Boolean} indicating whether to include non-word characters in the regex. (default: true)
	**/
	var includeNonWordCharacters : Bool; }):EReg;
	/**
		Get the RegExp used by the cursor to determine what a "subword" is.Returns a {RegExp}.
	**/
	function subwordRegExp(?options:{ /**
		A {Boolean} indicating whether to look forwards or backwards for the next subword. (default: false)
	**/
	var backwards : Bool; }):EReg;
}