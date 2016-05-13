# Elm Native UI

![](img/elm-native-160.png)

Experimental support for writing native iOS and Android applications in the beautiful functional [Elm language](http://elm-lang.org/).
This project builds on Facebook's [React Native](https://facebook.github.io/react-native/), using it as the JavaScript environment for Elm.


## Is This Production Ready?

No.


## Get it running


### Caution: Experimental software!

The newest version of Elm Native UI depends on

- [modified Elm compiler](https://github.com/elm-native-ui/elm-compiler/) &mdash; **Must be on your `PATH`** before the standard `elm-make`. There is a [pre-built `elm-make`](https://github.com/elm-native-ui/elm-compiler/blob/master/built/elm-make?raw=true) for OS X 64-bit. For other platforms you will need to build the compiler from source yourself for now.

- [modified core](https://github.com/elm-native-ui/core/) &mdash; Must replace the `elm-lang/core` package in your project.

The modified compiler will allow our `NativeUi` type to pass through `main`, and the modified core enables rendering for it.


### Actually getting it running

Install React Native following [their guide](https://facebook.github.io/react-native/docs/getting-started.html#content). Check that you can create a new project:

```bash
$ react-native init MyAppName
```

and try running it on a real or virtual device.

Once that works, clone this repository and the [modified core](https://github.com/elm-native-ui/core/) in the same directory where you ran `react-native init` in. You should have a directory structure similar to this:

```
--|
  -- core
  |
  -- elm-native-ui
  |
  -- MyAppName
```

Go ahead and copy the files from the [`examples`](examples) in your React Native app directory now.

Now try to compile the Elm code with

```bash
$ npm run compile
```

This will create the `elm-package.json` and `elm-stuff` for you, even though it won't compile yet.

Edit the `index.*.js` files' last lines in case your React Native app is not called 'MyAppName' at this point. You may also need to rename the project in the `package.json` file.

We will then use [elm_self_publish](https://github.com/NoRedInk/elm-ops-tooling#elm_self_publish) to publish the Elm packages into our project.

Assuming we're in the parent directory where `core` and `elm-native-ui` reside, and that `elm_self_publish.py` is in that same directory:

```bash
$ python elm_self_publish.py ./core ./MyAppName
$ python elm_self_publish.py ./elm-native-ui ./MyAppName
```

Now we are ready to rock! 🤘🎸

Just to list out the basics:

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

When you make changes to the code, you only need to recompile Elm and press Cmd-R on the Simulator (iOS) or refresh the emulator (Android).

If you wish, you can also start a file watcher for \*.elm files, which will recompile whenever you make a change:

```bash
$ npm start
```


## How it works

This section was outdated, but for an overview of the older structure, read this blog post: [Elm Native UI: Writing a React Native app in Elm](http://ohanhi.github.io/elm-native-ui.html)

You can also watch this [ElmCast Live episode](https://www.livecoding.tv/elmcast/videos/JjbOK-elmcast-live-2), where @ohanhi explains some of the differences between the old and the new versions. (You can safely skip the first 5 minutes, as we had technical issues in the beginning.)


## Screenshots

iOS | Android
----|--------
![](img/screenshot-ios.png) | ![](img/screenshot-android.png)

## To Do

- [x] Basic PoC
  - [x] Show something from Elm
  - [x] Make basic VTree work
  - [x] Add some kind of event handlers
- [x] Library
  - [x] Make `main` support our VTree ([see this suggestion](https://github.com/ohanhi/elm-native/commit/0a35edeb0c21985394b6f3b296140da431aa936c#commitcomment-14303291))
- [ ] Styles
  - [x] Basic types for styles
  - [x] Support object type styles - _transform styles and `shadowOffset`_
  - [x] Make enum type styles safer
  - [ ] Allow the `StyleSheet.create` method for styles
- [x] Props
  - [x] Improved event handlers
  - [x] Support props besides styles and event handlers
  - [x] Unify syntax for styles, handlers and other props
- [ ] Core features
  - [ ] Navigation (NavigationExperimental)
  - [ ] Tasks (HTTP calls, storage)
  - [ ] UIExplorer / Component examples

## License

[BSD (3-clause)](LICENSE)
