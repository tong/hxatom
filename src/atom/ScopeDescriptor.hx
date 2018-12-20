package atom;
/**
	Wraps an `Array` of `String`s. The Array describes a path from the
	root of the syntax tree to a token including _all_ scope names for the entire
	path.
	
	Methods that take a `ScopeDescriptor` will also accept an `Array` of `String`
	scope names e.g. `['.source.js']`.
	
	You can use `ScopeDescriptor`s to get language-specific config settings via
	`Config.get`.
	
	You should not need to create a `ScopeDescriptor` directly.
	
	* {TextEditor::getRootScopeDescriptor} to get the language's descriptor.
	* {TextEditor::scopeDescriptorForBufferPosition} to get the descriptor at a
	  specific position in the buffer.
	* `Cursor.getScopeDescriptor` to get a cursor's descriptor based on position.
	
	See the [scopes and scope descriptor guide](http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors/)
	for more information.
	
	@see https://github.com/atom/atom/blob/v1.33.1/src/scope-descriptor.js#L21
**/
@:jsRequire("atom", "ScopeDescriptor") extern class ScopeDescriptor {
	/**
		Create a {ScopeDescriptor} object.
	**/
	function new(object:{ /**
		`Array` of `String`s
	**/
	var scopes : Array<Any>; }):Void;
	function getScopesArray():Array<Any>;
}