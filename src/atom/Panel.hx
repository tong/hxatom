package atom;

@:native("Panel")
extern class Panel {

    function destroy() : Void;

    function onDidChangeVisible( callback : Bool->Void ) : Disposable;
    function onDidDestroy( callback : Panel->Void ) : Disposable;

    function getItem() : Dynamic;
    function getPriority() : Float;
    function isVisible() : Bool;
    function hide() : Void;
    function show() : Void;
}
