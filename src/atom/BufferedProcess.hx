package atom;

/**
	A wrapper which provides standard error/output line buffering for
	Node's ChildProcess.
	@see <https://github.com/atom/atom/blob/v1.24.0/src/buffered-process.js#L22>

**/
@:require(js, atom) @:jsRequire("atom", "BufferedProcess") extern class BufferedProcess {
	/**
		Runs the given command by spawning a new child process.
	**/
	function new(options:Dynamic):Void;
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