package atom;

/**
	Like {BufferedProcess}, but accepts a Node script as the command
	to run.
	
	This is necessary on Windows since it doesn't support shebang `#!` lines.
	@see <https://github.com/atom/atom/blob/v1.27.0-beta1/src/buffered-node-process.js#L14>

**/
@:require(js, atom) @:jsRequire("atom", "BufferedNodeProcess") extern class BufferedNodeProcess extends atom.BufferedProcess {
	/**
		Runs the given Node script by spawning a new child process.
	**/
	function new(options:{ /**
		The {String} path to the JavaScript script to execute.
	**/
	var command : String; /**
		The {Array} of arguments to pass to the script (optional).
	**/
	var args : Array<Dynamic>; /**
		The options {Object} to pass to Node's `ChildProcess.spawn`
		```
		      method (optional).
		```
	**/
	var options : Dynamic; /**
		The callback {Function} that receives a single argument which
		```
		     contains the standard output from the command. The callback is
		     called as data is received but it's buffered to ensure only
		     complete lines are passed until the source stream closes. After
		     the source stream has closed all remaining data is sent in a
		     final call (optional).
		```
	**/
	var stdout : haxe.Constraints.Function; /**
		The callback {Function} that receives a single argument which
		```
		     contains the standard error output from the command. The
		     callback is called as data is received but it's buffered to
		     ensure only complete lines are passed until the source stream
		     closes. After the source stream has closed all remaining data
		     is sent in a final call (optional).
		```
	**/
	var stderr : haxe.Constraints.Function; /**
		The callback {Function} which receives a single argument
		```
		   containing the exit status (optional).
		```
	**/
	var exit : haxe.Constraints.Function; }):Void;
}