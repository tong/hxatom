package atom;

extern class DeserializerManager {
    function add( deserializers : Array<{name:String,deserialize:Dynamic}> ) : Void;
    function deserialize( state : Dynamic, ?params : Dynamic ) : Void;
}
