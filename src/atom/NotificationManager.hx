package atom;

/**
	A notification manager used to create {Notification}s to be shown
	to the user.
	
	An instance of this class is always available as the `atom.notifications`
	global.
	@see <https://github.com/atom/atom/blob/v1.22.1/src/notification-manager.js#L10>

**/
@:require(js, atom) @:jsRequire("atom", "NotificationManager") extern class NotificationManager {
	/**
		Invoke the given callback after a notification has been added.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddNotification(callback:haxe.Constraints.Function):Disposable;
	/**
		Add a success notification.Returns the `Notification` that was added.
	**/
	function addSuccess(message:String, ?options:Dynamic):Notification;
	/**
		Add an informational notification.Returns the `Notification` that was added.
	**/
	function addInfo(message:String, ?options:Dynamic):Notification;
	/**
		Add a warning notification.Returns the `Notification` that was added.
	**/
	function addWarning(message:String, ?options:Dynamic):Notification;
	/**
		Add an error notification.Returns the `Notification` that was added.
	**/
	function addError(message:String, ?options:Dynamic):Notification;
	/**
		Add a fatal error notification.Returns the `Notification` that was added.
	**/
	function addFatalError(message:String, ?options:Dynamic):Notification;
	/**
		Get all the notifications.Returns an `Array` of `Notification`s.
	**/
	function getNotifications():Array<Dynamic>;
}