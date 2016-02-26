package atom;

extern class GitRepository {

    // Construction and Destruction

    static function open( path : String, options : { refreshOnWindowFocus:Bool } ) : GitRepository;

    function destroy() : Void;
    function onDidDestroy( callback : Void->Void ) : Disposable;
    function onDidChangeStatus( callback : {path:String,pathStatus:Int}->Void ) : Disposable;
    function onDidChangeStatuses( callback : Void->Void ) : Disposable;

    // Repository Details

    function getType() : String;
    function getPath() : String;
    function getWorkingDirectory() : String;
    function isProjectAtRoot() : Bool;
    function relativize() : Void;
    function hasBranch() : Void;
    function getShortHead( path : String ) : String;
    function isSubmodule() : Bool;
    function getAheadBehindCount( reference : String, path : String ) : Int;
    function getCachedUpstreamAheadBehindCount( path : String ) : {ahead:Int,behind:Int};
    function getConfigValue( ?path : String ) : Dynamic;
    function getOriginURL( ?path : String ) : String;
    function getUpstreamBranch( ?path : String ) : String;
    function getReferences( path : String ) : Dynamic;
    function getReferenceTarget( reference : String, path : String ) : String;

    // Reading Status

    function isPathModified() : Bool;
    function isPathNew() : Bool;
    function isPathIgnored() : Bool;
    function getDirectoryStatus( path : String ) : Int;
    function getPathStatus() : String;
    function getCachedPathStatus( path : String ) : Int;
    function isStatusModified() : Bool;
    function isStatusNew() : Bool;

    //Retrieving Diffs

    function getDiffStats( path : String ) : {added:Int,deleted:Int};
    function getLineDiffs( path : String, text : String ) : {oldStart:Int,newStart:Int,oldLines:Int,newLines:Int};

    // Checking Out

    function checkoutHead( path : String ) : Bool;
    function checkoutReference( reference : String, create : Bool ) : Bool;
}
