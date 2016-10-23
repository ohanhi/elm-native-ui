module NativeUi.Handlers exposing (onLayout, onPress, onLongPress, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange)

{-| elm-native-ui Handlers

@docs onLayout, onPress, onLongPress, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange
-}

import Json.Decode as Decode exposing (Value, Decoder)
import NativeUi exposing (Property, on)

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
