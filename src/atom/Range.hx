package atom;

/**
	Represents a region in a buffer in row/column coordinates.
	
	Every public method that takes a range also accepts a *range-compatible*
	{Array}. This means a 2-element array containing {Point}s or point-compatible
	arrays. So the following are equivalent:
	@see <https://github.com/atom/text-buffer/blob/v13.5.10/src/range.coffee#L18>

**/
@:require(js, atom) @:jsRequire("atom", "Range") extern class Range {
	/**
		A `Point` representing the start of the `Range`. 
	**/
	var start : Point;
	/**
		A `Point` representing the end of the `Range`. 
	**/
	var end : Point;
	/**
		Convert any range-compatible object to a `Range`.Returns: A `Range` based on the given object.
	**/
	static function fromObject(object:Range, copy:Dynamic):Range;
	/**
		Call this with the result of `Range.serialize` to construct a new Range.
	**/
	static function deserialize(array:Array<Dynamic>):Void;
	/**
		Construct a `Range` object
	**/
	function new(pointA:Point, pointB:Point):Void;
	/**
		Returns a new range with the same start and end positions.
	**/
	function copy():Dynamic;
	/**
		Returns a new range with the start and end positions negated.
	**/
	function negate():Dynamic;
	/**
		Returns a plain javascript object representation of the range.
	**/
	function serialize():Dynamic;
	/**
		Is the start position of this range equal to the end position?Returns a `Boolean`.
	**/
	function isEmpty():Bool;
	/**
		Returns a `Boolean` indicating whether this range starts and ends on
		the same row.
	**/
	function isSingleLine():Bool;
	/**
		Get the number of rows in this range.Returns a `Number`.
	**/
	function getRowCount():Float;
	/**
		Returns an array of all rows in the range.
	**/
	function getRows():Dynamic;
	/**
		Freezes the range and its start and end point so it becomes
		immutable and returns itself.Returns an immutable version of this `Range`
	**/
	function freeze():Range;
	/**
		Returns a new range that contains this range and the given range.
	**/
	function union(otherRange:Range):Dynamic;
	/**
		Build and return a new range by translating this range's start and
		end points by the given delta(s).Returns a `Range`.
	**/
	function translate(startDelta:Point, ?endDelta:Point):Range;
	/**
		Build and return a new range by traversing this range's start and
		end points by the given delta.
		
		See `Point.traverse` for details of how traversal differs from translation.Returns a `Range`.
	**/
	function traverse(delta:Point):Range;
	/**
		Compare two RangesReturns `-1` if this range starts before the argument or contains it.
	**/
	function compare(otherRange:Range):Dynamic;
	/**
		Returns a `Boolean` indicating whether this range has the same start
		and end points as the given `Range` or range-compatible `Array`.
	**/
	function isEqual(otherRange:Range):Bool;
	/**
		Returns a `Boolean` indicating whether this range starts and ends on
		the same row as the argument.
	**/
	function coversSameRows(otherRange:Range):Bool;
	/**
		Determines whether this range intersects with the argument.Returns a `Boolean`.
	**/
	function intersectsWith(otherRange:Range, ?exclusive:Bool):Bool;
	/**
		Returns a `Boolean` indicating whether this range contains the given
		range.
	**/
	function containsRange(otherRange:Range, exclusive:Dynamic):Bool;
	/**
		Returns a `Boolean` indicating whether this range contains the given
		point.
	**/
	function containsPoint(point:Point, exclusive:Dynamic):Bool;
	/**
		Returns a `Boolean` indicating whether this range intersects the
		given row `Number`.
	**/
	function intersectsRow(row:Float):Bool;
	/**
		Returns a `Boolean` indicating whether this range intersects the
		row range indicated by the given startRow and endRow `Number`s.
	**/
	function intersectsRowRange(startRow:Float, endRow:Float):Bool;
	/**
		Returns a string representation of the range.
	**/
	function toString():Dynamic;
}