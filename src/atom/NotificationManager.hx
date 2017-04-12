package atom;

/**
	A notification manager used to create {Notification}s to be shown
	to the user.
**/
@:require(js, atom) @:jsRequire("atom", "NotificationManager") extern class NotificationManager {
	/**
		Invoke the given callback after a notification has been added.
	**/
	function onDidAddNotification(callback:haxe.Constraints.Function):Disposable;
	/**
		Add a success notification.
	**/
	function addSuccess(message:String, ?options:Dynamic):Void;
	/**
		Add an informational notification.
	**/
	function addInfo(message:String, ?options:Dynamic):Void;
	/**
		Add a warning notification.
	**/
	function addWarning(message:String, ?options:Dynamic):Void;
	/**
		Add an error notification.
	**/
	function addError(message:String, ?options:Dynamic):Void;
	/**
		Add a fatal error notification.
	**/
	function addFatalError(message:String, ?options:Dynamic):Void;
	/**
		Get all the notifications.
	**/
	function getNotifications():Array<Dynamic>;
}