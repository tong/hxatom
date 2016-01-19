package atom;

import js.html.Element;

private typedef KeyBinding = Dynamic; //TODO

@:native("KeymapManager")
extern class KeymapManager {

    static function buildKeydownEvent( key : Int, ?options : {ctrl:Bool,alt:Bool,shift:Bool,cmd:Bool,which:Int,target:Element} ) : Void;

    function new( options : {defaultTarget:Element} ) : Void;
    function destroy() : Void;

    // Event Subscription

    function onDidMatchBinding( callback : {keystrokes:String,binding:KeyBinding,keyboardEventTarget:Element}->Void ) : Disposable;
    function onDidPartiallyMatchBindings( callback : {keystrokes:String,partiallyMatchedBindings:KeyBinding,keyboardEventTarget:Element}->Void ) : Disposable;
    function onDidFailToMatchBinding( callback : {keystrokes:String,keyboardEventTarget:Element}->Void ) : Disposable;
    function onDidFailToReadFile( callback : {message:String,stack:String}->Void ) : Void;

    // Adding and Removing Bindings

    function add( source : String, bindings : Dynamic ) : Void;

    // Accessing Bindings

    function getKeyBindings() : Array<KeyBinding>;
    function findKeyBindings( params : {keystrokes:String,command:String,target:Element} ) : Array<KeyBinding>;

    // Managing Keymap Files

    function loadKeymap( path : String, options : {watch:Bool} ) : Void;
    function watchKeymap( path : String ) : Void;

    // Managing Keyboard Events

    function handleKeyboardEvent( event : js.html.KeyboardEvent ) : Void;
    function keystrokeForKeyboardEvent( event : js.html.KeyboardEvent ) : Void;
    function getPartialMatchTimeout() : Void;
}
