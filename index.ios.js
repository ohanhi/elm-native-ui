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
  if (typeof vtree === 'string') {
    return vtree;
  }
  if (vtree.tagName === 'Text') {
    return React.createElement(Text, {
      style: vtree.style,
      onPress: vtree.onPress ?
        program.ports._ElNativoEventHandlers[vtree.onPress] :
        undefined},
      vtree.children
    );
  }
  return React.createElement(React[vtree.tagName], null,
    vtree.children.map(vtreeToReactElement)
  );
}

function componentFactory() {
  return React.createClass({
    componentWillMount() {
      program.ports.vtreeOutput.subscribe(vtree => {
        this.setState({vtree})
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
