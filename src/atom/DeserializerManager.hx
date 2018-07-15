package atom;

/**
	Manages the deserializers used for serialized state
	
	An instance of this class is always available as the `atom.deserializers`
	global.
	@see <https://github.com/atom/atom/blob/v1.28.2/src/deserializer-manager.js#L23>

**/
@:require(js, atom) @:jsRequire("atom", "DeserializerManager") extern class DeserializerManager {
	/**
		Register the given class(es) as deserializers.
	**/
	function add(deserializers:AtomEnvironment):Void;
	/**
		Deserialize the state and params.
	**/
	function deserialize(state:Dynamic):Void;
}