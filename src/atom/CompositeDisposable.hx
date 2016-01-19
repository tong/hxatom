package atom;

//@:native("CompositeDisposable")
@:jsRequire("atom","CompositeDisposable")
extern class CompositeDisposable {
    function new() : Void;
    function dispose() : Void;
    function add( disposable : Disposable ) : Void;
    function remove( disposable : Disposable ) : Void;
    function clear() : Void;
}
