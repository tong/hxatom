package atom;
/**
	Atom global for dealing with packages, themes, menus, and the window.
	
	An instance of this class is always available as the `atom` global.
	
	@see https://github.com/atom/atom/blob/v1.31.2/src/atom-environment.js#L52
**/
@:native("atom") extern class AtomEnvironment {
	/**
		A `Clipboard` instance
	**/
	static var clipboard : atom.Clipboard;
	/**
		A {DeserializerManager} instance
	**/
	static var deserializers : atom.DeserializerManager;
	/**
		A {ViewRegistry} instance
	**/
	static var views : atom.ViewRegistry;
	/**
		A {NotificationManager} instance
	**/
	static var notifications : atom.NotificationManager;
	/**
		A `Config` instance
	**/
	static var config : atom.Config;
	/**
		A {KeymapManager} instance
	**/
	static var keymaps : atom.KeymapManager;
	/**
		A {TooltipManager} instance
	**/
	static var tooltips : atom.TooltipManager;
	/**
		A {CommandRegistry} instance
	**/
	static var commands : atom.CommandRegistry;
	/**
		A {GrammarRegistry} instance
	**/
	static var grammars : atom.GrammarRegistry;
	/**
		A {StyleManager} instance
	**/
	static var styles : atom.StyleManager;
	/**
		A {PackageManager} instance
	**/
	static var packages : atom.PackageManager;
	/**
		A {ThemeManager} instance
	**/
	static var themes : atom.ThemeManager;
	/**
		A {MenuManager} instance
	**/
	static var menu : atom.MenuManager;
	/**
		A {ContextMenuManager} instance
	**/
	static var contextMenu : atom.ContextMenuManager;
	/**
		A `Project` instance
	**/
	static var project : atom.Project;
	/**
		A {TextEditorRegistry} instance
	**/
	static var textEditors : Dynamic;
	/**
		A `Workspace` instance
	**/
	static var workspace : atom.Workspace;
	/**
		A {HistoryManager} instance
	**/
	static var history : atom.HistoryManager;
	/**
		Invoke the given callback whenever {::beep} is called.
	**/
	static function onDidBeep(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when there is an unhandled error, but
		before the devtools pop open
	**/
	static function onWillThrowError(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback whenever there is an unhandled error.
	**/
	static function onDidThrowError(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback as soon as the shell environment is
		loaded (or immediately if it was already loaded).
	**/
	static function whenShellEnvironmentLoaded(callback:haxe.Constraints.Function):Void;
	static function inDevMode():Bool;
	static function inSafeMode():Bool;
	static function inSpecMode():Bool;
	/**
		Get the version of the Atom application.
	**/
	static function getVersion():String;
	/**
		Gets the release channel of the Atom application.
	**/
	static function getReleaseChannel():String;
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
	static function open(params:{ /**
		An `Array` of `String` paths to open.
	**/
	var pathsToOpen : Array<Any>; /**
		A `Boolean`, true to always open a new window instead of reusing existing windows depending on the paths to open.
	**/
	var newWindow : Bool; /**
		A `Boolean`, true to open the window in development mode. Development mode loads the Atom source from the locally cloned repository and also loads all the packages in ~/.atom/dev/packages
	**/
	var devMode : Bool; /**
		A `Boolean`, true to open the window in safe mode. Safe mode prevents all packages installed to ~/.atom/packages from loading.
	**/
	var safeMode : Bool; }):Void;
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
	static function isMaximized():Bool;
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
		
		While both async and sync versions are provided, it is recommended to use the async version
		such that the renderer process is not blocked while the dialog box is open.
		
		The async version accepts the same options as Electron's `dialog.showMessageBox`.
		For convenience, it sets `type` to `'info'` and `normalizeAccessKeys` to `true` by default.
		
		If the dialog is closed (via `Esc` key or `X` in the top corner) without selecting a button
		the first button will be clicked unless a "Cancel" or "No" button is provided.
	**/
	static function confirm(options:{ /**
		The `String` message to display.
	**/
	var message : String; /**
		The `String` detailed message to display.
	**/
	@:optional
	var detailedMessage : String; /**
		Either an `Array` of `String`s or an `Object` where keys are button names and the values are callback `Function`s to invoke when clicked.
	**/
	@:optional
	var buttons : Array<Any>; }, ?callback:haxe.Constraints.Function):Float;
	/**
		Open the dev tools for the current window.
	**/
	static function openDevTools():js.Promise<Any>;
	/**
		Toggle the visibility of the dev tools for the current window.
	**/
	static function toggleDevTools():js.Promise<Any>;
	/**
		Execute code in dev tools.
	**/
	static function executeJavaScriptInDevTools():Void;
}