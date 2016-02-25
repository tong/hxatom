package atom;

/**
    Run a node script in a separate process.
*/
@:jsRequire("atom","Task")
extern class Task {

    static function once( taskPath : String, args : Dynamic ) : Task;

    function new( taskPath : String ) : Void;
    function start( args : Dynamic, ?cb : Void->Void ) : Void;
    function send( message : Dynamic ) : Void;
    function on( eventName : String, callback : Void->Void ) : Disposable;
    function terminate() : Void;
}
