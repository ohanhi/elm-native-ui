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
          return vtree._0;
        case 'VNode': {
          let tagName = vtree._0;
          let propertyList = vtree._1;
          let childNodes = vtree._2;

          let reactClass = React[tagName];
          let props = propertyListToJS(propertyList);
          let children = List.toArray(childNodes).map(vtreeToReactElement);

          return React.createElement(reactClass, props, ...children);
        }
      }
    }

    function propertyToJS(property) {
      if (property.ctor !== 'JsonProperty' &&
          property.ctor !== 'NativeProperty') {
        return undefined;
      }

      return {
        key: property._0,
        value: property._1,
      }
    }

    function propertyListToJS(list)
  	{
  		var object = {};
  		while (list.ctor !== '[]')
  		{
  			var entry = propertyToJS(list._0);
        if (entry) {
  			  object[entry.key] = entry.value;
        }
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
