module NativeUi.Handlers (..) where

{-| elm-native-ui Handlers

@docs onLayout, onPress, onLoadStart, onProgress, onError, onLoad, onLoadEnd,
onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange,
 onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange,
 onSegmentedControlValueChange, onChange, onSliderValueChange,
 onSlidingComplete, onSwitchValueChange, onBlur, onFocus, onChangeText,
 onEndEditing, onSelectionChange, onSubmitEditing, onKeyPress, onActionSelected,
 onIconClicked, onAccessibilityTap, onMagicTap, onResponderGrant,
 onResponderMove, onResponderReject, onResponderRelease, onResponderTerminate,
 onResponderTerminationRequest, onStartShouldSetResponder,
 onStartShouldSetResponderCapture, onMoveShouldSetResponder,
 onMoveShouldSetResponderCapture
-}

import Json.Decode
import NativeUi exposing (Property, on)


onLayout : Signal.Address a -> a -> Property
onLayout address action =
  on "Layout" Json.Decode.value (\_ -> Signal.message address action)


onPress : Signal.Address a -> a -> Property
onPress address action =
  on "Press" Json.Decode.value (\_ -> Signal.message address action)


onLoadStart : Signal.Address a -> a -> Property
onLoadStart address action =
  on "LoadStart" Json.Decode.value (\_ -> Signal.message address action)


onProgress : Signal.Address a -> a -> Property
onProgress address action =
  on "Progress" Json.Decode.value (\_ -> Signal.message address action)


onError : Signal.Address a -> a -> Property
onError address action =
  on "Error" Json.Decode.value (\_ -> Signal.message address action)


onLoad : Signal.Address a -> a -> Property
onLoad address action =
  on "Load" Json.Decode.value (\_ -> Signal.message address action)


onLoadEnd : Signal.Address a -> a -> Property
onLoadEnd address action =
  on "LoadEnd" Json.Decode.value (\_ -> Signal.message address action)


onRegionChange : Signal.Address a -> a -> Property
onRegionChange address action =
  on "RegionChange" Json.Decode.value (\_ -> Signal.message address action)


onRegionChangeComplete : Signal.Address a -> a -> Property
onRegionChangeComplete address action =
  on "RegionChangeComplete" Json.Decode.value (\_ -> Signal.message address action)


onAnnotationPress : Signal.Address a -> a -> Property
onAnnotationPress address action =
  on "AnnotationPress" Json.Decode.value (\_ -> Signal.message address action)


onPickerValueChange : Signal.Address a -> (String -> a) -> Property
onPickerValueChange address stringToAction =
  on "PickerValueChange" Json.Decode.string (\value -> Signal.message address (stringToAction value))


onRefresh : Signal.Address a -> a -> Property
onRefresh address action =
  on "Refresh" Json.Decode.value (\_ -> Signal.message address action)


onScroll : Signal.Address a -> a -> Property
onScroll address action =
  on "Scroll" Json.Decode.value (\_ -> Signal.message address action)


onScrollAnimationEnd : Signal.Address a -> a -> Property
onScrollAnimationEnd address action =
  on "ScrollAnimationEnd" Json.Decode.value (\_ -> Signal.message address action)


onContentSizeChange : Signal.Address a -> a -> Property
onContentSizeChange address action =
  on "ContentSizeChange" Json.Decode.value (\_ -> Signal.message address action)


onSegmentedControlValueChange : Signal.Address a -> (Int -> a) -> Property
onSegmentedControlValueChange address intToAction =
  on "SegmentedControlValueChange" Json.Decode.int (\value -> Signal.message address (intToAction value))


onChange : Signal.Address a -> a -> Property
onChange address action =
  on "Change" Json.Decode.value (\_ -> Signal.message address action)


onSliderValueChange : Signal.Address a -> (Float -> a) -> Property
onSliderValueChange address floatToAction =
  on "SliderValueChange" Json.Decode.float (\value -> Signal.message address (floatToAction value))


onSlidingComplete : Signal.Address a -> a -> Property
onSlidingComplete address action =
  on "SlidingComplete" Json.Decode.value (\_ -> Signal.message address action)


onSwitchValueChange : Signal.Address a -> (Int -> a) -> Property
onSwitchValueChange address intToAction =
  on "SwitchValueChange" Json.Decode.int (\value -> Signal.message address (intToAction value))


onBlur : Signal.Address a -> a -> Property
onBlur address action =
  on "Blur" Json.Decode.value (\_ -> Signal.message address action)


onFocus : Signal.Address a -> a -> Property
onFocus address action =
  on "Focus" Json.Decode.value (\_ -> Signal.message address action)


onChangeText : Signal.Address a -> (String -> a) -> Property
onChangeText address stringToAction =
  on "ChangeText" Json.Decode.string (\text -> Signal.message address (stringToAction text))


onEndEditing : Signal.Address a -> a -> Property
onEndEditing address action =
  on "EndEditing" Json.Decode.value (\_ -> Signal.message address action)


onSelectionChange : Signal.Address a -> a -> Property
onSelectionChange address action =
  on "SelectionChange" Json.Decode.value (\_ -> Signal.message address action)


onSubmitEditing : Signal.Address a -> a -> Property
onSubmitEditing address action =
  on "SubmitEditing" Json.Decode.value (\_ -> Signal.message address action)


onKeyPress : Signal.Address a -> a -> Property
onKeyPress address action =
  on "KeyPress" Json.Decode.value (\_ -> Signal.message address action)


onActionSelected : Signal.Address a -> a -> Property
onActionSelected address action =
  on "ActionSelected" Json.Decode.value (\_ -> Signal.message address action)


onIconClicked : Signal.Address a -> a -> Property
onIconClicked address action =
  on "IconClicked" Json.Decode.value (\_ -> Signal.message address action)


onAccessibilityTap : Signal.Address a -> a -> Property
onAccessibilityTap address action =
  on "AccessibilityTap" Json.Decode.value (\_ -> Signal.message address action)


onMagicTap : Signal.Address a -> a -> Property
onMagicTap address action =
  on "MagicTap" Json.Decode.value (\_ -> Signal.message address action)


onResponderGrant : Signal.Address a -> a -> Property
onResponderGrant address action =
  on "ResponderGrant" Json.Decode.value (\_ -> Signal.message address action)


onResponderMove : Signal.Address a -> a -> Property
onResponderMove address action =
  on "ResponderMove" Json.Decode.value (\_ -> Signal.message address action)


onResponderReject : Signal.Address a -> a -> Property
onResponderReject address action =
  on "ResponderReject" Json.Decode.value (\_ -> Signal.message address action)


onResponderRelease : Signal.Address a -> a -> Property
onResponderRelease address action =
  on "ResponderRelease" Json.Decode.value (\_ -> Signal.message address action)


onResponderTerminate : Signal.Address a -> a -> Property
onResponderTerminate address action =
  on "ResponderTerminate" Json.Decode.value (\_ -> Signal.message address action)


onResponderTerminationRequest : Signal.Address a -> a -> Property
onResponderTerminationRequest address action =
  on "ResponderTerminationRequest" Json.Decode.value (\_ -> Signal.message address action)


onStartShouldSetResponder : Signal.Address a -> a -> Property
onStartShouldSetResponder address action =
  on "StartShouldSetResponder" Json.Decode.value (\_ -> Signal.message address action)


onStartShouldSetResponderCapture : Signal.Address a -> a -> Property
onStartShouldSetResponderCapture address action =
  on "StartShouldSetResponderCapture" Json.Decode.value (\_ -> Signal.message address action)


onMoveShouldSetResponder : Signal.Address a -> a -> Property
onMoveShouldSetResponder address action =
  on "MoveShouldSetResponder" Json.Decode.value (\_ -> Signal.message address action)


onMoveShouldSetResponderCapture : Signal.Address a -> a -> Property
onMoveShouldSetResponderCapture address action =
  on "MoveShouldSetResponderCapture" Json.Decode.value (\_ -> Signal.message address action)


onDateChange : Signal.Address a -> a -> Property
onDateChange address action =
  on "DateChange" Json.Decode.value (\_ -> Signal.message address action)


onDrawerClose : Signal.Address a -> a -> Property
onDrawerClose address action =
  on "DrawerClose" Json.Decode.value (\_ -> Signal.message address action)


onDrawerOpen : Signal.Address a -> a -> Property
onDrawerOpen address action =
  on "DrawerOpen" Json.Decode.value (\_ -> Signal.message address action)


onDrawerSlide : Signal.Address a -> a -> Property
onDrawerSlide address action =
  on "DrawerSlide" Json.Decode.value (\_ -> Signal.message address action)


onDrawerStateChanged : Signal.Address a -> a -> Property
onDrawerStateChanged address action =
  on "DrawerStateChanged" Json.Decode.value (\_ -> Signal.message address action)


onChangeVisibleRows : Signal.Address a -> a -> Property
onChangeVisibleRows address action =
  on "ChangeVisibleRows" Json.Decode.value (\_ -> Signal.message address action)


onEndReached : Signal.Address a -> a -> Property
onEndReached address action =
  on "EndReached" Json.Decode.value (\_ -> Signal.message address action)


onRequestClose : Signal.Address a -> a -> Property
onRequestClose address action =
  on "RequestClose" Json.Decode.value (\_ -> Signal.message address action)


onShow : Signal.Address a -> a -> Property
onShow address action =
  on "Show" Json.Decode.value (\_ -> Signal.message address action)


onDidFocus : Signal.Address a -> a -> Property
onDidFocus address action =
  on "DidFocus" Json.Decode.value (\_ -> Signal.message address action)


onWillFocus : Signal.Address a -> a -> Property
onWillFocus address action =
  on "WillFocus" Json.Decode.value (\_ -> Signal.message address action)


onValueChange : Signal.Address a -> a -> Property
onValueChange address action =
  on "ValueChange" Json.Decode.value (\_ -> Signal.message address action)


onTintColor : Signal.Address a -> a -> Property
onTintColor address action =
  on "TintColor" Json.Decode.value (\_ -> Signal.message address action)


onHideUnderlay : Signal.Address a -> a -> Property
onHideUnderlay address action =
  on "HideUnderlay" Json.Decode.value (\_ -> Signal.message address action)


onShowUnderlay : Signal.Address a -> a -> Property
onShowUnderlay address action =
  on "ShowUnderlay" Json.Decode.value (\_ -> Signal.message address action)


onLongPress : Signal.Address a -> a -> Property
onLongPress address action =
  on "LongPress" Json.Decode.value (\_ -> Signal.message address action)


onPressIn : Signal.Address a -> a -> Property
onPressIn address action =
  on "PressIn" Json.Decode.value (\_ -> Signal.message address action)


onPressOut : Signal.Address a -> a -> Property
onPressOut address action =
  on "PressOut" Json.Decode.value (\_ -> Signal.message address action)


onPageScroll : Signal.Address a -> a -> Property
onPageScroll address action =
  on "PageScroll" Json.Decode.value (\_ -> Signal.message address action)


onPageScrollStateChanged : Signal.Address a -> a -> Property
onPageScrollStateChanged address action =
  on "PageScrollStateChanged" Json.Decode.value (\_ -> Signal.message address action)


onPageSelected : Signal.Address a -> a -> Property
onPageSelected address action =
  on "PageSelected" Json.Decode.value (\_ -> Signal.message address action)


onNavigationStateChange : Signal.Address a -> a -> Property
onNavigationStateChange address action =
  on "NavigationStateChange" Json.Decode.value (\_ -> Signal.message address action)


onShouldStartLoadWithRequest : Signal.Address a -> a -> Property
onShouldStartLoadWithRequest address action =
  on "ShouldStartLoadWithRequest" Json.Decode.value (\_ -> Signal.message address action)
