package atom;

extern class Color {

    var red : Int;
    var green : Int;
    var blue : Int;
    var alpha : Float;

    function toHexString() : String;
    function toRGBAString() : String;
    function toJSON() : Dynamic;
    function isEqual( color : Color ) : Bool;
    function clone() : Color;

    static function parse( value : Dynamic ) : Color;
    static function parseColor( colorString : String ) : Color;
    static function parseAlpha( parseAlpha : String ) : Float;
    static function numberToHexString( number : Int ) : String;
}
