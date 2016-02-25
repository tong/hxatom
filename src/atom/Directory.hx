package atom;

import js.Error;
import js.Promise;
import haxe.extern.EitherType;

@:jsRequire("atom","Directory")
extern class Directory {

    // Construction

    function new( directoryPath : String, ?symlink : Bool ) : Void;
    function create( mode : Int ) : Promise<Dynamic>;

    // Event Subscription

    function onDidChange( callback : Void->Void ) : Disposable;

    // Directory Metadata

    function isFile() : Bool;
    function isDirectory() : Bool;
    function exists() : Bool;
    function existsSync() : Bool;
    function isRoot() : Bool;

    // Managing Paths

    function getPath() : String;
    function getRealPathSync() : String;
    function getBaseName() : String;
    function relativize() : String;

    // Traversing

    function getParent() : Directory;
    function getFile( filename : String ) : File;
    function getSubdirectory( dirname : String ) : Directory;
    function getEntriesSync() : Array<EitherType<Directory,File>>;
    function getEntries( callback : Error->Array<EitherType<Directory,File>>->Void ) : Void;
    function contains() : Bool;

}
