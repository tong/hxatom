package atom;

/**
	Run a node script in a separate process.
**/
@:require(js, atom) @:jsRequire("atom", "Task") extern class Task {
	/**
		A helper method to easily launch and run a task once.
	**/
	static function once(taskPath:String, args:Dynamic):Task;
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
	function on(eventName:String, callback:haxe.Constraints.Function):Disposable;
	/**
		A helper method to easily launch and run a task once.
	**/
	function once(taskPath:String, args:Dynamic):Task;
	/**
		Forcefully stop the running task.
		
		No more events are emitted once this method is called. 
	**/
	function terminate():Void;
}