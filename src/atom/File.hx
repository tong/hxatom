package atom;

import js.Promise;
import haxe.extern.EitherType;

@:jsRequire("atom","File")
extern class File {

    // Construction

    function new( filePath : String, ?symlink : Bool ) : Void;
    function create() : Promise<Dynamic>;

    // Event Subscription

    function onDidChange( callback : Void->Void ) : Disposable;
    function onDidRename( callback : Void->Void ) : Disposable;
    function onDidDelete( callback : Void->Void ) : Disposable;
    function onWillThrowWatchError( callback : {error:Dynamic,handle:String->Void}->Void ) : Disposable;

    // File Metadata

    function isFile() : Bool;
    function isDirectory() : Bool;
    function exists() : Bool;
    function existsSync() : Bool;
    function getDigest() : Promise<Dynamic>;
    function getDigestSync() : String;
    function setEncoding( encoding : String ) : Void;
    function getEncoding() : String;

    // Managing Paths

    function getPath() : String;
    function getRealPathSync() : String;
    function getRealPath() : String;
    function getBaseName() : String;

    // Traversing

    function getParent() : Directory;

    // Reading and Writing

    function read( flushCache : Bool ) : Promise<Dynamic>;
    function write( text : String ) : Promise<Dynamic>;
    function writeSync( text : String ) : Void;

}
