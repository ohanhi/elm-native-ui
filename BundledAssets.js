/*
 * The providesModule directive makes this file available to `require` using an absolute path.
 * This lets us require it from Elm 'Native' code, so we can pull the bundled assets out and
 * pass them into Elm without having to rely on `elm.js` always being at the project root.
 *
  @providesModule BundledAssets
 */

module.exports = {
  'elm-native-160.png': require('./img/elm-native-160.png'),
  'waiting.gif': require('./img/waiting.gif'),
}
