package atom;

extern class ContextMenuManager {
    function add(
        itemsBySelector : {
            ?label:String,
            ?command:String,
            ?submenu:Array<Dynamic>,
            ?type:String,
            ?created:Dynamic->Void,
            ?event:Dynamic,
            ?shouldDisplay:Dynamic->Void
        }
    ) : Void;
}
