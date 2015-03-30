package atom;

extern class Point {

    // Construction

    static function fromObject( object : Dynamic, ?copy : Bool ) : Point;

    function new( row : Int, column : Int ) : Void;
    function copy() : Point;
    function negate() : Point;

    // Comparison

    static function min( point1 : Point, point2 : Point ) : Point;

    function compare( other : Point ) : Int;
    function isEqual( other : Point ) : Bool;
    function isLessThan( other : Point ) : Bool;
    function isLessThanOrEqual( other : Point ) : Bool;
    function isGreaterThan( other : Point ) : Bool;
    function isGreaterThanOrEqual( other : Point ) : Bool;

    // Operations

    function freeze() : Point;
    function translate( other : Point ) : Point;
    function traverse( other : Point ) : Point;

    // Conversion

    function toArray() : Array<Int>;
    function serialize() : Array<Int>;
    function toString() : String;

}
