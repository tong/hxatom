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
	/**
		Returns the given {Point} that is earlier in the buffer.
	**/
	static function min(point1:Point, point2:Point):Point;
	/**
		Construct a {Point} object
	**/
	function new(row:Float, column:Float):Void;
	/**
		Returns a new {Point} with the same row and column.
	**/
	function copy():Point;
	/**
		Returns a new {Point} with the row and column negated.
	**/
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
	/**
		Returns `-1` if this point precedes the argument.
	**/
	function compare(other:Point):Dynamic;
	/**
		Returns a {Boolean} indicating whether this point has the same row
		and column as the given {Point} or point-compatible {Array}.
	**/
	function isEqual(other:Point):Bool;
	/**
		Returns a {Boolean} indicating whether this point precedes the given
		{Point} or point-compatible {Array}.
	**/
	function isLessThan(other:Point):Bool;
	/**
		Returns a {Boolean} indicating whether this point precedes or is
		equal to the given {Point} or point-compatible {Array}.
	**/
	function isLessThanOrEqual(other:Point):Bool;
	/**
		Returns a {Boolean} indicating whether this point follows the given
		{Point} or point-compatible {Array}.
	**/
	function isGreaterThan(other:Point):Bool;
	/**
		Returns a {Boolean} indicating whether this point follows or is
		equal to the given {Point} or point-compatible {Array}.
	**/
	function isGreaterThanOrEqual(other:Point):Bool;
	/**
		Returns an array of this point's row and column.
	**/
	function toArray():Dynamic;
	/**
		Returns an array of this point's row and column.
	**/
	function serialize():Dynamic;
	/**
		Returns a string representation of the point.
	**/
	function toString():Dynamic;
}