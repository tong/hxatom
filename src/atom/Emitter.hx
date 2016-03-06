package atom;

@:jsRequire("atom","Emitter")
extern class Emitter {
    function new() : Void;
    function clear() : Void;
    function dispose() : Void;
    function on( eventName : String, handler : Dynamic->Void, ?unshift : Bool ) : Disposable;
    function preempt( eventName : String, handler : Void->Void ) : Disposable;
    function off( eventName : String, handlerToRemove : Dynamic->Void ) : Void;
    function emit( eventName : String, ?value : Dynamic ) : Void;
}
