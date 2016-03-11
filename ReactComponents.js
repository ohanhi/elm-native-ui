module.exports = {
  React: require('react-native'),

  // To render a custom component from elm, you can add it to this object, then write an
  // Elm function that calls ReactNative.node "AppComponents.NameOfComponent".
  //
  // For example, you might set up AppComponents to look like this:
  //
  // AppComponents: {
  //   FancyButton: require('./components/FancyButton'),
  // }
  //
  // Then in elm, you could define a function that will add that component to the view tree:
  //
  // fancyButton : List ReactNative.Property -> List ReactNative.Node -> ReactNative.Node
  // fancyButton =
  //   ReactNative.node "AppComponents.FancyButton"
  //
  // Note that there's nothing special about the name "AppComponents".  You can call it whatever
  // you want, or put your components into multiple container objects, etc.  Whatever name you
  // use here should match what you use in Elm.
  //
  AppComponents: {

  }
};
