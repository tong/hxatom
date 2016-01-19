package atom;

@:native("Decoration")
extern class Decoration {
    function onDidChangeProperties( callback : {oldProperties:Dynamic,newProperties:Dynamic}->Void ) : Disposable;
    function onDidDestroy( callback : Void->Void ) : Disposable;
    function getId() : Void;
    function getMarker() : Marker;
    function getProperties() : Dynamic;
    function setProperties( newProperties : Dynamic ) : Void;
    function destroy() : Void;
}
