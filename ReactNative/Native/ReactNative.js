Elm.Native.ReactNative = {};
Elm.Native.ReactNative.make = function(localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.ReactNative = localRuntime.Native.ReactNative || {};
    if (localRuntime.Native.ReactNative.values) {
        return localRuntime.Native.ReactNative.values;
    }

    var List = Elm.Native.List.make(localRuntime);
    var Json = Elm.Native.Json.make(localRuntime);
    var Signal = Elm.Native.Signal.make(localRuntime);
    var React = require('react-native');

    function nativeEventHandler(decoder, createMessage) {
        function eventHandler(event) {
            var value = A2(Json.runDecoderValue, decoder, event);
            if (value.ctor === 'Ok') {
                Signal.sendMessage(createMessage(value._0));
            }
        }
        return eventHandler;
    }

    function vtreeToReactElement(vtree) {
      switch (vtree.ctor) {
        case 'VString':
        {
          return vtree._0;
        }
        case 'VNode':
        {
          var tagName = vtree._0;
          var propertyList = vtree._1;
          var childNodes = vtree._2;

          var reactClass = React[tagName];
          var props = propertyListToObject(propertyList);
          var children = List.toArray(childNodes).map(vtreeToReactElement);

          var args = [reactClass, props].concat(children);
          return React.createElement.apply(null, args);
        }
        default:
          throw new Error("I don't know how to render a VTree of type '" + vtree.ctor + "'\n" +
            "If you've recently added a new type of VTree, you must add a new case to\n" +
            "the switch statement in Native.ReactNative.vtreeToReactElement");
      }
    }

    function propertyToObject(property) {
      if (property.ctor !== 'JsonProperty' &&
          property.ctor !== 'NativeProperty') {
        throw new Error("I don't know how to handle a Property of type '" + property.ctor + "'\n" +
          "If you've recently added a new type of Property, you must edit the\n" +
          "function Native.ReactiNative.propertyToObject");
      }

      return {
        key: property._0,
        value: property._1,
      };
    }

    function propertyListToObject(list)
  	{
  		var object = {};
  		while (list.ctor !== '[]')
  		{
  			var entry = propertyToObject(list._0);
  			object[entry.key] = entry.value;
  			list = list._1;
  		}
  		return object;
  	}

    function render(vtree) {
      return vtreeToReactElement(vtree);
    }

    function setReactVTree(reactElement, vtree) {
			var newState = Object.assign({},
				reactElement.state,
				{_elmVTree: vtreeToReactElement(vtree)}
			);

			reactElement.setState(newState);
		}

    function updateAndReplace(containerElement, oldVTree, newVTree) {
      setReactVTree(containerElement, newVTree);
    }


    localRuntime.Native.ReactNative.values = {
        render: render,
        updateAndReplace: updateAndReplace,
        nativeEventHandler: F2(nativeEventHandler),
    };
    return localRuntime.Native.ReactNative.values;
};
