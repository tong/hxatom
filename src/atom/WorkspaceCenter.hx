package atom;

/**
	Represents the workspace at the center of the entire window.
	@see <https://github.com/atom/atom/blob/v1.24.0/src/workspace-center.js#L7>

**/
@:require(js, atom) @:jsRequire("atom", "WorkspaceCenter") extern class WorkspaceCenter {
	/**
		Invoke the given callback with all current and future text
		editors in the workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeTextEditors(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		with all future active pane items in the workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is added to the workspace
		center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the
		workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		Invoke the given callback when a pane item is added to the
		workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		Invoke the given callback when a text editor is added to the
		workspace center.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Get all pane items in the workspace center.Returns an `Array` of items.
	**/
	function getPaneItems():Array<Dynamic>;
	/**
		Get the active `Pane`'s active item.Returns an pane item `Object`.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all text editors in the workspace center.Returns an `Array` of {TextEditor}s.
	**/
	function getTextEditors():Array<Dynamic>;
	/**
		Get the active item if it is an {TextEditor}.Returns an {TextEditor} or `` if the current active item is not an
		{TextEditor}.
	**/
	function getActiveTextEditor():TextEditor;
	/**
		Get all panes in the workspace center.Returns an `Array` of `Pane`s.
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