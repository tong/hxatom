package atom;

extern class TextEditorMarker {

    static function destroy()  : Void;
    static function copy( properties : Dynamic ) : Void;

    // Event Subscription

    static function onDidChange( callback : Dynamic ) : Disposable;
    static function onDidDestroy( callback : Dynamic ) : Disposable;

    // Marker Details

    static function isValid() : Bool;
    static function isDestroyed() : Bool;
    static function isReversed() : Bool;
    static function getInvalidationStrategy() : String;
    static function getProperties() : Dynamic;
    static function setProperties( properties : Dynamic ) : Void;

    // Comparing to other markers

    static function isEqual( other : TextEditorMarker ) : Bool;
    static function compare( other : TextEditorMarker ) : Int;

    // Managing the marker's range

    static function getBufferRange() : Range;
    static function setBufferRange( bufferRange : Range, properties : Dynamic ) : Void;
    static function getScreenRange() : Range;
    static function setScreenRange( screenRange : Range, properties : Dynamic ) : Void;
    static function getStartBufferPosition() : Point;
    static function getStartScreenPosition() : Point;
    static function getEndBufferPosition() : Point;
    static function getEndScreenPosition() : Point;

    // Extended Methods

    static function getHeadBufferPosition() : Point;
    static function setHeadBufferPosition( bufferPosition : Point, ?properties : Dynamic ) : Void;
    static function getHeadScreenPosition() : Point;
    static function setHeadScreenPosition( screenPosition : Point, ?properties : Dynamic ) : Void;
    static function getTailBufferPosition() : Point;
    static function setTailBufferPosition( bufferPosition : Point, ?properties : Dynamic ) : Void;
    static function getTailScreenPosition() : Point;
    static function setTailScreenPosition( screenPosition : Point, ?properties : Dynamic ) : Void;
    static function hasTail() : Bool;
    static function plantTail( ?properties : Dynamic ) : Void;
    static function clearTail( ?properties : Dynamic ) : Void;

}
