package atom;

/**
	Registry containing one or more grammars. 
	@see <https://github.com/atom/first-mate\blob\v7.1.0\src\grammar-registry.coffee#L11>

**/
@:require(js, atom) @:jsRequire("atom", "GrammarRegistry") extern class GrammarRegistry {
	/**
		Invoke the given callback when a grammar is added to the registry.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a grammar is updated due to a grammar
		it depends on being added or removed from the registry.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidUpdateGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a grammar is removed from the registry.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRemoveGrammar(callback:haxe.Constraints.Function):Disposable;
	/**
		Get all the grammars in this registry.Returns a non-empty `Array` of `Grammar` instances.
	**/
	function getGrammars():Array<Dynamic>;
	/**
		Get a grammar with the given scope name.Returns a `Grammar` or .
	**/
	function grammarForScopeName(scopeName:String):Grammar;
	/**
		Add a grammar to this registry.
		
		A 'grammar-added' event is emitted after the grammar is added.Returns a `Disposable` on which `.dispose()` can be called to remove the
		grammar.
	**/
	function addGrammar(grammar:Grammar):Disposable;
	/**
		Remove the grammar with the given scope name.Returns the removed `Grammar` or .
	**/
	function removeGrammarForScopeName(scopeName:String):Grammar;
	/**
		Read a grammar synchronously but don't add it to the registry.Returns a `Grammar`.
	**/
	function readGrammarSync(grammarPath:String):Grammar;
	/**
		Read a grammar asynchronously but don't add it to the registry.Returns .
	**/
	function readGrammar(grammarPath:String, callback:haxe.Constraints.Function):Dynamic;
	/**
		Read a grammar synchronously and add it to this registry.Returns a `Grammar`.
	**/
	function loadGrammarSync(grammarPath:String):Grammar;
	/**
		Read a grammar asynchronously and add it to the registry.Returns .
	**/
	function loadGrammar(grammarPath:String, callback:haxe.Constraints.Function):Dynamic;
}