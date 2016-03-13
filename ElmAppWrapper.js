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


function componentFactory() {
  return React.createClass({
    componentWillMount() {
      Elm.embedReact(Elm.Main, this);
    },
    getInitialState() {
      return {
        _elmVTree: React.createElement(View, {}, []),
      };
    },
    render() {
      var vtree = this.state._elmVTree;
      console.log('react app rendering vtree: ', vtree);
      return React.createElement(View, {style: styles.container},
        vtree
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

module.exports = componentFactory;
