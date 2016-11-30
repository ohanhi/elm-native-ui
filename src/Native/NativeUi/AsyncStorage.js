const _elm_native_ui$elm_native_ui$Native_NativeUi_AsyncStorage = function () {
  const { AsyncStorage } = require("react-native");
  const unit = { ctor: "_Tuple0" };

  function setItem(key, value) {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
      AsyncStorage.setItem(key, value)
        .then(function() {
          return callback(_elm_lang$core$Native_Scheduler.succeed(unit));
        })
        .catch(failWithError(callback));
    });
  }

  function getItem(key) {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
      AsyncStorage.getItem(key)
        .then(function(value) {
          const result = maybe(value);
          return callback(_elm_lang$core$Native_Scheduler.succeed(result));
        })
        .catch(failWithError(callback));
    });
  }

  function removeItem(key) {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
      AsyncStorage.removeItem(key)
        .then(function() {
          return callback(_elm_lang$core$Native_Scheduler.succeed(unit));
        })
        .catch(failWithError(callback));
    });
  }

  function failWithError(callback) {
    return function(e) {
      const errorValue = { ctor: 'Error', _0: e.message };
      return callback(_elm_lang$core$Native_Scheduler.fail(errorValue));
    };
  }

  function maybe(value) {
    if (value) {
      return { ctor: 'Just', _0: value };
    } else {
      return { ctor: 'Nothing' };
    }
  }

  return {
    setItem: F2(setItem),
    getItem: getItem,
    removeItem: removeItem,
  };
}();
