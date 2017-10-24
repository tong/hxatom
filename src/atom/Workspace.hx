package atom;

/**
	Represents the state of the user interface for the entire window.
	An instance of this class is available via the `atom.workspace` global.
**/
@:require(js, atom) @:jsRequire("atom", "Workspace") extern class Workspace {
	/**
		Invoke the given callback with all current and future text
		editors in the workspace.
	**/
	function observeTextEditors(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the workspace.
	**/
	function observePaneItems(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the active pane item changes.
		
		Because observers are invoked synchronously, it's important not to perform
		any expensive operations via this method. Consider
		{::onDidStopChangingActivePaneItem} to delay operations until after changes
		stop occurring.
	**/
	function onDidChangeActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the active pane item stops
		changing.
		
		Observers are called asynchronously 100ms after the last active pane item
		change. Handling changes here rather than in the synchronous
		{::onDidChangeActivePaneItem} prevents unneeded work if the user is quickly
		changing or closing tabs and ensures critical UI feedback, like changing the
		highlighted tab, gets priority over work that can be done asynchronously.
	**/
	function onDidStopChangingActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a text editor becomes the active
		text editor and when there is no longer an active text editor.
	**/
	function onDidChangeActiveTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active pane item and
		with all future active pane items in the workspace.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active text editor
		(if any), with all future active text editors, and when there is no longer
		an active text editor.
	**/
	function observeActiveTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback whenever an item is opened. Unlike
		{::onDidAddPaneItem}, observers will be notified for items that are already
		present in the workspace when they are reopened.
	**/
	function onDidOpen(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is added to the workspace.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		workspace.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the
		workspace.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		workspace.
	**/
	function observePanes(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when the active pane changes.
	**/
	function onDidChangeActivePane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback with the current active pane and when
		the active pane changes.
	**/
	function observeActivePane(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane item is added to the
		workspace.
	**/
	function onDidAddPaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane item is about to be
		destroyed, before the user is prompted to save it.
	**/
	function onWillDestroyPaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a pane item is destroyed.
	**/
	function onDidDestroyPaneItem(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a text editor is added to the
		workspace.
	**/
	function onDidAddTextEditor(callback:haxe.Constraints.Function):Disposable;
	/**
		Opens the given URI in Atom asynchronously.
		If the URI is already open, the existing item for that URI will be
		activated. If no URI is given, or no registered opener can open
		the URI, a new empty {TextEditor} will be created.
	**/
	function open(?uri:String, ?options:Dynamic):js.Promise<Dynamic>;
	/**
		Search the workspace for items matching the given URI and hide them.
	**/
	function hide(?itemOrURI:String):Bool;
	/**
		Search the workspace for items matching the given URI. If any are found, hide them.
		Otherwise, open the URL.
	**/
	function toggle(?itemOrURI:String):Dynamic;
	/**
		Creates a new item that corresponds to the provided URI.
		
		If no URI is given, or no registered opener can open the URI, a new empty
		{TextEditor} will be created.
	**/
	function createItemForURI(uri:String):js.Promise<Dynamic>;
	/**
		Returns a {Boolean} that is `true` if `object` is a `TextEditor`.
	**/
	function isTextEditor(object:Dynamic):Bool;
	/**
		Create a new text editor.
	**/
	function buildTextEditor():TextEditor;
	/**
		Asynchronously reopens the last-closed item's URI if it hasn't already been
		reopened.
	**/
	function reopenItem():js.Promise<Dynamic>;
	/**
		Register an opener for a uri.
		
		When a URI is opened via {Workspace::open}, Atom loops through its registered
		opener functions until one returns a value for the given uri.
		Openers are expected to return an object that inherits from HTMLElement or
		a model which has an associated view in the {ViewRegistry}.
		A {TextEditor} will be used if no opener returns a value.
	**/
	function addOpener(opener:haxe.Constraints.Function):Disposable;
	/**
		Get all pane items in the workspace.
	**/
	function getPaneItems():Array<Dynamic>;
	/**
		Get the active {Pane}'s active item.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all text editors in the workspace.
	**/
	function getTextEditors():Array<Dynamic>;
	/**
		Get the workspace center's active item if it is a {TextEditor}.
	**/
	function getActiveTextEditor():TextEditor;
	/**
		Get the most recently focused pane container.
	**/
	function getActivePaneContainer():Dock;
	/**
		Get all panes in the workspace.
	**/
	function getPanes():Array<Dynamic>;
	/**
		Get the active {Pane}.
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
		URI.
	**/
	function paneContainerForURI(uri:String):Dock;
	/**
		Get the first pane container that contains the given item.
	**/
	function paneContainerForItem(item:Dynamic):Dock;
	/**
		Get the first {Pane} that contains an item with the given URI.
	**/
	function paneForURI(uri:String):Pane;
	/**
		Get the {Pane} containing the given item.
	**/
	function paneForItem(item:Dynamic):Pane;
	/**
		Get the {WorkspaceCenter} at the center of the editor window.
	**/
	function getCenter():Void;
	/**
		Get the {Dock} to the left of the editor window.
	**/
	function getLeftDock():Void;
	/**
		Get the {Dock} to the right of the editor window.
	**/
	function getRightDock():Void;
	/**
		Get the {Dock} below the editor window.
	**/
	function getBottomDock():Void;
	/**
		Get an {Array} of all the panel items at the bottom of the editor window.
	**/
	function getBottomPanels():Void;
	/**
		Adds a panel item to the bottom of the editor window.
	**/
	function addBottomPanel(options:Dynamic):Panel;
	/**
		Get an {Array} of all the panel items to the left of the editor window.
	**/
	function getLeftPanels():Void;
	/**
		Adds a panel item to the left of the editor window.
	**/
	function addLeftPanel(options:Dynamic):Panel;
	/**
		Get an {Array} of all the panel items to the right of the editor window.
	**/
	function getRightPanels():Void;
	/**
		Adds a panel item to the right of the editor window.
	**/
	function addRightPanel(options:Dynamic):Panel;
	/**
		Get an {Array} of all the panel items at the top of the editor window.
	**/
	function getTopPanels():Void;
	/**
		Adds a panel item to the top of the editor window above the tabs.
	**/
	function addTopPanel(options:Dynamic):Panel;
	/**
		Get an {Array} of all the panel items in the header.
	**/
	function getHeaderPanels():Void;
	/**
		Adds a panel item to the header.
	**/
	function addHeaderPanel(options:Dynamic):Panel;
	/**
		Get an {Array} of all the panel items in the footer.
	**/
	function getFooterPanels():Void;
	/**
		Adds a panel item to the footer.
	**/
	function addFooterPanel(options:Dynamic):Panel;
	/**
		Get an {Array} of all the modal panel items
	**/
	function getModalPanels():Void;
	/**
		Adds a panel item as a modal dialog.
	**/
	function addModalPanel(options:Dynamic):Panel;
	/**
		Returns the {Panel} associated with the given item.
	**/
	function panelForItem(item:Dynamic):Panel;
	/**
		Performs a search across all files in the workspace.
	**/
	function scan(regex:EReg, ?options:Dynamic, iterator:haxe.Constraints.Function):js.Promise<Dynamic>;
	/**
		Performs a replace across all the specified files in the project.
	**/
	function replace(regex:EReg, replacementText:String, filePaths:Array<Dynamic>, iterator:haxe.Constraints.Function):js.Promise<Dynamic>;
}