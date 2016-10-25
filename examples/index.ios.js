const { AppRegistry } = require('react-native');
const Elm = require('./elm');
const component = Elm.Main.start();

AppRegistry.registerComponent('Counter', () => component);
