package atom;

extern class Config {
    function get( keyPath : String, ?options : Dynamic ) : Void;
    function set( keyPath : String, ?options : Dynamic ) : Void;
    function unset( keyPath : String, ?options : Dynamic ) : Void;
}
