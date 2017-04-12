package atom;

/**
	Represents a region in a buffer in row/column coordinates.
**/
@:require(js, atom) @:jsRequire("atom", "Range") extern class Range {
	/**
		A {Point} representing the start of the {Range}. 
	**/
	var start : Dynamic;
	/**
		A {Point} representing the end of the {Range}. 
	**/
	var end : Dynamic;
	/**
		Convert any range-compatible object to a {Range}.
	**/
	static function fromObject(object:Range, copy:Dynamic):Range;
	/**
		Call this with the result of {Range::serialize} to construct a new Range.
	**/
	static function deserialize(array:Array<Dynamic>):Void;
	/**
		Construct a {Range} object
	**/
	function new(pointA:Point, pointB:Point):Void;
	function copy():Dynamic;
	function negate():Dynamic;
	function serialize():Dynamic;
	/**
		Is the start position of this range equal to the end position?
	**/
	function isEmpty():Bool;
	function isSingleLine():Bool;
	/**
		Get the number of rows in this range.
	**/
	function getRowCount():Float;
	function getRows():Dynamic;
	/**
		Freezes the range and its start and end point so it becomes
		immutable and returns itself.
	**/
	function freeze():Range;
	function union(otherRange:Range):Dynamic;
	/**
		Build and return a new range by translating this range's start and
		end points by the given delta(s).
	**/
	function translate(startDelta:Point, ?endDelta:Point):Range;
	/**
		Build and return a new range by traversing this range's start and
		end points by the given delta.
		
		See {Point::traverse} for details of how traversal differs from translation.
	**/
	function traverse(delta:Point):Range;
	/**
		Compare two Ranges
	**/
	function compare(otherRange:Range):Dynamic;
	function isEqual(otherRange:Range):Bool;
	function coversSameRows(otherRange:Range):Bool;
	/**
		Determines whether this range intersects with the argument.
	**/
	function intersectsWith(otherRange:Range, ?exclusive:Bool):Bool;
	function containsRange(otherRange:Range, exclusive:Dynamic):Bool;
	function containsPoint(point:Point, exclusive:Dynamic):Bool;
	function intersectsRow(row:Float):Bool;
	function intersectsRowRange(startRow:Float, endRow:Float):Bool;
	function toString():Dynamic;
}