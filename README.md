
# HXAtom

Haxe type definitions for [atom](https://atom.io/docs/api), a hackable text editor for the 21st Century.

[![Build Status](https://travis-ci.org/tong/hxatom.svg?branch=master)](https://travis-ci.org/tong/hxatom) [![Haxelib Version](https://img.shields.io/github/tag/tong/hxatom.svg?style=flat-square&colorA=EA8220&colorB=FBC707&label=haxelib)](http://lib.haxe.org/p/atom/)


## Install

```sh
# Release version from haxelib
haxelib install atom

# Development version from git
haxelib git atom https://github.com/tong/hxatom.git
```


## Build

Haxe externs are generated from the [atom-api.json](atom-api.json) description file.  
To (re)generate the type definitons for another atom version, download the description file from https://github.com/atom/atom/releases and run:
```sh
haxe --macro AtomAPI.generate("path/to/atom-api.json")
```
By default `hxatom/atom-api.json` is used if you ommit the path argument to your custom description file.


## Usage

 - [Basic example package](./example)
 - https://atom.io/packages/clock
 - https://atom.io/packages/videoplayer
