package atom;

/**
	Manages the deserializers used for serialized state
**/
@:require(js, atom) @:jsRequire("atom", "DeserializerManager") extern class DeserializerManager {
	/**
		Register the given class(es) as deserializers.
	**/
	function add(deserializers:Atom):Void;
	/**
		Deserialize the state and params.
	**/
	function deserialize(state:Dynamic):Void;
}