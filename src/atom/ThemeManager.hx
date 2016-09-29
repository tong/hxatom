package atom;

extern class ThemeManager {

    // Event Subscription

    function onDidChangeActiveThemes( callback : Void->Void ) : Void;

    // Accessing Loaded Themes

    function getLoadedThemeNames() : Array<String>;
    function getLoadedThemes() : Array<Dynamic>;

    // Accessing Active Themes

    function getActiveThemeNames() : Array<String>;
    function getActiveThemes() : Array<Dynamic>;

    // Managing Enabled Themes

    function getEnabledThemeNames() : Array<String>;
}
