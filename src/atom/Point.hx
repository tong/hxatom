package atom;
/**
	Represents a point in a buffer in row/column coordinates.
	
	Every public method that takes a point also accepts a *point-compatible*
	`Array`. This means a 2-element array containing `Number`s representing the
	row and column. So the following are equivalent:
	
	```coffee
	new Point(1, 2)
	[1, 2] # Point compatible Array
	```
	
	@see https://github.com/atom/text-buffer/blob/v13.15.0/src/point.coffee#L12
**/
@:jsRequire("atom", "Point") extern class Point {
	/**
		Convert any point-compatible object to a `Point`.
	**/
	static function fromObject(object:atom.Point, copy:Dynamic):atom.Point;
	/**
		
		
		
	**/
	static function min(point1:atom.Point, point2:atom.Point):atom.Point;
	/**
		A zero-indexed `Number` representing the row of the `Point`. 
	**/
	var row : atom.Point;
	/**
		A zero-indexed `Number` representing the column of the `Point`. 
	**/
	var column : atom.Point;
	/**
		Construct a `Point` object
	**/
	function new(row:Float, column:Float):Void;
	function copy():atom.Point;
	function negate():atom.Point;
	/**
		Makes this point immutable and returns itself.
	**/
	function freeze():atom.Point;
	/**
		Build and return a new point by adding the rows and columns of
		the given point.
	**/
	function translate(other:atom.Point):atom.Point;
	/**
		Build and return a new `Point` by traversing the rows and columns
		specified by the given point.
		
		This method differs from the direct, vector-style addition offered by
		{::translate}. Rather than adding the rows and columns directly, it derives
		the new point from traversing in "typewriter space". At the end of every row
		traversed, a carriage return occurs that returns the columns to 0 before
		continuing the traversal.
	**/
	function traverse(other:atom.Point):atom.Point;
	function compare(other:atom.Point):Dynamic;
	/**
		
		
		
	**/
	function isEqual(other:atom.Point):Bool;
	/**
		
		
		
	**/
	function isLessThan(other:atom.Point):Bool;
	/**
		
		
		
	**/
	function isLessThanOrEqual(other:atom.Point):Bool;
	/**
		
		
		
	**/
	function isGreaterThan(other:atom.Point):Bool;
	/**
		
		
		
	**/
	function isGreaterThanOrEqual(other:atom.Point):Bool;
	function toArray():Dynamic;
	function serialize():Dynamic;
	function toString():Dynamic;
}