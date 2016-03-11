Elm.Native.ReactNative = {};
Elm.Native.ReactNative.make = function(localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.ReactNative = localRuntime.Native.ReactNative || {};
    if (localRuntime.Native.ReactNative.values) {
        return localRuntime.Native.ReactNative.values;
    }

    function bundledAsset(path) {
      var BundledAssets = require('BundledAssets');
      return BundledAssets[path];
    }

    localRuntime.Native.ReactNative.values = {
        bundledAsset: bundledAsset
    };
    return localRuntime.Native.ReactNative.values;
};
