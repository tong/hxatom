package atom;
/**
	Loads and activates a package's main module and resources such as
	stylesheets, keymaps, grammar, editor properties, and menus.
	
	@see https://github.com/atom/atom/blob/v1.31.2/src/package.js#L16
**/
@:jsRequire("atom", "Package") extern class Package {
	/**
		Invoke the given callback when all packages have been activated.
	**/
	function onDidDeactivate(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Are all native modules depended on by this package correctly
		compiled against the current version of Atom?
		
		Incompatible packages cannot be activated.
	**/
	function isCompatible():Bool;
	/**
		Rebuild native modules in this package's dependencies for the
		current version of Atom.
	**/
	function rebuild():js.Promise<Any>;
	/**
		If a previous rebuild failed, get the contents of stderr.
	**/
	function getBuildFailureOutput():String;
}