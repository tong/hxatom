package atom;

//@:jsRequire("atom","DeserializerManager")
@:native("DeserializerManager")
extern class DeserializerManager {
    //function add( deserializers : Array<{name:String,deserialize:Dynamic}> ) : Void;
    function add( deserializers : Dynamic ) : Void;
    function deserialize( state : Dynamic, ?params : Dynamic ) : Void;
}
