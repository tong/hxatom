package atom;

/**
	Represents the state of the user interface for the entire window.
	An instance of this class is available via the `atom.workspace` global.
	
	Interact with this object to open files, be notified of current and future
	editors, and manipulate panes. To add panels, use {Workspace::addTopPanel}
	and friends.
	
	## Workspace Items
	
	The term "item" refers to anything that can be displayed
	in a pane within the workspace, either in the {WorkspaceCenter} or in one
	of the three {Dock}s. The workspace expects items to conform to the
	following interface:
	
	### Required Methods
	
	#### `getTitle()`
	@see <https://github.com/atom/atom/blob/v1.22.1/src/workspace.js#L177>

**/
@:require(js, atom) @:jsRequire("atom", "Workspace") extern class Workspace {
	/**
		Invoke the given callback with all current and future text
		editors in the workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeTextEditors(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		Invoke the given callback when a text editor becomes the active
		text editor and when there is no longer an active text editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeActiveTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active pane item and
		with all future active pane items in the workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active text editor
		(if any), with all future active text editors, and when there is no longer
		an active text editor.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function observeActiveTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback whenever an item is opened. Unlike
		{::onDidAddPaneItem}, observers will be notified for items that are already
		present in the workspace when they are reopened.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidOpen(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is added to the workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the
		workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
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
		workspace.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidAddTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Opens the given URI in Atom asynchronously.
		If the URI is already open, the existing item for that URI will be
		activated. If no URI is given, or no registered opener can open
		the URI, a new empty {TextEditor} will be created.Returns a `Promise` that resolves to the {TextEditor} for the file URI.
	**/
	function open(?uri:String, ?options:Dynamic):js.Promise<Dynamic>;
	/**
		Search the workspace for items matching the given URI and hide them.Returns a {boolean} indicating whether any items were found (and hidden).
	**/
	function hide(?itemOrURI:String):Bool;
	/**
		Search the workspace for items matching the given URI. If any are found, hide them.
		Otherwise, open the URL.Returns a Promise that resolves when the item is shown or hidden.
	**/
	function toggle(?itemOrURI:String):Dynamic;
	/**
		Creates a new item that corresponds to the provided URI.
		
		If no URI is given, or no registered opener can open the URI, a new empty
		{TextEditor} will be created.Returns a `Promise` that resolves to the {TextEditor} (or other item) for the given URI.
	**/
	function createItemForURI(uri:String):js.Promise<Dynamic>;
	/**
		Returns a `Boolean` that is `true` if `object` is a `TextEditor`.
	**/
	function isTextEditor(object:Dynamic):Bool;
	/**
		Create a new text editor.Returns a {TextEditor}.
	**/
	function buildTextEditor():TextEditor;
	/**
		Asynchronously reopens the last-closed item's URI if it hasn't already been
		reopened.Returns a `Promise` that is resolved when the item is opened
	**/
	function reopenItem():js.Promise<Dynamic>;
	/**
		Register an opener for a uri.
		
		When a URI is opened via `Workspace.open`, Atom loops through its registered
		opener functions until one returns a value for the given uri.
		Openers are expected to return an object that inherits from HTMLElement or
		a model which has an associated view in the {ViewRegistry}.
		A {TextEditor} will be used if no opener returns a value.Returns a `Disposable` on which `.dispose()` can be called to remove the
		opener.
		
		Note that the opener will be called if and only if the URI is not already open
		in the current pane. The searchAllPanes flag expands the search from the
		current pane to all panes. If you wish to open a view of a different type for
		a file that is already open, consider changing the protocol of the URI. For
		example, perhaps you wish to preview a rendered version of the file `/foo/bar/baz.quux`
		that is already open in a text editor view. You could signal this by calling
		`Workspace.open` on the URI `quux-preview://foo/bar/baz.quux`. Then your opener
		can check the protocol for quux-preview and only handle those URIs that match.
	**/
	function addOpener(opener:haxe.Constraints.Function):Disposable;
	/**
		Get all pane items in the workspace.Returns an `Array` of items.
	**/
	function getPaneItems():Array<Dynamic>;
	/**
		Get the active `Pane`'s active item.Returns an pane item `Object`.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all text editors in the workspace.Returns an `Array` of {TextEditor}s.
	**/
	function getTextEditors():Array<Dynamic>;
	/**
		Get the workspace center's active item if it is a {TextEditor}.Returns a {TextEditor} or `` if the workspace center's current
		active item is not a {TextEditor}.
	**/
	function getActiveTextEditor():TextEditor;
	/**
		Get the most recently focused pane container.Returns a `Dock` or the {WorkspaceCenter}.
	**/
	function getActivePaneContainer():Dock;
	/**
		Get all panes in the workspace.Returns an `Array` of `Pane`s.
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
	/**
		Get the first pane container that contains an item with the given
		URI.Returns a `Dock`, the {WorkspaceCenter}, or `` if no item exists
		with the given URI.
	**/
	function paneContainerForURI(uri:String):Dock;
	/**
		Get the first pane container that contains the given item.Returns a `Dock`, the {WorkspaceCenter}, or `` if no item exists
		with the given URI.
	**/
	function paneContainerForItem(item:Dynamic):Dock;
	/**
		Get the first `Pane` that contains an item with the given URI.Returns a `Pane` or `` if no item exists with the given URI.
	**/
	function paneForURI(uri:String):Pane;
	/**
		Get the `Pane` containing the given item.Returns a `Pane` or `` if no pane exists for the given item.
	**/
	function paneForItem(item:Dynamic):Pane;
	/**
		Get the {WorkspaceCenter} at the center of the editor window.
	**/
	function getCenter():Void;
	/**
		Get the `Dock` to the left of the editor window.
	**/
	function getLeftDock():Void;
	/**
		Get the `Dock` to the right of the editor window.
	**/
	function getRightDock():Void;
	/**
		Get the `Dock` below the editor window.
	**/
	function getBottomDock():Void;
	/**
		Get an `Array` of all the panel items at the bottom of the editor window.
	**/
	function getBottomPanels():Void;
	/**
		Adds a panel item to the bottom of the editor window.Returns a `Panel`
	**/
	function addBottomPanel(options:Dynamic):Panel;
	/**
		Get an `Array` of all the panel items to the left of the editor window.
	**/
	function getLeftPanels():Void;
	/**
		Adds a panel item to the left of the editor window.Returns a `Panel`
	**/
	function addLeftPanel(options:Dynamic):Panel;
	/**
		Get an `Array` of all the panel items to the right of the editor window.
	**/
	function getRightPanels():Void;
	/**
		Adds a panel item to the right of the editor window.Returns a `Panel`
	**/
	function addRightPanel(options:Dynamic):Panel;
	/**
		Get an `Array` of all the panel items at the top of the editor window.
	**/
	function getTopPanels():Void;
	/**
		Adds a panel item to the top of the editor window above the tabs.Returns a `Panel`
	**/
	function addTopPanel(options:Dynamic):Panel;
	/**
		Get an `Array` of all the panel items in the header.
	**/
	function getHeaderPanels():Void;
	/**
		Adds a panel item to the header.Returns a `Panel`
	**/
	function addHeaderPanel(options:Dynamic):Panel;
	/**
		Get an `Array` of all the panel items in the footer.
	**/
	function getFooterPanels():Void;
	/**
		Adds a panel item to the footer.Returns a `Panel`
	**/
	function addFooterPanel(options:Dynamic):Panel;
	/**
		Get an `Array` of all the modal panel items
	**/
	function getModalPanels():Void;
	/**
		Adds a panel item as a modal dialog.Returns a `Panel`
	**/
	function addModalPanel(options:Dynamic):Panel;
	/**
		Returns the `Panel` associated with the given item.
	**/
	function panelForItem(item:Dynamic):Panel;
	/**
		Performs a search across all files in the workspace.Returns a `Promise` with a `cancel()` method that will cancel all
		of the underlying searches that were started as part of this scan.
	**/
	function scan(regex:EReg, ?options:Dynamic, iterator:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Performs a replace across all the specified files in the project.Returns a `Promise`.
	**/
	function replace(regex:EReg, replacementText:String, filePaths:Array<Dynamic>, iterator:haxe.Constraints.Function):js.Promise<Dynamic>;
}