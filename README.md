
# Atom Haxe Type Definitions

> Haxe/Javascript type definitions for the [atom](https://atom.io/docs/api) text editor.

[![Build Status](https://travis-ci.org/tong/hxatom.svg?branch=master)](https://travis-ci.org/tong/hxatom)


## Install

```sh
haxelib install atom
```
Or:


## Usage
See: [example](example)


## Generate Type Definitions

All type definitions are generated from [atom-api.json](electron-api.json) into the [src/](src/) directory.  
To (re)generate type definitions using [another atom version](https://github.com/atom/atom/releases) run:
```sh
haxelib run atom path/to/your/atom-api.json
```
