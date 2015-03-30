package atom;

extern class DeserializerManager {
    function add( deserializers : Array<{name:String,deserialize:Void->Void}> ) : Void;
    function deserialize( state : Dynamic, params : Dynamic ) : Void;
}
