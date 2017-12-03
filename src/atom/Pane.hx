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
	@see <https://github.com/atom/atom/blob/v1.22.1/src/pane.js#L21>

**/
@:require(js, atom) @:jsRequire("atom", "Pane") extern class Pane {
	/**
		Invoke the given callback when the pane resizes
		
		The callback will be invoked when pane's flexScale property changes.
		Use {::getFlexScale} to get the current value.Returns a `Disposable` on which '.dispose()' can be called to unsubscribe.
	**/
	function onDidChangeFlexScale(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current and future values of
		{::getFlexScale}.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeFlexScale(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the pane is activated.
		
		The given callback will be invoked whenever {::activate} is called on the
		pane, even if it is already active at the time.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidActivate(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before the pane is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the pane is destroyed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroy(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the value of the {::isActive}
		property changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeActive(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current and future values of the
		{::isActive} property.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActive(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when an item is added to the pane.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when an item is removed from the pane.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidRemoveItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before an item is removed from the pane.
	**/
	function onWillRemoveItem(callback:haxe.Constraints.Function):Void;
	/**
		Invoke the given callback when an item is moved within the pane.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidMoveItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future items.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeItems(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the value of {::getActiveItem}
		changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeActiveItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when {::activateNextRecentlyUsedItem}
		has been called, either initiating or continuing a forward MRU traversal of
		pane items.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onChooseNextMRUItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when {::activatePreviousRecentlyUsedItem}
		has been called, either initiating or continuing a reverse MRU traversal of
		pane items.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onChooseLastMRUItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when {::moveActiveItemToTopOfStack}
		has been called, terminating an MRU traversal of pane items and moving the
		current active item to the top of the stack. Typically bound to a modifier
		(e.g. CTRL) key up event.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDoneChoosingMRUItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current and future values of
		{::getActiveItem}.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActiveItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before items are destroyed.Returns a `Disposable` on which `.dispose()` can be called to
		unsubscribe.
	**/
	function onWillDestroyItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Get the items in this pane.Returns an `Array` of items.
	**/
	function getItems():Array<Dynamic>;
	/**
		Get the active pane item in this pane.Returns a pane item.
	**/
	function getActiveItem():Dynamic;
	/**
		Return the item at the given index.Returns an item or `null` if no item exists at the given index.
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
		Get the index of the active item.Returns a `Number`.
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
	function activateItem(item:Dynamic, ?options:Dynamic):Void;
	/**
		Add the given item to the pane.Returns the added item.
	**/
	function addItem(item:Dynamic, ?options:Dynamic):Dynamic;
	/**
		Add the given items to the pane.Returns an `Array` of added items.
	**/
	function addItems(items:Array<Dynamic>, ?index:Float):Array<Dynamic>;
	/**
		Move the given item to the given index.
	**/
	function moveItem(item:Dynamic, index:Float):Void;
	/**
		Move the given item to the given index on another pane.
	**/
	function moveItemToPane(item:Dynamic, pane:Pane, index:Float):Void;
	/**
		Destroy the active item and activate the next item.Returns a `Promise` that resolves when the item is destroyed.
	**/
	function destroyActiveItem():js.Promise<Dynamic>;
	/**
		Destroy the given item.
		
		If the item is active, the next item will be activated. If the item is the
		last item, the pane will be destroyed if the `core.destroyEmptyPanes` config
		setting is `true`.Returns a `Promise` that resolves with a `Boolean` indicating whether or not
		the item was destroyed.
	**/
	function destroyItem(item:Dynamic, ?force:Bool):js.Promise<Dynamic>;
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
		path they select.Returns a `Promise` that resolves when the save is complete
	**/
	function saveActiveItemAs(?nextAction:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Save the given item.Returns a `Promise` that resolves when the save is complete
	**/
	function saveItem(item:Dynamic, ?nextAction:haxe.Constraints.Function):js.Promise<Dynamic>;
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
		Activate the first item that matches the given URI.Returns a `Boolean` indicating whether an item matching the URI was found.
	**/
	function activateItemForURI(uri:String):Bool;
	/**
		Determine whether the pane is active.Returns a `Boolean`.
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
		Determine whether this pane has been destroyed.Returns a `Boolean`.
	**/
	function isDestroyed():Bool;
	/**
		Create a new pane to the left of this pane.Returns the new `Pane`.
	**/
	function splitLeft(?params:Dynamic):Pane;
	/**
		Create a new pane to the right of this pane.Returns the new `Pane`.
	**/
	function splitRight(?params:Dynamic):Pane;
	/**
		Creates a new pane above the receiver.Returns the new `Pane`.
	**/
	function splitUp(?params:Dynamic):Pane;
	/**
		Creates a new pane below the receiver.Returns the new `Pane`.
	**/
	function splitDown(?params:Dynamic):Pane;
}