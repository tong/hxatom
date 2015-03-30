package atom;

extern class Config {

    function get( keyPath : String, ?options : {?sources:Array<String>,?excludeSources:Array<String>,?scope:ScopeDescriptor} ) : Void;
    function set( keyPath : String, value : Dynamic, ?options : {?scopeSelector:String,source:String} ) : Bool;
    function unset( keyPath : String, ?options : {?scopeSelector:String,?source:String} ) : Void;

    function getAll( keyPath : String, ?options : {?sources:Array<String>,?excludeSources:Array<String>,?scope:ScopeDescriptor} ) : Array<{scopeDescriptor:ScopeDescriptor,value:Dynamic}>;
    function getSources() : Array<String>;
    function getSchema( keyPath : String ) : Dynamic;
    function getUserConfigPath() : String;
    function transact( callback : Void->Void ) : Void;
}
