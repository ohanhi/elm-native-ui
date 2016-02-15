# Elm Native UI

![](img/elm-native-160.png)

Experimental support for writing native iOS and Android applications in the beautiful functional [Elm language](http://elm-lang.org/).
This project builds on Facebook's [React Native](https://facebook.github.io/react-native/), using it as the JavaScript environment for Elm.


## Is This Production Ready?

**No.**


## How does this work?

* `PoC.elm` is the main "app" file -- where the actual application lives.
* The `ReactNative` directory contains the Elm module that provides the types and bindings for React Native in Elm
* `index.ios.js` makes the bridging between the compiled-to-JS Elm code and React Native


## Major blockers?

The [Navigator](https://facebook.github.io/react-native/docs/navigator.html#content) in React Native is tricky. It manages state, and expects callback functions for several different things. It also has methods that [mutate the state](https://facebook.github.io/react-native/docs/navigator.html#navigator-methods).

For Elm Native UI to really be useable for bigger apps, we need to solve how to interface with the Navigator. As of now, I (ohanhi) am learning React Native with React and Redux in order to gain better understanding of the whole architecture.


## Screenshots

iOS | Android
----|--------
![](img/screenshot-ios.png) | ![](img/screenshot-android.png)

## To Do

- [x] Basic PoC
  - [x] Show something from Elm
  - [x] Make basic VTree work
  - [x] Add some kind of event handlers
- [ ] Library
  - [ ] Make `main` support our VTree ([see this suggestion](https://github.com/ohanhi/elm-native/commit/0a35edeb0c21985394b6f3b296140da431aa936c#commitcomment-14303291))
- [ ] Styles
  - [x] Basic types for styles
  - [x] Support object type styles - _transform styles and `shadowOffset`_
  - [ ] Make enum type styles safer - _currently all Strings_
  - [ ] Allow the `StyleSheet.create` method for styles
- [ ] Props
  - [ ] Improve event handlers - _currently uses event handler ids_
  - [ ] Support props besides styles and event handlers
  - [ ] Unify syntax for styles, handlers and other props


## License

[BSD (3-clause)](LICENSE)
