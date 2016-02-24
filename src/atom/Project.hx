package atom;

@:native("Project")
extern class Project {

    function onDidChangePaths( callback : Array<String>->Void ) : Disposable;

    function getRepositories() : Array<GitRepository>;
    function repositoryForDirectory( directory : String ) : js.Promise<Dynamic>;

    function getPaths() : Array<String>;
    function setPaths( projectPaths : Array<String> ) : Void;
    function addPath( projectPath : String ) : Void;
    function removePath( projectPath : String ) : Void;
    function getDirectories() : Array<Directory>;
    function relativizePath( fullPath : String ) : Array<String>;
    function contains( pathToCheck : String ) : Bool;
}
