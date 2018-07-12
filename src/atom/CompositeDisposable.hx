package atom;

/**
	An object that aggregates multiple {Disposable} instances together
	into a single disposable, so they can all be disposed as a group.
	
	These are very useful when subscribing to multiple events.
	@see <https://github.com/atom/event-kit/blob/v2.5.0/src/composite-disposable.coffee#L24>

**/
@:require(js, atom) @:jsRequire("atom", "CompositeDisposable") extern class CompositeDisposable {
	/**
		Construct an instance, optionally with one or more disposables 
	**/
	function new():Void;
	/**
		Dispose all disposables added to this composite disposable.
		
		If this object has already been disposed, this method has no effect. 
	**/
	function dispose():Void;
	/**
		Add disposables to be disposed when the composite is disposed.
		
		If this object has already been disposed, this method has no effect.
	**/
	function add(disposables:haxe.extern.Rest<Disposable>):Void;
	/**
		Remove a previously added disposable.
	**/
	function remove(disposable:Disposable):Void;
	/**
		Alias to {CompositeDisposable::remove} 
	**/
	function delete():Void;
	/**
		Clear all disposables. They will not be disposed by the next call
		to dispose. 
	**/
	function clear():Void;
}