package atom;

/**
	Allows commands to be associated with keystrokes in a
	context-sensitive way. In Atom, you can access a global instance of this
	object via `atom.keymaps`.
	
	Key bindings are plain JavaScript objects containing **CSS selectors** as
	their top level keys, then **keystroke patterns** mapped to commands.
	
	```cson
	'.workspace':
	  'ctrl-l': 'package:do-something'
	  'ctrl-z': 'package:do-something-else'
	'.mini.editor':
	  'enter': 'core:confirm'
	```
	
	When a keystroke sequence matches a binding in a given context, a custom DOM
	event with a type based on the command is dispatched on the target of the
	keyboard event.
	
	To match a keystroke sequence, the keymap starts at the target element for the
	keyboard event. It looks for key bindings associated with selectors that match
	the target element. If multiple match, the most specific is selected. If there
	is a tie in specificity, the most recently added binding wins. If no bindings
	are found for the events target, the search is repeated again for the target's
	parent node and so on recursively until a binding is found or we traverse off
	the top of the document.
	
	When a binding is found, its command event is always dispatched on the
	original target of the keyboard event, even if the matching element is higher
	up in the DOM. In addition, `.preventDefault()` is called on the keyboard
	event to prevent the browser from taking action. `.preventDefault` is only
	called if a matching binding is found.
	
	Command event objects have a non-standard method called `.abortKeyBinding()`.
	If your command handler is invoked but you programmatically determine that no
	action can be taken and you want to allow other bindings to be matched, call
	`.abortKeyBinding()` on the event object. An example of where this is useful
	is binding snippet expansion to `tab`. If `snippets:expand` is invoked when
	the cursor does not follow a valid snippet prefix, we abort the binding and
	allow `tab` to be handled by the default handler, which inserts whitespace.
	
	Multi-keystroke bindings are possible. If a sequence of one or more keystrokes
	*partially* matches a multi-keystroke binding, the keymap enters a pending
	state. The pending state is terminated on the next keystroke, or after
	{::getPartialMatchTimeout} milliseconds has elapsed. When the pending state is
	terminated via a timeout or a keystroke that leads to no matches, the longest
	ambiguous bindings that caused the pending state are temporarily disabled and
	the previous keystrokes are replayed. If there is ambiguity again during the
	replay, the next longest bindings are disabled and the keystrokes are replayed
	again. 
	@see <https://github.com/atom/atom-keymap/blob/v8.2.10/src/keymap-manager.coffee#L66>

**/
@:require(js, atom) @:jsRequire("atom", "KeymapManager") extern class KeymapManager {
	/**
		Create a keydown DOM event for testing purposes.
	**/
	static function buildKeydownEvent(key:Dynamic, ?options:{ /**
		A {Boolean} indicating the ctrl modifier key
	**/
	var ctrl : Bool; /**
		A {Boolean} indicating the alt modifier key
	**/
	var alt : Bool; /**
		A {Boolean} indicating the shift modifier key
	**/
	var shift : Bool; /**
		A {Boolean} indicating the cmd modifier key
	**/
	var cmd : Bool; /**
		A {Number} indicating `which` value of the event. See the docs for KeyboardEvent for more information.
	**/
	var which : Float; /**
		The target element of the event. 
	**/
	var target : Dynamic; }):Void;
	/**
		Create a new KeymapManager.
	**/
	function new(options:{ /**
		This will be used as the target of events whose target is `document.body` to allow for a catch-all element when nothing is focused. 
	**/
	var defaultTarget : Dynamic; }):Void;
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
		match a key binding.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidMatchBinding(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when one or more keystrokes partially
		match a binding.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidPartiallyMatchBindings(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when one or more keystrokes fail to match
		any bindings.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidFailToMatchBinding(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a keymap file not able to be loaded.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidFailToReadFile(callback:haxe.Constraints.Function):Disposable;
	/**
		Construct {KeyBinding}s from an object grouping them by CSS selector.
	**/
	function build(source:String, bindings:Dynamic, priority:Float):Void;
	/**
		Add sets of key bindings grouped by CSS selector.
	**/
	function add(source:String, bindings:Dynamic, priority:Float):Void;
	/**
		Get all current key bindings.Returns an `Array` of {KeyBinding}s.
	**/
	function getKeyBindings():Array<Dynamic>;
	/**
		Get the key bindings for a given command and optional target.Returns an `Array` of key bindings.
	**/
	function findKeyBindings(params:{ /**
		A {String} representing one or more keystrokes, such as 'ctrl-x ctrl-s'
	**/
	var keystrokes : String; /**
		A {String} representing the name of a command, such as 'editor:backspace'
	**/
	var command : String; /**
		An optional DOM element constraining the search. If this parameter is supplied, the call will only return bindings that can be invoked by a KeyboardEvent originating from the target element.
	**/
	var target : Dynamic; }):Array<Dynamic>;
	/**
		Load the key bindings from the given path.
	**/
	function loadKeymap(path:String, options:{ /**
		If `true`, the keymap will also reload the file at the given path whenever it changes. This option cannot be used with directory paths.
	**/
	var watch : Dynamic; /**
		A {Number} used to sort keybindings which have the same specificity. 
	**/
	var priority : Float; }):Void;
	/**
		Cause the keymap to reload the key bindings file at the given path
		whenever it changes.
		
		This method doesn't perform the initial load of the key bindings file. If
		that's what you're looking for, call {::loadKeymap} with `watch: true`.
	**/
	function watchKeymap(path:String, options:{ /**
		A {Number} used to sort keybindings which have the same specificity. 
	**/
	var priority : Float; }):Void;
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
		Translate a keydown event to a keystroke string.Returns a `String` describing the keystroke.
	**/
	function keystrokeForKeyboardEvent(event:Dynamic):String;
	/**
		Customize translation of raw keyboard events to keystroke strings.
		This API is useful for working around Chrome bugs or changing how Atom
		resolves certain key combinations. If multiple resolvers are installed,
		the most recently-added resolver returning a string for a given keystroke
		takes precedence.Returns a `Disposable` that removes the added resolver.
	**/
	function addKeystrokeResolver(resolver:haxe.Constraints.Function):Disposable;
	/**
		Get the number of milliseconds allowed before pending states caused
		by partial matches of multi-keystroke bindings are terminated.Returns a `Number`
	**/
	function getPartialMatchTimeout():Float;
}