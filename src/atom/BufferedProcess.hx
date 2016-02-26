package atom;

@:jsRequire("atom","BufferedProcess")
extern class BufferedProcess {
    function new( options : {command:String,?args:Array<String>,?options:Dynamic,?stdout:String->Void,?stderr:String->Void,?exit:Int->Void} ) : Void;
    function onWillThrowError( callback : {error:Dynamic,handle:Void->Void}->Void ) : Disposable;
    function kill() : Void;
}
