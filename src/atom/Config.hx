package atom;

/**
	Used to access all of Atom's configuration details.
	
	An instance of this class is always available as the `atom.config` global.
	
	## Getting and setting config settings.
	
	```coffee
	# Note that with no value set, ::get returns the setting's default value.
	atom.config.get('my-package.myKey') # -> 'defaultValue'
	
	atom.config.set('my-package.myKey', 'value')
	atom.config.get('my-package.myKey') # -> 'value'
	```
	
	You may want to watch for changes. Use {::observe} to catch changes to the setting.
	
	```coffee
	atom.config.set('my-package.myKey', 'value')
	atom.config.observe 'my-package.myKey', (newValue) ->
	  # `observe` calls immediately and every time the value is changed
	  console.log 'My configuration changed:', newValue
	```
	
	If you want a notification only when the value changes, use {::onDidChange}.
	
	```coffee
	atom.config.onDidChange 'my-package.myKey', ({newValue, oldValue}) ->
	  console.log 'My configuration changed:', newValue, oldValue
	```
	
	### Value Coercion
	
	Config settings each have a type specified by way of a
	[schema](json-schema.org). For example we might an integer setting that only
	allows integers greater than `0`:
	
	```coffee
	# When no value has been set, `::get` returns the setting's default value
	atom.config.get('my-package.anInt') # -> 12
	
	# The string will be coerced to the integer 123
	atom.config.set('my-package.anInt', '123')
	atom.config.get('my-package.anInt') # -> 123
	
	# The string will be coerced to an integer, but it must be greater than 0, so is set to 1
	atom.config.set('my-package.anInt', '-20')
	atom.config.get('my-package.anInt') # -> 1
	```
	
	## Defining settings for your package
	
	Define a schema under a `config` key in your package main.
	
	```coffee
	module.exports =
	  # Your config schema
	  config:
	    someInt:
	      type: 'integer'
	      default: 23
	      minimum: 1
	
	  activate: (state) -> # ...
	  # ...
	```
	
	See [package docs](http://flight-manual.atom.io/hacking-atom/sections/package-word-count/) for
	more info.
	
	## Config Schemas
	
	We use [json schema](http://json-schema.org) which allows you to define your value's
	default, the type it should be, etc. A simple example:
	
	```coffee
	# We want to provide an `enableThing`, and a `thingVolume`
	config:
	  enableThing:
	    type: 'boolean'
	    default: false
	  thingVolume:
	    type: 'integer'
	    default: 5
	    minimum: 1
	    maximum: 11
	```
	
	The type keyword allows for type coercion and validation. If a `thingVolume` is
	set to a string `'10'`, it will be coerced into an integer.
	
	```coffee
	atom.config.set('my-package.thingVolume', '10')
	atom.config.get('my-package.thingVolume') # -> 10
	
	# It respects the min / max
	atom.config.set('my-package.thingVolume', '400')
	atom.config.get('my-package.thingVolume') # -> 11
	
	# If it cannot be coerced, the value will not be set
	atom.config.set('my-package.thingVolume', 'cats')
	atom.config.get('my-package.thingVolume') # -> 11
	```
	
	### Supported Types
	
	The `type` keyword can be a string with any one of the following. You can also
	chain them by specifying multiple in an an array. For example
	
	```coffee
	config:
	  someSetting:
	    type: ['boolean', 'integer']
	    default: 5
	
	# Then
	atom.config.set('my-package.someSetting', 'true')
	atom.config.get('my-package.someSetting') # -> true
	
	atom.config.set('my-package.someSetting', '12')
	atom.config.get('my-package.someSetting') # -> 12
	```
	
	#### string
	
	Values must be a string.
	
	```coffee
	config:
	  someSetting:
	    type: 'string'
	    default: 'hello'
	```
	
	#### integer
	
	Values will be coerced into integer. Supports the (optional) `minimum` and
	`maximum` keys.
	
	```coffee
	  config:
	    someSetting:
	      type: 'integer'
	      default: 5
	      minimum: 1
	      maximum: 11
	```
	
	#### number
	
	Values will be coerced into a number, including real numbers. Supports the
	(optional) `minimum` and `maximum` keys.
	
	```coffee
	config:
	  someSetting:
	    type: 'number'
	    default: 5.3
	    minimum: 1.5
	    maximum: 11.5
	```
	
	#### boolean
	
	Values will be coerced into a Boolean. `'true'` and `'false'` will be coerced into
	a boolean. Numbers, arrays, objects, and anything else will not be coerced.
	
	```coffee
	config:
	  someSetting:
	    type: 'boolean'
	    default: false
	```
	
	#### array
	
	Value must be an Array. The types of the values can be specified by a
	subschema in the `items` key.
	
	```coffee
	config:
	  someSetting:
	    type: 'array'
	    default: [1, 2, 3]
	    items:
	      type: 'integer'
	      minimum: 1.5
	      maximum: 11.5
	```
	
	#### color
	
	Values will be coerced into a {Color} with `red`, `green`, `blue`, and `alpha`
	properties that all have numeric values. `red`, `green`, `blue` will be in
	the range 0 to 255 and `value` will be in the range 0 to 1. Values can be any
	valid CSS color format such as `#abc`, `#abcdef`, `white`,
	`rgb(50, 100, 150)`, and `rgba(25, 75, 125, .75)`.
	
	```coffee
	config:
	  someSetting:
	    type: 'color'
	    default: 'white'
	```
	
	#### object / Grouping other types
	
	A config setting with the type `object` allows grouping a set of config
	settings. The group will be visually separated and has its own group headline.
	The sub options must be listed under a `properties` key.
	
	```coffee
	config:
	  someSetting:
	    type: 'object'
	    properties:
	      myChildIntOption:
	        type: 'integer'
	        minimum: 1.5
	        maximum: 11.5
	```
	
	### Other Supported Keys
	
	#### enum
	
	All types support an `enum` key, which lets you specify all the values the
	setting can take. `enum` may be an array of allowed values (of the specified
	type), or an array of objects with `value` and `description` properties, where
	the `value` is an allowed value, and the `description` is a descriptive string
	used in the settings view.
	
	In this example, the setting must be one of the 4 integers:
	
	```coffee
	config:
	  someSetting:
	    type: 'integer'
	    default: 4
	    enum: [2, 4, 6, 8]
	```
	
	In this example, the setting must be either 'foo' or 'bar', which are
	presented using the provided descriptions in the settings pane:
	
	```coffee
	config:
	  someSetting:
	    type: 'string'
	    default: 'foo'
	    enum: [
	      {value: 'foo', description: 'Foo mode. You want this.'}
	      {value: 'bar', description: 'Bar mode. Nobody wants that!'}
	    ]
	```
	
	Usage:
	
	```coffee
	atom.config.set('my-package.someSetting', '2')
	atom.config.get('my-package.someSetting') # -> 2
	
	# will not set values outside of the enum values
	atom.config.set('my-package.someSetting', '3')
	atom.config.get('my-package.someSetting') # -> 2
	
	# If it cannot be coerced, the value will not be set
	atom.config.set('my-package.someSetting', '4')
	atom.config.get('my-package.someSetting') # -> 4
	```
	
	#### title and description
	
	The settings view will use the `title` and `description` keys to display your
	config setting in a readable way. By default the settings view humanizes your
	config key, so `someSetting` becomes `Some Setting`. In some cases, this is
	confusing for users, and a more descriptive title is useful.
	
	Descriptions will be displayed below the title in the settings view.
	
	For a group of config settings the humanized key or the title and the
	description are used for the group headline.
	
	```coffee
	config:
	  someSetting:
	    title: 'Setting Magnitude'
	    description: 'This will affect the blah and the other blah'
	    type: 'integer'
	    default: 4
	```
	
	__Note__: You should strive to be so clear in your naming of the setting that
	you do not need to specify a title or description!
	
	Descriptions allow a subset of
	[Markdown formatting](https://help.github.com/articles/github-flavored-markdown/).
	Specifically, you may use the following in configuration setting descriptions:
	
	* **bold** - `**bold**`
	* *italics* - `*italics*`
	* [links](https://atom.io) - `[links](https://atom.io)`
	* `code spans` - `\`code spans\``
	* line breaks - `line breaks<br/>`
	* ~~strikethrough~~ - `~~strikethrough~~`
	
	#### order
	
	The settings view orders your settings alphabetically. You can override this
	ordering with the order key.
	
	```coffee
	config:
	  zSetting:
	    type: 'integer'
	    default: 4
	    order: 1
	  aSetting:
	    type: 'integer'
	    default: 4
	    order: 2
	```
	
	## Manipulating values outside your configuration schema
	
	It is possible to manipulate(`get`, `set`, `observe` etc) values that do not
	appear in your configuration schema. For example, if the config schema of the
	package 'some-package' is
	
	```coffee
	config:
	someSetting:
	  type: 'boolean'
	  default: false
	```
	
	You can still do the following
	
	```coffee
	let otherSetting  = atom.config.get('some-package.otherSetting')
	atom.config.set('some-package.stillAnotherSetting', otherSetting * 5)
	```
	
	In other words, if a function asks for a `key-path`, that path doesn't have to
	be described in the config schema for the package or any package. However, as
	highlighted in the best practices section, you are advised against doing the
	above.
	
	## Best practices
	
	* Don't depend on (or write to) configuration keys outside of your keypath.
	@see <https://github.com/atom/atom/blob/v1.24.0/src/config.coffee#L369>

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
		```Returns a `Disposable` with the following keys on which you can call
		`.dispose()` to unsubscribe.
	**/
	function observe(keyPath:String, ?options:{ /**
		{ScopeDescriptor} describing a path from the root of the syntax tree to a token. Get one by calling {editor.getLastCursor().getScopeDescriptor()}. See {::get} for examples. See [the scopes docs](http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors/) for more information.
	**/
	@:optional
	var scope : ScopeDescriptor; }, callback:haxe.Constraints.Function):Disposable;
	/**
		Add a listener for changes to a given key path. If `keyPath` is
		not specified, your callback will be called on changes to any key.Returns a `Disposable` with the following keys on which you can call
		`.dispose()` to unsubscribe.
	**/
	function onDidChange(?keyPath:String, ?options:{ /**
		{ScopeDescriptor} describing a path from the root of the syntax tree to a token. Get one by calling {editor.getLastCursor().getScopeDescriptor()}. See {::get} for examples. See [the scopes docs](http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors/) for more information.
	**/
	@:optional
	var scope : ScopeDescriptor; }, callback:haxe.Constraints.Function):Disposable;
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
		```Returns the value from Atom's default settings, the user's configuration
		file in the type specified by the configuration schema.
	**/
	function get(keyPath:String, ?options:{ /**
		{Array} of {String} source names. If provided, only values that were associated with these sources during {::set} will be used.
	**/
	@:optional
	var sources : Array<Dynamic>; /**
		{Array} of {String} source names. If provided, values that  were associated with these sources during {::set} will not be used.
	**/
	@:optional
	var excludeSources : Array<Dynamic>; /**
		{ScopeDescriptor} describing a path from the root of the syntax tree to a token. Get one by calling {editor.getLastCursor().getScopeDescriptor()} See [the scopes docs](http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors/) for more information.
	**/
	@:optional
	var scope : ScopeDescriptor; }):Dynamic;
	/**
		Get all of the values for the given key-path, along with their
		associated scope selector.Returns an `Array` of `Object`s with the following keys:
		
		* `scopeDescriptor` The {ScopeDescriptor} with which the value is associated
		* `value` The value for the key-path
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
		```Returns a `Boolean`
		
		* `true` if the value was set.
		* `false` if the value was not able to be coerced to the type specified in the setting's schema.
	**/
	function set(keyPath:String, value:Dynamic, ?options:{ /**
		{String}. eg. '.source.ruby' See [the scopes docs](http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors/) for more information.
	**/
	@:optional
	var scopeSelector : String; /**
		{String} The name of a file with which the setting is associated. Defaults to the user's config file.
	**/
	@:optional
	var source : String; }):Bool;
	/**
		Restore the setting at `keyPath` to its default value.
	**/
	function unset(keyPath:String, ?options:{ /**
		{String}. See {::set}
	**/
	@:optional
	var scopeSelector : String; /**
		{String}. See {::set} 
	**/
	@:optional
	var source : String; }):Void;
	/**
		Get an `Array` of all of the `source` `String`s with which
		settings have been added via {::set}. 
	**/
	function getSources():Void;
	/**
		Retrieve the schema for a specific key path. The schema will tell
		you what type the keyPath expects, and other metadata about the config
		option.Returns an `Object` eg. `{type: 'integer', default: 23, minimum: 1}`.
	**/
	function getSchema(keyPath:String):Dynamic;
	/**
		Get the `String` path to the config file being used. 
	**/
	function getUserConfigPath():Void;
	/**
		Suppress calls to handler functions registered with {::onDidChange}
		and {::observe} for the duration of `callback`. After `callback` executes,
		handlers will be called once if the value for their key-path has changed.
	**/
	function transact(callback:haxe.Constraints.Function):Void;
}