
# Atom Haxe Type Definitions

> Haxe/Javascript type definitions for the [atom text editor api](https://atom.io/docs/api)

[![Build Status](https://travis-ci.org/tong/hxatom.svg?branch=master)](https://travis-ci.org/tong/hxatom)


## Install

```sh
# Release version from haxelib:
haxelib install atom
# Development version from git:
haxelib git atom https://github.com/tong/hxatom.git
```


## Usage

 - [Basic example](./example)
 - https://atom.io/packages/clock
 - https://atom.io/packages/videoplayer


## Generate Externs

Haxe externs are generated from the [atom-api.json](atom-api.json)
Do not make changes to the externs itself as they will be overwritten, but edit the [extra/AtomAPI.hx](generator).

```sh
# Rebuild generator (run.n)
haxe run.hxml
# Generate externs
neko run.n [atom-api.json]
```

To use another api version download [atom-api.json](https://github.com/atom/atom/releases) and rebuild.
