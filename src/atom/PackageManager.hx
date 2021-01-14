package atom;
/**
	Package manager for coordinating the lifecycle of Atom packages.
	
	An instance of this class is always available as the `atom.packages` global.
	
	Packages can be loaded, activated, and deactivated, and unloaded:
	
	* Loading a package reads and parses the package's metadata and resources
	  such as keymaps, menus, stylesheets, etc.
	* Activating a package registers the loaded resources and calls `activate()`
	  on the package's main module.
	* Deactivating a package unregisters the package's resources  and calls
	  `deactivate()` on the package's main module.
	* Unloading a package removes it completely from the package manager.
	
	Packages can be enabled/disabled via the `core.disabledPackages` config
	settings and also by calling `enablePackage()/disablePackage()`.
	
	@see https://github.com/atom/atom/blob/v1.54.0/src/package-manager.js#L30
**/
@:jsRequire("atom", "PackageManager") extern class PackageManager {
	/**
		Invoke the given callback when all packages have been loaded.
	**/
	function onDidLoadInitialPackages(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when all packages have been activated.
	**/
	function onDidActivateInitialPackages(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a package is activated.
	**/
	function onDidActivatePackage(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a package is deactivated.
	**/
	function onDidDeactivatePackage(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a package is loaded.
	**/
	function onDidLoadPackage(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke the given callback when a package is unloaded.
	**/
	function onDidUnloadPackage(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Get the path to the apm command.
		
		Uses the value of the `core.apmPath` config setting if it exists.
		
		Return a `String` file path to apm.
	**/
	function getApmPath():Void;
	/**
		Get the paths being used to look for packages.
	**/
	function getPackageDirPaths():Array<Any>;
	/**
		Resolve the given package name to a path on disk.
		
		Return a `String` folder path or undefined if it could not be resolved.
	**/
	function resolvePackagePath(name:String):Void;
	/**
		Is the package with the given name bundled with Atom?
	**/
	function isBundledPackage(name:String):Bool;
	/**
		Enable the package with the given name.
	**/
	function enablePackage(name:String):atom.Package;
	/**
		Disable the package with the given name.
	**/
	function disablePackage(name:String):atom.Package;
	/**
		Is the package with the given name disabled?
	**/
	function isPackageDisabled(name:String):Bool;
	/**
		Get an `Array` of all the active `Package`s.
	**/
	function getActivePackages():Void;
	/**
		Get the active `Package` with the given name.
	**/
	function getActivePackage(name:String):atom.Package;
	/**
		Is the `Package` with the given name active?
	**/
	function isPackageActive(name:String):Bool;
	function hasActivatedInitialPackages():Bool;
	/**
		Get an `Array` of all the loaded `Package`s
	**/
	function getLoadedPackages():Void;
	/**
		Get the loaded `Package` with the given name.
	**/
	function getLoadedPackage(name:String):atom.Package;
	/**
		Is the package with the given name loaded?
	**/
	function isPackageLoaded(name:String):Bool;
	function hasLoadedInitialPackages():Bool;
	function getAvailablePackagePaths():Array<Any>;
	function getAvailablePackageNames():Array<Any>;
	function getAvailablePackageMetadata():Array<Any>;
}