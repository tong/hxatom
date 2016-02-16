package atom;

import js.html.Element;
import js.html.Event;

@:native("CommandRegistry")
extern class CommandRegistry {
    @:overload(function( target : String, commands : Dynamic ):Disposable{})
    @:overload(function( target : Element, commandName : String, callback : Event->Void ):Disposable{})
    function add( target : String, commandName : String, callback : Event->Void ) : Disposable;
    function findCommands( params : {target:js.html.Node} ) : Array<{name:String,displayName:String,jQuery:Dynamic}>;
    function dispatch( target : js.html.Node, commandName : String ) : Void;
}
