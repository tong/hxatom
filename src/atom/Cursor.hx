package atom;

extern class Cursor {

    //Event Subscription

    function onDidChangePosition( callback : {oldBufferPosition:Point,oldScreenPosition:Point,newBufferPosition:Point,newScreenPosition:Point,textChanged:Bool,cursor:Cursor}->Void ) : Disposable;
    function onDidDestroy( callback : Void->Void ) : Disposable;
    function onDidChangeVisibility( callback : Bool->Void ) : Disposable;

    // Managing Cursor Position

    function setScreenPosition( screenPosition : Array<Int>, ?options : {autoscroll:Bool} ) : Void;
    function getScreenPosition() : Point;
    function setBufferPosition( bufferPosition : Array<Int>, ?options : {autoscroll:Bool} ) : Void;
    function getBufferPosition() : Array<Int>;
    function getScreenRow() : Int;
    function getScreenColumn() : Int;
    function getBufferRow() : Int;
    function getBufferColumn() : Int;
    function getCurrentBufferLine() : Int;
    function isAtBeginningOfLine() : Bool;
    function isAtEndOfLine() : Bool;

    // Cursor Position Details

    function getMarker() : TextEditorMarker;
    function isSurroundedByWhitespace() : Bool;
    function isBetweenWordAndNonWord() : Bool;
    function isInsideWord( ?options : {wordRegex:EReg} ) : Bool;
    function getIndentLevel() : Int;
    function getScopeDescriptor() : ScopeDescriptor;
    function hasPrecedingCharactersOnLine() : Bool;
    function isLastCursor() : Bool;

    // Moving the Cursor

    function moveUp( ?rowCount : Int, ?options:{moveToEndOfSelection:Bool} ) : Void;
    function moveDown( ?rowCount : Int,  ?options : {moveToEndOfSelection:Bool} ) : Void;
    function moveLeft( ?columnCount : Int,  ?options : {moveToEndOfSelection:Bool} ) : Void;
    function moveRight( ?columnCount : Int,  ?options : {moveToEndOfSelection:Bool} ) : Void;
    function moveToTop() : Void;
    function moveToBottom() : Void;
    function moveToBeginningOfScreenLine() : Void;
    function moveToBeginningOfLine() : Void;
    function moveToFirstCharacterOfLine() : Void;
    function moveToEndOfScreenLine() : Void;
    function moveToEndOfLine() : Void;
    function moveToBeginningOfWord() : Void;
    function moveToEndOfWord() : Void;
    function moveToBeginningOfNextWord() : Void;
    function moveToPreviousWordBoundary() : Void;
    function moveToNextWordBoundary() : Void;
    function skipLeadingWhitespace() : Void;
    function moveToBeginningOfNextParagraph() : Void;
    function moveToBeginningOfPreviousParagraph() : Void;

    // Local Positions and Ranges

    function getPreviousWordBoundaryBufferPosition( ?options : { wordRegex:EReg } ) : Point;
    function getNextWordBoundaryBufferPosition( ?options : { wordRegex:EReg } ) : Point;
    function getBeginningOfCurrentWordBufferPosition( ?options : { wordRegex:EReg, includeNonWordCharacters:Bool, allowPrevious:Bool } ) : Point;
    function getEndOfCurrentWordBufferPosition( ?options : { wordRegex:EReg, includeNonWordCharacters:Bool } ) : Point;
    function getBeginningOfNextWordBufferPosition( ?options : { wordRegex:EReg } ) : Point;
    function getCurrentWordBufferRange( ?options : { wordRegex:EReg } ) : Point;
    function getCurrentLineBufferRange( ?options : { includeNewline:Bool } ) : Point;
    function getCurrentParagraphBufferRange() : Range;
    function getCurrentWordPrefix() : String;

    // Visibility

    function setVisible() : Void;
    function isVisible() : Bool;

    // Comparing to another cursor

    function compare( otherCursor : Cursor ) : Int;

    // Utilities

    function clearAutoscroll() : Void;
    function clearSelection() : Void;
    function wordRegExp( ?options : {includeNonWordCharacters:Bool} ) : EReg;
    function subwordRegExp( ?options : {backwards:Bool} ) : EReg;
}
