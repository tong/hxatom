package atom;
/**
	Grammar that tokenizes lines of text.
	
	This class should not be instantiated directly but instead obtained from
	a {GrammarRegistry} by calling {GrammarRegistry::loadGrammar}. 
	
	@see https://github.com/atom/first-mate/blob/v7.1.3/src/grammar.coffee#L19
**/
@:jsRequire("atom", "Grammar") extern class Grammar {
	/**
		Invoke the given callback when this grammar is updated due to a
		grammar it depends on being added or removed from the registry.
	**/
	function onDidUpdate(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Tokenize all lines in the given text.
	**/
	function tokenizeLines(text:String):Array<Any>;
	/**
		Tokenize the line of text.
	**/
	function tokenizeLine(line:String, ruleStack:Array<Any>, firstLine:Bool):Dynamic;
}