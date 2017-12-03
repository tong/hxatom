package atom;

/**
	Like {BufferedProcess}, but accepts a Node script as the command
	to run.
	
	This is necessary on Windows since it doesn't support shebang `#!` lines.
	@see <https://github.com/atom/atom/blob/v1.22.1/src/buffered-node-process.js#L15>

**/
@:require(js, atom) @:jsRequire("atom", "BufferedNodeProcess") extern class BufferedNodeProcess extends atom.BufferedProcess {
	/**
		Runs the given Node script by spawning a new child process.
	**/
	function new(options:Dynamic):Void;
}