package atom;
/**
	Associates tooltips with HTML elements.
	
	You can get the `TooltipManager` via `atom.tooltips`.
	
	@see https://github.com/atom/atom/blob/v1.33.1/src/tooltip-manager.js#L48
**/
@:jsRequire("atom", "TooltipManager") extern class TooltipManager {
	/**
		Add a tooltip to the given element.
	**/
	function add(target:Dynamic, options:Dynamic):atom.Disposable;
	/**
		Find the tooltips that have been applied to the given element.
	**/
	function findTooltips(target:Dynamic):Array<Any>;
}