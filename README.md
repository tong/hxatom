
# Atom Haxe Type Definitions

> Haxe/Javascript type definitions for the [atom text editor api](https://atom.io/docs/api)

[![Build Status](https://travis-ci.org/tong/hxatom.svg?branch=master)](https://travis-ci.org/tong/hxatom)


## Install

```sh
haxelib git atom https://github.com/tong/hxatom.git
```


## Generate Type Definitions

All type definitions are generated from [atom-api.json](atom-api.json) to the [src/](src/) directory by [extra/AtomAPI.hx](extra/AtomAPI.hx).  
To (re)generate type definitions using [another atom version](https://github.com/atom/atom/releases) run:
```sh
haxelib run atom path/to/your/atom-api.json
```


## Usage
See: [example](example)
