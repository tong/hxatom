package atom;

/**
	Provides a registry for commands that you'd like to appear in the
	context menu.
**/
@:require(js, atom) @:jsRequire("atom", "ContextMenuManager") extern class ContextMenuManager {
	/**
		Add context menu items scoped by CSS selectors.
	**/
	function add(itemsBySelector:Dynamic):Disposable;
}