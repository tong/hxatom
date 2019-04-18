#!/bin/sh
haxe --macro 'AtomAPI.generate("atom-api.json","src",true)'
haxe haxedoc.hxml
haxe --cwd example build.hxml
rm -f atom.zip
zip -r atom.zip src/ AtomAPI.hx extraParams.hxml haxelib.json README.md -x "*/\.*"
#haxelib submit atom.zip
