var _elm_native_ui$elm_native_ui$Native_NativeUi = (function () {

  var ReactNative = require('react-native');
  var React = require('react');

  // PROPS

  function on(eventName, decoder) {
    return {
      type: 'event',
      eventName: eventName,
      decoder: decoder
    };
  }

  function property(propName, value) {
    return {
      type: 'prop',
      propName: propName,
      value: value
    };
  }

  function style(attrs) {
    return {
      type: 'style',
      sheet: attrs
    };
  }

  // ELEMENTS

  function organizeFacts(facts) {
    var head = facts;
    var output = [];
    while (head.ctor !== '[]') {
      output.push(head._0);
      head = head._1;
    }
    return output;
  }

  function organizeChildren(children) {
    var head = children;
    var output = [];
    while(head.ctor !== '[]') {
      output.push(head._0);
      head = head._1;
    }
    return output;
  }

  function string(text) {
    return {
      type: 'string',
      string: text
    };
  }

  function node(tagName) {
    return F2(function(factList, childList) {
      return {
        type: 'node',
        tagName: tagName,
        facts: organizeFacts(factList),
        children: organizeChildren(childList)
      };
    });
  }

  function voidNode(tagName) {
    return function (factList) {
      return {
        type: 'node',
        tagName: tagName,
        facts: organizeFacts(factList),
        children: []
      };
    };
  }

  function map(tagger, node) {
    return {
      type: 'tagger',
      tagger: tagger,
      node: node
    };
  }

  // RENDER

  function makeEventHandler(eventNode, decoder) {
    function eventHandler(event) {
      var decoder = eventHandler.decoder;
      var value = A2(_elm_lang$core$Native_Json.run, decoder, event);

      if (value.ctor !== 'Ok') {
        return;
      }

      var message = value._0;
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


  function treeToReactNative(node, eventNode) {
    switch (node.type) {
      case 'string':
        return node.string;

      case 'tagger':
        var subNode = node.node;
        var tagger = node.tagger;

        while (subNode.type === 'tagger') {
          typeof tagger !== 'object' ?
            tagger = [tagger, subNode.tagger] :
            tagger.push(subNode.tagger);

          subNode = subNode.node;
        }

        var subEventRoot = { tagger: tagger, parent: eventNode };
        return treeToReactNative(subNode, subEventRoot);

      case 'node':
        var children = [];
        for (var i = 0; i < node.children.length; i++) {
          children.push(treeToReactNative(node.children[i], eventNode));
        }

        var finalProps = {};

        for (var i = 0; i < node.facts.length; i++) {
          var fact = node.facts[i];
          switch (fact.type) {
            case 'prop':
              finalProps[fact.propName] = fact.value;
              break;

            case 'event':
              finalProps[fact.eventName] = makeEventHandler(eventNode, fact.decoder);
              break;

            case 'style':
              finalProps.style = fact.sheet;
              break;
          }
        }

        if (children.length === 1) {
          finalProps.children = children[0];
        } else if (children.length) {
          finalProps.children = children;
        }

        return React.createElement(ReactNative[node.tagName], finalProps);
    }
  }

  // PROGRAM

  function makeComponent(impl) {
    var noValue = {};

    return React.createClass({
      getInitialState() {
        return { model: noValue };
      },

      componentDidMount() {
        var self = this;
        this.eventNode = { tagger: function() {}, parent: undefined };

        function renderer(onMessage, initialModel) {
          self.eventNode.tagger = onMessage;
          self.updateModel(initialModel);
          return function (model) {
            self.updateModel(model);
          };
        }

        this._app = _elm_lang$core$Native_Platform.initialize(
          impl.init,
          impl.update,
          impl.subscriptions,
          renderer
        );

        if (typeof this.onAppReady === 'function') {
          this.onAppReady(this._app);
        }
      },

      updateModel(model) {
        this.setState({ model: model });
      },

      render() {
        return this.state.model !== noValue ?
          treeToReactNative(impl.view(this.state.model), this.eventNode) :
          null;
      }
    });
  }

  function program(impl) {
    return function(flagDecoder) {
      return function(object, moduleName, debugMetadata) {
        object.start = function start() {
          return makeComponent(impl);
        };
      };
    };
  };

  function identity(value) {
    return value;
  }

  function parseDate(value) {
    if (value instanceof Date) {
      return _elm_lang$core$Native_Json.succeed(value);
    } else {
      return _elm_lang$core$Native_Json.fail('Expected a Date, but did not find one');
    }
  }

  function toIsoString(date) {
    return date.toISOString();
  }

  return {
    program: program,
    node: node,
    voidNode: voidNode,
    string: string,
    map: F2(map),
    on: F2(on),
    style: style,
    property: F2(property),
    encodeDate: identity,
    parseDate: parseDate,
    toIsoString: toIsoString
  };
}());
