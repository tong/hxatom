package atom;

/**
	Associates tooltips with HTML elements.
	
	You can get the `TooltipManager` via `atom.tooltips`.
	@see <https://github.com/atom/atom/blob/v1.27.2/src/tooltip-manager.js#L48>

**/
@:require(js, atom) @:jsRequire("atom", "TooltipManager") extern class TooltipManager {
	/**
		Add a tooltip to the given element.Returns a `Disposable` on which `.dispose()` can be called to remove the
		tooltip.
	**/
	function add(target:Dynamic, options:Dynamic):Disposable;
	/**
		Find the tooltips that have been applied to the given element.Returns an `Array` of `Tooltip` objects that match the `target`.
	**/
	function findTooltips(target:Dynamic):Array<Dynamic>;
}