package atom;

/**
	`ViewRegistry` handles the association between model and view
	types in Atom. We call this association a View Provider. As in, for a given
	model, this class can provide a view via {::getView}, as long as the
	model/view association was registered via {::addViewProvider}
**/
@:require(js, atom) @:jsRequire("atom", "ViewRegistry") extern class ViewRegistry {
	/**
		Add a provider that will be used to construct views in the
		workspace's view layer based on model objects in its model layer.
	**/
	function addViewProvider(?modelConstructor:haxe.Constraints.Function, createView:haxe.Constraints.Function):Disposable;
	/**
		Get the view associated with an object in the workspace.
		
		If you're just *using* the workspace, you shouldn't need to access the view
		layer, but view layer access may be necessary if you want to perform DOM
		manipulation that isn't supported via the model API.
		
		## View Resolution Algorithm
		
		The view associated with the object is resolved using the following
		sequence
		
		1. Is the object an instance of `HTMLElement`? If true, return the object.
		1. Does the object have a method named `getElement` that returns an
		  instance of `HTMLElement`? If true, return that value.
		1. Does the object have a property named `element` with a value which is
		  an instance of `HTMLElement`? If true, return the property value.
		1. Is the object a jQuery object, indicated by the presence of a `jquery`
		  property? If true, return the root DOM element (i.e. `object[0]`).
		1. Has a view provider been registered for the object? If true, use the
		  provider to create a view associated with the object, and return the
		  view.
		
		If no associated view is returned by the sequence an error is thrown.
	**/
	function getView():Dynamic;
}