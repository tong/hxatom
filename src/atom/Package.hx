package atom;

/**
	Loads and activates a package's main module and resources such as
	stylesheets, keymaps, grammar, editor properties, and menus.
	@see <https://github.com/atom/atom/blob/v1.27.0-beta1/src/package.js#L16>

**/
@:require(js, atom) @:jsRequire("atom", "Package") extern class Package {
	/**
		Invoke the given callback when all packages have been activated.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidDeactivate(callback:haxe.Constraints.Function):Disposable;
	/**
		Are all native modules depended on by this package correctly
		compiled against the current version of Atom?
		
		Incompatible packages cannot be activated.Returns a `Boolean`, true if compatible, false if incompatible.
	**/
	function isCompatible():Bool;
	/**
		Rebuild native modules in this package's dependencies for the
		current version of Atom.Returns a `Promise` that resolves with an object containing `code`,
		`stdout`, and `stderr` properties based on the results of running
		`apm rebuild` on the package.
	**/
	function rebuild():js.Promise<Dynamic>;
	/**
		If a previous rebuild failed, get the contents of stderr.Returns a `String` or null if no previous build failure occurred.
	**/
	function getBuildFailureOutput():String;
}