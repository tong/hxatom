package atom;

@:native("Disposable")
extern class Disposable {
    function new( disposalAction : Dynamic ) : Void;
    function dispose() : Void;
}
