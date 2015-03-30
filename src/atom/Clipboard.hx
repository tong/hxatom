package atom;

extern class Clipboard {
    function write( text : String, ?metadata : Dynamic ) : Void;
    function read() : String;
    function readWithMetadata() : Dynamic;
}
