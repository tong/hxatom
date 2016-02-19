package atom;

import js.Promise;

private typedef PaneOptions = {
    item : Dynamic,
    pane : Pane,
    index : Int
}

private typedef PanelOptions = {
    item : Dynamic,
    ?visible : Bool,
    ?priority : Int
}

@:enum abstract Split(String) from String to String {
    var left = "left";
    var right = "right";
}

typedef OpenOptions = {
    ?initialLine : Int,
    ?initialColumn : Int,
    ?split : Split,
    ?activatePane : Bool,
    ?searchAllPanes : Bool
}

@:native("Workspace")
extern class Workspace {

    // Event Subscription

    function observeTextEditors( callback : TextEditor->Void ) : Disposable;
    function observePaneItems( callback : Dynamic->Void ) : Disposable;
    function onDidChangeActivePaneItem( callback : Dynamic->Void ) : Disposable;
    function observeActivePaneItem( callback : Dynamic->Void ) : Disposable;
    function onDidOpen( callback : Dynamic->Void ) : Disposable;

    function onDidAddPane( callback : {pane:Pane}->Void ) : Disposable;
    function onWillDestroyPane( callback : {pane:Pane}->Void ) : Disposable;
    function onDidDestroyPane( callback : {pane:Pane}->Void ) : Disposable;
    function observePanes( callback : Pane->Void ) : Disposable;
    function onDidChangeActivePane( callback : Pane->Void ) : Disposable;
    function observeActivePane( callback : Pane->Void ) : Disposable;
    function onDidAddPaneItem( callback : PaneOptions->Void ) : Disposable;
    function onWillDestroyPaneItem( callback : PaneOptions->Void ) : Disposable;
    function onDidDestroyPaneItem( callback : PaneOptions->Void ) : Disposable;
    function onDidAddTextEditor( callback : {textEditor:TextEditor,pane:Pane,index:Int}->Void ) : Disposable;

    // Opening

    function open( uri : String, ?options : OpenOptions ) : Promise<TextEditor>;
    function isTextEditor( object : Dynamic ) : Bool;
    function reopenItem() : Promise<Dynamic>;
    function addOpener( opener : String->Void ) : Disposable;

    // Pane Items

    function getPaneItems() : Array<Dynamic>;
    function getActivePaneItem() : Pane;
    function getTextEditors() : Array<TextEditor>;
    function getActiveTextEditor() : TextEditor;

    // Panes

    function getPanes() : Array<Pane>;
    function getActivePane() : Pane;
    function activateNextPane() : Void;
    function activatePreviousPane() : Void;
    function paneForURI( uri : String ) : Pane;
    function paneForItem( item : Dynamic ) : Pane;

    // Panels

    function getBottomPanels() : Array<Dynamic>;
    function addBottomPanel( options : PanelOptions ) : Panel;
    function getLeftPanels() : Array<Panel>;
    function addLeftPanel( options : PanelOptions ) : Panel;
    function getRightPanels() : Array<Panel>;
    function addRightPanel( options : PanelOptions ) : Panel;
    function getTopPanels() : Array<Panel>;
    function addTopPanel( options : PanelOptions ) : Panel;
    function getModalPanels() : Array<Panel>;
    function addModalPanel( options : PanelOptions ) : Panel;
    function panelForItem( item : Dynamic ) : Panel;

    // Searching and Replacing

    function scan( regex : EReg, ?options : {paths:Array<String>}, iterator : String->Void ) : Promise<Dynamic>;
    function replace( regex : EReg, replacementText : String, filePaths : Array<String>, options : {filePath:String,replacements:Array<String>} ) : Promise<Dynamic>;

}
