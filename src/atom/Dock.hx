package atom;

/**
	A container at the edges of the editor window capable of holding items.
	You should not create a Dock directly. Instead, access one of the three docks of the workspace
	via {Workspace::getLeftDock}, {Workspace::getRightDock}, and {Workspace::getBottomDock}
	or add an item to a dock via {Workspace::open}.
	@see <https://github.com/atom/atom/blob/v1.28.2/src/dock.js#L21>

**/
@:require(js, atom) @:jsRequire("atom", "Dock") extern class Dock {
	/**
		Show the dock and focus its active `Pane`.
	**/
	function activate():Void;
	/**
		Show the dock without focusing it.
	**/
	function show():Void;
	/**
		Hide the dock and activate the {WorkspaceCenter} if the dock was
		was previously focused.
	**/
	function hide():Void;
	/**
		Toggle the dock's visibility without changing the `Workspace`'s
		active pane container.
	**/
	function toggle():Void;
	/**
		Check if the dock is visible.Returns a `Boolean`.
	**/
	function isVisible():Bool;
	/**
		Invoke the given callback when the visibility of the dock changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current and all future visibilities of the dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeVisible(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observePaneItems(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the active pane item changes.
		
		Because observers are invoked synchronously, it's important not to perform
		any expensive operations via this method. Consider
		{::onDidStopChangingActivePaneItem} to delay operations until after changes
		stop occurring.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the active pane item stops
		changing.
		
		Observers are called asynchronously 100ms after the last active pane item
		change. Handling changes here rather than in the synchronous
		{::onDidChangeActivePaneItem} prevents unneeded work if the user is quickly
		changing or closing tabs and ensures critical UI feedback, like changing the
		highlighted tab, gets priority over work that can be done asynchronously.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidStopChangingActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active pane item and
		with all future active pane items in the dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is added to the dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observePanes(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the active pane changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeActivePane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active pane and when
		the active pane changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActivePane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane item is added to the dock.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddPaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane item is about to be
		destroyed, before the user is prompted to save it.Returns a `Disposable` on which `.dispose` can be called to unsubscribe.
	**/
	function onWillDestroyPaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane item is destroyed.Returns a `Disposable` on which `.dispose` can be called to unsubscribe.
	**/
	function onDidDestroyPaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the hovered state of the dock changes.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeHovered(callback:haxe.Constraints.Function):Disposable;
	/**
		Get all pane items in the dock.Returns an `Array` of items.
	**/
	function getPaneItems():Array<Dynamic>;
	/**
		Get the active `Pane`'s active item.Returns an pane item `Object`.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all panes in the dock.Returns an `Array` of `Pane`s.
	**/
	function getPanes():Array<Dynamic>;
	/**
		Get the active `Pane`.Returns a `Pane`.
	**/
	function getActivePane():Pane;
	/**
		Make the next pane active.
	**/
	function activateNextPane():Void;
	/**
		Make the previous pane active.
	**/
	function activatePreviousPane():Void;
}