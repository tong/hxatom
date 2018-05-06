package atom;

/**
	A singleton instance of this class available via `atom.styles`,
	which you can use to globally query and observe the set of active style
	sheets. The `StyleManager` doesn't add any style elements to the DOM on its
	own, but is instead subscribed to by individual `<atom-styles>` elements,
	which clone and attach style elements in different contexts.
	@see <https://github.com/atom/atom/blob/v1.27.0-beta1/src/style-manager.js#L15>

**/
@:require(js, atom) @:jsRequire("atom", "StyleManager") extern class StyleManager {
	/**
		Invoke `callback` for all current and future style elements.Returns a `Disposable` on which `.dispose()` can be called to cancel the
		subscription.
	**/
	function observeStyleElements(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke `callback` when a style element is added.Returns a `Disposable` on which `.dispose()` can be called to cancel the
		subscription.
	**/
	function onDidAddStyleElement(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke `callback` when a style element is removed.Returns a `Disposable` on which `.dispose()` can be called to cancel the
		subscription.
	**/
	function onDidRemoveStyleElement(callback:haxe.Constraints.Function):Disposable;
	/**
		Invoke `callback` when an existing style element is updated.Returns a `Disposable` on which `.dispose()` can be called to cancel the
		subscription.
	**/
	function onDidUpdateStyleElement(callback:haxe.Constraints.Function):Disposable;
	/**
		Get all loaded style elements.
	**/
	function getStyleElements():Void;
	/**
		Get the path of the user style sheet in `~/.atom`.Returns a `String`.
	**/
	function getUserStyleSheetPath():String;
}