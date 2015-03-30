package atom;

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


    //TODO .................https://atom.io/docs/api/v0.188.0/TextEditor

}
