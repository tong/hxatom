/*
A mutable text container with undo/redo support and the ability to annotate logical regions in the text.
Construction

::constructor(params)

Event Subscription

::onWillChange(callback)

::onDidChange(callback)

::onDidStopChanging(callback)

::onDidConflict(callback)

::onDidChangeModified(callback)

::onDidUpdateMarkers(callback)

::onDidCreateMarker(callback)

::onDidChangePath(callback)

::onDidChangeEncoding(callback)

::onWillSave(callback)

::onDidSave(callback)

::onDidDelete(callback)

::onWillReload(callback)

::onDidReload(callback)

::onDidDestroy(callback)

::onWillThrowWatchError(callback)

::getStoppedChangingDelay()

File Details

::isModified()

::isInConflict()

::getPath()

::setPath(filePath)

::setEncoding(encoding)

::getEncoding()

::getUri()

Reading Text

::isEmpty()

::getText()

::getTextInRange(range)

::getLines()

::getLastLine()

::lineForRow(row)

::lineEndingForRow(row)

::lineLengthForRow(row)

::isRowBlank(row)

::previousNonBlankRow(startRow)

::nextNonBlankRow(startRow)

Mutating Text

::setText(text)

::setTextViaDiff(text)

::setTextInRange(range, text, [options])

::insert(position, text, [options])

::append(text, [options])

::delete(range)

::deleteRow(row)

::deleteRows(startRow, endRow)

Markers

::markRange(range, properties)

::markPosition(position, properties)

::getMarkers()

::getMarker(id)

::findMarkers(params)

::getMarkerCount()

History

::undo()

::redo()

::transact([groupingInterval], fn)

::clearUndoStack()

::createCheckpoint()

::revertToCheckpoint()

::groupChangesSinceCheckpoint()

Search And Replace

::scan(regex, iterator)

::backwardsScan(regex, iterator)

::scanInRange(regex, range, iterator)

::backwardsScanInRange(regex, range, iterator)

::replace(regex, replacementText)

Buffer Range Details

::getRange()

::getLineCount()

::getLastRow()

::getFirstPosition()

::getEndPosition()

::getMaxCharacterIndex()

::rangeForRow(row, includeNewline)

::characterIndexForPosition(position)

::positionForCharacterIndex(offset)

::clipRange(range)

::clipPosition(position)

Buffer Operations

::save()

::saveAs(filePath)

::reload()

*/
