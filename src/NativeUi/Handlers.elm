module NativeUi.Handlers (..) where

{-| elm-native-ui Handlers

@docs onLayout, onAccessibilityTap, onActionSelected, onAnnotationPress, onBlur
@docs onChange, onChangeText, onChangeVisibleRows, onContentSizeChange
@docs onDateChange, onDidFocus, onDrawerClose, onDrawerOpen, onDrawerSlide
@docs onDrawerStateChanged, onEndEditing, onEndReached, onError, onFocus
@docs onHideUnderlay, onIconClicked, onKeyPress, onLoad
@docs onLoadEnd, onLoadStart, onLongPress, onMagicTap, onMoveShouldSetResponder
@docs onMoveShouldSetResponderCapture, onNavigationStateChange, onPageScroll
@docs onPageScrollStateChanged, onPageSelected, onPickerValueChange, onPress
@docs onPressIn, onPressOut, onProgress, onRefresh, onRegionChange
@docs onRegionChangeComplete, onRequestClose, onResponderGrant, onResponderMove
@docs onResponderReject, onResponderRelease, onResponderTerminate
@docs onResponderTerminationRequest, onScroll, onScrollAnimationEnd
@docs onSegmentedControlValueChange, onSelectionChange
@docs onShouldStartLoadWithRequest, onShow, onShowUnderlay, onSliderValueChange
@docs onSlidingComplete, onStartShouldSetResponder
@docs onStartShouldSetResponderCapture, onSubmitEditing, onSwitchValueChange
@docs onTintColor, onValueChange, onWillFocus
-}

import Json.Decode
import NativeUi exposing (Property, on)

{-| Animated Loading Indicators
-}
onLayout : Signal.Address a -> a -> Property
onLayout address action =
  on "Layout" Json.Decode.value (\_ -> Signal.message address action)


{-| Binds an event handler into the `onPress` event.
-}
onPress : Signal.Address a -> a -> Property
onPress address msg =
  on "Press" Json.Decode.value (\_ -> Signal.message address msg)


{-| Animated Loading Indicators
-}
onLoadStart : Signal.Address a -> a -> Property
onLoadStart address action =
  on "LoadStart" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onProgress : Signal.Address a -> a -> Property
onProgress address action =
  on "Progress" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onError : Signal.Address a -> a -> Property
onError address action =
  on "Error" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onLoad : Signal.Address a -> a -> Property
onLoad address action =
  on "Load" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onLoadEnd : Signal.Address a -> a -> Property
onLoadEnd address action =
  on "LoadEnd" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onRegionChange : Signal.Address a -> a -> Property
onRegionChange address action =
  on "RegionChange" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onRegionChangeComplete : Signal.Address a -> a -> Property
onRegionChangeComplete address action =
  on "RegionChangeComplete" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onAnnotationPress : Signal.Address a -> a -> Property
onAnnotationPress address action =
  on "AnnotationPress" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onPickerValueChange : Signal.Address a -> (String -> a) -> Property
onPickerValueChange address stringToAction =
  on "PickerValueChange" Json.Decode.string (\value -> Signal.message address (stringToAction value))

{-| Animated Loading Indicators
-}
onRefresh : Signal.Address a -> a -> Property
onRefresh address action =
  on "Refresh" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onScroll : Signal.Address a -> a -> Property
onScroll address action =
  on "Scroll" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onScrollAnimationEnd : Signal.Address a -> a -> Property
onScrollAnimationEnd address action =
  on "ScrollAnimationEnd" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onContentSizeChange : Signal.Address a -> a -> Property
onContentSizeChange address action =
  on "ContentSizeChange" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onSegmentedControlValueChange : Signal.Address a -> (Int -> a) -> Property
onSegmentedControlValueChange address intToAction =
  on "SegmentedControlValueChange" Json.Decode.int (\value -> Signal.message address (intToAction value))

{-| Animated Loading Indicators
-}
onChange : Signal.Address a -> a -> Property
onChange address action =
  on "Change" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onSliderValueChange : Signal.Address a -> (Float -> a) -> Property
onSliderValueChange address floatToAction =
  on "SliderValueChange" Json.Decode.float (\value -> Signal.message address (floatToAction value))

{-| Animated Loading Indicators
-}
onSlidingComplete : Signal.Address a -> a -> Property
onSlidingComplete address action =
  on "SlidingComplete" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onSwitchValueChange : Signal.Address a -> (Int -> a) -> Property
onSwitchValueChange address intToAction =
  on "SwitchValueChange" Json.Decode.int (\value -> Signal.message address (intToAction value))

{-| Animated Loading Indicators
-}
onBlur : Signal.Address a -> a -> Property
onBlur address action =
  on "Blur" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onFocus : Signal.Address a -> a -> Property
onFocus address action =
  on "Focus" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onChangeText : Signal.Address a -> (String -> a) -> Property
onChangeText address stringToAction =
  on "ChangeText" Json.Decode.string (\text -> Signal.message address (stringToAction text))

{-| Animated Loading Indicators
-}
onEndEditing : Signal.Address a -> a -> Property
onEndEditing address action =
  on "EndEditing" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onSelectionChange : Signal.Address a -> a -> Property
onSelectionChange address action =
  on "SelectionChange" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onSubmitEditing : Signal.Address a -> a -> Property
onSubmitEditing address action =
  on "SubmitEditing" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onKeyPress : Signal.Address a -> a -> Property
onKeyPress address action =
  on "KeyPress" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onActionSelected : Signal.Address a -> a -> Property
onActionSelected address action =
  on "ActionSelected" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onIconClicked : Signal.Address a -> a -> Property
onIconClicked address action =
  on "IconClicked" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onAccessibilityTap : Signal.Address a -> a -> Property
onAccessibilityTap address action =
  on "AccessibilityTap" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onMagicTap : Signal.Address a -> a -> Property
onMagicTap address action =
  on "MagicTap" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onResponderGrant : Signal.Address a -> a -> Property
onResponderGrant address action =
  on "ResponderGrant" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onResponderMove : Signal.Address a -> a -> Property
onResponderMove address action =
  on "ResponderMove" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onResponderReject : Signal.Address a -> a -> Property
onResponderReject address action =
  on "ResponderReject" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onResponderRelease : Signal.Address a -> a -> Property
onResponderRelease address action =
  on "ResponderRelease" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onResponderTerminate : Signal.Address a -> a -> Property
onResponderTerminate address action =
  on "ResponderTerminate" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onResponderTerminationRequest : Signal.Address a -> a -> Property
onResponderTerminationRequest address action =
  on "ResponderTerminationRequest" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onStartShouldSetResponder : Signal.Address a -> a -> Property
onStartShouldSetResponder address action =
  on "StartShouldSetResponder" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onStartShouldSetResponderCapture : Signal.Address a -> a -> Property
onStartShouldSetResponderCapture address action =
  on "StartShouldSetResponderCapture" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onMoveShouldSetResponder : Signal.Address a -> a -> Property
onMoveShouldSetResponder address action =
  on "MoveShouldSetResponder" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onMoveShouldSetResponderCapture : Signal.Address a -> a -> Property
onMoveShouldSetResponderCapture address action =
  on "MoveShouldSetResponderCapture" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onDateChange : Signal.Address a -> a -> Property
onDateChange address action =
  on "DateChange" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onDrawerClose : Signal.Address a -> a -> Property
onDrawerClose address action =
  on "DrawerClose" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onDrawerOpen : Signal.Address a -> a -> Property
onDrawerOpen address action =
  on "DrawerOpen" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onDrawerSlide : Signal.Address a -> a -> Property
onDrawerSlide address action =
  on "DrawerSlide" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onDrawerStateChanged : Signal.Address a -> a -> Property
onDrawerStateChanged address action =
  on "DrawerStateChanged" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onChangeVisibleRows : Signal.Address a -> a -> Property
onChangeVisibleRows address action =
  on "ChangeVisibleRows" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onEndReached : Signal.Address a -> a -> Property
onEndReached address action =
  on "EndReached" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onRequestClose : Signal.Address a -> a -> Property
onRequestClose address action =
  on "RequestClose" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onShow : Signal.Address a -> a -> Property
onShow address action =
  on "Show" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onDidFocus : Signal.Address a -> a -> Property
onDidFocus address action =
  on "DidFocus" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onWillFocus : Signal.Address a -> a -> Property
onWillFocus address action =
  on "WillFocus" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onValueChange : Signal.Address a -> a -> Property
onValueChange address action =
  on "ValueChange" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onTintColor : Signal.Address a -> a -> Property
onTintColor address action =
  on "TintColor" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onHideUnderlay : Signal.Address a -> a -> Property
onHideUnderlay address action =
  on "HideUnderlay" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onShowUnderlay : Signal.Address a -> a -> Property
onShowUnderlay address action =
  on "ShowUnderlay" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onLongPress : Signal.Address a -> a -> Property
onLongPress address action =
  on "LongPress" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onPressIn : Signal.Address a -> a -> Property
onPressIn address action =
  on "PressIn" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onPressOut : Signal.Address a -> a -> Property
onPressOut address action =
  on "PressOut" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onPageScroll : Signal.Address a -> a -> Property
onPageScroll address action =
  on "PageScroll" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onPageScrollStateChanged : Signal.Address a -> a -> Property
onPageScrollStateChanged address action =
  on "PageScrollStateChanged" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onPageSelected : Signal.Address a -> a -> Property
onPageSelected address action =
  on "PageSelected" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onNavigationStateChange : Signal.Address a -> a -> Property
onNavigationStateChange address action =
  on "NavigationStateChange" Json.Decode.value (\_ -> Signal.message address action)

{-| Animated Loading Indicators
-}
onShouldStartLoadWithRequest : Signal.Address a -> a -> Property
onShouldStartLoadWithRequest address action =
  on "ShouldStartLoadWithRequest" Json.Decode.value (\_ -> Signal.message address action)
