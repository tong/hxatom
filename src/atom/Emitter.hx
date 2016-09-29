package atom;

@:jsRequire("atom","Emitter")
extern class Emitter implements Disposable {
    function new() : Void;
    function clear() : Void;
    function dispose() : Void;
    @:overload(function( eventName : String, handler : Void->Void, ?unshift : Bool ) : Disposable {})
    function on<T>( eventName : String, handler : T->Void, ?unshift : Bool ) : Disposable;
    function preempt( eventName : String, handler : Void->Void ) : Disposable;
    function off<T>( eventName : String, handlerToRemove : T->Void ) : Void;
    function emit<T>( eventName : String, ?value : T ) : Void;
}
