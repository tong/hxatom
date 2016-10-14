
import atom.*;

@:native("atom")
extern class Atom {

    static var commands(default,null) : CommandRegistry;
    static var config(default,null) : Config;
    static var clipboard(default,null) : Clipboard;
    static var contextMenu(default,null) : ContextMenuManager;
    static var menu(default,null) : MenuManager;
    static var keymaps(default,null) : KeymapManager;
    static var tooltips(default,null) : TooltipManager;
    static var notifications(default,null) : NotificationManager;
    static var project(default,null) : Project;
    static var grammars(default,null) : GrammarRegistry;
    static var packages(default,null) : PackageManager;
    static var themes(default,null) : ThemeManager;
    static var styles(default,null) : StyleManager;
    static var deserializers(default,null) : DeserializerManager;
    static var views(default,null) : ViewRegistry;
    static var workspace(default,null) : Workspace;

    static function onDidBeep( callback : Void->Void ) : Disposable;
    static function onWillThrowError( callback : Dynamic->Void ) : Disposable;
    static function onDidThrowError( callback : Dynamic->Void ) : Disposable;

    static function inDevMode() : Bool;
    static function inSpecMode() : Bool;
    static function getVersion() : String;
    static function isReleasedVersion() : Bool;
    static function getWindowLoadTime() : Float;
    static function getLoadSettings() : Dynamic;

    static function open( options : Dynamic ) : Void;
    static function close() : Void;
    static function getSize() : {width:Int,height:Int};
    static function setSize( width : Int, height : Int ) : Void;
    static function getPosition() : {x:Int,y:Int};
    static function setPosition( x : Int, y : Int ) : Void;

    static function pickFolder( callback : Array<String>->Void ) : Void;
    static function getCurrentWindow() : Dynamic; //TODO ?
    static function center() : Void;
    static function focus() : Void;
    static function show() : Void;
    static function hide() : Void;
    static function reload() : Void;
    static function isMaximized() : Bool;
    static function isFullScreen() : Bool;
    static function setFullScreen( ?fullScreen : Bool ) : Void;
    static function toggleFullScreen() : Void;

    static function beep() : Void;
    static function confirm( options : {message:String,?detailedMessage:String,?buttons:Dynamic} ) : Int;

    static function openDevTools() : Void;
    static function toggleDevTools() : Void;
    static function executeJavaScriptInDevTools() : Void;
}
