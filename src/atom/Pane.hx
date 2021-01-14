package atom;
/**
	A container for presenting content in the center of the workspace.
	Panes can contain multiple items, one of which is *active* at a given time.
	The view corresponding to the active item is displayed in the interface. In
	the default configuration, tabs are also displayed for each item.
	
	Each pane may also contain one *pending* item. When a pending item is added
	to a pane, it will replace the currently pending item, if any, instead of
	simply being added. In the default configuration, the text in the tab for
	pending items is shown in italics.
	
	@see https://github.com/atom/atom/blob/v1.54.0/src/pane.js#L20
**/
@:jsRequire("atom", "Pane") extern class Pane {
	/**
		Invoke the given callback when the pane resizes
		
		The callback will be invoked when pane's flexScale property changes.
		Use {::getFlexScale} to get the current value.
	**/
	function onDidChangeFlexScale(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current and future values of
		{::getFlexScale}.
	**/
	function observeFlexScale(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the pane is activated.
		
		The given callback will be invoked whenever {::activate} is called on the
		pane, even if it is already active at the time.
	**/
	function onDidActivate(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback before the pane is destroyed.
	**/
	function onWillDestroy(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the pane is destroyed.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the value of the {::isActive}
		property changes.
	**/
	function onDidChangeActive(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current and future values of the
		{::isActive} property.
	**/
	function observeActive(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when an item is added to the pane.
	**/
	function onDidAddItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when an item is removed from the pane.
	**/
	function onDidRemoveItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback before an item is removed from the pane.
	**/
	function onWillRemoveItem(callback:haxe.Constraints.Function):Void;
	/**
		Invoke the given callback when an item is moved within the pane.
	**/
	function onDidMoveItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future items.
	**/
	function observeItems(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the value of {::getActiveItem}
		changes.
	**/
	function onDidChangeActiveItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when {::activateNextRecentlyUsedItem}
		has been called, either initiating or continuing a forward MRU traversal of
		pane items.
	**/
	function onChooseNextMRUItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when {::activatePreviousRecentlyUsedItem}
		has been called, either initiating or continuing a reverse MRU traversal of
		pane items.
	**/
	function onChooseLastMRUItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when {::moveActiveItemToTopOfStack}
		has been called, terminating an MRU traversal of pane items and moving the
		current active item to the top of the stack. Typically bound to a modifier
		(e.g. CTRL) key up event.
	**/
	function onDoneChoosingMRUItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current and future values of
		{::getActiveItem}.
	**/
	function observeActiveItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback before items are destroyed.
	**/
	function onWillDestroyItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Get the items in this pane.
	**/
	function getItems():Array<Any>;
	/**
		Get the active pane item in this pane.
	**/
	function getActiveItem():Dynamic;
	/**
		Return the item at the given index.
	**/
	function itemAtIndex(index:Float):Dynamic;
	/**
		Makes the next item active.
	**/
	function activateNextItem():Void;
	/**
		Makes the previous item active.
	**/
	function activatePreviousItem():Void;
	/**
		Move the active tab to the right.
	**/
	function moveItemRight():Void;
	/**
		Move the active tab to the left
	**/
	function moveItemLeft():Void;
	/**
		Get the index of the active item.
	**/
	function getActiveItemIndex():Float;
	/**
		Activate the item at the given index.
	**/
	function activateItemAtIndex(index:Float):Void;
	/**
		Make the given item *active*, causing it to be displayed by
		the pane's view.
	**/
	function activateItem(item:Dynamic, ?options:{ /**
		`Boolean` indicating that the item should be added in a pending state if it does not yet exist in the pane. Existing pending items in a pane are replaced with new pending items when they are opened.
	**/
	@:optional
	var pending : Bool; }):Void;
	/**
		Add the given item to the pane.
	**/
	function addItem(item:Dynamic, ?options:{ /**
		`Number` indicating the index at which to add the item. If omitted, the item is added after the current active item.
	**/
	@:optional
	var index : Float; /**
		`Boolean` indicating that the item should be added in a pending state. Existing pending items in a pane are replaced with new pending items when they are opened.
	**/
	@:optional
	var pending : Bool; }):Dynamic;
	/**
		Add the given items to the pane.
	**/
	function addItems(items:Array<Any>, ?index:Float):Array<Any>;
	/**
		Move the given item to the given index.
	**/
	function moveItem(item:Dynamic, index:Float):Void;
	/**
		Move the given item to the given index on another pane.
	**/
	function moveItemToPane(item:Dynamic, pane:atom.Pane, index:Float):Void;
	/**
		Destroy the active item and activate the next item.
	**/
	function destroyActiveItem():js.lib.Promise<Any>;
	/**
		Destroy the given item.
		
		If the item is active, the next item will be activated. If the item is the
		last item, the pane will be destroyed if the `core.destroyEmptyPanes` config
		setting is `true`.
	**/
	function destroyItem(item:Dynamic, ?force:Bool):js.lib.Promise<Any>;
	/**
		Destroy all items.
	**/
	function destroyItems():Void;
	/**
		Destroy all items except for the active item.
	**/
	function destroyInactiveItems():Void;
	/**
		Save the active item.
	**/
	function saveActiveItem():Void;
	/**
		Prompt the user for a location and save the active item with the
		path they select.
	**/
	function saveActiveItemAs(?nextAction:haxe.Constraints.Function):js.lib.Promise<Any>;
	/**
		Save the given item.
	**/
	function saveItem(item:Dynamic, ?nextAction:haxe.Constraints.Function):js.lib.Promise<Any>;
	/**
		Prompt the user for a location and save the active item with the
		path they select.
	**/
	function saveItemAs(item:Dynamic, ?nextAction:haxe.Constraints.Function):Void;
	/**
		Save all items.
	**/
	function saveItems():Void;
	/**
		Return the first item that matches the given URI or undefined if
		none exists.
	**/
	function itemForURI(uri:String):Void;
	/**
		Activate the first item that matches the given URI.
	**/
	function activateItemForURI(uri:String):Bool;
	/**
		Determine whether the pane is active.
	**/
	function isActive():Bool;
	/**
		Makes this pane the *active* pane, causing it to gain focus.
	**/
	function activate():Void;
	/**
		Close the pane and destroy all its items.
		
		If this is the last pane, all the items will be destroyed but the pane
		itself will not be destroyed.
	**/
	function destroy():Void;
	/**
		Determine whether this pane has been destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Create a new pane to the left of this pane.
	**/
	function splitLeft(?params:{ /**
		`Array` of items to add to the new pane.
	**/
	@:optional
	var items : Array<Any>; /**
		`Boolean` true will copy the active item into the new split pane
	**/
	@:optional
	var copyActiveItem : Bool; }):atom.Pane;
	/**
		Create a new pane to the right of this pane.
	**/
	function splitRight(?params:{ /**
		`Array` of items to add to the new pane.
	**/
	@:optional
	var items : Array<Any>; /**
		`Boolean` true will copy the active item into the new split pane
	**/
	@:optional
	var copyActiveItem : Bool; }):atom.Pane;
	/**
		Creates a new pane above the receiver.
	**/
	function splitUp(?params:{ /**
		`Array` of items to add to the new pane.
	**/
	@:optional
	var items : Array<Any>; /**
		`Boolean` true will copy the active item into the new split pane
	**/
	@:optional
	var copyActiveItem : Bool; }):atom.Pane;
	/**
		Creates a new pane below the receiver.
	**/
	function splitDown(?params:{ /**
		`Array` of items to add to the new pane.
	**/
	@:optional
	var items : Array<Any>; /**
		`Boolean` true will copy the active item into the new split pane
	**/
	@:optional
	var copyActiveItem : Bool; }):atom.Pane;
}