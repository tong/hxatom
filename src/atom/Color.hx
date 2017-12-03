package atom;

/**
	A simple color class returned from {Config::get} when the value
	at the key path is of type 'color'.
	@see <https://github.com/atom/atom/blob/v1.22.1/src/color.js#L7>

**/
@:require(js, atom) @:jsRequire("atom", "Color") extern class Color {
	/**
		Parse a `String` or `Object` into a `Color`.Returns a `Color` or `null` if it cannot be parsed.
	**/
	static function parse(value:String):Color;
	/**
		Returns a `String` in the form `'#abcdef'`.
	**/
	function toHexString():String;
	/**
		Returns a `String` in the form `'rgba(25, 50, 75, .9)'`.
	**/
	function toRGBAString():String;
}