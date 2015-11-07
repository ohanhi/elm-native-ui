/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
var React = require('react-native');
var Elm = require('./elm');
var {AppRegistry, StyleSheet, Text, View} = React;

var program = Elm.worker(Elm.PoC);

function vtreeToReactElement(vtree) {
  return React.createElement(React[vtree.tagName], null,
    vtree.children.map(child => React.createElement(Text, null, child))
  );
}

function componentFactory() {
  return React.createClass({
    componentWillMount() {
      program.ports.vtree.subscribe(vtreeInstance => {
        this.setState({vtree: vtreeInstance})
      })
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
