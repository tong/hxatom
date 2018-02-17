package atom;

/**
	Associates listener functions with commands in a
	context-sensitive way using CSS selectors. You can access a global instance of
	this class via `atom.commands`, and commands registered there will be
	presented in the command palette.
	
	The global command registry facilitates a style of event handling known as
	*event delegation* that was popularized by jQuery. Atom commands are expressed
	as custom DOM events that can be invoked on the currently focused element via
	a key binding or manually via the command palette. Rather than binding
	listeners for command events directly to DOM nodes, you instead register
	command event listeners globally on `atom.commands` and constrain them to
	specific kinds of elements with CSS selectors.
	
	Command names must follow the `namespace:action` pattern, where `namespace`
	will typically be the name of your package, and `action` describes the
	behavior of your command. If either part consists of multiple words, these
	must be separated by hyphens. E.g. `awesome-package:turn-it-up-to-eleven`.
	All words should be lowercased.
	
	As the event bubbles upward through the DOM, all registered event listeners
	with matching selectors are invoked in order of specificity. In the event of a
	specificity tie, the most recently registered listener is invoked first. This
	mirrors the "cascade" semantics of CSS. Event listeners are invoked in the
	context of the current DOM node, meaning `this` always points at
	`event.currentTarget`. As is normally the case with DOM events,
	`stopPropagation` and `stopImmediatePropagation` can be used to terminate the
	bubbling process and prevent invocation of additional listeners.
	
	## Example
	
	Here is a command that inserts the current date in an editor:
	
	```coffee
	atom.commands.add 'atom-text-editor',
	  'user:insert-date': (event) ->
	    editor = @getModel()
	    editor.insertText(new Date().toLocaleString())
	```
	@see <https://github.com/atom/atom/blob/v1.24.0/src/command-registry.js#L47>

**/
@:require(js, atom) @:jsRequire("atom", "CommandRegistry") extern class CommandRegistry {
	/**
		Add one or more command listeners associated with a selector.Returns a `Disposable` on which `.dispose()` can be called to remove the
		added command handler(s).
	**/
	function add(target:String, commandName:String, listener:haxe.Constraints.Function):Disposable;
	/**
		Find all registered commands matching a query.Returns an `Array` of `CommandDescriptor` `Object`s containing the following keys:
		
		* `name` The name of the command. For example, `user:insert-date`.
		* `displayName` The display name of the command. For example,
		  `User: Insert Date`.
		  Additional metadata may also be present in the returned descriptor:
		* `description` a `String` describing the function of the command in more
		  detail than the title
		* `tags` an `Array` of `String`s that describe keywords related to the
		  command
		  Any additional nonstandard metadata provided when the command was `add`ed
		  may also be present in the returned descriptor.
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