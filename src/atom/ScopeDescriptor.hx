package atom;

/**
	Wraps an {Array} of `String`s. The Array describes a path from the
	root of the syntax tree to a token including _all_ scope names for the entire
	path.
**/
@:require(js, atom) @:jsRequire("atom", "ScopeDescriptor") extern class ScopeDescriptor {
	/**
		Create a {ScopeDescriptor} object.
	**/
	function new(object:Dynamic):Void;
	function getScopesArray():Array<Dynamic>;
}