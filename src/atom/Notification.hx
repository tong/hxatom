package atom;

/**
	A notification to the user containing a message and type.
	@see <https://github.com/atom/atom/blob/v1.27.0-beta1/src/notification.js#L6>

**/
@:require(js, atom) @:jsRequire("atom", "Notification") extern class Notification {
	/**
		Invoke the given callback when the notification is dismissed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDismiss(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the notification is displayed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDisplay(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns the `String` type.
	**/
	function getType():String;
	/**
		Returns the `String` message.
	**/
	function getMessage():String;
	/**
		Dismisses the notification, removing it from the UI. Calling this
		programmatically will call all callbacks added via `onDidDismiss`.
	**/
	function dismiss():Void;
}