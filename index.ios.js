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

// Patch Elm.Native.VirtualDom.render to set the state of our AppWrapper component

function patchElmVDom(reactAppComponent) {
  // Patch VirtualDom render functions
  Elm.Native.VirtualDom = Elm.Native.VirtualDom || {};
  var VDomMake = Elm.Native.VirtualDom.make || function() { return {}; };
  Elm.Native.VirtualDom.make = function(localRuntime) {
    var VirtualDom = VDomMake(localRuntime);

    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.VirtualDom = localRuntime.Native.VirtualDom || {};
    var values = localRuntime.Native.VirtualDom.values || {};

    function render(state) {
      console.log('rendering new state: ', state);
      reactAppComponent.setState({vdom: state});
      return reactAppComponent;
    }

    function updateAndReplace(elem, oldState, newState) {
      return render(newState);
    }

    localRuntime.Native.VirtualDom.values = Object.assign({}, values, {
      render: render,
      updateAndReplace: updateAndReplace,
      patchedForReactNative: true,
    });

    return localRuntime.Native.VirtualDom.values;
  }
}



var AppWrapper = React.createClass({
  componentWillMount() {
    patchElmVDom(this);
    Elm.fullscreen(Elm.Main, {init: []})
  },

  getInitialState() {
    return {vdom: null};
  },

  render() {
    var vdom = this.state.vdom;
    return React.createElement(View, {style: styles.container},
      vDomToReactElement(vdom)
    );
  }
});


function vDomToReactElement(vdomNode) {
  if (!vdomNode) {
    return undefined;
  }

  if (typeof(vdomNode.text) === 'string') {
    return vdomNode.text;
  }

  var {tagName, properties, key} = vdomNode;
  properties = {...properties, key};
  var children = vdomNode.children || [];
  children = children.map(vDomToReactElement);
  return React.createElement(React[tagName], properties, ...children);
}



var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});


AppRegistry.registerComponent('ElmNative', () => AppWrapper);
