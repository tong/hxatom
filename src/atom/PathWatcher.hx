package atom;

/**
	Manage a subscription to filesystem events that occur beneath a root directory. Construct these by
	calling `watchPath`. To watch for events within active project directories, use {Project::onDidChangeFiles}
	instead.
**/
@:require(js, atom) @:jsRequire("atom", "PathWatcher") extern class PathWatcher {
	/**
		Return a {Promise} that will resolve when the underlying native watcher is ready to begin sending events.
		When testing filesystem watchers, it's important to await this promise before making filesystem changes that you
		intend to assert about because there will be a delay between the instantiation of the watcher and the activation
		of the underlying OS resources that feed it events.
		
		PathWatchers acquired through `watchPath` are already started.
		
		```js
		const {watchPath} = require('atom')
		const ROOT = path.join(__dirname, 'fixtures')
		const FILE = path.join(ROOT, 'filename.txt')
		
		describe('something', function () {
		  it("doesn't miss events", async function () {
		    const watcher = watchPath(ROOT, {}, events => {})
		    await watcher.getStartPromise()
		    fs.writeFile(FILE, 'contents\n', err => {
		      // The watcher is listening and the event should be
		      // received asynchronously
		    }
		  })
		})
		```
	**/
	function getStartPromise():Void;
	/**
		Invoke a {Function} when any errors related to this watcher are reported.
	**/
	function onDidError(callback:haxe.Constraints.Function):Disposable;
	/**
		Unsubscribe all subscribers from filesystem events. Native resources will be release asynchronously,
		but this watcher will stop broadcasting events immediately.
	**/
	function dispose():Void;
}