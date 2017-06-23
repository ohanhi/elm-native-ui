const _ohanhi$elm_native_ui$Native_NativeUi_Alert = function () {
  const { Alert } = require("react-native");
  const toArray = _elm_lang$core$Native_List.toArray;
  const unit = { ctor: "_Tuple0" };

  function alert(title, message, buttons) {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
      const buttonArray = toArray(buttons).map(function(button) {
        const { text, value } = button;

        return {
          text,
          onPress: () => {
            callback(_elm_lang$core$Native_Scheduler.succeed(value));
          },
        };
      });

      Alert.alert(title, message, buttonArray);
    });
  }

  return {
    alert: F3(alert),
  };
}();
