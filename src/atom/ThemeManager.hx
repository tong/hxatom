package atom;

/**
	Handles loading and activating available themes.
	
	An instance of this class is always available as the `atom.themes` global.
	@see <https://github.com/atom/atom/blob/v1.28.2/src/theme-manager.js#L14>

**/
@:require(js, atom) @:jsRequire("atom", "ThemeManager") extern class ThemeManager {
	/**
		Invoke `callback` when style sheet changes associated with
		updating the list of active themes have completed.Returns a `Disposable` on which `.dispose()` can be called to unsubscribe.
	**/
	function onDidChangeActiveThemes(callback:haxe.Constraints.Function):Disposable;
	/**
		Returns an `Array` of `String`s of all the loaded theme names.
	**/
	function getLoadedThemeNames():Array<Dynamic>;
	/**
		Returns an `Array` of all the loaded themes.
	**/
	function getLoadedThemes():Array<Dynamic>;
	/**
		Returns an `Array` of `String`s of all the active theme names.
	**/
	function getActiveThemeNames():Array<Dynamic>;
	/**
		Returns an `Array` of all the active themes.
	**/
	function getActiveThemes():Array<Dynamic>;
	/**
		Get the enabled theme names from the config.Returns an array of theme names in the order that they should be activated.
	**/
	function getEnabledThemeNames():Dynamic;
}