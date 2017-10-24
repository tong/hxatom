package atom;

/**
	Package manager for coordinating the lifecycle of Atom packages.
**/
@:require(js, atom) @:jsRequire("atom", "PackageManager") extern class PackageManager {
	/**
		Invoke the given callback when all packages have been loaded.
	**/
	function onDidLoadInitialPackages(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when all packages have been activated.
	**/
	function onDidActivateInitialPackages(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is activated.
	**/
	function onDidActivatePackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is deactivated.
	**/
	function onDidDeactivatePackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is loaded.
	**/
	function onDidLoadPackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is unloaded.
	**/
	function onDidUnloadPackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Get the path to the apm command.
		
		Uses the value of the `core.apmPath` config setting if it exists.
		
		Return a {String} file path to apm.
	**/
	function getApmPath():Void;
	/**
		Get the paths being used to look for packages.
	**/
	function getPackageDirPaths():Array<Dynamic>;
	/**
		Resolve the given package name to a path on disk.
		
		Return a {String} folder path or undefined if it could not be resolved.
	**/
	function resolvePackagePath(name:String):Void;
	/**
		Is the package with the given name bundled with Atom?
	**/
	function isBundledPackage(name:String):Bool;
	/**
		Enable the package with the given name.
	**/
	function enablePackage(name:String):Package;
	/**
		Disable the package with the given name.
	**/
	function disablePackage(name:String):Package;
	/**
		Is the package with the given name disabled?
	**/
	function isPackageDisabled(name:String):Bool;
	/**
		Get an {Array} of all the active {Package}s.
	**/
	function getActivePackages():Void;
	/**
		Get the active {Package} with the given name.
	**/
	function getActivePackage(name:String):Package;
	/**
		Is the {Package} with the given name active?
	**/
	function isPackageActive(name:String):Bool;
	/**
		Returns a {Boolean} indicating whether package activation has occurred.
	**/
	function hasActivatedInitialPackages():Bool;
	/**
		Get an {Array} of all the loaded {Package}s
	**/
	function getLoadedPackages():Void;
	/**
		Get the loaded {Package} with the given name.
	**/
	function getLoadedPackage(name:String):Package;
	/**
		Is the package with the given name loaded?
	**/
	function isPackageLoaded(name:String):Bool;
	/**
		Returns a {Boolean} indicating whether package loading has occurred.
	**/
	function hasLoadedInitialPackages():Bool;
	/**
		Returns an {Array} of {String}s of all the available package paths.
	**/
	function getAvailablePackagePaths():Array<Dynamic>;
	/**
		Returns an {Array} of {String}s of all the available package names.
	**/
	function getAvailablePackageNames():Array<Dynamic>;
	/**
		Returns an {Array} of {String}s of all the available package metadata.
	**/
	function getAvailablePackageMetadata():Array<Dynamic>;
}