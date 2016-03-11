'use strict';
require('./browser-polyfills');


const React = require('react-native');
const {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;

const Elm = require('./elm');
const ReactComponents = require('./ReactComponents');

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
    let vdom = this.state.vdom;
    return React.createElement(View, {style: styles.container},
      vDomToReactElement(vdom)
    );
  }
});


function getNested(obj, path) {
  if (typeof(obj) !== 'object' || typeof(path) !== 'string') {
    return undefined;
  }
  let pathComponents = path.split('.');
  while (typeof(obj) === 'object') {
    let p = pathComponents.shift();
    obj = obj[p];
  }
  return obj;
}

function vDomToReactElement(vdomNode) {
  if (!vdomNode) {
    return undefined;
  }

  if (typeof(vdomNode.text) === 'string') {
    return vdomNode.text;
  }

  let {tagName, properties, key} = vdomNode;
  properties = {...properties, key};
  let children = vdomNode.children || [];
  children = children.map(vDomToReactElement);
  let reactClass = getNested(ReactComponents, tagName);
  return React.createElement(reactClass, properties, ...children);
}



const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default AppWrapper;
