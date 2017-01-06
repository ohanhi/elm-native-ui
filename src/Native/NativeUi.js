var _ohanhi$elm_native_ui$Native_NativeUi = (function () {

  var ReactNative = require('react-native');
  var React = require('react');
  var toArray = _elm_lang$core$Native_List.toArray;

  // PROPS

  /**
   * Declares a message decoder to be run on an event for a particular node
   */
  function on(eventName, decoder) {
    return {
      type: 'event',
      eventName: eventName,
      decoder: decoder
    };
  }

  /**
   * Declares a style attribute for a node, expressed as an inline styles for
   * the moment.
   */
  function style(attrs) {
    return {
      type: 'style',
      sheet: attrs
    };
  }

  /**
   * Declares any other kind of property for a node.
   */
  function property(propName, value) {
    return {
      type: 'prop',
      propName: propName,
      value: value
    };
  }

  function renderProperty(propName, value) {
    return {
      type: 'renderProp',
      propName: propName,
      value: value,
    };
  }

  function unsafeRenderDecodedProperty(propName, decoder, value) {
    return {
      type: 'renderDecodedProp',
      propName: propName,
      value: value,
      decoder: decoder
    };
  }

  // ELEMENTS

  /**
   * A plain string node
   */
  function string(text) {
    return {
      type: 'string',
      string: text
    };
  }

  /**
   * A node that renders a React Native component with props and children
   */
  function node(tagName) {
    return F2(function(factList, childList) {
      return {
        type: 'component',
        tagName: tagName,
        facts: toArray(factList),
        children: toArray(childList)
      };
    });
  }

  /**
   * A node that renders a React Native component with props, but no children.
   * This can improve performance by reducing function calls during
   * tree-building and can allow for optimizations later on as well.
   */
  function voidNode(tagName) {
    return function (factList) {
      return {
        type: 'component',
        tagName: tagName,
        facts: toArray(factList),
        children: []
      };
    };
  }

  /**
   * A non-standard node that renders a React Native component with props and children
   */
  function customNode(tagName, nativeComponent) {
    return F2(function(factList, childList) {
      return {
        type: 'component',
        tagName: tagName,
        facts: toArray(factList),
        children: toArray(childList),
        nativeComponent: nativeComponent
      };
    });
  }

  /**
   * Maps another node onto a different message type
   */
  function map(tagger, node) {
    return {
      type: 'tagger',
      tagger: tagger,
      node: node
    };
  }

  // RENDER

  /**
   * Converts a stack of `on` handlers and `map` nodes into a final function
   * that can be passed into a React Native component's `onSomeEvent` props
   */
  function makeEventHandler(eventNode, decoder) {
    function eventHandler(event) {
      var decoder = eventHandler.decoder;
      var message = decodeValue(eventHandler.decoder, event);

      var currentEventNode = eventNode;
      while (currentEventNode) {
        var tagger = currentEventNode.tagger;

        if (typeof tagger === 'function') {
          message = tagger(message);
        } else {
          for (var i = tagger.length; i--; ) {
            message = tagger[i](message);
          }
        }

        currentEventNode = currentEventNode.parent;
      }
    }

    eventHandler.decoder = decoder;

    return eventHandler;
  }

  /**
   * Converts a fact whose value is a function that renders a subTree into a
   * function that constructs the subTree to render with the provided props.
   * This is used by NavigationExperimental to pass the header and scene views
   * into the component
   */
  function makeRenderNodePropHandler(fact, eventNode, key) {
    function handler(props) {
      return renderTree(handler.component(props), eventNode, key);
    };

    handler.component = fact.value;

    return handler;
  }

  /**
   * Converts a fact whose value is a function that renders a subTree into a
   * function that constructs the subTree to render with the provided props.
   * This is used by NavigationExperimental to pass the header and scene views
   * into the component
   */
  function makeRenderNodeDecodedPropHandler(fact, eventNode, key) {
    function handler(props) {
      var decodedProps = decodeValue(handler.decoder, props);

      return renderTree(handler.component(decodedProps), eventNode, key);
    };

    handler.component = fact.value;
    handler.decoder = fact.decoder;

    return handler;
  }

  /**
   * Decodes properties from elm into json props for react-native
   */
  function decodeValue(decoder, value) {
    var decodedValue = A2(_elm_lang$core$Native_Json.run, decoder, value);

    if (decodedValue.ctor !== 'Ok') {
      throw Error(decodedValue._0);
    }

    return decodedValue._0;
  }

  /**
   * Converts a string node back to a plain string for React Native to render
   */
  function renderString(node) {
    return node.string;
  }

  /**
   * Composes taggers created by `map`
   */
  function renderTagger(node, eventNode, key) {
    var subNode = node.node;
    var tagger = node.tagger;

    while (subNode.type === 'tagger') {
      typeof tagger !== 'object' ?
        tagger = [tagger, subNode.tagger] :
        tagger.push(subNode.tagger);

      subNode = subNode.node;
    }

    var subEventRoot = { tagger: tagger, parent: eventNode };
    return renderTree(subNode, subEventRoot, key);
  }

  /**
   * Converts a component node into an actual React Native node. Builds the
   * children array and props object, looks up the component by name on the
   * React Native module and calls into React.createElement.
   */
  function renderComponent(node, eventNode, key) {
    var children = [];
    for (var i = 0; i < node.children.length; i++) {
      children.push(renderTree(node.children[i], eventNode, i));
    }

    var finalProps = {};

    for (var j = 0; j < node.facts.length; j++) {
      var fact = node.facts[j];

      switch (fact.type) {
        case 'prop':
          finalProps[fact.propName] = fact.value;
          break;

        case 'renderProp':
          finalProps[fact.propName] = makeRenderNodePropHandler(fact, eventNode, key);
          break;

        case 'renderDecodedProp':
          finalProps[fact.propName] = makeRenderNodeDecodedPropHandler(fact, eventNode, key);
          break;
	  
        case 'event':
          finalProps[fact.eventName] = makeEventHandler(eventNode, fact.decoder);
          break;

        case 'style':
          finalProps.style = fact.sheet;
          break;
      }
    }

    if(!finalProps.key) {
      finalProps.key = 'elm-native-ui-auto-added-' + key;
    }

    if (children.length === 1) {
      finalProps.children = children[0];
    } else if (children.length) {
      finalProps.children = children;
    }

    if (ReactNative[node.tagName]) {
      return React.createElement(ReactNative[node.tagName], finalProps);
    } else {
      if (!node.nativeComponent) {
          throw Error('Unable to find a node called ' + node.tagName + ' in ReactNative. Try defining it as a customNode');
      }

      return React.createElement(node.nativeComponent, finalProps);
    }
  }

  /**
   * Renders the whole tree!
   */
  function renderTree(node, eventNode, key) {
    switch (node.type) {
      case 'string':
        return renderString(node);

      case 'tagger':
        return renderTagger(node, eventNode, key);

      case 'component':
        return renderComponent(node, eventNode, key);

    }
  }

  // PROGRAM

  /**
   * Takes am Elm Native UI program implementation and turns into a React
   * component that will begin rendering the virtual tree as soon as the Elm
   * program starts running
   */
  function makeComponent(impl) {
    return React.createClass({
      getInitialState: function getInitialState() {
        return {};
      },

      componentDidMount: function componentDidMount() {
        this.eventNode = { tagger: function() {}, parent: undefined };

        this._app = _elm_lang$core$Native_Platform.initialize(
          impl.init,
          impl.update,
          impl.subscriptions,
          this.renderer
        );
      },

      renderer: function renderer(onMessage, initialModel) {
        this.eventNode.tagger = onMessage;
        this.updateModel(initialModel);
        return this.updateModel;
      },

      updateModel: function updateModel(model) {
        this.setState({ model: model });
      },

      render: function render() {
        // There won't be a model to render right away so we'll check that it
        // exists before trying to call the view function
        return typeof this.state.model !== 'undefined' ?
          renderTree(impl.view(this.state.model), this.eventNode, 0) :
          null;
      }
    });
  }

  /**
   * Makes an Elm program from the standard init, model, update, view
   * specification and adds a function to your module called `start` that,
   * when called in JavaScript-land, will return a React component that you can
   * render or register with the AppRegistry. In the future this function will
   * also deal with decoding flags from JavaScript and setting up debugging
   * facilities. But for now it just returns a `Program Never model msg` that
   * you can pass to `main`.
   */
  function program(impl) {
    return function(flagDecoder) {
      return function(object, moduleName, debugMetadata) {
        object.start = function start() {
          return makeComponent(impl);
        };
      };
    };
  }

  // UTILS

  /**
   * Useful for encoding a Date.Date as a Json.Encode.Value since Date.Date is
   * just a plain JavaScript Date. This can be used for props on things like
   * DatePickerIOS that expect date values.
   */
  function identity(value) {
    return value;
  }

  /**
   * When combined with `Decode.andThen`, creates a decoder for a Date.Date from
   * a plain JavaScript Date. This can be used for event handlers that pass a
   * Date.
   */
  function parseDate(value) {
    if (value instanceof Date) {
      return _elm_lang$core$Native_Json.succeed(value);
    } else {
      return _elm_lang$core$Native_Json.fail('Expected a Date, but did not find one');
    }
  }

  return {
    program: program,
    node: node,
    voidNode: voidNode,
    customNode: F2(customNode),
    string: string,
    map: F2(map),
    on: F2(on),
    style: style,
    property: F2(property),
    renderProperty: F2(renderProperty),
    unsafeRenderDecodedProperty: F3(unsafeRenderDecodedProperty),
    encodeDate: identity,
    parseDate: parseDate
  };
}());
