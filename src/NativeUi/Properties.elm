module NativeUi.Properties exposing (key, ellipsizeMode, numberOfLines, selectable, suppressHighlighting, testID, allowFontScaling, accessible, adjustsFontSizeToFit, minimumFontScale, source, sourceUri, defaultSource, defaultSourceUri, showsUserLocation, followUserLocation, showsPointsOfInterest, showsCompass, zoomEnabled, rotateEnabled, pitchEnabled, scrollEnabled, maxDelta, minDelta, active, enabled, mode, prompt, refreshing, title, progressViewOffset, automaticallyAdjustContentInsets, bounces, bouncesZoom, alwaysBounceHorizontal, alwaysBounceVertical, centerContent, horizontal, indicatorStyle, directionalLockEnabled, canCancelContentTouches, keyboardDismissMode, keyboardShouldPersistTaps, maximumZoomScale, minimumZoomScale, pagingEnabled, scrollEventThrottle, scrollsToTop, showsHorizontalScrollIndicator, showsVerticalScrollIndicator, snapToInterval, snapToAlignment, removeClippedSubviews, zoomScale, scrollPerfTag, hidden, animated, translucent, barStyle, networkActivityIndicatorVisible, showHideTransition, itemPositioning, activeOpacity, gestureResponseDistance, enableGestures, statusBarHeight, underlayColor)

{-| elm-native-ui Properties

@docs key, ellipsizeMode, numberOfLines, selectable, suppressHighlighting, testID, allowFontScaling, accessible, adjustsFontSizeToFit, minimumFontScale, source, sourceUri, defaultSource, defaultSourceUri, showsUserLocation, followUserLocation, showsPointsOfInterest, showsCompass, zoomEnabled, rotateEnabled, pitchEnabled, scrollEnabled, maxDelta, minDelta, active, enabled, mode, prompt, refreshing, title, progressViewOffset, automaticallyAdjustContentInsets, bounces, bouncesZoom, alwaysBounceHorizontal, alwaysBounceVertical, centerContent, horizontal, indicatorStyle, directionalLockEnabled, canCancelContentTouches, keyboardDismissMode, keyboardShouldPersistTaps, maximumZoomScale, minimumZoomScale, pagingEnabled, scrollEventThrottle, scrollsToTop, showsHorizontalScrollIndicator, showsVerticalScrollIndicator, snapToInterval, snapToAlignment, removeClippedSubviews, zoomScale, scrollPerfTag, hidden, animated, translucent, barStyle, networkActivityIndicatorVisible, showHideTransition, itemPositioning, activeOpacity, gestureResponseDistance, enableGestures, statusBarHeight, underlayColor

-}

import Json.Encode
import NativeUi exposing (Property, property)


{-| -}
key : String -> Property msg
key val =
    property "key" (Json.Encode.string val)


{-| -}
type TextEllipsizeMode
    = TextEllipsizeModeHead
    | TextEllipsizeModeMiddle
    | TextEllipsizeModeTail
    | TextEllipsizeModeClip


{-| -}
ellipsizeMode : TextEllipsizeMode -> Property msg
ellipsizeMode val =
    let
        stringValue =
            case val of
                TextEllipsizeModeHead ->
                    "head"

                TextEllipsizeModeMiddle ->
                    "middle"

                TextEllipsizeModeTail ->
                    "tail"

                TextEllipsizeModeClip ->
                    "clip"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "ellipsizeMode" jsonValue


{-| -}
numberOfLines : Float -> Property msg
numberOfLines val =
    property "numberOfLines" (Json.Encode.float val)


{-| -}
selectable : Bool -> Property msg
selectable val =
    property "selectable" (Json.Encode.bool val)


{-| -}
suppressHighlighting : Bool -> Property msg
suppressHighlighting val =
    property "suppressHighlighting" (Json.Encode.bool val)


{-| -}
testID : String -> Property msg
testID val =
    property "testID" (Json.Encode.string val)


{-| -}
allowFontScaling : Bool -> Property msg
allowFontScaling val =
    property "allowFontScaling" (Json.Encode.bool val)


{-| -}
accessible : Bool -> Property msg
accessible val =
    property "accessible" (Json.Encode.bool val)


{-| -}
adjustsFontSizeToFit : Bool -> Property msg
adjustsFontSizeToFit val =
    property "adjustsFontSizeToFit" (Json.Encode.bool val)


{-| -}
minimumFontScale : Float -> Property msg
minimumFontScale val =
    property "minimumFontScale" (Json.Encode.float val)


{-| -}
source : String -> Property msg
source image =
    property "source" (Json.Encode.string image)


{-| -}
sourceUri : String -> Property msg
sourceUri uri =
    property "source" (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


{-| -}
defaultSource : String -> Property msg
defaultSource image =
    property "defaultSource" (Json.Encode.string image)


{-| -}
defaultSourceUri : String -> Property msg
defaultSourceUri uri =
    property "defaultSource" (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


{-| -}
showsUserLocation : Bool -> Property msg
showsUserLocation val =
    property "showsUserLocation" (Json.Encode.bool val)


{-| -}
followUserLocation : Bool -> Property msg
followUserLocation val =
    property "followUserLocation" (Json.Encode.bool val)


{-| -}
showsPointsOfInterest : Bool -> Property msg
showsPointsOfInterest val =
    property "showsPointsOfInterest" (Json.Encode.bool val)


{-| -}
showsCompass : Bool -> Property msg
showsCompass val =
    property "showsCompass" (Json.Encode.bool val)


{-| -}
zoomEnabled : Bool -> Property msg
zoomEnabled val =
    property "zoomEnabled" (Json.Encode.bool val)


{-| -}
rotateEnabled : Bool -> Property msg
rotateEnabled val =
    property "rotateEnabled" (Json.Encode.bool val)


{-| -}
pitchEnabled : Bool -> Property msg
pitchEnabled val =
    property "pitchEnabled" (Json.Encode.bool val)


{-| -}
scrollEnabled : Bool -> Property msg
scrollEnabled val =
    property "scrollEnabled" (Json.Encode.bool val)


{-| -}
maxDelta : Float -> Property msg
maxDelta val =
    property "maxDelta" (Json.Encode.float val)


{-| -}
minDelta : Float -> Property msg
minDelta val =
    property "minDelta" (Json.Encode.float val)


{-| -}
active : Bool -> Property msg
active val =
    property "active" (Json.Encode.bool val)


{-| -}
enabled : Bool -> Property msg
enabled val =
    property "enabled" (Json.Encode.bool val)


{-| -}
type PickerMode
    = PickerModeDialog
    | PickerModeDropdown


{-| -}
mode : PickerMode -> Property msg
mode val =
    let
        stringValue =
            case val of
                PickerModeDialog ->
                    "dialog"

                PickerModeDropdown ->
                    "dropdown"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "mode" jsonValue


{-| -}
prompt : String -> Property msg
prompt val =
    property "prompt" (Json.Encode.string val)


{-| -}
refreshing : Bool -> Property msg
refreshing val =
    property "refreshing" (Json.Encode.bool val)


{-| -}
title : String -> Property msg
title val =
    property "title" (Json.Encode.string val)


{-| -}
progressViewOffset : Float -> Property msg
progressViewOffset val =
    property "progressViewOffset" (Json.Encode.float val)


{-| -}
automaticallyAdjustContentInsets : Bool -> Property msg
automaticallyAdjustContentInsets val =
    property "automaticallyAdjustContentInsets" (Json.Encode.bool val)


{-| -}
bounces : Bool -> Property msg
bounces val =
    property "bounces" (Json.Encode.bool val)


{-| -}
bouncesZoom : Bool -> Property msg
bouncesZoom val =
    property "bouncesZoom" (Json.Encode.bool val)


{-| -}
alwaysBounceHorizontal : Bool -> Property msg
alwaysBounceHorizontal val =
    property "alwaysBounceHorizontal" (Json.Encode.bool val)


{-| -}
alwaysBounceVertical : Bool -> Property msg
alwaysBounceVertical val =
    property "alwaysBounceVertical" (Json.Encode.bool val)


{-| -}
centerContent : Bool -> Property msg
centerContent val =
    property "centerContent" (Json.Encode.bool val)


{-| -}
horizontal : Bool -> Property msg
horizontal val =
    property "horizontal" (Json.Encode.bool val)


{-| -}
type ScrollViewIndicatorStyle
    = ScrollViewIndicatorStyleDefault
    | ScrollViewIndicatorStyleBlack
    | ScrollViewIndicatorStyleWhite


{-| -}
indicatorStyle : ScrollViewIndicatorStyle -> Property msg
indicatorStyle val =
    let
        stringValue =
            case val of
                ScrollViewIndicatorStyleDefault ->
                    "default"

                ScrollViewIndicatorStyleBlack ->
                    "black"

                ScrollViewIndicatorStyleWhite ->
                    "white"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "indicatorStyle" jsonValue


{-| -}
directionalLockEnabled : Bool -> Property msg
directionalLockEnabled val =
    property "directionalLockEnabled" (Json.Encode.bool val)


{-| -}
canCancelContentTouches : Bool -> Property msg
canCancelContentTouches val =
    property "canCancelContentTouches" (Json.Encode.bool val)


{-| -}
type ScrollViewKeyboardDismissMode
    = ScrollViewKeyboardDismissModeNone
    | ScrollViewKeyboardDismissModeInteractive
    | ScrollViewKeyboardDismissModeOnDrag


{-| -}
keyboardDismissMode : ScrollViewKeyboardDismissMode -> Property msg
keyboardDismissMode val =
    let
        stringValue =
            case val of
                ScrollViewKeyboardDismissModeNone ->
                    "none"

                ScrollViewKeyboardDismissModeInteractive ->
                    "interactive"

                ScrollViewKeyboardDismissModeOnDrag ->
                    "on-drag"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "keyboardDismissMode" jsonValue


{-| -}
keyboardShouldPersistTaps : Bool -> Property msg
keyboardShouldPersistTaps val =
    property "keyboardShouldPersistTaps" (Json.Encode.bool val)


{-| -}
maximumZoomScale : Float -> Property msg
maximumZoomScale val =
    property "maximumZoomScale" (Json.Encode.float val)


{-| -}
minimumZoomScale : Float -> Property msg
minimumZoomScale val =
    property "minimumZoomScale" (Json.Encode.float val)


{-| -}
pagingEnabled : Bool -> Property msg
pagingEnabled val =
    property "pagingEnabled" (Json.Encode.bool val)


{-| -}
scrollEventThrottle : Float -> Property msg
scrollEventThrottle val =
    property "scrollEventThrottle" (Json.Encode.float val)


{-| -}
scrollsToTop : Bool -> Property msg
scrollsToTop val =
    property "scrollsToTop" (Json.Encode.bool val)


{-| -}
showsHorizontalScrollIndicator : Bool -> Property msg
showsHorizontalScrollIndicator val =
    property "showsHorizontalScrollIndicator" (Json.Encode.bool val)


{-| -}
showsVerticalScrollIndicator : Bool -> Property msg
showsVerticalScrollIndicator val =
    property "showsVerticalScrollIndicator" (Json.Encode.bool val)


{-| -}
snapToInterval : Float -> Property msg
snapToInterval val =
    property "snapToInterval" (Json.Encode.float val)


{-| -}
type ScrollViewSnapToAlignment
    = ScrollViewSnapToAlignmentStart
    | ScrollViewSnapToAlignmentCenter
    | ScrollViewSnapToAlignmentEnd


{-| -}
snapToAlignment : ScrollViewSnapToAlignment -> Property msg
snapToAlignment val =
    let
        stringValue =
            case val of
                ScrollViewSnapToAlignmentStart ->
                    "start"

                ScrollViewSnapToAlignmentCenter ->
                    "center"

                ScrollViewSnapToAlignmentEnd ->
                    "end"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "snapToAlignment" jsonValue


{-| -}
removeClippedSubviews : Bool -> Property msg
removeClippedSubviews val =
    property "removeClippedSubviews" (Json.Encode.bool val)


{-| -}
zoomScale : Float -> Property msg
zoomScale val =
    property "zoomScale" (Json.Encode.float val)


{-| -}
scrollPerfTag : String -> Property msg
scrollPerfTag val =
    property "scrollPerfTag" (Json.Encode.string val)


{-| -}
hidden : Bool -> Property msg
hidden val =
    property "hidden" (Json.Encode.bool val)


{-| -}
animated : Bool -> Property msg
animated val =
    property "animated" (Json.Encode.bool val)


{-| -}
translucent : Bool -> Property msg
translucent val =
    property "translucent" (Json.Encode.bool val)


{-| -}
type StatusBarBarStyle
    = StatusBarBarStyleDefault
    | StatusBarBarStyleLightContent


{-| -}
barStyle : StatusBarBarStyle -> Property msg
barStyle val =
    let
        stringValue =
            case val of
                StatusBarBarStyleDefault ->
                    "default"

                StatusBarBarStyleLightContent ->
                    "light-content"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "barStyle" jsonValue


{-| -}
networkActivityIndicatorVisible : Bool -> Property msg
networkActivityIndicatorVisible val =
    property "networkActivityIndicatorVisible" (Json.Encode.bool val)


{-| -}
type StatusBarShowHideTransition
    = StatusBarShowHideTransitionFade
    | StatusBarShowHideTransitionSlide


{-| -}
showHideTransition : StatusBarShowHideTransition -> Property msg
showHideTransition val =
    let
        stringValue =
            case val of
                StatusBarShowHideTransitionFade ->
                    "fade"

                StatusBarShowHideTransitionSlide ->
                    "slide"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "showHideTransition" jsonValue


{-| -}
type TabBarItemPositioning
    = TabBarItemPositioningFill
    | TabBarItemPositioningCenter
    | TabBarItemPositioningAuto


{-| -}
itemPositioning : TabBarItemPositioning -> Property msg
itemPositioning val =
    let
        stringValue =
            case val of
                TabBarItemPositioningFill ->
                    "fill"

                TabBarItemPositioningCenter ->
                    "center"

                TabBarItemPositioningAuto ->
                    "auto"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "itemPositioning" jsonValue


{-| -}
activeOpacity : Float -> Property msg
activeOpacity val =
    property "activeOpacity" (Json.Encode.float val)


{-| -}
gestureResponseDistance : Float -> Property msg
gestureResponseDistance val =
    property "gestureResponseDistance" (Json.Encode.float val)


{-| -}
enableGestures : Bool -> Property msg
enableGestures val =
    property "enableGestures" (Json.Encode.bool val)


{-| -}
statusBarHeight : Float -> Property msg
statusBarHeight val =
    property "statusBarHeight" (Json.Encode.float val)


{-| -}
underlayColor : String -> Property msg
underlayColor val =
    property "underlayColor" (Json.Encode.string val)
