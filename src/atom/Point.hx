package atom;

/**
	Represents a point in a buffer in row/column coordinates.
**/
@:require(js, atom) @:jsRequire("atom", "Point") extern class Point {
	/**
		A zero-indexed {Number} representing the row of the {Point}. 
	**/
	var row : Dynamic;
	/**
		A zero-indexed {Number} representing the column of the {Point}. 
	**/
	var column : Dynamic;
	/**
		Convert any point-compatible object to a {Point}.
	**/
	static function fromObject(object:Point, copy:Dynamic):Point;
	static function min(point1:Point, point2:Point):Point;
	/**
		Construct a {Point} object
	**/
	function new(row:Float, column:Float):Void;
	function copy():Point;
	function negate():Point;
	/**
		Makes this point immutable and returns itself.
	**/
	function freeze():Point;
	/**
		Build and return a new point by adding the rows and columns of
		the given point.
	**/
	function translate(other:Point):Point;
	/**
		Build and return a new {Point} by traversing the rows and columns
		specified by the given point.
		
		This method differs from the direct, vector-style addition offered by
		{::translate}. Rather than adding the rows and columns directly, it derives
		the new point from traversing in "typewriter space". At the end of every row
		traversed, a carriage return occurs that returns the columns to 0 before
		continuing the traversal.
	**/
	function traverse(other:Point):Point;
	function compare(other:Point):Dynamic;
	function isEqual(other:Point):Bool;
	function isLessThan(other:Point):Bool;
	function isLessThanOrEqual(other:Point):Bool;
	function isGreaterThan(other:Point):Bool;
	function isGreaterThanOrEqual(other:Point):Bool;
	function toArray():Dynamic;
	function serialize():Dynamic;
	function toString():Dynamic;
}