package atom;

/**
	A wrapper which provides standard error/output line buffering for
	Node's ChildProcess.
	@see <https://github.com/atom/atom/blob/v1.28.1/src/buffered-process.js#L21>

**/
@:require(js, atom) @:jsRequire("atom", "BufferedProcess") extern class BufferedProcess {
	/**
		Runs the given command by spawning a new child process.
	**/
	function new(options:{ /**
		The {String} command to execute.
	**/
	var command : String; /**
		The {Array} of arguments to pass to the command (optional).
	**/
	var args : Array<Dynamic>; /**
		{Object} (optional) The options {Object} to pass to Node's `ChildProcess.spawn` method.
	**/
	var options : Dynamic; /**
		{Function} (optional) The callback that receives a single argument which contains the standard output from the command. The callback is called as data is received but it's buffered to ensure only complete lines are passed until the source stream closes. After the source stream has closed all remaining data is sent in a final call.
	**/
	var stdout : haxe.Constraints.Function; /**
		{Function} (optional) The callback that receives a single argument which contains the standard error output from the command. The callback is called as data is received but it's buffered to ensure only complete lines are passed until the source stream closes. After the source stream has closed all remaining data is sent in a final call.
	**/
	var stderr : haxe.Constraints.Function; /**
		{Function} (optional) The callback which receives a single argument containing the exit status.
	**/
	var exit : haxe.Constraints.Function; /**
		{Boolean} (optional) Whether the command will automatically start when this BufferedProcess is created. Defaults to true.  When set to false you must call the `start` method to start the process.
	**/
	var autoStart : Bool; }):Void;
	/**
		Will call your callback when an error will be raised by the process.
		Usually this is due to the command not being available or not on the PATH.
		You can call `handle()` on the object passed to your callback to indicate
		that you have handled this error.Returns a `Disposable`
	**/
	function onWillThrowError(callback:haxe.Constraints.Function):Disposable;
	/**
		Terminate the process.
	**/
	function kill():Void;
}