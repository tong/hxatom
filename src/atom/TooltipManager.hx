package atom;

/**
	Associates tooltips with HTML elements.
**/
@:require(js, atom) @:jsRequire("atom", "TooltipManager") extern class TooltipManager {
	/**
		Add a tooltip to the given element.
	**/
	function add(target:Dynamic, options:Dynamic):Disposable;
	/**
		Find the tooltips that have been applied to the given element.
	**/
	function findTooltips(target:Dynamic):Array<Dynamic>;
}