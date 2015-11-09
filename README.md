# Elm Native

![](img/elmnative-160.png)

Experimental support for writing [React Native](https://facebook.github.io/react-native/) powered mobile applications in the [Elm language](http://elm-lang.org/).


## Is This Production Ready?

![](img/nothing_to_see_here_naked_gun.gif)

Just to make it totally clear: **No.**


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
