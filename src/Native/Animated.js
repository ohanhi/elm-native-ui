var _elm_native_ui$elm_native_ui$Native_Animated = (function () {

  /**
   * Call the interpolate method on the supplied animatedValue
   * documentation: https://facebook.github.io/react-native/docs/animated.html#interpolate
   * source: https://github.com/facebook/react-native/blob/master/Libraries/Animated/src/AnimatedImplementation.js
   */
  function animatedValueInterpolate(animatedValue, config) {
    return animatedValue.interpolate(config);
  }

  return {
    animatedValueInterpolate: F2(animatedValueInterpolate),
  };
}());
