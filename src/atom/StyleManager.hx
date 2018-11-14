package atom;
/**
	A singleton instance of this class available via `atom.styles`,
	which you can use to globally query and observe the set of active style
	sheets. The `StyleManager` doesn't add any style elements to the DOM on its
	own, but is instead subscribed to by individual `<atom-styles>` elements,
	which clone and attach style elements in different contexts.
	
	@see https://github.com/atom/atom/blob/v1.32.2/src/style-manager.js#L15
**/
@:jsRequire("atom", "StyleManager") extern class StyleManager {
	/**
		Invoke `callback` for all current and future style elements.
	**/
	function observeStyleElements(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke `callback` when a style element is added.
	**/
	function onDidAddStyleElement(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke `callback` when a style element is removed.
	**/
	function onDidRemoveStyleElement(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Invoke `callback` when an existing style element is updated.
	**/
	function onDidUpdateStyleElement(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Get all loaded style elements.
	**/
	function getStyleElements():Void;
	/**
		Get the path of the user style sheet in `~/.atom`.
	**/
	function getUserStyleSheetPath():String;
}