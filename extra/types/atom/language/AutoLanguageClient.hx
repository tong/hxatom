package atom.language;

@:require(js,atom)
@:native("AutoLanguageClient")
@:jsRequire("atom-languageclient")
extern class AutoLanguageClient {
    function new() : Void;
    function getGrammarScopes() : Array<String>;
    function getLanguageName() : String;
    function getServerName() : String;
    function startServerProcess( projectPath : String ) : Dynamic; //TODO
    function shouldStartForEditor( editor : atom.TextEditor ) : Bool;
    function getInitializeParams( projectPath : String, process : Dynamic ) : Dynamic; //TODO
    function preInitialization( connection : Dynamic ) : Void; //TODO
    function postInitialization( server : Dynamic ) : Void; //TODO
    function getConnectionType() : String; //TODO
    //-...
}
