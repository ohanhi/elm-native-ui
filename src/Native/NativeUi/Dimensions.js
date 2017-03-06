const _ohanhi$elm_native_ui$Native_NativeUi_Dimensions = function () {
  const { Dimensions } = require('react-native');
  const { height, width } = Dimensions.get('window');

  return {
    windowHeight: height,
    windowWidth: width,
  };
}();
