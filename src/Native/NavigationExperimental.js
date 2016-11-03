var _elm_native_ui$elm_native_ui$Native_NavigationExperimental = (function () {

  var NavigationPagerPanResponder = require('NavigationPagerPanResponder');
  var NavigationPagerStyleInterpolator = require('NavigationPagerStyleInterpolator');

  /**
   * This method calls the ReactNavigationPanResponder to get the pan handlers used to control the animation. The only
   * one that is of interest is onResponderRelease which decides if the onNavigateBack or onNavigateForward functions
   * in the supplied props should be called. In a normal react-native application you would then update the
   * navigation state for the application inside these functions. However, that is outside the normal elm view / update
   * cycle. As a result to get the messages into the update function the onNavigateBack and onNavigateForward functions
   * are wrapped with an update to the getUpdateMessage value which is then evaluated when processing the onResponderRelease
   * event and the message is stored in getUpdateMessage, such that it can then be provided to the apps update function.
   *
   * https://github.com/facebook/react-native/blob/master/Libraries/CustomComponents/NavigationExperimental/NavigationPagerPanResponder.js
   */
  function pagerPanResponderForHorizontal(props, backMsg, forwardMsg) {

    // getUpdateMessage
    function getUpdateMessage() {
      return getUpdateMessage.__message;
    };

    getUpdateMessage.__message = null;

    // onNavigateBack
    function onNavigateBack() {
      getUpdateMessage.__message = backMsg;
      return onNavigateBack.handler();
    }

    onNavigateBack.handler = props.onNavigateBack;
    props.onNavigateBack = onNavigateBack;

    // OnNavigateForward
    function onNavigateForward() {
      getUpdateMessage.__message = forwardMsg;
      return onNavigateForward.handler();
    }

    onNavigateForward.handler = props.onNavigateForward;
    props.onNavigateForward = onNavigateForward;


    // forHorizontal
    var result = NavigationPagerPanResponder.forHorizontal(props);
    result.onResponderRelease.getUpdateMessage = getUpdateMessage;

    return result;
  }

  /**
   * https://github.com/facebook/react-native/blob/master/Libraries/CustomComponents/NavigationExperimental/NavigationPagerStyleInterpolator.js
   */
  function pagerStyleInterpolatorForHorizontal(props) {
    return NavigationPagerStyleInterpolator.forHorizontal(props);
  }

  return {
    pagerPanResponderForHorizontal: F3(pagerPanResponderForHorizontal),
    pagerStyleInterpolatorForHorizontal: pagerStyleInterpolatorForHorizontal
  };
}());
