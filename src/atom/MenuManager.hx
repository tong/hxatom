package atom;

extern class MenuManager {
    function add( items : Array<{label:String,?submenu:Array<Dynamic>,?command:String}> ) : Disposable;
    function update() : Void;
}
