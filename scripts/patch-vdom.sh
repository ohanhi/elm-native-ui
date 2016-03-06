#!/bin/bash

# path to script dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# path to elm-stuff/packages/evancz/virtual-dom
VDOM_DIR="$DIR/../elm-stuff/packages/evancz/virtual-dom"

# path to built Native/VirtualDom.js, relative to package root
VDOM_JS="src/Native/VirtualDom.js"

# globally replace 'require' with '_browserify_require' in VirtualDom.js
# Uses a '*' glob to match against whatever specific version is installed
perl -p -i -e 's/\brequire\b/_browserify_require/g' "$VDOM_DIR"/*/$VDOM_JS
