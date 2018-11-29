package atom;
/**
	Handles loading and activating available themes.
	
	An instance of this class is always available as the `atom.themes` global.
	
	@see https://github.com/atom/atom/blob/v1.33.0/src/theme-manager.js#L14
**/
@:jsRequire("atom", "ThemeManager") extern class ThemeManager {
	/**
		Invoke `callback` when style sheet changes associated with
		updating the list of active themes have completed.
	**/
	function onDidChangeActiveThemes(callback:haxe.Constraints.Function):atom.Disposable;
	function getLoadedThemeNames():Array<Any>;
	function getLoadedThemes():Array<Any>;
	function getActiveThemeNames():Array<Any>;
	function getActiveThemes():Array<Any>;
	/**
		Get the enabled theme names from the config.
	**/
	function getEnabledThemeNames():Dynamic;
}