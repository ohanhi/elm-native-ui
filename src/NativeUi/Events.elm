module NativeUi.Events exposing (onLayout, onPress, onLoadStart, onProgress, onError, onLoad, onLoadEnd, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange, onSegmentedControlValueChange, onChange, onSliderValueChange, onSlidingComplete, onSwitchValueChange, onBlur, onFocus, onChangeText, onEndEditing, onSelectionChange, onSubmitEditing, onKeyPress, onActionSelected, onIconClicked, onAccessibilityTap, onMagicTap, onResponderGrant, onResponderMove, onResponderReject, onResponderRelease, onResponderTerminate, onResponderTerminationRequest, onStartShouldSetResponder, onStartShouldSetResponderCapture, onMoveShouldSetResponder, onMoveShouldSetResponderCapture)

{-| elm-native-ui Handlers

@docs onLayout, onPress, onLoadStart, onProgress, onError, onLoad, onLoadEnd, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange, onSegmentedControlValueChange, onChange, onSliderValueChange, onSlidingComplete, onSwitchValueChange, onBlur, onFocus, onChangeText, onEndEditing, onSelectionChange, onSubmitEditing, onKeyPress, onActionSelected, onIconClicked, onAccessibilityTap, onMagicTap, onResponderGrant, onResponderMove, onResponderReject, onResponderRelease, onResponderTerminate, onResponderTerminationRequest, onStartShouldSetResponder, onStartShouldSetResponderCapture, onMoveShouldSetResponder, onMoveShouldSetResponderCapture
-}

import Json.Decode as Decode exposing (Value, Decoder)
import NativeUi exposing (Property, on)


constantMsgEvent : String -> msg -> Property msg
constantMsgEvent name msg =
    on name (Decode.succeed msg)


{-| -}
onLayout : msg -> Property msg
onLayout =
    constantMsgEvent "Layout"


{-| -}
onPress : msg -> Property msg
onPress =
    constantMsgEvent "Press"


{-| -}
onLoadStart : msg -> Property msg
onLoadStart =
    constantMsgEvent "LoadStart"


{-| -}
onProgress : msg -> Property msg
onProgress =
    constantMsgEvent "Progress"


{-| -}
onError : msg -> Property msg
onError =
    constantMsgEvent "Error"


{-| -}
onLoad : msg -> Property msg
onLoad =
    constantMsgEvent "Load"


{-| -}
onLoadEnd : msg -> Property msg
onLoadEnd =
    constantMsgEvent "LoadEnd"


{-| -}
onRegionChange : msg -> Property msg
onRegionChange =
    constantMsgEvent "RegionChange"


{-| -}
onRegionChangeComplete : msg -> Property msg
onRegionChangeComplete =
    constantMsgEvent "RegionChangeComplete"


{-| -}
onAnnotationPress : msg -> Property msg
onAnnotationPress =
    constantMsgEvent "AnnotationPress"


{-| -}
onPickerValueChange : (String -> msg) -> Property msg
onPickerValueChange tagger =
    on "PickerValueChange" (Decode.map tagger Decode.string)


{-| -}
onRefresh : msg -> Property msg
onRefresh =
    constantMsgEvent "Refresh"


{-| -}
onScroll : msg -> Property msg
onScroll =
    constantMsgEvent "Scroll"


{-| -}
onScrollAnimationEnd : msg -> Property msg
onScrollAnimationEnd =
    constantMsgEvent "ScrollAnimationEnd"


{-| -}
onContentSizeChange : msg -> Property msg
onContentSizeChange =
    constantMsgEvent "ContentSizeChange"


{-| -}
onSegmentedControlValueChange : (Int -> msg) -> Property msg
onSegmentedControlValueChange tagger =
    on "SegmentedControlValueChange" (Decode.map tagger Decode.int)


{-| -}
onChange : msg -> Property msg
onChange =
    constantMsgEvent "Change"


{-| -}
onSliderValueChange : (Float -> msg) -> Property msg
onSliderValueChange tagger =
    on "SliderValueChange" (Decode.map tagger Decode.float)


{-| -}
onSlidingComplete : msg -> Property msg
onSlidingComplete =
    constantMsgEvent "SlidingComplete"


{-| -}
onSwitchValueChange : (Int -> msg) -> Property msg
onSwitchValueChange tagger =
    on "SwitchValueChange" (Decode.map tagger Decode.int)


{-| -}
onBlur : msg -> Property msg
onBlur =
    constantMsgEvent "Blur"


{-| -}
onFocus : msg -> Property msg
onFocus =
    constantMsgEvent "Focus"


{-| -}
onChangeText : (String -> msg) -> Property msg
onChangeText tagger =
    on "ChangeText" (Decode.map tagger Decode.string)


{-| -}
onEndEditing : msg -> Property msg
onEndEditing =
    constantMsgEvent "EndEditing"


{-| -}
onSelectionChange : msg -> Property msg
onSelectionChange =
    constantMsgEvent "SelectionChange"


{-| -}
onSubmitEditing : msg -> Property msg
onSubmitEditing =
    constantMsgEvent "SubmitEditing"


{-| -}
onKeyPress : msg -> Property msg
onKeyPress =
    constantMsgEvent "KeyPress"


{-| -}
onActionSelected : msg -> Property msg
onActionSelected =
    constantMsgEvent "ActionSelected"


{-| -}
onIconClicked : msg -> Property msg
onIconClicked =
    constantMsgEvent "IconClicked"


{-| -}
onAccessibilityTap : msg -> Property msg
onAccessibilityTap =
    constantMsgEvent "AccessibilityTap"


{-| -}
onMagicTap : msg -> Property msg
onMagicTap =
    constantMsgEvent "MagicTap"


{-| -}
onResponderGrant : msg -> Property msg
onResponderGrant =
    constantMsgEvent "ResponderGrant"


{-| -}
onResponderMove : msg -> Property msg
onResponderMove =
    constantMsgEvent "ResponderMove"


{-| -}
onResponderReject : msg -> Property msg
onResponderReject =
    constantMsgEvent "ResponderReject"


{-| -}
onResponderRelease : msg -> Property msg
onResponderRelease =
    constantMsgEvent "ResponderRelease"


{-| -}
onResponderTerminate : msg -> Property msg
onResponderTerminate =
    constantMsgEvent "ResponderTerminate"


{-| -}
onResponderTerminationRequest : msg -> Property msg
onResponderTerminationRequest =
    constantMsgEvent "ResponderTerminationRequest"


{-| -}
onStartShouldSetResponder : msg -> Property msg
onStartShouldSetResponder =
    constantMsgEvent "StartShouldSetResponder"


{-| -}
onStartShouldSetResponderCapture : msg -> Property msg
onStartShouldSetResponderCapture =
    constantMsgEvent "StartShouldSetResponderCapture"


{-| -}
onMoveShouldSetResponder : msg -> Property msg
onMoveShouldSetResponder =
    constantMsgEvent "MoveShouldSetResponder"


{-| -}
onMoveShouldSetResponderCapture : msg -> Property msg
onMoveShouldSetResponderCapture =
    constantMsgEvent "MoveShouldSetResponderCapture"
