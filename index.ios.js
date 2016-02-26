/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
var React = require('react-native');
var Elm = require('./elm');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  Image,
} = React;

var program = Elm.worker(Elm.Main, { init: [] });

function vtreeToReactElement(vtree) {
  if (typeof vtree === 'string') {
    return vtree;
  }
  if (vtree.tagName === 'Text') {
    return React.createElement(Text, {
      style: vtree.style,
      onPress: vtree.onPress ?
        program.ports._ReactNativeEventHandlers[vtree.onPress] :
        undefined},
      vtree.children
    );
  } else if (vtree.tagName === 'Image') {
    return React.createElement(Image, {
      style: vtree.style,
      source: {uri: vtree.source},
    });
  }
  return React.createElement(
    React[vtree.tagName],
    { style: vtree.style },
    vtree.children.map(vtreeToReactElement)
  );
}

function componentFactory() {
  return React.createClass({
    componentWillMount() {
      program.ports.viewTree.subscribe(vtree => {
        this.setState({vtree});
        Elm.Native.ReactNative.prepareResetHandlers();
      });
      program.ports.init.send([]);
    },
    getInitialState() {
      return {
        vtree: {tagName: 'View', children: []},
      };
    },
    render() {
      return React.createElement(View, {style: styles.container},
        vtreeToReactElement(this.state.vtree)
      );
    },
  })
}

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

AppRegistry.registerComponent('ElmNative', componentFactory)
