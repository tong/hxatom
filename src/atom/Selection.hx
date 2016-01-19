package atom;

@:native("Selection")
extern class Selection {

    //Event Subscription

    static function onDidChangeRange( cb : Dynamic->Void ) : Void;
    static function onDidDestroy( cb : Dynamic->Void ) : Void;

    //Managing the selection range

    static function getScreenRange() : Range;
    static function setScreenRange( screenRange : Range, ?options : {} ) : Void;
    static function getBufferRange() : Range;
    static function setBufferRange( screenRange : Range, ?options : {} ) : Void;
    static function getBufferRowRange() : Range;

    //Info about the selection

    static function isEmpty() : Bool;
    static function isReversed() : Bool;
    static function isSingleScreenLine() : Bool;
    static function getText() : String;
    static function intersectsBufferRange( bufferRange : Range ) : Bool;
    static function intersectsWith( otherSelection : Selection ) : Bool;

    //Modifying the selected range

    static function clear( ?options : {?autoscroll:Bool} ) : Void;
    static function selectToScreenPosition( position : Point ) : Void;
    static function selectToBufferPosition( position : Point ) : Void;
    static function selectRight( ?columnCount : Int ) : Void;
    static function selectLeft( ?columnCount : Int ) : Void;
    static function selectUp( ?rowCount : Int ) : Void;
    static function selectDown( ?rowCount : Int ) : Void;
    static function selectToTop() : Void;
    static function selectToBottom() : Void;
    static function selectAll() : Void;
    static function selectToBeginningOfLine() : Void;
    static function selectToFirstCharacterOfLine() : Void;
    static function selectToEndOfLine() : Void;
    static function selectToBeginningOfWord() : Void;
    static function selectToEndOfWord() : Void;
    static function selectToBeginningOfNextWord() : Void;
    static function selectToPreviousWordBoundary() : Void;
    static function selectToNextWordBoundary() : Void;
    static function selectToBeginningOfNextParagraph() : Void;
    static function selectToBeginningOfPreviousParagraph() : Void;
    static function selectWord() : Void;
    static function expandOverWord() : Void;
    static function selectLine( row : Int ) : Void;
    static function expandOverLine() : Void;

    // Modifying the selected text

    static function insertText( text : String, ?options : {?select:Bool,?autoIndent:Bool,?autoIndentNewline:Bool,?autoDecreaseIndent:Bool,?normalizeLineEndings:Bool,?undo:Bool} ) : Void;
    static function backspace() : Void;
    static function deleteToPreviousWordBoundary() : Void;
    static function deleteToNextWordBoundary() : Void;
    static function deleteToBeginningOfWord() : Void;
    static function deleteToBeginningOfLine() : Void;
    static function delete() : Void;
    static function deleteToEndOfLine() : Void;
    static function deleteToEndOfWord() : Void;
    static function deleteSelectedText() : Void;
    static function deleteLine() : Void;
    static function joinLines() : Void;
    static function outdentSelectedRows() : Void;
    static function autoIndentSelectedRows() : Void;
    static function toggleLineComments() : Void;
    static function cutToEndOfLine() : Void;
    static function cut( maintainClipboard : Bool, fullLine : Bool ) : Void;
    static function copy( maintainClipboard : Bool, fullLine : Bool ) : Void;
    static function fold() : Void;
    static function indentSelectedRows() : Void;

    // Managing multiple selections

    static function addSelectionBelow() : Bool;
    static function addSelectionAbove() : Bool;
    static function merge( otherSelection : Selection, ?options : Dynamic ) : Bool;

    // Comparing to other selections

    static function compare( otherSelection : Selection ) : Void;

}
