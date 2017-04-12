package atom;

/**
	Registry containing one or more grammars. 
**/
@:require(js, atom) @:jsRequire("atom", "GrammarRegistry") extern class GrammarRegistry {
	/**
		Invoke the given callback when a grammar is added to the registry.
	**/
	function onDidAddGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a grammar is updated due to a grammar
		it depends on being added or removed from the registry.
	**/
	function onDidUpdateGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Get all the grammars in this registry.
	**/
	function getGrammars():Array<Dynamic>;
	/**
		Get a grammar with the given scope name.
	**/
	function grammarForScopeName(scopeName:String):Grammar;
	/**
		Add a grammar to this registry.
		
		A 'grammar-added' event is emitted after the grammar is added.
	**/
	function addGrammar(grammar:Grammar):Disposable;
	/**
		Remove the grammar with the given scope name.
	**/
	function removeGrammarForScopeName(scopeName:String):Grammar;
	/**
		Read a grammar synchronously but don't add it to the registry.
	**/
	function readGrammarSync(grammarPath:String):Grammar;
	/**
		Read a grammar asynchronously but don't add it to the registry.
	**/
	function readGrammar(grammarPath:String, callback:haxe.Constraints.Function):Dynamic;
	/**
		Read a grammar synchronously and add it to this registry.
	**/
	function loadGrammarSync(grammarPath:String):Grammar;
	/**
		Read a grammar asynchronously and add it to the registry.
	**/
	function loadGrammar(grammarPath:String, callback:haxe.Constraints.Function):Dynamic;
}