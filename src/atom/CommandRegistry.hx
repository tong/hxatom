package atom;

extern class CommandRegistry {
    function add( target : String, commandName : String, callback : Dynamic->Void ) : Disposable;
    function findCommands( params : {target:js.html.Node} ) : Array<{name:String,displayName:String,jQuery:Dynamic}>;
    function dispatch( target : js.html.Node, commandName : String ) : Void;
}
