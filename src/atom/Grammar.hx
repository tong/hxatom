package atom;

@:native("Grammar")
extern class Grammar {
    function onDidUpdate( callback : Void->Void ) : Disposable;
    function tokenizeLines( text : String ) : Array<Dynamic>;
    function tokenizeLine( line : String, ?ruleStack : Array<Dynamic>, ?firstLine : Bool ) : {token:Array<Dynamic>,ruleStack:Array<Dynamic>};
}
