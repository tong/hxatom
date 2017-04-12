package atom;

/**
	Associates listener functions with commands in a
	context-sensitive way using CSS selectors. You can access a global instance of
	this class via `atom.commands`, and commands registered there will be
	presented in the command palette.
**/
@:require(js, atom) @:jsRequire("atom", "CommandRegistry") extern class CommandRegistry {
	/**
		Add one or more command listeners associated with a selector.
	**/
	function add():Disposable;
	/**
		Find all registered commands matching a query.
	**/
	function findCommands(params:Dynamic):Array<Dynamic>;
	/**
		Simulate the dispatch of a command on a DOM node.
		
		This can be useful for testing when you want to simulate the invocation of a
		command on a detached DOM node. Otherwise, the DOM node in question needs to
		be attached to the document so the event bubbles up to the root node to be
		processed.
	**/
	function dispatch(target:Dynamic, commandName:String):Void;
	/**
		Invoke the given callback before dispatching a command event.
	**/
	function onWillDispatch(callback:haxe.Constraints.Function):Void;
	/**
		Invoke the given callback after dispatching a command event.
	**/
	function onDidDispatch(callback:haxe.Constraints.Function):Void;
}