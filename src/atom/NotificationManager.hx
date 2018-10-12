package atom;
/**
	A notification manager used to create `Notification`s to be shown
	to the user.
	
	An instance of this class is always available as the `atom.notifications`
	global.
	
	@see https://github.com/atom/atom/blob/v1.31.2/src/notification-manager.js#L10
**/
@:jsRequire("atom", "NotificationManager") extern class NotificationManager {
	/**
		Invoke the given callback after a notification has been added.
	**/
	function onDidAddNotification(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback after the notifications have been cleared.
	**/
	function onDidClearNotifications(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Add a success notification.
	**/
	function addSuccess(message:String, ?options:{ /**
		An `Array` of `Object` where each `Object` has the following options:
	**/
	@:optional
	var buttons : Array<Any>; /**
		A Markdown `String` containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text `String` containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A `Boolean` indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A `String` name of an icon from Octicons to display in the notification header. Defaults to `'check'`.
	**/
	@:optional
	var icon : String; }):atom.Notification;
	/**
		Add an informational notification.
	**/
	function addInfo(message:String, ?options:{ /**
		An `Array` of `Object` where each `Object` has the following options:
	**/
	@:optional
	var buttons : Array<Any>; /**
		A Markdown `String` containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text `String` containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A `Boolean` indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A `String` name of an icon from Octicons to display in the notification header. Defaults to `'info'`.
	**/
	@:optional
	var icon : String; }):atom.Notification;
	/**
		Add a warning notification.
	**/
	function addWarning(message:String, ?options:{ /**
		An `Array` of `Object` where each `Object` has the following options:
	**/
	@:optional
	var buttons : Array<Any>; /**
		A Markdown `String` containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text `String` containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A `Boolean` indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A `String` name of an icon from Octicons to display in the notification header. Defaults to `'alert'`.
	**/
	@:optional
	var icon : String; }):atom.Notification;
	/**
		Add an error notification.
	**/
	function addError(message:String, ?options:{ /**
		An `Array` of `Object` where each `Object` has the following options:
	**/
	@:optional
	var buttons : Array<Any>; /**
		A Markdown `String` containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text `String` containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A `Boolean` indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A `String` name of an icon from Octicons to display in the notification header. Defaults to `'flame'`.
	**/
	@:optional
	var icon : String; /**
		A preformatted `String` with stack trace information describing the location of the error.
	**/
	@:optional
	var stack : String; }):atom.Notification;
	/**
		Add a fatal error notification.
	**/
	function addFatalError(message:String, ?options:{ /**
		An `Array` of `Object` where each `Object` has the following options:
	**/
	@:optional
	var buttons : Array<Any>; /**
		A Markdown `String` containing a longer description about the notification. By default, this **will not** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var description : String; /**
		A plain-text `String` containing additional details about the notification. By default, this **will** preserve newlines and whitespace when it is rendered.
	**/
	@:optional
	var detail : String; /**
		A `Boolean` indicating whether this notification can be dismissed by the user. Defaults to `false`.
	**/
	@:optional
	var dismissable : Bool; /**
		A `String` name of an icon from Octicons to display in the notification header. Defaults to `'bug'`.
	**/
	@:optional
	var icon : String; /**
		A preformatted `String` with stack trace information describing the location of the error.
	**/
	@:optional
	var stack : String; }):atom.Notification;
	/**
		Get all the notifications.
	**/
	function getNotifications():Array<Any>;
	/**
		Clear all the notifications.
	**/
	function clear():Void;
}