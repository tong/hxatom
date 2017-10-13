package atom;

/**
	Allows commands to be associated with keystrokes in a
	context-sensitive way. In Atom, you can access a global instance of this
	object via `atom.keymaps`.
**/
@:require(js, atom) @:jsRequire("atom", "KeymapManager") extern class KeymapManager {
	/**
		Create a keydown DOM event for testing purposes.
	**/
	static function buildKeydownEvent(key:Dynamic, ?options:Dynamic):Void;
	/**
		Create a new KeymapManager.
	**/
	function new(options:Dynamic):Void;
	/**
		Clear all registered key bindings and enqueued keystrokes. For use
		in tests. 
	**/
	function clear():Void;
	/**
		Unwatch all watched paths. 
	**/
	function destroy():Void;
	/**
		Invoke the given callback when one or more keystrokes completely
		match a key binding.
	**/
	function onDidMatchBinding(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when one or more keystrokes partially
		match a binding.
	**/
	function onDidPartiallyMatchBindings(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when one or more keystrokes fail to match
		any bindings.
	**/
	function onDidFailToMatchBinding(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a keymap file not able to be loaded.
	**/
	function onDidFailToReadFile(callback:haxe.Constraints.Function):Disposable;
	/**
		Construct [KeyBindings]{KeyBinding} from an object grouping them by CSS selector.
	**/
	function build(source:String, bindings:Dynamic, priority:Float):Void;
	/**
		Add sets of key bindings grouped by CSS selector.
	**/
	function add(source:String, bindings:Dynamic, priority:Float):Void;
	/**
		Get all current key bindings.
	**/
	function getKeyBindings():Array<Dynamic>;
	/**
		Get the key bindings for a given command and optional target.
	**/
	function findKeyBindings(params:Dynamic):Array<Dynamic>;
	/**
		Load the key bindings from the given path.
	**/
	function loadKeymap(path:String, options:Dynamic):Void;
	/**
		Cause the keymap to reload the key bindings file at the given path
		whenever it changes.
		
		This method doesn't perform the initial load of the key bindings file. If
		that's what you're looking for, call {::loadKeymap} with `watch: true`.
	**/
	function watchKeymap(path:String, options:Dynamic):Void;
	/**
		Dispatch a custom event associated with the matching key binding for
		the given `KeyboardEvent` if one can be found.
		
		If a matching binding is found on the event's target or one of its
		ancestors, `.preventDefault()` is called on the keyboard event and the
		binding's command is emitted as a custom event on the matching element.
		
		If the matching binding's command is 'native!', the method will terminate
		without calling `.preventDefault()` on the keyboard event, allowing the
		browser to handle it as normal.
		
		If the matching binding's command is 'unset!', the search will continue from
		the current element's parent.
		
		If the matching binding's command is 'abort!', the search will terminate
		without dispatching a command event.
		
		If the event's target is `document.body`, it will be treated as if its
		target is `.defaultTarget` if that property is assigned on the keymap.
	**/
	function handleKeyboardEvent(event:Dynamic):Void;
	/**
		Translate a keydown event to a keystroke string.
	**/
	function keystrokeForKeyboardEvent(event:Dynamic):String;
	/**
		Customize translation of raw keyboard events to keystroke strings.
		This API is useful for working around Chrome bugs or changing how Atom
		resolves certain key combinations. If multiple resolvers are installed,
		the most recently-added resolver returning a string for a given keystroke
		takes precedence.
	**/
	function addKeystrokeResolver(resolver:haxe.Constraints.Function):Disposable;
	/**
		Get the number of milliseconds allowed before pending states caused
		by partial matches of multi-keystroke bindings are terminated.
	**/
	function getPartialMatchTimeout():Float;
}