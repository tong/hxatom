package atom;

/**
	A notification manager used to create {Notification}s to be shown
	to the user.
	
	An instance of this class is always available as the `atom.notifications`
	global.
	@see <https://github.com/atom/atom/blob/v1.27.0-beta1/src/notification-manager.js#L10>

**/
@:require(js, atom) @:jsRequire("atom", "NotificationManager") extern class NotificationManager {
	/**
		Invoke the given callback after a notification has been added.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddNotification(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback after the notifications have been cleared.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidClearNotifications(callback:haxe.Constraints.Function):Disposable;
	/**
		Add a success notification.Returns the `Notification` that was added.
	**/
	function addSuccess(message:String, ?options:{ /**
		An {Array} of {Object} where each {Object} has the following options:
	**/
	@:optional
	var buttons : Array<Dynamic>; /**
		A Markdown {String} containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text {String} containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A {Boolean} indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A {String} name of an icon from Octicons to display in the notification header. Defaults to `'check'`.
	**/
	@:optional
	var icon : String; }):Notification;
	/**
		Add an informational notification.Returns the `Notification` that was added.
	**/
	function addInfo(message:String, ?options:{ /**
		An {Array} of {Object} where each {Object} has the following options:
	**/
	@:optional
	var buttons : Array<Dynamic>; /**
		A Markdown {String} containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text {String} containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A {Boolean} indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A {String} name of an icon from Octicons to display in the notification header. Defaults to `'info'`.
	**/
	@:optional
	var icon : String; }):Notification;
	/**
		Add a warning notification.Returns the `Notification` that was added.
	**/
	function addWarning(message:String, ?options:{ /**
		An {Array} of {Object} where each {Object} has the following options:
	**/
	@:optional
	var buttons : Array<Dynamic>; /**
		A Markdown {String} containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text {String} containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A {Boolean} indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A {String} name of an icon from Octicons to display in the notification header. Defaults to `'alert'`.
	**/
	@:optional
	var icon : String; }):Notification;
	/**
		Add an error notification.Returns the `Notification` that was added.
	**/
	function addError(message:String, ?options:{ /**
		An {Array} of {Object} where each {Object} has the following options:
	**/
	@:optional
	var buttons : Array<Dynamic>; /**
		A Markdown {String} containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text {String} containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A {Boolean} indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A {String} name of an icon from Octicons to display in the notification header. Defaults to `'flame'`.
	**/
	@:optional
	var icon : String; /**
		A preformatted {String} with stack trace information describing the location of the error.
	**/
	@:optional
	var stack : String; }):Notification;
	/**
		Add a fatal error notification.Returns the `Notification` that was added.
	**/
	function addFatalError(message:String, ?options:{ /**
		An {Array} of {Object} where each {Object} has the following options:
	**/
	@:optional
	var buttons : Array<Dynamic>; /**
		A Markdown {String} containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text {String} containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A {Boolean} indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A {String} name of an icon from Octicons to display in the notification header. Defaults to `'bug'`.
	**/
	@:optional
	var icon : String; /**
		A preformatted {String} with stack trace information describing the location of the error.
	**/
	@:optional
	var stack : String; }):Notification;
	/**
		Get all the notifications.Returns an `Array` of `Notification`s.
	**/
	function getNotifications():Array<Dynamic>;
	/**
		Clear all the notifications.
	**/
	function clear():Void;
}