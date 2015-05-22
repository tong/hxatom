package atom;

import js.Promise;

private typedef PaneOptions = {
    item:Dynamic,
    pane:Pane,
    index:Int
}

private typedef PanelOptions = {
    item:Dynamic,
    ?visible:Bool,
    ?priority:Int
}

@:enum abstract Split(String) {
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

extern class Workspace {

    // Event Subscription

    function observeTextEditors( callback : TextEditor->Void ) : Void;
    function observePaneItems( callback : Dynamic->Void ) : Void;
    function onDidChangeActivePaneItem( callback : Dynamic->Void ) : Void;
    function observeActivePaneItem( callback : Dynamic->Void ) : Void;
    function onDidOpen( callback : Dynamic->Void ) : Void;

    function onDidAddPane( callback : {pane:Pane}->Void ) : Void;
    function onDidDestroyPane( callback : {pane:Pane}->Void ) : Void;
    function observePanes( callback : Pane->Void ) : Void;
    function onDidChangeActivePane( callback : Pane->Void ) : Void;
    function observeActivePane( callback : Pane->Void ) : Void;
    function onDidAddPaneItem( callback : PaneOptions->Void ) : Void;
    function onWillDestroyPaneItem( callback : PaneOptions->Void ) : Void;
    function onDidDestroyPaneItem( callback : PaneOptions->Void ) : Void;
    function onDidAddTextEditor( callback : {textEditor:TextEditor,pane:Pane,index:Int}->Void ) : Void;

    // Opening

    function open( uri : String, ?options : OpenOptions ) : Void;
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
    function paneForItem(item : Dynamic ) : Pane;

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
