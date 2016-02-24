Elm.Native.ReactNative = {};
Elm.Native.ReactNative.make = function(localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.ReactNative = localRuntime.Native.ReactNative || {};
    if (localRuntime.Native.ReactNative.values) {
        return localRuntime.Native.ReactNative.values;
    }

    var Json = Elm.Native.Json.make(localRuntime);
    var Signal = Elm.Native.Signal.make(localRuntime);

    var prepareReset = true;
    var eventHandlerCount = 0;
    localRuntime.ports._ReactNativeEventHandlers = {};

    function on(decoder, createMessage) {
        if(prepareReset){
            eventHandlerCount = 0;
            localRuntime.ports._ReactNativeEventHandlers = {};
        }

        function eventHandler(event) {
            var value = A2(Json.runDecoderValue, decoder, event);
            if (value.ctor === 'Ok') {
                Signal.sendMessage(createMessage(value._0));
            }
        }
        localRuntime.ports._ReactNativeEventHandlers[++eventHandlerCount] = eventHandler;
        prepareReset = false;
        return eventHandlerCount;
    }

    Elm.Native.ReactNative.prepareResetHandlers = function () {
        prepareReset = true;
    }

    localRuntime.Native.ReactNative.values = {
        on: F2(on),
    };
    return localRuntime.Native.ReactNative.values;
};
