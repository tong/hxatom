package atom;

/**
	Represents the clipboard used for copying and pasting in Atom.
	
	An instance of this class is always available as the `atom.clipboard` global.
	@see <https://github.com/atom/atom/blob/v1.24.0/src/clipboard.js#L17>

**/
@:require(js, atom) @:jsRequire("atom", "Clipboard") extern class Clipboard {
	/**
		Write the given text to the clipboard.
		
		The metadata associated with the text is available by calling
		{::readWithMetadata}.
	**/
	function write(text:String, ?metadata:Dynamic):Void;
	/**
		Read the text from the clipboard.Returns a `String`.
	**/
	function read():String;
	/**
		Read the text from the clipboard and return both the text and the
		associated metadata.Returns an `Object` with the following keys:
		
		* `text` The `String` clipboard text.
		* `metadata` The metadata stored by an earlier call to {::write}.
	**/
	function readWithMetadata():Dynamic;
}