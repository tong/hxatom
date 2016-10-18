package atom;

typedef ChangeEvent = {
    oldRange : Range,
    newRange : Range,
    oldText : String,
    newText : Bool
};

@:jsRequire("atom","TextBuffer")
extern class TextBuffer {

    function new( params : { load : Bool, text : String } ) : Void;

    function onWillChange( event : ChangeEvent->Void ) : Disposable;
    function onDidChange( event : ChangeEvent->Void ) : Disposable;
    function onDidStopChanging( event : Void->Void ) : Disposable;
    function onDidConflict( event : Void->Void ) : Disposable;
    function onDidChangeModified( event : Bool->Void ) : Disposable;
    function onDidUpdateMarkers( event : Void->Void ) : Disposable;
    function onDidCreateMarker( event : TextEditorMarker->Void ) : Disposable;
    function onDidChangePath( event : String->Void ) : Disposable;
    function onDidChangeEncoding( event : String->Void ) : Disposable;
    function onWillSave( event : Void->Void ) : Disposable;
    function onDidSave( event : String->Void ) : Disposable;
    function onDidDelete( event : Void->Void ) : Disposable;
    function onWillReload( event : Void->Void ) : Disposable;
    function onDidReload( event : Void->Void ) : Disposable;
    function onDidDestroy( event : Void->Void ) : Disposable;
    function onWillThrowWatchError( event : {error:Dynamic,handle:Void->Void}->Void ) : Disposable;
    function getStoppedChangingDelay() : Float;

    // File Details

    function isModified() : Bool;
    function isInConflict() : Bool;
    function getPath() : String;
    function setPath( filePath : String ) : Void;
    function setEncoding( encoding : String ) : Void;
    function getEncoding() : String;
    function getUri() : String;

    // Reading Text

    function isEmpty() : Bool;
    function getText() : String;
    function getTextInRange( range : Range ) : String;
    function getLines() : Array<String>;
    function getLastLine() : String;
    function lineForRow( row : Int ) : Float;
    function lineEndingForRow( row : Int ) : Float;
    function lineLengthForRow( row : Int ) : Int;
    function isRowBlank( row : Int ) : Bool;
    function previousNonBlankRow( startRow : Int ) : Int;
    function nextNonBlankRow( startRow : Int ) : Int;

    // Mutating Text

    function setText( text : String ) : Range;
    function setTextViaDiff( text : String ) : String;
    function setTextInRange( range : Range,  text : String , ?options : {normalizeLineEndings:Bool,undo:Bool} ) : Range;
    function insert( position : Point,  text : String , ?options : {normalizeLineEndings:Bool,undo:Bool} ) : Void;
    function append( text : String , ?options : {normalizeLineEndings:Bool,undo:Bool} ) : Void;
    function delete( range : Range ) : Range;
    function deleteRow(row : Int ) : Float;
    function deleteRows( startRow : Int, endRow : Int ) : Range;

    // Markers

    function addMarkerLayer( options : {maintainHistory:Bool} ) : DisplayMarkerLayer;
    function getMarkerLayer( id : String ) : DisplayMarkerLayer;
    function getDefaultMarkerLayer() : DisplayMarkerLayer;
    function markRange( range : Range, properties : { ?reversed:Bool, ?persistent:Bool, ?invalidate:String } ) : TextEditorMarker;
    function markPosition( position : Point, properties : { ?reversed:Bool, ?persistent:Bool, ?invalidate:String } ) : TextEditorMarker;
    function getMarkers() : Array<TextEditorMarker>;
    function getMarker( id : String ) : TextEditorMarker;
    function findMarkers( params : { startPosition:Point, endPosition:Point, containsPoint:Point, containsRange:Range, startRow:Int, endRow:Int, intersectsRow:Bool } ) : Array<TextEditorMarker>;
    function getMarkerCount() : Int;

    // History

    function undo() : Void;
    function redo() : Void;
    function transact( ?groupingInterval : Float, fn : Void->Void ) : Void;
    function clearUndoStack() : Void;
    function createCheckpoint() : Void;
    function revertToCheckpoint() : Void;
    function groupChangesSinceCheckpoint() : Bool;

    // Search And Replace

    function scan( regex : EReg, iterator : Dynamic ) : Void;
    function backwardsScan( regex : EReg, iterator : Dynamic ) : Void;
    function scanInRange( regex : EReg, range : Range , iterator : Dynamic ) : Void;
    function backwardsScanInRange( regex : EReg, range : Range , iterator : Dynamic ) : Void;
    function replace( regex : EReg, replacementText : Dynamic ) : Void;

    // Buffer Range Details

    function getRange() : Range;
    function getLineCount() : Int;
    function getLastRow() : Int;
    function getFirstPosition() : Point;
    function getEndPosition() : Point;
    function getMaxCharacterIndex() : Range;
    function rangeForRow( row : Int, includeNewline : Bool ) : Range;
    function characterIndexForPosition( position : Point ) : Range;
    function positionForCharacterIndex( offset : Int ) : Range;
    function clipRange( range : Range ) : Range;
    function clipPosition( position : Point ) : Range;

    // Buffer Operations

    function save() : Void;
    function saveAs( filePath : String ) : Void;
    function reload() : Void;
}
