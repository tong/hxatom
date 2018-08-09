package atom;
/**
	Represents the state of the user interface for the entire window.
	An instance of this class is available via the `atom.workspace` global.
	
	Interact with this object to open files, be notified of current and future
	editors, and manipulate panes. To add panels, use `Workspace.addTopPanel`
	and friends.
	
	## Workspace Items
	
	The term "item" refers to anything that can be displayed
	in a pane within the workspace, either in the {WorkspaceCenter} or in one
	of the three `Dock`s. The workspace expects items to conform to the
	following interface:
	
	### Required Methods
	
	#### `getTitle()`
	
	@see https://github.com/atom/atom/blob/v1.29.0/src/workspace.js#L175
**/
@:jsRequire("atom", "Workspace") extern class Workspace {
	/**
		Invoke the given callback with all current and future text
		editors in the workspace.
	**/
	function observeTextEditors(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future panes items
		in the workspace.
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
		Invoke the given callback when a text editor becomes the active
		text editor and when there is no longer an active text editor.
	**/
	function onDidChangeActiveTextEditor(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current active pane item and
		with all future active pane items in the workspace.
	**/
	function observeActivePaneItem(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with the current active text editor
		(if any), with all future active text editors, and when there is no longer
		an active text editor.
	**/
	function observeActiveTextEditor(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback whenever an item is opened. Unlike
		{::onDidAddPaneItem}, observers will be notified for items that are already
		present in the workspace when they are reopened.
	**/
	function onDidOpen(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane is added to the workspace.
	**/
	function onDidAddPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback before a pane is destroyed in the
		workspace.
	**/
	function onWillDestroyPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a pane is destroyed in the
		workspace.
	**/
	function onDidDestroyPane(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback with all current and future panes in the
		workspace.
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
		workspace.
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
		workspace.
	**/
	function onDidAddTextEditor(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Opens the given URI in Atom asynchronously.
		If the URI is already open, the existing item for that URI will be
		activated. If no URI is given, or no registered opener can open
		the URI, a new empty {TextEditor} will be created.
	**/
	function open(?uri:String, ?options:{ /**
		A `Number` indicating which row to move the cursor to initially. Defaults to `0`.
	**/
	var initialLine : Float; /**
		A `Number` indicating which column to move the cursor to initially. Defaults to `0`.
	**/
	var initialColumn : Float; /**
		Either 'left', 'right', 'up' or 'down'. If 'left', the item will be opened in leftmost pane of the current active pane's row. If 'right', the item will be opened in the rightmost pane of the current active pane's row. If only one pane exists in the row, a new pane will be created. If 'up', the item will be opened in topmost pane of the current active pane's column. If 'down', the item will be opened in the bottommost pane of the current active pane's column. If only one pane exists in the column, a new pane will be created.
	**/
	var split : Dynamic; /**
		A `Boolean` indicating whether to call `Pane.activate` on containing pane. Defaults to `true`.
	**/
	var activatePane : Bool; /**
		A `Boolean` indicating whether to call `Pane.activateItem` on containing pane. Defaults to `true`.
	**/
	var activateItem : Bool; /**
		A `Boolean` indicating whether or not the item should be opened in a pending state. Existing pending items in a pane are replaced with new pending items when they are opened.
	**/
	var pending : Bool; /**
		A `Boolean`. If `true`, the workspace will attempt to activate an existing item for the given URI on any pane. If `false`, only the active pane will be searched for an existing item for the same URI. Defaults to `false`.
	**/
	var searchAllPanes : Bool; /**
		A `String` containing the name of the location in which this item should be opened (one of "left", "right", "bottom", or "center"). If omitted, Atom will fall back to the last location in which a user has placed an item with the same URI or, if this is a new URI, the default location specified by the item. NOTE: This option should almost always be omitted to honor user preference.
	**/
	@:optional
	var location : String; }):js.Promise<Any>;
	/**
		Search the workspace for items matching the given URI and hide them.
	**/
	function hide(itemOrURI:String):Bool;
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
	function createItemForURI(uri:String):js.Promise<Any>;
	/**
		
		
		
	**/
	function isTextEditor(object:Dynamic):Bool;
	/**
		Create a new text editor.
	**/
	function buildTextEditor():atom.TextEditor;
	/**
		Asynchronously reopens the last-closed item's URI if it hasn't already been
		reopened.
	**/
	function reopenItem():js.Promise<Any>;
	/**
		Register an opener for a uri.
		
		When a URI is opened via `Workspace.open`, Atom loops through its registered
		opener functions until one returns a value for the given uri.
		Openers are expected to return an object that inherits from HTMLElement or
		a model which has an associated view in the {ViewRegistry}.
		A {TextEditor} will be used if no opener returns a value.
	**/
	function addOpener(opener:haxe.Constraints.Function):atom.Disposable;
	/**
		Get all pane items in the workspace.
	**/
	function getPaneItems():Array<Any>;
	/**
		Get the active `Pane`'s active item.
	**/
	function getActivePaneItem():Dynamic;
	/**
		Get all text editors in the workspace.
	**/
	function getTextEditors():Array<Any>;
	/**
		Get the workspace center's active item if it is a {TextEditor}.
	**/
	function getActiveTextEditor():atom.TextEditor;
	/**
		Get the most recently focused pane container.
	**/
	function getActivePaneContainer():atom.Dock;
	/**
		Get all panes in the workspace.
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
	/**
		Get the first pane container that contains an item with the given
		URI.
	**/
	function paneContainerForURI(uri:String):atom.Dock;
	/**
		Get the first pane container that contains the given item.
	**/
	function paneContainerForItem(item:Dynamic):atom.Dock;
	/**
		Get the first `Pane` that contains an item with the given URI.
	**/
	function paneForURI(uri:String):atom.Pane;
	/**
		Get the `Pane` containing the given item.
	**/
	function paneForItem(item:Dynamic):atom.Pane;
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
		Adds a panel item to the bottom of the editor window.
	**/
	function addBottomPanel(options:{ /**
		Your panel content. It can be DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the latter. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; }):atom.Panel;
	/**
		Get an `Array` of all the panel items to the left of the editor window.
	**/
	function getLeftPanels():Void;
	/**
		Adds a panel item to the left of the editor window.
	**/
	function addLeftPanel(options:{ /**
		Your panel content. It can be DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the latter. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; }):atom.Panel;
	/**
		Get an `Array` of all the panel items to the right of the editor window.
	**/
	function getRightPanels():Void;
	/**
		Adds a panel item to the right of the editor window.
	**/
	function addRightPanel(options:{ /**
		Your panel content. It can be DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the latter. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; }):atom.Panel;
	/**
		Get an `Array` of all the panel items at the top of the editor window.
	**/
	function getTopPanels():Void;
	/**
		Adds a panel item to the top of the editor window above the tabs.
	**/
	function addTopPanel(options:{ /**
		Your panel content. It can be DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the latter. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; }):atom.Panel;
	/**
		Get an `Array` of all the panel items in the header.
	**/
	function getHeaderPanels():Void;
	/**
		Adds a panel item to the header.
	**/
	function addHeaderPanel(options:{ /**
		Your panel content. It can be DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the latter. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; }):atom.Panel;
	/**
		Get an `Array` of all the panel items in the footer.
	**/
	function getFooterPanels():Void;
	/**
		Adds a panel item to the footer.
	**/
	function addFooterPanel(options:{ /**
		Your panel content. It can be DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the latter. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; }):atom.Panel;
	/**
		Get an `Array` of all the modal panel items
	**/
	function getModalPanels():Void;
	/**
		Adds a panel item as a modal dialog.
	**/
	function addModalPanel(options:{ /**
		Your panel content. It can be a DOM element, a jQuery element, or a model with a view registered via {ViewRegistry::addViewProvider}. We recommend the model option. See {ViewRegistry::addViewProvider} for more information.
	**/
	var item : Dynamic; /**
		`Boolean` false if you want the panel to initially be hidden (default: true)
	**/
	@:optional
	var visible : Bool; /**
		`Number` Determines stacking order. Lower priority items are forced closer to the edges of the window. (default: 100)
	**/
	@:optional
	var priority : Float; /**
		`Boolean` true if you want modal focus managed for you by Atom. Atom will automatically focus your modal panel's first tabbable element when the modal opens and will restore the previously selected element when the modal closes. Atom will also automatically restrict user tab focus within your modal while it is open. (default: false)
	**/
	@:optional
	var autoFocus : Bool; }):atom.Panel;
	/**
		
		
		
	**/
	function panelForItem(item:Dynamic):Dynamic;
	/**
		Performs a search across all files in the workspace.
	**/
	function scan(regex:EReg, ?options:{ /**
		An `Array` of glob patterns to search within.
	**/
	var paths : Array<Any>; /**
		`Function` to be periodically called with number of paths searched.
	**/
	@:optional
	var onPathsSearched : haxe.Constraints.Function; /**
		`Number` default `0`; The number of lines  before the matched line to include in the results object.
	**/
	var leadingContextLineCount : Float; /**
		`Number` default `0`; The number of lines  after the matched line to include in the results object.
	**/
	var trailingContextLineCount : Float; }, iterator:haxe.Constraints.Function):js.Promise<Any>;
	/**
		Performs a replace across all the specified files in the project.
	**/
	function replace(regex:EReg, replacementText:String, filePaths:Array<Any>, iterator:haxe.Constraints.Function):js.Promise<Any>;
}