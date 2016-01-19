package atom;

@:native("Color")
extern class Color {
    function parse( value : Dynamic ) : Color;
    function toHexString() : String;
    function toRGBAString() : String;
}
