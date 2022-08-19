## Problem 1 (solved)

zkey-manager use packages from apt, therefore require linux 

### Solution

Run Linux in Docker

## Problem 2

parcel-bundler doesn't seem to work on Apple M1 silicon

### Symptoms

``` shell
vscode ➜ /workspaces/zknftmint/web (main ✗) $ npm run serve

> zknftmint-web@1.0.0 serve
> parcel serve src/index.html

Error: No native build was found for platform=linux arch=arm64 runtime=node abi=93 uv=1 armv=8 libc=glibc node=16.16.0
    loaded from: /workspaces/zknftmint/web/node_modules/@parcel/watcher

    at Function.load.path (/workspaces/zknftmint/web/node_modules/node-gyp-build/index.js:59:9)
    at load (/workspaces/zknftmint/web/node_modules/node-gyp-build/index.js:21:30)
    at Object.<anonymous> (/workspaces/zknftmint/web/node_modules/@parcel/watcher/index.js:1:104)
    at Module._compile (/workspaces/zknftmint/web/node_modules/v8-compile-cache/v8-compile-cache.js:192:30)
    at Object.Module._extensions..js (node:internal/modules/cjs/loader:1159:10)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Module.require (node:internal/modules/cjs/loader:1005:19)
    at require (/workspaces/zknftmint/web/node_modules/v8-compile-cache/v8-compile-cache.js:159:20)
    at _watcher (/workspaces/zknftmint/web/node_modules/@parcel/fs/lib/NodeFS.js:79:39)
```

## Build

```shell
docker build --rm -f Dockerfile -t ubuntu:jammy_dev .
```

## Run with current folder as Volume

```shell
docker run --rm -it --name zknftmint --volume `pwd`:/host ubuntu:jammy_dev
```

## Create a new image with all changes (snapshot)

```shell
docker commit 0bd100ca0f8a ubuntu:jammy_dev
```
