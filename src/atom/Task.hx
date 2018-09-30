package atom;
/**
	Run a node script in a separate process.
	
	Used by the fuzzy-finder and [find in project](https://github.com/atom/atom/blob/master/src/scan-handler.coffee).
	
	For a real-world example, see the [scan-handler](https://github.com/atom/atom/blob/master/src/scan-handler.coffee)
	and the [instantiation of the task](https://github.com/atom/atom/blob/4a20f13162f65afc816b512ad7201e528c3443d7/src/project.coffee#L245).
	
	@see https://github.com/atom/atom/blob/v1.31.1/src/task.coffee#L40
**/
@:jsRequire("atom", "Task") extern class Task {
	/**
		A helper method to easily launch and run a task once.
	**/
	static function once(taskPath:String, args:Dynamic):atom.Task;
	/**
		Creates a task. You should probably use {.once}
	**/
	function new(taskPath:String):Void;
	/**
		Starts the task.
		
		Throws an error if this task has already been terminated or if sending a
		message to the child process fails.
	**/
	function start(args:Dynamic, ?callback:haxe.Constraints.Function):Void;
	/**
		Send message to the task.
		
		Throws an error if this task has already been terminated or if sending a
		message to the child process fails.
	**/
	function send(message:Dynamic):Void;
	/**
		Call a function when an event is emitted by the child process
	**/
	function on(eventName:String, callback:haxe.Constraints.Function):atom.Disposable;
	/**
		A helper method to easily launch and run a task once.
	**/
	function once(taskPath:String, args:Dynamic):atom.Task;
	/**
		Forcefully stop the running task.
		
		No more events are emitted once this method is called. 
	**/
	function terminate():Void;
	/**
		Cancel the running task and emit an event if it was canceled.
	**/
	function cancel():Bool;
}