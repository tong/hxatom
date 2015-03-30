package atom;

extern class CommandRegistry {
    function add( target : String, commandName : String, callback : Dynamic->Void ) : Disposable;
    function findCommands( params : Dynamic ) : Void;
    function dispatch( target : Dynamic, commandName : String ) : Void;
}
