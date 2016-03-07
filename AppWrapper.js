'use strict';
var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

var Elm = require('./elm');

// Provide minimal 'document' for Elm.fullscreen to hook into
var dummyNode = {
  appendChild: function() {}
}

global.document = global.document || {
  body: dummyNode,

  createElement: function() {
    return dummyNode;
  },

  createTextNode(text) {
    console.log("createTextNode: ", text);
  }
 };

// Returns a `make` function that will patch the local elm runtime and
// replace the `render` and `update` functions in localRuntime.Native.VirtualDom
// with implementations that call `setState` on the `AppWrapper` component instance

function runtimePatcher(appWrapperInstance) {
  function make(localRuntime) {
    function render(state) {
      console.log('rendering new state: ', state);
      appWrapperInstance.setState({vdom: state});
      return appWrapperInstance;
    }

    function updateAndReplace(elem, oldState, newState) {
      return render(newState);
    }

    var VirtualDom = Elm.Native.VirtualDom.make(localRuntime);
    localRuntime.Native.VirtualDom.values = {
      ...VirtualDom,
      render: render,
      updateAndReplace: updateAndReplace,
      patchedForReactNative: true,
    };

    return Elm.Main.make(localRuntime);
  }

  return make;
}


const AppWrapper = React.createClass({
  componentWillMount() {
    Elm.fullscreen({make: runtimePatcher(this)});
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

export default AppWrapper;
