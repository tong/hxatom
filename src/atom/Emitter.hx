package atom;

/**
	Utility class to be used when implementing event-based APIs that
	allows for handlers registered via `::on` to be invoked with calls to
	`::emit`. Instances of this class are intended to be used internally by
	classes that expose an event-based API.
**/
@:require(js, atom) @:jsRequire("atom", "Emitter") extern class Emitter {
	/**
		Construct an emitter.
		
		```coffee
		@emitter = new Emitter()
		```
	**/
	function new():Void;
	/**
		Clear out any existing subscribers. 
	**/
	function clear():Void;
	/**
		Unsubscribe all handlers. 
	**/
	function dispose():Void;
	/**
		Register the given handler function to be invoked whenever events by
		the given name are emitted via {::emit}.
	**/
	function on(eventName:String, handler:haxe.Constraints.Function):Disposable;
	/**
		Register the given handler function to be invoked *before* all
		other handlers existing at the time of subscription whenever events by the
		given name are emitted via {::emit}.
		
		Use this method when you need to be the first to handle a given event. This
		could be required when a data structure in a parent object needs to be
		updated before third-party event handlers registered on a child object via a
		public API are invoked. Your handler could itself be preempted via
		subsequent calls to this method, but this can be controlled by keeping
		methods based on `::preempt` private.
	**/
	function preempt(eventName:String, handler:haxe.Constraints.Function):Disposable;
	/**
		Invoke handlers registered via {::on} for the given event name.
	**/
	function emit(eventName:Dynamic, value:Dynamic):Void;
}