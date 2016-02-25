package atom;

extern class DeserializerManager {
    //function add( deserializers : Array<{name:String,deserialize:Dynamic}> ) : Void;
    function add( deserializers : haxe.extern.Rest<Dynamic> ) : Void;
    function getDeserializerCount() : Int;
    function deserialize( state : Dynamic ) : Dynamic;
    function get( state : Dynamic ) : Dynamic;
}
