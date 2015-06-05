package atom;

typedef DecorationParams = Dynamic; //TODO

extern class TextEditor {

    // Event Subscription

    function onDidChangeTitle( callback : Void->Void ) : Disposable;
    function onDidChangePath( callback : Void->Void ) : Disposable;
    function onDidChange( callback : Void->Void ) : Disposable;
    function onDidStopChanging( callback : Void->Void ) : Disposable;
    function onDidChangeCursorPosition( callback : Dynamic->Void ) : Disposable;
    function onDidChangeSelectionRange( callback : Dynamic->Void ) : Disposable;
    function onDidSave( callback : Dynamic->Void ) : Disposable;
    function onDidDestroy( callback : Void->Void ) : Disposable;

    function onDidChangeSoftWrapped( callback : Void->Void ) : Disposable;
    function onDidChangeEncoding( callback : Void->Void ) : Disposable;
    function observeGrammar( callback : Grammar->Void ) : Disposable;
    function onDidChangeGrammar( callback : Grammar->Void ) : Disposable;
    function onDidChangeModified( callback : Void->Void ) : Disposable;
    function onDidConflict( callback : Void->Void ) : Disposable;
    function onWillInsertText( callback : {text:String,cancel:Void->Void}->Void ) : Disposable;
    function onDidInsertText( callback : {text:String}->Void ) : Disposable;
    function observeCursors( callback : Cursor->Void ) : Disposable;
    function onDidAddCursor( callback : Cursor->Void ) : Disposable;
    function onDidRemoveCursor( callback : Cursor->Void ) : Disposable;
    function observeSelections( callback : Selection->Void ) : Disposable;
    function onDidAddSelection( callback : Selection->Void ) : Disposable;
    function onDidRemoveSelection( callback : Selection->Void ) : Disposable;
    function observeDecorations( callback : Decoration->Void ) : Disposable;
    function onDidAddDecoration( callback : Decoration->Void ) : Disposable;
    function onDidRemoveDecoration( callback : Decoration->Void ) : Disposable;
    function onDidChangePlaceholderText( callback : String->Void ) : Disposable;

    // File Details

    function getTitle() : String;
    function getLongTitle() : String;
    function getPath() : String;
    function isModified() : Bool;
    function isEmpty() : Bool;

    // File Operations

    function save() : Void;
    function saveAs( filePath : String ) : Void;

    // Reading Text

    function getText() : String;
    function getTextInBufferRange( range : Range ) : String;
    function getLineCount() : Int;
    function getScreenLineCount() : Int;
    function getLastBufferRow() : Int;
    function getLastScreenRow() : Int;
    function lineTextForBufferRow( bufferRow : Int ) : String;
    function lineTextForScreenRow( screenRow : Int ) : String;
    function getCurrentParagraphBufferRange() : Range;

    // Mutating Text

    function setText( text : String ) : Void;
    function setTextInBufferRange( range : Range, text : String, ?options : Dynamic ) : Void;
    function insertText( text : String, ?options : Dynamic ) : Void;
    function insertNewline() : Void;
    function delete() : Void;
    function backspace() : Void;

    function mutateSelectedText( fn : Selection->Int->Void ) : Void;
    function transpose() : Void;
    function upperCase() : Void;
    function lowerCase() : Void;
    function toggleLineCommentsInSelection() : Void;
    function insertNewlineBelow() : Void;
    function insertNewlineAbove() : Void;
    function deleteToBeginningOfWord() : Void;
    function deleteToBeginningOfLine() : Void;
    function deleteToEndOfLine() : Void;
    function deleteToEndOfWord() : Void;
    function deleteLine() : Void;

    // History

    function undo() : String;
    function redo() : String;

    function transact( ?groupingInterval : Float, fn : Void->Void ) : Void;
    function abortTransaction() : Void;
    function createCheckpoint() : Void;
    function revertToCheckpoint() : Void;
    function groupChangesSinceCheckpoint() : Void;

    // TextEditor Coordinates

    function screenPositionForBufferPosition( bufferPosition : Dynamic, ?options : Dynamic ) : Point;
    function bufferPositionForScreenPosition( bufferPosition : Dynamic, ?options : Dynamic ) : Point;
    function screenRangeForBufferRange( bufferRange : Range ) : Range;
    function bufferRangeForScreenRange( screenRange : Range ) : Range;

    function clipBufferPosition( bufferPosition : Point ) : Point;
    function clipBufferRange( range : Range ) : Range;
    function clipScreenPosition( screenPosition : Point, ?options:{?wrapBeyondNewlines:Bool,wrapAtSoftNewlines:Bool,?screenLine:Int} ) : Point;
    function clipScreenRange( range : Range, ?options:{?wrapBeyondNewlines:Bool,wrapAtSoftNewlines:Bool,?screenLine:Int} ) : Range;

    // Decorations

    function decorateMarker( marker : Marker, decorationParams : DecorationParams ) : Decoration;
    function decorationsForScreenRowRange( startScreenRow : Int, endScreenRow : Int ) : Dynamic;

    function getDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    function getLineDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    function getLineNumberDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    function getHighlightDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    function getOverlayDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;

    // Markers

    function markBufferRange( range : Range, ?properties : {?properties:Dynamic,?reversed:Bool,?persistent:Bool,?invalidate:Bool} ) : Marker;
    function markScreenRange( range : Range, ?properties  : {?properties:Dynamic,?reversed:Bool,?persistent:Bool,?invalidate:Bool} ) : Marker;
    function markBufferPosition( position : Point, ?options : Dynamic ) : Marker;
    function markScreenPosition( position : Point, ?options : Dynamic ) : Marker;
    function findMarkers( properties : {?startBufferRow:Int,?endBufferRow:Int,?containsBufferRange:Range,?containsBufferPosition:Point} ) : Array<Marker>;

    function getMarker( id : Int ) : Marker;
    function getMarkers() : Array<Marker>;
    function getMarkerCount() : Int;

    // Cursors

    function getCursorBufferPosition() : Point;
    function getCursorBufferPositions() : Array<Point>;
    function setCursorBufferPosition( position : Point, ?options : {?autoscroll:Bool} ) : Void;
    function getCursorScreenPosition() : Point;
    function getCursorScreenPositions() : Array<Point>;
    function setCursorScreenPosition(position : Point, ?options : {?autoscroll:Bool} )  : Void;
    function addCursorAtBufferPosition( bufferPosition : Point ) : Cursor;
    function addCursorAtScreenPosition( screenPosition : Point ) : Cursor;
    function hasMultipleCursors() : Bool;
    function moveUp( ?lineCount : Int ) : Int;
    function moveDown( ?lineCount : Int ) : Int;
    function moveLeft( ?columnCount : Int ) : Void;
    function moveRight( ?columnCount : Int ) : Void;
    function moveToBeginningOfLine() : Void;
    function moveToBeginningOfScreenLine() : Void;
    function moveToFirstCharacterOfLine() : Void;
    function moveToEndOfLine() : Void;
    function moveToEndOfScreenLine() : Void;
    function moveToBeginningOfWord() : Void;
    function moveToEndOfWord() : Void;

    function moveToTop() : Void;
    function moveToBottom() : Void;
    function moveToBeginningOfNextWord() : Void;
    function moveToPreviousWordBoundary() : Void;
    function moveToNextWordBoundary() : Void;
    function moveToBeginningOfNextParagraph() : Void;
    function moveToBeginningOfPreviousParagraph() : Void;
    function getLastCursor() : Cursor;
    function getWordUnderCursor( ?options:Dynamic ) : String;
    function getCursors() : Array<Cursor>;
    function getCursorsOrderedByBufferPosition() : Array<Cursor>;

    // Selections

    function getSelectedText() : String;
    function getSelectedBufferRange() : Range;
    function getSelectedBufferRanges() : Array<Range>;
    function setSelectedBufferRange( bufferRange : Range, ?options : {?reversed:Bool} ) : Void;
    function setSelectedBufferRanges( bufferRanges : Array<Range>, ?options: {?reversed:Bool} ) : Void;
    function getSelectedScreenRange() : Range;
    function getSelectedScreenRanges() : Array<Range>;
    function setSelectedScreenRange( screenRange : Range, ?options : {?reversed:Bool} ) : Void;
    function setSelectedScreenRanges( screenRanges : Array<Range>, ?options : {?reversed:Bool} ) : Void;
    function addSelectionForBufferRange( bufferRange : Range, ?options :  {?reversed:Bool} ) : Selection;
    function addSelectionForScreenRange( screenRange : Range, ?options : {?reversed:Bool} ) : Selection;
    function selectToBufferPosition( position : Point ) : Void;
    function selectToScreenPosition( position : Point ) : Void;
    function selectUp( ?rowCount : Int ) : Void;
    function selectDown( ?rowCount : Int ) : Void;
    function selectLeft( ?columnCount : Int ) : Void;
    function selectRight( ?columnCount : Int ) : Void;
    function selectToTop() : Void;
    function selectToBottom() : Void;
    function selectAll() : Void;
    function selectToBeginningOfLine() : Void;
    function selectToFirstCharacterOfLine() : Void;
    function selectToEndOfLine() : Void;
    function selectToBeginningOfWord() : Void;
    function selectToEndOfWord() : Void;
    function selectLinesContainingCursors() : Void;
    function selectWordsContainingCursors() : Void;

    function selectToPreviousWordBoundary() : Void;
    function selectToNextWordBoundary() : Void;
    function selectToBeginningOfNextWord() : Void;
    function selectToBeginningOfNextParagraph() : Void;
    function selectToBeginningOfPreviousParagraph() : Void;
    function selectMarker( marker : Marker ) : Void;
    function getLastSelection() : Selection;
    function getSelections() : Array<Selection>;
    function getSelectionsOrderedByBufferPosition() : Array<Selection>;
    function selectionIntersectsBufferRange( bufferRange : Range ) : Void;

    // Searching and Replacing

    function scan( regex : EReg, iterator : Dynamic ) : Void;
    function scanInBufferRange( regex : EReg, range : Range, iterator : Dynamic ) : Void;
    function backwardsScanInBufferRange( regex : EReg, range : Range, iterator : Dynamic ) : Void;

    // Tab Behavior

    function getSoftTabs() : Bool;
    function setSoftTabs( softTabs : Bool ) : Void;
    function toggleSoftTabs() : Void;
    function getTabLength() : Int;
    function setTabLength( tabLength : Int ) : Void;

    function usesSoftTabs(): Void;
    function getTabText() : Void;

    // Soft Wrap Behavior

    function isSoftWrapped() : Bool;
    function setSoftWrapped( softWrapped : Bool ) : Void;
    function toggleSoftWrapped() : Bool;
    function getSoftWrapColumn() : Int;

    // Indentation

    function indentationForBufferRow() : Int;
    function setIndentationForBufferRow( bufferRow : Int, newLevel : Int, ?options : {?preserveLeadingWhitespace:Bool} ) : Void;
    function indentSelectedRows() : Void;
    function outdentSelectedRows() : Void;
    function indentLevelForLine() : Float;
    function autoIndentSelectedRows() : Void;

    // Grammars

    function getGrammar() : Grammar;
    function setGrammar( grammar : Grammar ) : Void;

    // Managing Syntax Scopes

    function getRootScopeDescriptor() : ScopeDescriptor;
    function scopeDescriptorForBufferPosition( bufferPosition : Point ) : ScopeDescriptor;
    function bufferRangeForScopeAtCursor( scopeSelector : String ) : Range;
    function isBufferRowCommented() : Bool;

    // Clipboard Operations

    function copySelectedText() : Void;
    function cutSelectedText() : Void;
    function pasteText( options : Dynamic ) : Void;
    function cutToEndOfLine() : Void;

    // Folds

    function foldCurrentRow() : Void;
    function unfoldCurrentRow() : Void;
    function foldBufferRow( bufferRow : Int ) : Void;
    function unfoldBufferRow( bufferRow : Int ) : Void;
    function foldSelectedLines() : Void;
    function foldAll() : Void;
    function unfoldAll() : Void;
    function foldAllAtIndentLevel( level : Float ) : Void;
    function isFoldableAtBufferRow(  bufferRow : Int ) : Void;
    function isFoldableAtScreenRow(  bufferRow : Int ) : Void;
    function toggleFoldAtBufferRow() : Void;
    function isFoldedAtCursorRow() : Bool;
    function isFoldedAtBufferRow(  bufferRow : Int ) : Bool;
    function isFoldedAtScreenRow( screenRow : Int ) : Bool;

    //Scrolling the TextEditor

    function scrollToCursorPosition( ?options : {?center:Bool} ) : Void;
    function scrollToBufferPosition( bufferPosition : Point ,  ?options : {?center:Bool} ) : Void;
    function scrollToScreenPosition( screenPosition : Point,  ?options : {?center:Bool} ) : Void;
    function scrollToTop() : Void;
    function scrollToBottom() : Void;

    // TextEditor Rendering

    function getPlaceholderText() : String;
    function setPlaceholderText( placeholderText : String ) : Void;

}
