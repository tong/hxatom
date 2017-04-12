package atom;

/**
	View class that extends the jQuery prototype.
**/
@:require(js, atom) @:jsRequire("atom", "View") extern class View extends atom.JQuery {
	/**
		Add the given subview wired to an outlet with the given name
	**/
	static function subview(name:String, view:Dynamic):Void;
	/**
		Add a text node with the given text content
	**/
	static function text(string:String):Void;
	/**
		Add a new tag with the given name
	**/
	static function tag(tagName:String, args:haxe.extern.Rest<Dynamic>):Void;
	/**
		Add new child DOM nodes from the given raw HTML string.
	**/
	static function raw(string:String):Void;
	/**
		Preempt events registered with jQuery's `::on`.
	**/
	function preempt(eventName:String, handler:haxe.Constraints.Function):Void;
}