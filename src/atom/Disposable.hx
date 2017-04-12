package atom;

/**
	A handle to a resource that can be disposed. For example,
	{Emitter::on} returns disposables representing subscriptions. 
**/
@:require(js, atom) @:jsRequire("atom", "Disposable") extern class Disposable {
	/**
		Ensure that `object` correctly implements the `Disposable`
		contract.
	**/
	static function isDisposable(object:Dynamic):Bool;
	/**
		Construct a Disposable
	**/
	function new(disposalAction:haxe.Constraints.Function):Void;
	/**
		Perform the disposal action, indicating that the resource associated
		with this disposable is no longer needed.
		
		You can call this method more than once, but the disposal action will only
		be performed the first time. 
	**/
	function dispose():Void;
}