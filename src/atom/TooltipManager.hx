package atom;

import js.html.HtmlElement;

extern class TooltipManager {
    function add( target : HtmlElement, options : {title:String,keyBindingCommand:String,keyBindingTarget:HtmlElement} ) : Disposable;
}
