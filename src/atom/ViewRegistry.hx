package atom;

import js.html.Element;

@:native("ViewRegistry")
extern class ViewRegistry {
    function addViewProvider<T>( modelConstructor:Dynamic, createView:T->Void ) : Disposable;
    function getView<T>( object : T ) : js.html.Element;
}
