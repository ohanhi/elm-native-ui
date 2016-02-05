# Elm Native

![](img/elmnative-160.png)

Experimental support for writing [React Native](https://facebook.github.io/react-native/) powered mobile applications in the [Elm language](http://elm-lang.org/).


## Is This Production Ready?

![](img/nothing_to_see_here_naked_gun.gif)

Just to make it totally clear: **No.**


## How does this work?

* `PoC.elm` is the main "app" file -- where the actual application lives.
* The `ReactNative` directory contains the Elm module that provides the types and bindings for React Native in Elm
* `index.ios.js` makes the bridging between the compiled-to-JS Elm code and React Native


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
