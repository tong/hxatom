package atom;

typedef Package = Dynamic; //TODO

@:native("PackageManager")
extern class PackageManager {

    // Event Subscription

    function onDidLoadInitialPackages( callback : Void->Void ) : Disposable;
    function onDidActivateInitialPackages( callback : Void->Void ) : Disposable;
    function onDidActivatePackage( callback : Package->Void ) : Disposable;
    function onDidDeactivatePackage( callback : Package->Void ) : Disposable;
    function onDidLoadPackage( callback : Package->Void ) : Disposable;
    function onDidUnloadPackage( callback : Package->Void ) : Disposable;

    // Package system data

    function getApmPath() : String;
    function getPackageDirPaths() : Array<String>;

    // General package data

    function resolvePackagePath( name : String ) : String;
    function isBundledPackage( name : String ) : Bool;

    // Enabling and disabling packages

    function enablePackage() : Package;
    function disablePackage() : Package;
    function isPackageDisabled( name : String ) : Bool;

    // Accessing active packages

    function getActivePackages() : Array<Package>;
    function getActivePackage( name : String ) : Package;
    function isPackageActive( name : String ) : Bool;

    // Accessing loaded packages

    function getLoadedPackages() : Array<Package>;
    function getLoadedPackage( name : String ) : Package;
    function isPackageLoaded( name : String ) : Bool;

    // Accessing available packages

    function getAvailablePackagePaths() : Array<String>;
    function getAvailablePackageNames() : Array<String>;
    function getAvailablePackageMetadata() : Array<String>;
}
