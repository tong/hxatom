package atom;

extern class Gutter {
    function destroy() : Void;
    function onDidChangeVisible( callback : Gutter->Void ) : Disposable;
    function onDidDestroy( callback : Void->Void ) : Disposable;
    function hide() : Void;
    function show() : Void;
    function isVisible() : Bool;
    function decorateMarker( marker : TextEditorMarker, decorationParams : {type:String} ) : Decoration;

}
