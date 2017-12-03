package atom;

/**
	Grammar that tokenizes lines of text.
	
	This class should not be instantiated directly but instead obtained from
	a {GrammarRegistry} by calling {GrammarRegistry::loadGrammar}. 
	@see <https://github.com/atom/first-mate/blob/v7.0.7/src/grammar.coffee#L19>

**/
@:require(js, atom) @:jsRequire("atom", "Grammar") extern class Grammar {
	/**
		Invoke the given callback when this grammar is updated due to a
		grammar it depends on being added or removed from the registry.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidUpdate(callback:haxe.Constraints.Function):Disposable;
	/**
		Tokenize all lines in the given text.Returns an `Array` of token arrays for each line tokenized.
	**/
	function tokenizeLines(text:String):Array<Dynamic>;
	/**
		Tokenize the line of text.Returns an `Object` containing the following properties:
		
		* `line` The `String` of text that was tokenized.
		* `tags` An `Array` of integer scope ids and strings. Positive ids
		  indicate the beginning of a scope, and negative tags indicate the end.
		  To resolve ids to scope names, call {GrammarRegistry::scopeForId} with the
		  absolute value of the id.
		* `tokens` This is a dynamic property. Invoking it will incur additional
		  overhead, but will automatically translate the `tags` into token objects
		  with `value` and `scopes` properties.
		* `ruleStack` An `Array` of rules representing the tokenized state at the
		  end of the line. These should be passed back into this method when
		  tokenizing the next line in the file.
	**/
	function tokenizeLine(line:String, ruleStack:Array<Dynamic>, firstLine:Bool):Dynamic;
}