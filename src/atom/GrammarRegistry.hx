package atom;

@:native("GrammarRegistry")
extern class GrammarRegistry {

    // Event Subscription

    static function onDidAddGrammar( callback : Void->Void ) : Void;
    static function onDidUpdateGrammar( callback : Void->Void ) : Void;

    // Managing Grammars

    static function getGrammars() : Array<Grammar>;
    static function grammarForScopeName( scopeName : String ) : Grammar;
    static function addGrammar( grammar : Grammar ) : Disposable;
    static function removeGrammarForScopeName( scopeName : String ) : Grammar;
    static function readGrammarSync( grammarPath : String ) : Grammar;
    static function readGrammar( grammarPath : String , callback : String->Grammar->Void ) : Void;
    static function loadGrammarSync( grammarPath : String ) : Grammar;
    static function loadGrammar( grammarPath : String , callback : String->Grammar->Void ) : Void;
    static function grammarOverrideForPath( filePath : String ) : Grammar;
    static function setGrammarOverrideForPath( filePath : String , scopeName : String ) : Grammar;
    static function clearGrammarOverrideForPath( filePath : String ) : Void;
    static function clearGrammarOverrides() : Void;
    static function selectGrammar( filePath : String , fileContents : String ) : Grammar;
}
