package atom;

import js.html.Element;

typedef TooltipOptions = {

    title : String,
    ?keyBindingCommand : String,
    ?keyBindingTarget : String,

    ?animation : Bool,
    ?container : Dynamic,
    ?delay : Dynamic,
    ?html : Bool,
    ?placement : Dynamic,
    ?selector : String,
    ?template : String,
    ?trigger : String,
    ?viewport : Dynamic
}

@:native("TooltipManager")
extern class TooltipManager {
    function add( target : Element, options : TooltipOptions ) : Disposable;
}
