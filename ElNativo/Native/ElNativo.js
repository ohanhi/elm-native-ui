Elm.Native.ElNativo = {};
Elm.Native.ElNativo.make = function(localRuntime) {

    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.ElNativo = localRuntime.Native.ElNativo || {};
    if (localRuntime.Native.ElNativo.values) {
        return localRuntime.Native.ElNativo.values;
    }

    var Json = Elm.Native.Json.make(localRuntime);
    var Signal = Elm.Native.Signal.make(localRuntime);

    var eventHandlerCount = 0;
    localRuntime.ports._ElNativoEventHandlers = {};

    function on(decoder, createMessage) {
        function eventHandler(event) {
            var value = A2(Json.runDecoderValue, decoder, event);
            if (value.ctor === 'Ok') {
                Signal.sendMessage(createMessage(value._0));
            }
        }
        localRuntime.ports._ElNativoEventHandlers[++eventHandlerCount] = eventHandler;
        return eventHandlerCount;
    }

    localRuntime.Native.ElNativo.values = {
        on: F2(on),
    };
    return localRuntime.Native.ElNativo.values;
};