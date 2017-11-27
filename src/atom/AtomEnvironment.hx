package atom;

/**
	Atom global for dealing with packages, themes, menus, and the window.
**/
@:require(js, atom) @:native("atom") extern class AtomEnvironment {
	/**
		A {CommandRegistry} instance 
	**/
	static var commands : Dynamic;
	/**
		A {Config} instance 
	**/
	static var config : Dynamic;
	/**
		A {Clipboard} instance 
	**/
	static var clipboard : Dynamic;
	/**
		A {ContextMenuManager} instance 
	**/
	static var contextMenu : Dynamic;
	/**
		A {MenuManager} instance 
	**/
	static var menu : Dynamic;
	/**
		A {KeymapManager} instance 
	**/
	static var keymaps : Dynamic;
	/**
		A {TooltipManager} instance 
	**/
	static var tooltips : Dynamic;
	/**
		A {NotificationManager} instance 
	**/
	static var notifications : Dynamic;
	/**
		A {Project} instance 
	**/
	static var project : Dynamic;
	/**
		A {GrammarRegistry} instance 
	**/
	static var grammars : Dynamic;
	/**
		A {HistoryManager} instance 
	**/
	static var history : Dynamic;
	/**
		A {PackageManager} instance 
	**/
	static var packages : Dynamic;
	/**
		A {ThemeManager} instance 
	**/
	static var themes : Dynamic;
	/**
		A {StyleManager} instance 
	**/
	static var styles : Dynamic;
	/**
		A {DeserializerManager} instance 
	**/
	static var deserializers : Dynamic;
	/**
		A {ViewRegistry} instance 
	**/
	static var views : Dynamic;
	/**
		A {Workspace} instance 
	**/
	static var workspace : Dynamic;
	/**
		A {TextEditorRegistry} instance 
	**/
	static var textEditors : Dynamic;
	/**
		Invoke the given callback whenever {::beep} is called.
	**/
	static function onDidBeep(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when there is an unhandled error, but
		before the devtools pop open
	**/
	static function onWillThrowError(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback whenever there is an unhandled error.
	**/
	static function onDidThrowError(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback as soon as the shell environment is
		loaded (or immediately if it was already loaded).
	**/
	static function whenShellEnvironmentLoaded(callback:haxe.Constraints.Function):Void;
	/**
		Returns a {Boolean} that is `true` if the current window is in development mode.
	**/
	static function inDevMode():Bool;
	/**
		Returns a {Boolean} that is `true` if the current window is in safe mode.
	**/
	static function inSafeMode():Bool;
	/**
		Returns a {Boolean} that is `true` if the current window is running specs.
	**/
	static function inSpecMode():Bool;
	/**
		Get the version of the Atom application.
	**/
	static function getVersion():String;
	/**
		Gets the release channel of the Atom application.
	**/
	static function getReleaseChannel():String;
	/**
		Returns a {Boolean} that is `true` if the current version is an official release.
	**/
	static function isReleasedVersion():Bool;
	/**
		Get the time taken to completely load the current window.
		
		This time include things like loading and activating packages, creating
		DOM elements for the editor, and reading the config.
	**/
	static function getWindowLoadTime():Float;
	/**
		Get the load settings for the current window.
	**/
	static function getLoadSettings():Dynamic;
	/**
		Open a new Atom window using the given options.
		
		Calling this method without an options parameter will open a prompt to pick
		a file/folder to open in the new window.
	**/
	static function open(params:Dynamic):Void;
	/**
		Prompt the user to select one or more folders.
	**/
	static function pickFolder(callback:haxe.Constraints.Function):Void;
	/**
		Close the current window. 
	**/
	static function close():Void;
	/**
		Get the size of current window.
	**/
	static function getSize():Dynamic;
	/**
		Set the size of current window.
	**/
	static function setSize(width:Float, height:Float):Void;
	/**
		Get the position of current window.
	**/
	static function getPosition():Dynamic;
	/**
		Set the position of current window.
	**/
	static function setPosition(x:Float, y:Float):Void;
	/**
		Get the current window 
	**/
	static function getCurrentWindow():Void;
	/**
		Move current window to the center of the screen. 
	**/
	static function center():Void;
	/**
		Focus the current window. 
	**/
	static function focus():Void;
	/**
		Show the current window. 
	**/
	static function show():Void;
	/**
		Hide the current window. 
	**/
	static function hide():Void;
	/**
		Reload the current window. 
	**/
	static function reload():Void;
	/**
		Relaunch the entire application. 
	**/
	static function restartApplication():Void;
	/**
		Returns a {Boolean} that is `true` if the current window is maximized.
	**/
	static function isMaximized():Bool;
	/**
		Returns a {Boolean} that is `true` if the current window is in full screen mode.
	**/
	static function isFullScreen():Bool;
	/**
		Set the full screen state of the current window. 
	**/
	static function setFullScreen():Void;
	/**
		Toggle the full screen state of the current window. 
	**/
	static function toggleFullScreen():Void;
	/**
		Visually and audibly trigger a beep. 
	**/
	static function beep():Void;
	/**
		A flexible way to open a dialog akin to an alert dialog.
		
		If the dialog is closed (via `Esc` key or `X` in the top corner) without selecting a button
		the first button will be clicked unless a "Cancel" or "No" button is provided.
	**/
	static function confirm(options:Dynamic):Float;
	/**
		Open the dev tools for the current window.
	**/
	static function openDevTools():js.Promise<Dynamic>;
	/**
		Toggle the visibility of the dev tools for the current window.
	**/
	static function toggleDevTools():js.Promise<Dynamic>;
	/**
		Execute code in dev tools. 
	**/
	static function executeJavaScriptInDevTools():Void;
}