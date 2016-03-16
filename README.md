# Elm Native UI

![](img/elm-native-160.png)

Experimental support for writing native iOS and Android applications in the beautiful functional [Elm language](http://elm-lang.org/).
This project builds on Facebook's [React Native](https://facebook.github.io/react-native/), using it as the JavaScript environment for Elm.


## Is This Production Ready?

No.


## Get it running


### Caution: Experimental software!

The newest version of Elm Native UI depends on

- [modified Elm compiler](https://github.com/NoRedInk/elm-compiler/tree/elm-native-ui) ([ZIP](https://github.com/NoRedInk/elm-compiler/archive/elm-native-ui.zip)) &mdash; Must be on your `PATH` before the standard elm-compiler. You will need to [build the compiler from source](https://github.com/NoRedInk/elm-compiler/tree/elm-native-ui#build-from-source--contribute) yourself for now.

- [modified elm-core](https://github.com/yusefnapora/core/tree/elm-native-ui) ([ZIP](https://github.com/yusefnapora/core/archive/elm-native-ui.zip)) &mdash; Must replace the `elm-stuff/packages/elm-lang/core/3.0.0` directory in your project.

The modified compiler will allow our React Native "Virtual Tree", or `VTree` for short, to pass through `main`, just like `Html` from elm-html does.

The modified elm-core adds a function to enable rendering for the VTree type.

_If you clone the repositories yourself, make sure you checkout the elm-native-ui branch on each of them before using._


### Actually getting it running

Install React Native following [their guide](https://facebook.github.io/react-native/docs/getting-started.html#content). Check that you can create a new project with `react-native init AwesomeProject` and try running it on a real or virtual device.

Once that's out of the way, clone this repository and in the directory:

```bash
# install dependencies
$ npm install
# compile Elm with
$ npm run compile
# run app on iOS
$ react-native run-ios
# or run on Android
$ react-native run-android
```

When you make changes to the code, you only need to recompile Elm and press Cmd-R on the Simulator (iOS) or emulator (Android).

If you wish, you can also start a file watcher for \*.elm files, which will recompile whenever you make a change:

```bash
$ npm start
```


## How it works

* `Main.elm` is the main "app" file -- where the actual application lives.
* The `ReactNative` directory contains the Elm module that provides the types and bindings for React Native in Elm
* `index.ios.js` makes the bridging between the compiled-to-JS Elm code and React Native

For more insight, read this blog post: [Elm Native UI: Writing a React Native app in Elm](http://ohanhi.github.io/elm-native-ui.html)


## Major blockers

The "traditional" [Navigator](https://facebook.github.io/react-native/docs/navigator.html#content) in React Native is tricky. It manages state, and expects callback functions for several different things. It also has methods that [mutate the state](https://facebook.github.io/react-native/docs/navigator.html#navigator-methods).

Elm Native UI was just updated to use React Native 0.21.0, which brings a more functional navigation model: [NavigationExperimental](https://github.com/facebook/react-native/commit/a3085464f6ea36fc6b53cd0c711c048ffb1516f9). We'll see how that works for us.


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
