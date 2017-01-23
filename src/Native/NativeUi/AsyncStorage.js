const _ohanhi$elm_native_ui$Native_NativeUi_AsyncStorage = function () {
  const { AsyncStorage } = require("react-native");
  const unit = { ctor: "_Tuple0" };
  const toArray = _elm_lang$core$Native_List.toArray;
  const fromArray = _elm_lang$core$Native_List.fromArray;

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

  function multiGet(keys) {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
      AsyncStorage.multiGet(toArray(keys))
        .then(function(keysWithValues) {
          const result = fromArray(toTupleArray(keysWithValues));
          return callback(_elm_lang$core$Native_Scheduler.succeed(result));
        })
        .catch(failWithError(callback));
    });
  }

  function toTupleArray(keysWithValues) {
    return keysWithValues.map(([key, value]) => {
      return tuple2(key, maybe(value));
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

  function tuple2(a, b) {
    return { ctor: '_Tuple2', _0: a, _1: b };
  }

  return {
    setItem: F2(setItem),
    getItem: getItem,
    removeItem: removeItem,
    multiGet: multiGet,
  };
}();
