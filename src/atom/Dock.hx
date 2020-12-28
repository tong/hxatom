package atom;
/**
	A container at the edges of the editor window capable of holding items.
	You should not create a Dock directly. Instead, access one of the three docks of the workspace
	via `Workspace.getLeftDock`, `Workspace.getRightDock`, and `Workspace.getBottomDock`
	or add an item to a dock via `Workspace.open`.
	
	@see https://github.com/atom/atom/blob/v1.53.0/src/dock.js#L21
**/
@:jsRequire("atom", "Dock") extern class Dock {
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
		Check if the dock is visible.
	**/
	function isVisible():Bool;
	/**
		Invoke the given callback when the visibility of the dock changes.
	**/
	function onDidChangeVisible(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current and all future visibilities of the dock.
	**/
	function observeVisible(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the dock.
	**/
	function observePaneItems(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the active pane item changes.
		
		Because observers are invoked synchronously, it's important not to perform
		any expensive operations via this method. Consider
		{::onDidStopChangingActivePaneItem} to delay operations until after changes
		stop occurring.
	**/
	function onDidChangeActivePaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the active pane item stops
		changing.
		
		Observers are called asynchronously 100ms after the last active pane item
		change. Handling changes here rather than in the synchronous
		{::onDidChangeActivePaneItem} prevents unneeded work if the user is quickly
		changing or closing tabs and ensures critical UI feedback, like changing the
		highlighted tab, gets priority over work that can be done asynchronously.
	**/
	function onDidStopChangingActivePaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current active pane item and
		with all future active pane items in the dock.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane is added to the dock.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		dock.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the dock.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		dock.
	**/
	function observePanes(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the active pane changes.
	**/
	function onDidChangeActivePane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current active pane and when
		the active pane changes.
	**/
	function observeActivePane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane item is added to the dock.
	**/
	function onDidAddPaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane item is about to be
		destroyed, before the user is prompted to save it.
	**/
	function onWillDestroyPaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane item is destroyed.
	**/
	function onDidDestroyPaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when the hovered state of the dock changes.
	**/
	function onDidChangeHovered(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Get all pane items in the dock.
	**/
	function getPaneItems():Array<Any>;
	/**
		Get the active `Pane`'s active item.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all panes in the dock.
	**/
	function getPanes():Array<Any>;
	/**
		Get the active `Pane`.
	**/
	function getActivePane():atom.Pane;
	/**
		Make the next pane active.
	**/
	function activateNextPane():Void;
	/**
		Make the previous pane active.
	**/
	function activatePreviousPane():Void;
}