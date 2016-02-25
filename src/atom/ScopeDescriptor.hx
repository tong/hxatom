package atom;

@:jsRequire("atom","ScopeDescriptor")
extern class ScopeDescriptor {
    function new( object : {scopes:Array<String>}) : Void;
    function getScopesArray() : Array<String>;
}
