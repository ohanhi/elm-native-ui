module NativeUi.Events exposing (onLayout, onPress, onLongPress, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange, onShowUnderlay, onHideUnderlay, onNavigateBack, onChangeText)

{-| elm-native-ui Events

@docs onLayout, onPress, onLongPress, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange, onShowUnderlay, onHideUnderlay, onNavigateBack, onChangeText
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
onLongPress : msg -> Property msg
onLongPress =
    constantMsgEvent "LongPress"


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
onShowUnderlay : msg -> Property msg
onShowUnderlay =
    constantMsgEvent "ShowUnderlay"


{-| -}
onHideUnderlay : msg -> Property msg
onHideUnderlay =
    constantMsgEvent "HideUnderlay"


{-| -}
onNavigateBack : msg -> Property msg
onNavigateBack =
    constantMsgEvent "NavigateBack"


{-| -}
onChangeText : (String -> msg) -> Property msg
onChangeText tagger =
    on "ChangeText" (Decode.map tagger Decode.string)
