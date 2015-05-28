package atom;

import haxe.extern.EitherType;

extern class Range {

    var start : Point;
    var end : Point;

    function new( pointA : EitherType<Point,Array<Float>>, pointB : EitherType<Point,Array<Float>> ) : Void;

    function fromObject( object : Dynamic, ?copy : Bool ) : Range;
    function copy() : Range;
    function negate() : Range;

    function deserialize( array : Array<Dynamic> ) : Void;
    function serialize() : Dynamic;

    function isEmpty() : Bool;
    function isSingleLine() : Bool;
    function getRowCount() : Int;
    function getRows() : Array<Dynamic>;

    function freeze() : Range;
    function union( otherRange : Range ) : Range;
    function translate( startDelta : Point, ?endDelta : Point ) : Range;
    function traverse( delta : Point ) : Range;

    function compare( otherRange : Range ) : Int;
    function isEqual( otherRange : Range ) : Bool;
    function coversSameRows( otherRange : Range ) : Bool;
    function intersectsWith( otherRange : Range, ?exclusive : Bool ) : Bool;
    function containsRange( otherRange : Range , ?exclusive : Bool) : Bool;
    function containsPoint( point : Point , ?exclusive : Bool ) : Bool;
    function intersectsRow( row : Int ) : Bool;
    function intersectsRowRange( startRow : Int , endRow : Int ) : Bool;

    function toString() : String;
}
