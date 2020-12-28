package atom;
/**
	A simple color class returned from `Config.get` when the value
	at the key path is of type 'color'.
	
	@see https://github.com/atom/atom/blob/v1.53.0/src/color.js#L5
**/
@:jsRequire("atom", "Color") extern class Color {
	/**
		Parse a `String` or `Object` into a `Color`.
	**/
	static function parse(value:String):atom.Color;
	function toHexString():String;
	function toRGBAString():String;
}