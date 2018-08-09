package atom;
/**
	Manage a subscription to filesystem events that occur beneath a root directory. Construct these by
	calling `watchPath`. To watch for events within active project directories, use `Project.onDidChangeFiles`
	instead.
	
	Multiple PathWatchers may be backed by a single native watcher to conserve operation system resources.
	
	Call {::dispose} to stop receiving events and, if possible, release underlying resources. A PathWatcher may be
	added to a {CompositeDisposable} to manage its lifetime along with other `Disposable` resources like event
	subscriptions.
	
	```js
	const {watchPath} = require('atom')
	
	const disposable = await watchPath('/var/log', {}, events => {
	  console.log(`Received batch of ${events.length} events.`)
	  for (const event of events) {
	    // "created", "modified", "deleted", "renamed"
	    console.log(`Event action: ${event.action}`)
	
	    // absolute path to the filesystem entry that was touched
	    console.log(`Event path: ${event.path}`)
	
	    if (event.action === 'renamed') {
	      console.log(`.. renamed from: ${event.oldPath}`)
	    }
	  }
	})
	
	 // Immediately stop receiving filesystem events. If this is the last
	 // watcher, asynchronously release any OS resources required to
	 // subscribe to these events.
	 disposable.dispose()
	```
	
	`watchPath` accepts the following arguments:
	
	`rootPath` `String` specifies the absolute path to the root of the filesystem content to watch.
	
	`options` Control the watcher's behavior. Currently a placeholder.
	
	`eventCallback` `Function` to be called each time a batch of filesystem events is observed. Each event object has
	the keys: `action`, a `String` describing the filesystem action that occurred, one of `"created"`, `"modified"`,
	`"deleted"`, or `"renamed"`; `path`, a `String` containing the absolute path to the filesystem entry that was acted
	upon; for rename events only, `oldPath`, a `String` containing the filesystem entry's former absolute path.
	
	@see https://github.com/atom/atom/blob/v1.29.0/src/path-watcher.js#L340
**/
@:jsRequire("atom", "PathWatcher") extern class PathWatcher {
	/**
		Return a `Promise` that will resolve when the underlying native watcher is ready to begin sending events.
		When testing filesystem watchers, it's important to await this promise before making filesystem changes that you
		intend to assert about because there will be a delay between the instantiation of the watcher and the activation
		of the underlying OS resources that feed its events.
		
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
		Invoke a `Function` when any errors related to this watcher are reported.
	**/
	function onDidError(callback:haxe.Constraints.Function):atom.Disposable;
	/**
		Unsubscribe all subscribers from filesystem events. Native resources will be released asynchronously,
		but this watcher will stop broadcasting events immediately.
	**/
	function dispose():Void;
}