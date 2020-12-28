package atom;
/**
	Provides a registry for menu items that you'd like to appear in the
	application menu.
	
	An instance of this class is always available as the `atom.menu` global.
	
	## Menu CSON Format
	
	Here is an example from the [tree-view](https://github.com/atom/tree-view/blob/master/menus/tree-view.cson):
	
	```coffee
	[
	  {
	    'label': 'View'
	    'submenu': [
	      { 'label': 'Toggle Tree View', 'command': 'tree-view:toggle' }
	    ]
	  }
	  {
	    'label': 'Packages'
	    'submenu': [
	      'label': 'Tree View'
	      'submenu': [
	        { 'label': 'Focus', 'command': 'tree-view:toggle-focus' }
	        { 'label': 'Toggle', 'command': 'tree-view:toggle' }
	        { 'label': 'Reveal Active File', 'command': 'tree-view:reveal-active-file' }
	        { 'label': 'Toggle Tree Side', 'command': 'tree-view:toggle-side' }
	      ]
	    ]
	  }
	]
	```
	
	Use in your package's menu `.cson` file requires that you place your menu
	structure under a `menu` key.
	
	```coffee
	'menu': [
	  {
	    'label': 'View'
	    'submenu': [
	      { 'label': 'Toggle Tree View', 'command': 'tree-view:toggle' }
	    ]
	  }
	]
	```
	
	See {::add} for more info about adding menu's directly. 
	
	@see https://github.com/atom/atom/blob/v1.53.0/src/menu-manager.coffee#L61
**/
@:jsRequire("atom", "MenuManager") extern class MenuManager {
	/**
		Adds the given items to the application menu.
	**/
	function add(items:Array<Any>):atom.Disposable;
	/**
		Refreshes the currently visible menu. 
	**/
	function update():Void;
}