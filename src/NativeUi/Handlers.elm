module NativeUi.Handlers (..) where

{-| elm-native-ui Handlers

  @docs onLayout, onPress, onLoadStart, onProgress, onError, onLoad, onLoadEnd, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange, onSegmentedControlValueChange, onChange, onSliderValueChange, onSlidingComplete, onSwitchValueChange, onBlur, onFocus, onChangeText, onEndEditing, onSelectionChange, onSubmitEditing, onKeyPress, onActionSelected, onIconClicked
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
