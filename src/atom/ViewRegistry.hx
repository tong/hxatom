package atom;

extern class ViewRegistry {
    function addViewProvider( providerSpec : {modelConstructor:Void->Void,?viewConstructor:Void->Void,?createView:Void->Void} ) : Disposable;
    function getView( object : Dynamic ) : js.html.Element;
}
