package atom;

typedef DecorationParams = Dynamic; //TODO

extern class TextEditor {

    // Event Subscription

    static function onDidChangeTitle( callback : Void->Void ) : Disposable;
    static function onDidChangePath( callback : Void->Void ) : Disposable;
    static function onDidChange( callback : Void->Void ) : Disposable;
    static function onDidStopChanging( callback : Void->Void ) : Disposable;
    static function onDidChangeCursorPosition( callback : Dynamic->Void ) : Disposable;
    static function onDidChangeSelectionRange( callback : Dynamic->Void ) : Disposable;
    static function onDidSave( callback : Dynamic->Void ) : Disposable;
    static function onDidDestroy( callback : Void->Void ) : Disposable;

    static function onDidChangeSoftWrapped( callback : Void->Void ) : Disposable;
    static function onDidChangeEncoding( callback : Void->Void ) : Disposable;
    static function observeGrammar( callback : Grammar->Void ) : Disposable;
    static function onDidChangeGrammar( callback : Grammar->Void ) : Disposable;
    static function onDidChangeModified( callback : Void->Void ) : Disposable;
    static function onDidConflict( callback : Void->Void ) : Disposable;
    static function onWillInsertText( callback : {text:String,cancel:Void->Void}->Void ) : Disposable;
    static function onDidInsertText( callback : {text:String}->Void ) : Disposable;
    static function observeCursors( callback : Cursor->Void ) : Disposable;
    static function onDidAddCursor( callback : Cursor->Void ) : Disposable;
    static function onDidRemoveCursor( callback : Cursor->Void ) : Disposable;
    static function observeSelections( callback : Selection->Void ) : Disposable;
    static function onDidAddSelection( callback : Selection->Void ) : Disposable;
    static function onDidRemoveSelection( callback : Selection->Void ) : Disposable;
    static function observeDecorations( callback : Decoration->Void ) : Disposable;
    static function onDidAddDecoration( callback : Decoration->Void ) : Disposable;
    static function onDidRemoveDecoration( callback : Decoration->Void ) : Disposable;
    static function onDidChangePlaceholderText( callback : String->Void ) : Disposable;

    // File Details

    static function getTitle() : String;
    static function getLongTitle() : String;
    static function getPath() : String;
    static function isModified() : Bool;
    static function isEmpty() : Bool;

    // File Operations

    static function save() : Void;
    static function saveAs( filePath : String ) : Void;

    // Reading Text

    static function getText() : String;
    static function getTextInBufferRange( range : Range ) : String;
    static function getLineCount() : Int;
    static function getScreenLineCount() : Int;
    static function getLastBufferRow() : Int;
    static function getLastScreenRow() : Int;
    static function lineTextForBufferRow( bufferRow : Int ) : String;
    static function lineTextForScreenRow( screenRow : Int ) : String;
    static function getCurrentParagraphBufferRange() : Range;

    // Mutating Text

    static function setText( text : String ) : Void;
    static function setTextInBufferRange( range : Range, text : String, ?options : Dynamic ) : Void;
    static function insertText( text : String, ?options : Dynamic ) : Void;
    static function insertNewline() : Void;
    static function delete() : Void;
    static function backspace() : Void;

    static function mutateSelectedText( fn : Selection->Int->Void ) : Void;
    static function transpose() : Void;
    static function upperCase() : Void;
    static function lowerCase() : Void;
    static function toggleLineCommentsInSelection() : Void;
    static function insertNewlineBelow() : Void;
    static function insertNewlineAbove() : Void;
    static function deleteToBeginningOfWord() : Void;
    static function deleteToBeginningOfLine() : Void;
    static function deleteToEndOfLine() : Void;
    static function deleteToEndOfWord() : Void;
    static function deleteLine() : Void;

    // History

    static function undo() : String;
    static function redo() : String;

    static function transact( ?groupingInterval : Float, fn : Void->Void ) : Void;
    static function abortTransaction() : Void;
    static function createCheckpoint() : Void;
    static function revertToCheckpoint() : Void;
    static function groupChangesSinceCheckpoint() : Void;

    // TextEditor Coordinates

    static function screenPositionForBufferPosition( bufferPosition : Dynamic, ?options : Dynamic ) : Point;
    static function bufferPositionForScreenPosition( bufferPosition : Dynamic, ?options : Dynamic ) : Point;
    static function screenRangeForBufferRange( bufferRange : Range ) : Range;
    static function bufferRangeForScreenRange( screenRange : Range ) : Range;

    static function clipBufferPosition( bufferPosition : Point ) : Point;
    static function clipBufferRange( range : Range ) : Range;
    static function clipScreenPosition( screenPosition : Point, ?options:{?wrapBeyondNewlines:Bool,wrapAtSoftNewlines:Bool,?screenLine:Int} ) : Point;
    static function clipScreenRange( range : Range, ?options:{?wrapBeyondNewlines:Bool,wrapAtSoftNewlines:Bool,?screenLine:Int} ) : Range;

    // Decorations

    static function decorateMarker( marker : Marker, decorationParams : DecorationParams ) : Decoration;
    static function decorationsForScreenRowRange( startScreenRow : Int, endScreenRow : Int ) : Dynamic;

    static function getDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    static function getLineDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    static function getLineNumberDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    static function getHighlightDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;
    static function getOverlayDecorations( ?propertyFilter : Dynamic ) : Array<Decoration>;

    // Markers

    static function markBufferRange( range : Range, properties : {?properties:Dynamic,?reversed:Bool,?persistent:Bool,?invalidate:Bool} ) : Marker;
    static function markScreenRange( range : Range, properties  : {?properties:Dynamic,?reversed:Bool,?persistent:Bool,?invalidate:Bool} ) : Marker;
    static function markBufferPosition( position : Point, ?options : Dynamic ) : Marker;
    static function markScreenPosition( position : Point, ?options : Dynamic ) : Marker;
    static function findMarkers( properties : {?startBufferRow:Int,?endBufferRow:Int,?containsBufferRange:Range,?containsBufferPosition:Point} ) : Array<Marker>;

    static function getMarker( id : Int ) : Marker;
    static function getMarkers() : Array<Marker>;
    static function getMarkerCount() : Int;

    // Cursors

    static function getCursorBufferPosition() : Point;
    static function getCursorBufferPositions() : Array<Point>;
    static function setCursorBufferPosition( position : Point, ?options : {?autoscroll:Bool} ) : Void;
    static function getCursorScreenPosition() : Point;
    static function getCursorScreenPositions() : Array<Point>;
    static function setCursorScreenPosition(position : Point, ?options : {?autoscroll:Bool} )  : Void;
    static function addCursorAtBufferPosition( bufferPosition : Point ) : Cursor;
    static function addCursorAtScreenPosition( screenPosition : Point ) : Cursor;
    static function hasMultipleCursors() : Bool;
    static function moveUp( ?lineCount : Int ) : Int;
    static function moveDown( ?lineCount : Int ) : Int;
    static function moveLeft( ?columnCount : Int ) : Void;
    static function moveRight( ?columnCount : Int ) : Void;
    static function moveToBeginningOfLine() : Void;
    static function moveToBeginningOfScreenLine() : Void;
    static function moveToFirstCharacterOfLine() : Void;
    static function moveToEndOfLine() : Void;
    static function moveToEndOfScreenLine() : Void;
    static function moveToBeginningOfWord() : Void;
    static function moveToEndOfWord() : Void;

    static function moveToTop() : Void;
    static function moveToBottom() : Void;
    static function moveToBeginningOfNextWord() : Void;
    static function moveToPreviousWordBoundary() : Void;
    static function moveToNextWordBoundary() : Void;
    static function moveToBeginningOfNextParagraph() : Void;
    static function moveToBeginningOfPreviousParagraph() : Void;
    static function getLastCursor() : Cursor;
    static function getWordUnderCursor( ?options:Dynamic ) : String;
    static function getCursors() : Array<Cursor>;
    static function getCursorsOrderedByBufferPosition() : Array<Cursor>;

    // Selections

    static function getSelectedText() : String;
    static function getSelectedBufferRange() : Range;
    static function getSelectedBufferRanges() : Array<Range>;
    static function setSelectedBufferRange( bufferRange : Range, ?options : {?reversed:Bool} ) : Void;
    static function setSelectedBufferRanges( bufferRanges : Array<Range>, ?options: {?reversed:Bool} ) : Void;
    static function getSelectedScreenRange() : Range;
    static function getSelectedScreenRanges() : Array<Range>;
    static function setSelectedScreenRange( screenRange : Range, ?options : {?reversed:Bool} ) : Void;
    static function setSelectedScreenRanges( screenRanges : Array<Range>, ?options : {?reversed:Bool} ) : Void;
    static function addSelectionForBufferRange( bufferRange : Range, ?options :  {?reversed:Bool} ) : Selection;
    static function addSelectionForScreenRange( screenRange : Range, ?options : {?reversed:Bool} ) : Selection;
    static function selectToBufferPosition( position : Point ) : Void;
    static function selectToScreenPosition( position : Point ) : Void;
    static function selectUp( ?rowCount : Int ) : Void;
    static function selectDown( ?rowCount : Int ) : Void;
    static function selectLeft( ?columnCount : Int ) : Void;
    static function selectRight( ?columnCount : Int ) : Void;
    static function selectToTop() : Void;
    static function selectToBottom() : Void;
    static function selectAll() : Void;
    static function selectToBeginningOfLine() : Void;
    static function selectToFirstCharacterOfLine() : Void;
    static function selectToEndOfLine() : Void;
    static function selectToBeginningOfWord() : Void;
    static function selectToEndOfWord() : Void;
    static function selectLinesContainingCursors() : Void;
    static function selectWordsContainingCursors() : Void;

    static function selectToPreviousWordBoundary() : Void;
    static function selectToNextWordBoundary() : Void;
    static function selectToBeginningOfNextWord() : Void;
    static function selectToBeginningOfNextParagraph() : Void;
    static function selectToBeginningOfPreviousParagraph() : Void;
    static function selectMarker( marker : Marker ) : Void;
    static function getLastSelection() : Selection;
    static function getSelections() : Array<Selection>;
    static function getSelectionsOrderedByBufferPosition() : Array<Selection>;
    static function selectionIntersectsBufferRange( bufferRange : Range ) : Void;

    // Searching and Replacing

    static function scan( regex : EReg, iterator : Dynamic ) : Void;
    static function scanInBufferRange( regex : EReg, range : Range, iterator : Dynamic ) : Void;
    static function backwardsScanInBufferRange( regex : EReg, range : Range, iterator : Dynamic ) : Void;

    // Tab Behavior

    static function getSoftTabs() : Bool;
    static function setSoftTabs( softTabs : Bool ) : Void;
    static function toggleSoftTabs() : Void;
    static function getTabLength() : Int;
    static function setTabLength( tabLength : Int ) : Void;

    static function usesSoftTabs(): Void;
    static function getTabText() : Void;

    // Soft Wrap Behavior

    static function isSoftWrapped() : Bool;
    static function setSoftWrapped( softWrapped : Bool ) : Void;
    static function toggleSoftWrapped() : Bool;
    static function getSoftWrapColumn() : Int;

    // Indentation

    static function indentationForBufferRow() : Int;
    static function setIndentationForBufferRow( bufferRow : Int, newLevel : Int, ?options : {?preserveLeadingWhitespace:Bool} ) : Void;
    static function indentSelectedRows() : Void;
    static function outdentSelectedRows() : Void;
    static function indentLevelForLine() : Float;
    static function autoIndentSelectedRows() : Void;

    // Grammars

    static function getGrammar() : Grammar;
    static function setGrammar( grammar : Grammar ) : Void;

    // Managing Syntax Scopes

    static function getRootScopeDescriptor() : ScopeDescriptor;
    static function scopeDescriptorForBufferPosition( bufferPosition : Point ) : ScopeDescriptor;
    static function bufferRangeForScopeAtCursor( scopeSelector : String ) : Range;
    static function isBufferRowCommented() : Bool;

    // Clipboard Operations

    static function copySelectedText() : Void;
    static function cutSelectedText() : Void;
    static function pasteText( options : Dynamic ) : Void;
    static function cutToEndOfLine() : Void;

    // Folds

    static function foldCurrentRow() : Void;
    static function unfoldCurrentRow() : Void;
    static function foldBufferRow( bufferRow : Int ) : Void;
    static function unfoldBufferRow( bufferRow : Int ) : Void;
    static function foldSelectedLines() : Void;
    static function foldAll() : Void;
    static function unfoldAll() : Void;
    static function foldAllAtIndentLevel( level : Float ) : Void;
    static function isFoldableAtBufferRow(  bufferRow : Int ) : Void;
    static function isFoldableAtScreenRow(  bufferRow : Int ) : Void;
    static function toggleFoldAtBufferRow() : Void;
    static function isFoldedAtCursorRow() : Bool;
    static function isFoldedAtBufferRow(  bufferRow : Int ) : Bool;
    static function isFoldedAtScreenRow( screenRow : Int ) : Bool;

    //Scrolling the TextEditor

    static function scrollToCursorPosition( ?options : {?center:Bool} ) : Void;
    static function scrollToBufferPosition( bufferPosition : Point ,  ?options : {?center:Bool} ) : Void;
    static function scrollToScreenPosition( screenPosition : Point,  ?options : {?center:Bool} ) : Void;
    static function scrollToTop() : Void;
    static function scrollToBottom() : Void;

    // TextEditor Rendering

    static function getPlaceholderText() : String;
    static function setPlaceholderText( placeholderText : String ) : Void;

}
