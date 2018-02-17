package atom;

/**
	Provides a registry for commands that you'd like to appear in the
	context menu.
	
	An instance of this class is always available as the `atom.contextMenu`
	global.
	
	## Context Menu CSON Format
	
	```coffee
	'atom-workspace': [{label: 'Help', command: 'application:open-documentation'}]
	'atom-text-editor': [{
	  label: 'History',
	  submenu: [
	    {label: 'Undo', command:'core:undo'}
	    {label: 'Redo', command:'core:redo'}
	  ]
	}]
	```
	
	In your package's menu `.cson` file you need to specify it under a
	`context-menu` key:
	
	```coffee
	'context-menu':
	  'atom-workspace': [{label: 'Help', command: 'application:open-documentation'}]
	  ...
	```
	
	The format for use in {::add} is the same minus the `context-menu` key. See
	{::add} for more information. 
	@see <https://github.com/atom/atom/blob/v1.24.0/src/context-menu-manager.coffee#L42>

**/
@:require(js, atom) @:jsRequire("atom", "ContextMenuManager") extern class ContextMenuManager {
	/**
		Add context menu items scoped by CSS selectors.Returns a `Disposable` on which `.dispose()` can be called to remove the
		added menu items.
	**/
	function add(itemsBySelector:Dynamic):Disposable;
}