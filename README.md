
# Atom Haxe Type Definitions

> Haxe/Javascript type definitions for the [atom](https://atom.io/docs/api) text editor api.

[![Build Status](https://travis-ci.org/tong/hxatom.svg?branch=master)](https://travis-ci.org/tong/hxatom)


## Install

```sh
haxelib git atom https://github.com/tong/hxatom.git
```


## Generate Type Definitions

All type definitions are generated from [atom-api.json](electron-api.json) into the [src/](src/) directory.  
To (re)generate type definitions using [another atom version](https://github.com/atom/atom/releases) run:
```sh
haxelib run atom path/to/your/atom-api.json
```


## Usage
See: [example](example)
