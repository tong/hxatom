package atom;

extern class Workspace {

    function new( params : Dynamic ) : Void;

    ///// Event Subscription

    function observeTextEditors( callback : TextEditor->Void ) : Void;
    function observePaneItems( callback : Dynamic->Void ) : Void;
    function onDidChangeActivePaneItem( callback : Dynamic->Void ) : Void;
    function observeActivePaneItem( callback : Dynamic->Void ) : Void;
    function onDidOpen( callback : Dynamic->Void ) : Void;

    ///// Opening

    function open( uri : String, ?options : Dynamic ) : Void;
    function reopenItem() : Void;
    function addOpener( opener : Dynamic ) : Void;

    ///// Pane Items

    function getPaneItems() : Array<Dynamic>;
    function getActivePaneItem() : Pane;
    function getTextEditors() : Array<TextEditor>;
    function getActiveTextEditor() : TextEditor;

/*
    //TODO
    ///// Panes

    This section only has Extended methods.

     Extended Methods
    ::getPanes()

    ::getActivePane()

    ::activateNextPane()

    ::activatePreviousPane()

    ::paneForURI(uri)

    ::paneForItem(item)
    */

    ///// Panels

    function getBottomPanels() : Array<Dynamic>;
    function addBottomPanel( options : Dynamic ) : Panel;
    function getLeftPanels() : Array<Panel>;
    function addLeftPanel( options : Dynamic ) : Panel;
    function getRightPanels() : Array<Panel>;
    function addRightPanel( options : Dynamic ) : Panel;
    function getTopPanels() : Array<Dynamic>;
    function addTopPanel( options : Dynamic ) : Panel;
    function getModalPanels() : Array<Panel>;
    function addModalPanel( options : Dynamic ) : Panel;
    function panelForItem( item : Dynamic ) : Panel;

    ///// Searching and Replacing

    function scan( regex : EReg, ?options : Dynamic, iterator : Dynamic ) : Dynamic;
    function replace( regex : EReg, replacementText : String, filePaths : Array<String>, options : Dynamic ) : Dynamic;
}
