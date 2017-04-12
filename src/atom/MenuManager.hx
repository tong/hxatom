package atom;

/**
	Provides a registry for menu items that you'd like to appear in the
	application menu.
**/
@:require(js, atom) @:jsRequire("atom", "MenuManager") extern class MenuManager {
	/**
		Adds the given items to the application menu.
	**/
	function add(items:Array<Dynamic>):Disposable;
	/**
		Refreshes the currently visible menu. 
	**/
	function update():Void;
}