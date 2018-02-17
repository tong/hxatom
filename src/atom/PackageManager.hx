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
	@see <https://github.com/atom/atom/blob/v1.24.0/src/package-manager.js#L30>

**/
@:require(js, atom) @:jsRequire("atom", "PackageManager") extern class PackageManager {
	/**
		Invoke the given callback when all packages have been loaded.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidLoadInitialPackages(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when all packages have been activated.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidActivateInitialPackages(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is activated.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidActivatePackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is deactivated.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDeactivatePackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is loaded.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidLoadPackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke the given callback when a package is unloaded.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidUnloadPackage(callback:haxe.Constraints.Function):Disposable;
	/**
		Get the path to the apm command.
		
		Uses the value of the `core.apmPath` config setting if it exists.
		
		Return a `String` file path to apm.
	**/
	function getApmPath():Void;
	/**
		Get the paths being used to look for packages.Returns an `Array` of `String` directory paths.
	**/
	function getPackageDirPaths():Array<Dynamic>;
	/**
		Resolve the given package name to a path on disk.
		
		Return a `String` folder path or undefined if it could not be resolved.
	**/
	function resolvePackagePath(name:String):Void;
	/**
		Is the package with the given name bundled with Atom?Returns a `Boolean`.
	**/
	function isBundledPackage(name:String):Bool;
	/**
		Enable the package with the given name.Returns the `Package` that was enabled or null if it isn't loaded.
	**/
	function enablePackage(name:String):Package;
	/**
		Disable the package with the given name.Returns the `Package` that was disabled or null if it isn't loaded.
	**/
	function disablePackage(name:String):Package;
	/**
		Is the package with the given name disabled?Returns a `Boolean`.
	**/
	function isPackageDisabled(name:String):Bool;
	/**
		Get an `Array` of all the active `Package`s.
	**/
	function getActivePackages():Void;
	/**
		Get the active `Package` with the given name.Returns a `Package` or .
	**/
	function getActivePackage(name:String):Package;
	/**
		Is the `Package` with the given name active?Returns a `Boolean`.
	**/
	function isPackageActive(name:String):Bool;
	/**
		Returns a `Boolean` indicating whether package activation has occurred.
	**/
	function hasActivatedInitialPackages():Bool;
	/**
		Get an `Array` of all the loaded `Package`s
	**/
	function getLoadedPackages():Void;
	/**
		Get the loaded `Package` with the given name.Returns a `Package` or .
	**/
	function getLoadedPackage(name:String):Package;
	/**
		Is the package with the given name loaded?Returns a `Boolean`.
	**/
	function isPackageLoaded(name:String):Bool;
	/**
		Returns a `Boolean` indicating whether package loading has occurred.
	**/
	function hasLoadedInitialPackages():Bool;
	/**
		Returns an `Array` of `String`s of all the available package paths.
	**/
	function getAvailablePackagePaths():Array<Dynamic>;
	/**
		Returns an `Array` of `String`s of all the available package names.
	**/
	function getAvailablePackageNames():Array<Dynamic>;
	/**
		Returns an `Array` of `String`s of all the available package metadata.
	**/
	function getAvailablePackageMetadata():Array<Dynamic>;
}