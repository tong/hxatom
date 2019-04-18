package atom;
/**
	Represents the workspace at the center of the entire window.
	
	@see https://github.com/atom/atom/blob/v1.36.0/src/workspace-center.js#L7
**/
@:jsRequire("atom", "WorkspaceCenter") extern class WorkspaceCenter {
	/**
		Invoke the given callback with all current and future text
		editors in the workspace center.
	**/
	function observeTextEditors(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the workspace center.
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
		with all future active pane items in the workspace center.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane is added to the workspace
		center.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		workspace center.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the
		workspace center.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		workspace center.
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
		Invoke the given callback when a pane item is added to the
		workspace center.
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
		Invoke the given callback when a text editor is added to the
		workspace center.
	**/
	function onDidAddTextEditor(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Get all pane items in the workspace center.
	**/
	function getPaneItems():Array<Any>;
	/**
		Get the active `Pane`'s active item.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all text editors in the workspace center.
	**/
	function getTextEditors():Array<Any>;
	/**
		Get the active item if it is an {TextEditor}.
	**/
	function getActiveTextEditor():atom.TextEditor;
	/**
		Get all panes in the workspace center.
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