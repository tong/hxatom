package atom;

/**
	A notification to the user containing a message and type. 
**/
@:require(js, atom) @:jsRequire("atom", "Notification") extern class Notification {
	/**
		Invoke the given callback when the notification is dismissed.
	**/
	function onDidDismiss(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the notification is displayed.
	**/
	function onDidDisplay(callback:haxe.Constraints.Function):Disposable;
	function getType():String;
	function getMessage():String;
	/**
		Dismisses the notification, removing it from the UI. Calling this programmatically
		will call all callbacks added via `onDidDismiss`. 
	**/
	function dismiss():Void;
}