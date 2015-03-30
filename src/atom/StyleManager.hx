package atom;

import js.html.Element;

extern class StyleManager {

    // Event Subscription

    //TODO wtf, docs are unclear about callback types

    function observeStyleElements( callback : Element->String->String->Void ) : Disposable;
    function onDidAddStyleElement( callback : Element->String->String->Void ) : Disposable;
    function onDidRemoveStyleElement( callback : Dynamic->Void ) : Disposable;
    function onDidUpdateStyleElement( callback : Element->String->String->Void ) : Disposable;

    // Reading Style Elements

    function getStyleElements() : Dynamic;

    // Paths

    function getUserStyleSheetPath() : String;
}
