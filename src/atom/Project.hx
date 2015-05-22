package atom;

extern class Project {

    function onDidChangePaths( callback : Array<String>->Void ) : Void;

    function getRepositories() : Array<GitRepository>;
    function repositoryForDirectory( directory : String ) : js.Promise<Dynamic>;

    function getPaths() : Array<String>;
    function setPaths( projectPaths : Array<String> ) : Void;
    function addPath( projectPath : String ) : Void;
    function removePath( projectPath : String ) : Void;
    function getDirectories() : Array<Directory>;
    function contains( pathToCheck : String ) : Bool;
}
