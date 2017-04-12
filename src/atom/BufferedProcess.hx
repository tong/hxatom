package atom;

/**
	A wrapper which provides standard error/output line buffering for
	Node's ChildProcess.
**/
@:require(js, atom) @:jsRequire("atom", "BufferedProcess") extern class BufferedProcess {
	/**
		Runs the given command by spawning a new child process.
	**/
	function new(options:Dynamic, command:String, args:Array<Dynamic>, options:Dynamic, stdout:haxe.Constraints.Function, data:String, stderr:haxe.Constraints.Function, data:String, exit:haxe.Constraints.Function, code:Float, autoStart:Bool):Void;
	/**
		Will call your callback when an error will be raised by the process.
		Usually this is due to the command not being available or not on the PATH.
		You can call `handle()` on the object passed to your callback to indicate
		that you have handled this error.
	**/
	function onWillThrowError(callback:haxe.Constraints.Function, errorObject:Dynamic, error:Dynamic, handle:haxe.Constraints.Function):Disposable;
	/**
		Terminate the process.
	**/
	function kill():Void;
}