package atom;

@:native("Clipboard")
extern class Clipboard {
    function write( text : String, ?metadata : Dynamic ) : Void;
    function read() : String;
    function readWithMetadata() : {test:String,metadata:Dynamic};
}
