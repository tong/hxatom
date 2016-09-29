package atom;

/*
@:jsRequire("atom","Disposable")
extern class Disposable {
    function new( disposalAction : Dynamic->Void ) : Void;
    function dispose() : Void;
}
*/
interface Disposable {
    function dispose() : Void;
}
