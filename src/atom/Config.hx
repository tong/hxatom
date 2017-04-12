package atom;

/**
	Used to access all of Atom's configuration details.
**/
@:require(js, atom) @:jsRequire("atom", "Config") extern class Config {
	/**
		Add a listener for changes to a given key path. This is different
		than {::onDidChange} in that it will immediately call your callback with the
		current value of the config entry.
		
		### Examples
		
		You might want to be notified when the themes change. We'll watch
		`core.themes` for changes
		
		```coffee
		atom.config.observe 'core.themes', (value) ->
		  # do stuff with value
		```
	**/
	function observe(keyPath:String, ?options:Dynamic, callback:haxe.Constraints.Function):Disposable;
	/**
		Add a listener for changes to a given key path. If `keyPath` is
		not specified, your callback will be called on changes to any key.
	**/
	function onDidChange(?keyPath:String, ?options:Dynamic, callback:haxe.Constraints.Function):Disposable;
	/**
		Retrieves the setting for the given key.
		
		### Examples
		
		You might want to know what themes are enabled, so check `core.themes`
		
		```coffee
		atom.config.get('core.themes')
		```
		
		With scope descriptors you can get settings within a specific editor
		scope. For example, you might want to know `editor.tabLength` for ruby
		files.
		
		```coffee
		atom.config.get('editor.tabLength', scope: ['source.ruby']) # => 2
		```
		
		This setting in ruby files might be different than the global tabLength setting
		
		```coffee
		atom.config.get('editor.tabLength') # => 4
		atom.config.get('editor.tabLength', scope: ['source.ruby']) # => 2
		```
		
		You can get the language scope descriptor via
		{TextEditor::getRootScopeDescriptor}. This will get the setting specifically
		for the editor's language.
		
		```coffee
		atom.config.get('editor.tabLength', scope: @editor.getRootScopeDescriptor()) # => 2
		```
		
		Additionally, you can get the setting at the specific cursor position.
		
		```coffee
		scopeDescriptor = @editor.getLastCursor().getScopeDescriptor()
		atom.config.get('editor.tabLength', scope: scopeDescriptor) # => 2
		```
	**/
	function get(keyPath:String, ?options:Dynamic):Dynamic;
	/**
		Get all of the values for the given key-path, along with their
		associated scope selector.
	**/
	function getAll(keyPath:String, ?options:Dynamic):Array<Dynamic>;
	/**
		Sets the value for a configuration setting.
		
		This value is stored in Atom's internal configuration file.
		
		### Examples
		
		You might want to change the themes programmatically:
		
		```coffee
		atom.config.set('core.themes', ['atom-light-ui', 'atom-light-syntax'])
		```
		
		You can also set scoped settings. For example, you might want change the
		`editor.tabLength` only for ruby files.
		
		```coffee
		atom.config.get('editor.tabLength') # => 4
		atom.config.get('editor.tabLength', scope: ['source.ruby']) # => 4
		atom.config.get('editor.tabLength', scope: ['source.js']) # => 4
		
		# Set ruby to 2
		atom.config.set('editor.tabLength', 2, scopeSelector: '.source.ruby') # => true
		
		# Notice it's only set to 2 in the case of ruby
		atom.config.get('editor.tabLength') # => 4
		atom.config.get('editor.tabLength', scope: ['source.ruby']) # => 2
		atom.config.get('editor.tabLength', scope: ['source.js']) # => 4
		```
	**/
	function set(keyPath:String, value:Dynamic, ?options:Dynamic):Bool;
	/**
		Restore the setting at `keyPath` to its default value.
	**/
	function unset(keyPath:String, ?options:Dynamic):Void;
	/**
		Get an {Array} of all of the `source` {String}s with which
		settings have been added via {::set}. 
	**/
	function getSources():Void;
	/**
		Retrieve the schema for a specific key path. The schema will tell
		you what type the keyPath expects, and other metadata about the config
		option.
	**/
	function getSchema(keyPath:String):Dynamic;
	/**
		Get the {String} path to the config file being used. 
	**/
	function getUserConfigPath():Void;
	/**
		Suppress calls to handler functions registered with {::onDidChange}
		and {::observe} for the duration of `callback`. After `callback` executes,
		handlers will be called once if the value for their key-path has changed.
	**/
	function transact(callback:haxe.Constraints.Function):Void;
}