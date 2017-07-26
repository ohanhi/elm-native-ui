const _ohanhi$elm_native_ui$Native_NativeUi_PushNotificationIOS = function () {
  const { PushNotificationIOS } = require("react-native");

  function register() {
    return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
      PushNotificationIOS.addEventListener('register', token => {
        callback(_elm_lang$core$Native_Scheduler.succeed(token));
      });

      PushNotificationIOS.addEventListener('registrationError', e => {
        callback(_elm_lang$core$Native_Scheduler.fail(e.message));
      });

      PushNotificationIOS.requestPermissions();
    });
  }

  return {
    register,
  };
}();
