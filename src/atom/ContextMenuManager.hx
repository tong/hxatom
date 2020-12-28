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
	
	@see https://github.com/atom/atom/blob/v1.53.0/src/context-menu-manager.coffee#L44
**/
@:jsRequire("atom", "ContextMenuManager") extern class ContextMenuManager {
	/**
		Add context menu items scoped by CSS selectors.
	**/
	function add(itemsBySelector:{ /**
		A `String` containing the menu item's label.
	**/
	@:optional
	var label : String; /**
		A `String` containing the command to invoke on the target of the right click that invoked the context menu.
	**/
	@:optional
	var command : String; /**
		A `Boolean` indicating whether the menu item should be clickable. Disabled menu items typically appear grayed out. Defaults to `true`.
	**/
	@:optional
	var enabled : Bool; /**
		An `Array` of additional items.
	**/
	@:optional
	var submenu : Array<Any>; /**
		If you want to create a separator, provide an item  with `type: 'separator'` and no other keys.
	**/
	@:optional
	var type : Dynamic; /**
		A `Boolean` indicating whether the menu item should appear in the menu. Defaults to `true`.
	**/
	@:optional
	var visible : Bool; /**
		A `Function` that is called on the item each time a context menu is created via a right click. You can assign properties to `this` to dynamically compute the command, label, etc. This method is actually called on a clone of the original item template to prevent state from leaking across context menu deployments. Called with the following argument:
	**/
	@:optional
	var created : haxe.Constraints.Function; /**
		A `Function` that is called to determine whether to display this item on a given context menu deployment. Called with the following argument:
	**/
	@:optional
	var shouldDisplay : haxe.Constraints.Function; }):atom.Disposable;
}