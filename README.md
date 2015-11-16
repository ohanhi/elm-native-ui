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

Currently there is no Android version, but it should be quite straightforward to do that based on index.ios.js. PRs are welcome!


## To Do

- [x] Basic PoC
  - [x] Show something from Elm
  - [x] Make basic VTree work
  - [x] Add some kind of event handlers
- [ ] Styles
  - [x] Basic types for styles
  - [ ] Support object type styles - _transform styles and `shadowOffset`_
  - [ ] Make enum type styles safer - _currently all Strings_
  - [ ] Allow the `StyleSheet.create` method for styles
- [ ] Props
  - [ ] Improve event handlers - _currently uses event handler ids_
  - [ ] Support props besides styles and event handlers
  - [ ] Unify syntax for styles, handlers and other props


## License

[BSD (3-clause)](LICENSE)
