package atom;

@:native("Pane")
extern class Pane {

    // Event Subscription

    function onDidChangeFlexScale( callback : Void->Void ) : Disposable;
    function observerFlexScale( callback : Void->Void ) : Disposable;
    function onDidActivate( callback : Void->Void ) : Disposable;
    function onDidDestroy( callback : Void->Void ) : Disposable;
    function onDidChangeActive( callback : Bool->Void ) : Disposable;
    function observeActive( callback : Bool->Void ) : Disposable;
    function onDidAddItem( callback : {item:Dynamic,index:Int}->Void ) : Disposable;
    function onDidRemoveItem( callback : {item:Dynamic,index:Int}->Void ) : Disposable;
    function onDidMoveItem( callback : {item:Dynamic,oldIndex:Int,newIndex:Int}->Void ) : Disposable;
    function observeItems( callback : Dynamic->Void ) : Disposable;
    function onDidChangeActiveItem( callback : Dynamic->Void ) : Disposable;
    function observeActiveItem( callback : Dynamic->Void ) : Disposable;
    function onWillDestroyItem( callback : {item:Dynamic,index:Int}->Void ) : Disposable;

    // Items

    function getItems() : Array<Dynamic>;
    function getActiveItem() : Dynamic;
    function itemAtIndex( index : Int) : Dynamic;
    function activateNextItem() : Void;
    function activatePreviousItem() : Void;
    function moveItemRight() : Void;
    function moveItemLeft() : Void;
    function getActiveItemIndex() : Int;
    function activateItemAtIndex( index : Int ) : Void;
    function activateItem( item : Dynamic ) : Void;
    function addItem( item : Dynamic, ?index : Int ) : Dynamic;
    function addItems( items : Array<Dynamic>, ?index : Int ) : Array<Dynamic>;
    function moveItem( item : Dynamic, index : Int ) : Void;
    function moveItemToPane( item : Dynamic, pane : Pane, index : Int ) : Void;
    function destroyActiveItem() : Void;
    function destroyItem( item : Dynamic ) : Void;
    function destroyItems() : Void;
    function destroyInactiveItems()  : Void;
    function saveActiveItem() : Void;
    function saveActiveItemAs( ?nextAction : Void->Void ) : Void;
    function saveItem( item : Dynamic, ?nextAction : Void->Void ) : Void;
    function saveItemAs( item : Dynamic, ?nextAction : Void->Void ) : Void;
    function saveItems() : Void;
    function itemForURI( uri : String ) : Void;
    function activateItemForURI() : Void;

    // Lifecycle

    function isActive() : Bool;
    function activate() : Void;
    function destroy() : Void;

    // Splitting

    function splitLeft( params : {?items:Array<Dynamic>,?copyActiveItem:Bool} ) : Pane;
    function splitRight( params : {?items:Array<Dynamic>,?copyActiveItem:Bool} ) : Pane;
    function splitUp( params : {?items:Array<Dynamic>,?copyActiveItem:Bool} ) : Pane;
    function splitDown( params : {?items:Array<Dynamic>,?copyActiveItem:Bool} ) : Pane;

}
