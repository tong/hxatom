package atom;
/**
	Registry containing one or more grammars. 
	
	@see https://github.com/atom/first-mate\blob\v7.1.1\src\grammar-registry.coffee#L11
**/
@:jsRequire("atom", "GrammarRegistry") extern class GrammarRegistry {
	/**
		Invoke the given callback when a grammar is added to the registry.
	**/
	function onDidAddGrammar(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a grammar is updated due to a grammar
		it depends on being added or removed from the registry.
	**/
	function onDidUpdateGrammar(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a grammar is removed from the registry.
	**/
	function onDidRemoveGrammar(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Get all the grammars in this registry.
	**/
	function getGrammars():Array<Any>;
	/**
		Get a grammar with the given scope name.
	**/
	function grammarForScopeName(scopeName:String):atom.Grammar;
	/**
		Add a grammar to this registry.
		
		A 'grammar-added' event is emitted after the grammar is added.
	**/
	function addGrammar(grammar:atom.Grammar):atom.Disposable;
	/**
		Remove the grammar with the given scope name.
	**/
	function removeGrammarForScopeName(scopeName:String):atom.Grammar;
	/**
		Read a grammar synchronously but don't add it to the registry.
	**/
	function readGrammarSync(grammarPath:String):atom.Grammar;
	/**
		Read a grammar asynchronously but don't add it to the registry.
	**/
	function readGrammar(grammarPath:String, callback:haxe.Constraints.Function):Dynamic;
	/**
		Read a grammar synchronously and add it to this registry.
	**/
	function loadGrammarSync(grammarPath:String):atom.Grammar;
	/**
		Read a grammar asynchronously and add it to the registry.
	**/
	function loadGrammar(grammarPath:String, callback:haxe.Constraints.Function):Dynamic;
}