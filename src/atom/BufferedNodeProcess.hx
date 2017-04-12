package atom;

/**
	Like {BufferedProcess}, but accepts a Node script as the command
	to run.
**/
@:require(js, atom) @:jsRequire("atom", "BufferedNodeProcess") extern class BufferedNodeProcess extends atom.BufferedProcess {
	/**
		Runs the given Node script by spawning a new child process.
	**/
	function new(options:Dynamic, command:String, args:Array<Dynamic>, options:Dynamic, stdout:haxe.Constraints.Function, stderr:haxe.Constraints.Function, exit:haxe.Constraints.Function):Void;
}