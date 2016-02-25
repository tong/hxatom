package atom;

import js.html.MouseEvent;

typedef ContextMenuItem = {
    ?label : String,
    ?command : String,
    ?enabled : String,
    ?submenu : Array<ContextMenuItem>,
    ?type : String,
    ?visible : Bool,
    ?created : MouseEvent->Void,
    ?shouldDisplay : MouseEvent->Void
}

@:native("ContextMenuManager")
extern class ContextMenuManager {
    //function add( itemsBySelector : ContextMenuItem ) : Disposable;
    function add( itemsBySelector : Dynamic ) : Disposable;
}
