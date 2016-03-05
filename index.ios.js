/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image,
} = React;

var Elm = require('./elm');

// Provide minimal 'document' for Elm.fullscreen to hook into
var dummyNode = {
  appendChild: function() {}
}

global.document = {
  body: dummyNode,

  createElement: function() {
    return dummyNode;
  },
  createTextNode(text) {
    console.log("createTextNode: ", text);
  }
 };


// Patch VirtualDom render functions
Elm.Native.VirtualDom = Elm.Native.VirtualDom || {};
var VDomMake = Elm.Native.VirtualDom.make || function() { return {}; };
Elm.Native.VirtualDom.make = function(localRuntime) {
  var VirtualDom = VDomMake(localRuntime);

  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.VirtualDom = localRuntime.Native.VirtualDom || {};
  var values = localRuntime.Native.VirtualDom.values || {};
  if (values && values.patchedForReactNative) {
    return values;
  }

  function render(model) {
    console.log('foo! render called with model: ', model);
    AppRegistry.registerComponent('ElmNative', componentFactory(model));
  }

  function updateAndReplace(a, b) {
    console.log('updateAndReplace called: ', a, b);
  }

  localRuntime.Native.VirtualDom.values = Object.assign({}, values, {
    render: render,
    updateAndReplace: updateAndReplace,
    patchedForReactNative: true,
  });

  return localRuntime.Native.VirtualDom.values;
}

var program = Elm.fullscreen(Elm.Main, { init: [] });

function vDomToReactElement(vdomNode) {
  if (typeof(vdomNode.text) === 'string') {
    return vdomNode.text;
  }

  var {tagName, properties, key, children} = vdomNode;
  properties = {...properties, key};
  children = children.map(vDomToReactElement);
  return React.createElement(React[tagName], properties, ...children);
}

function componentFactory(model) {
  return () => {
    return React.createClass({
      render() {
        return React.createElement(View, {style: styles.container},
          vDomToReactElement(model)
        );
      },
    });
  }
}

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
