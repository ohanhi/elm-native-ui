/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
var React = require('react-native');
var Elm = require('./elm');
var {AppRegistry, StyleSheet, Text, View} = React;

var program = Elm.worker(Elm.PoC);

function componentFactory() {
  return React.createClass({
    componentWillMount() {
      program.ports.seconds.subscribe(s => {
        this.setState({s: s})
      })
    },
    getInitialState() {
      return {s: 0}
    },
    render() {
      return (
        <View style={styles.container}>
          <Text style={styles.welcome}>
            This is Elm Native
          </Text>
          <Text style={styles.instructions}>
            This comes straight from Elm: {this.state.s}
          </Text>
          <Text style={styles.instructions}>
            Press Cmd+R to reload,{'\n'}
            Cmd+D or shake for dev menu
          </Text>
        </View>
      )
    },
  })
}

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('ElmNative', componentFactory)
