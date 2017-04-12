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
	function getLoadedThemeNames():Array<Dynamic>;
	function getLoadedThemes():Array<Dynamic>;
	function getActiveThemeNames():Array<Dynamic>;
	function getActiveThemes():Array<Dynamic>;
	/**
		Get the enabled theme names from the config.
	**/
	function getEnabledThemeNames():Dynamic;
}