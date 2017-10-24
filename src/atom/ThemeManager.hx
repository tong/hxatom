package atom;

/**
	Handles loading and activating available themes.
**/
@:require(js, atom) @:jsRequire("atom", "ThemeManager") extern class ThemeManager {
	/**
		Invoke `callback` when style sheet changes associated with
		updating the list of active themes have completed.
	**/
	function onDidChangeActiveThemes(callback:haxe.Constraints.Function):Void;
	/**
		Returns an {Array} of {String}s of all the loaded theme names.
	**/
	function getLoadedThemeNames():Array<Dynamic>;
	/**
		Returns an {Array} of all the loaded themes.
	**/
	function getLoadedThemes():Array<Dynamic>;
	/**
		Returns an {Array} of {String}s all the active theme names.
	**/
	function getActiveThemeNames():Array<Dynamic>;
	/**
		Returns an {Array} of all the active themes.
	**/
	function getActiveThemes():Array<Dynamic>;
	/**
		Get the enabled theme names from the config.
	**/
	function getEnabledThemeNames():Dynamic;
}