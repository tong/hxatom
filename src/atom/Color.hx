package atom;

/**
	A simple color class returned from {Config::get} when the value
	at the key path is of type 'color'.
**/
@:require(js, atom) @:jsRequire("atom", "Color") extern class Color {
	/**
		Parse a {String} or {Object} into a {Color}.
	**/
	static function parse(value:String):Color;
	function toHexString():String;
	function toRGBAString():String;
}