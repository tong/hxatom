package atom;

import js.html.Element;

extern class ViewRegistry {
    function addViewProvider<T>( modelConstructor:Dynamic, createView:T->Void ) : Disposable;
    function getView( object : Dynamic ) : js.html.Element;
}
