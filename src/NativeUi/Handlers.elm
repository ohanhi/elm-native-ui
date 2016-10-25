module NativeUi.Handlers (..) where

{-| elm-native-ui Handlers

@docs onLayout, onPress, onLongPress, onRegionChange, onRegionChangeComplete, onAnnotationPress, onPickerValueChange, onRefresh, onScroll, onScrollAnimationEnd, onContentSizeChange
-}

import Json.Decode
import NativeUi exposing (Property, on)

{-| -}
onLayout : Signal.Address a -> a -> Property
onLayout address action =
    on "Layout" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onPress : Signal.Address a -> a -> Property
onPress address action =
    on "Press" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onLongPress : Signal.Address a -> a -> Property
onLongPress address action =
    on "LongPress" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onRegionChange : Signal.Address a -> a -> Property
onRegionChange address action =
    on "RegionChange" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onRegionChangeComplete : Signal.Address a -> a -> Property
onRegionChangeComplete address action =
    on "RegionChangeComplete" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onAnnotationPress : Signal.Address a -> a -> Property
onAnnotationPress address action =
    on "AnnotationPress" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onPickerValueChange : Signal.Address a -> (String-> a) -> Property
onPickerValueChange address stringToAction =
    on "PickerValueChange" Json.Decode.string (\value -> Signal.message address (stringToAction value))


{-| -}
onRefresh : Signal.Address a -> a -> Property
onRefresh address action =
    on "Refresh" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onScroll : Signal.Address a -> a -> Property
onScroll address action =
    on "Scroll" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onScrollAnimationEnd : Signal.Address a -> a -> Property
onScrollAnimationEnd address action =
    on "ScrollAnimationEnd" Json.Decode.value (\_ -> Signal.message address action)


{-| -}
onContentSizeChange : Signal.Address a -> a -> Property
onContentSizeChange address action =
    on "ContentSizeChange" Json.Decode.value (\_ -> Signal.message address action)

