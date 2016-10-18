package atom;

import atom.TextEditor;

@:native("DisplayMarkerLayer")
extern class DisplayMarkerLayer {

	// Lifecycle

	function destroy() : Void;
	function isDestroyed() : Bool;

	// Event Subscription

	function onDidDestroy() : Disposable;
	function onDidUpdate( callback : Void->Void ) : Disposable;
	function onDidCreateMarker( callback : DisplayMarker->Void ) : Disposable;

	// Marker creation

	function markScreenRange( range : Range, options : {?reversed:Bool,?invalidate:InvalidationStrategy,exclusive:Bool,clipDirection:ClipDirection} ) : DisplayMarker;
	function markScreenPosition( screenPosition : Range, ?options : {?invalidate:InvalidationStrategy,exclusive:Bool,clipDirection:ClipDirection} ) : DisplayMarker;
	function markBufferRange( range : Range, options : {?reversed:Bool,?invalidate:InvalidationStrategy,exclusive:Bool} ) : DisplayMarker;
	function markBufferPosition( bufferPosition : Point, ?options : {?invalidate:InvalidationStrategy,exclusive:Bool} ) : DisplayMarker;

	// Querying

	function getMarker() : DisplayMarker;
	function getMarkers() : Array<DisplayMarker>;
	function getMarkerCount() : Int;
	function findMarkers( properties : {
		?startBufferPosition : Point,
		?endBufferPosition : Point,
		?startScreenPosition : Point,
		?endScreenPosition : Point,
		?startBufferRow : Point,
		?endBufferRow : Point,
		?startScreenRow : Point,
		?endScreenRow : Point,
		?intersectsBufferRowRange : Range,
		?intersectsScreenRowRange : Range,
		?containsBufferRange : Range,
		?containsBufferPosition : Point,
		?containedInBufferRange : Range,
		?containedInScreenRange : Range,
		?intersectsBufferRange : Range,
		?intersectsScreenRange : Range
	} ) : Array<DisplayMarker>;

}
