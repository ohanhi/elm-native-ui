module NativeUi.Properties exposing (..)

{-| elm-native-ui Properties

@docs numberOfLines, suppressHighlighting, testID, allowFontScaling, source, defaultSource, accessible, accessibilityLabel, resizeMode, animating, color, hidesWhenStopped, size, showsUserLocation, followUserLocation, showsPointsOfInterest, showsCompass, zoomEnabled, rotateEnabled, pitchEnabled, scrollEnabled, mapType, maxDelta, minDelta, active, enabled, mode, prompt, progress, progressViewStyle, progressTintColor, trackTintColor, refreshing, title, automaticallyAdjustContentInsets, bounces, bouncesZoom, alwaysBounceHorizontal, alwaysBounceVertical, centerContent, horizontal, indicatorStyle, directionalLockEnabled, canCancelContentTouches, keyboardDismissMode, keyboardShouldPersistTaps, maximumZoomScale, minimumZoomScale, pagingEnabled, scrollEventThrottle, scrollsToTop, sendMomentumEvents, showsHorizontalScrollIndicator, showsVerticalScrollIndicator, snapToInterval, snapToAlignment, removeClippedSubviews, zoomScale, selectedIndex, tintColor, momentary, sliderValue, step, minimumValue, maximumValue, minimumTrackTintColor, maximumTrackTintColor, disabled, hidden, animated, translucent, barStyle, networkActivityIndicatorVisible, showHideTransition, autoCapitalize, autoCorrect, autoFocus, editable, keyboardType, keyboardAppearance, returnKeyType, maxLength, enablesReturnKeyAutomatically, multiline, placeholder, placeholderTextColor, secureTextEntry, selectionColor, value, defaultValue, clearButtonMode, clearTextOnFocus, selectTextOnFocus, blurOnSubmit, underlineColorAndroid, subtitle, contentInsetStart, contentInsetEnd, rtl, accessibilityLiveRegion, importantForAccessibility, pointerEvents, renderToHardwareTextureAndroid, shouldRasterizeIOS, collapsable, needsOffscreenAlphaCompositing, ActivityIndicatorSize, ImageResizeMode, MapViewMapType, PickerMode, ProgressViewProgressViewStyle, ScrollViewIndicatorStyle, ScrollViewKeyboardDismissMode, ScrollViewSnapToAlignment, StatusBarBarStyle, StatusBarShowHideTransition, TextInputAutoCapitalize, TextInputClearButtonMode, TextInputKeyboardAppearance, TextInputKeyboardType, TextInputReturnKeyType, ViewAccessibilityLiveRegion, ViewImportantForAccessibility, ViewPointerEvents
-}

import Json.Encode
import NativeUi exposing (Property, property)


{-| -}
numberOfLines : Float -> Property msg
numberOfLines val =
    property "numberOfLines" (Json.Encode.float val)


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
source : String -> Property msg
source uri =
    property "source" (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


{-| -}
defaultSource : String -> Property msg
defaultSource uri =
    property "defaultSource" (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


{-| -}
accessible : Bool -> Property msg
accessible val =
    property "accessible" (Json.Encode.bool val)


{-| -}
accessibilityLabel : String -> Property msg
accessibilityLabel val =
    property "accessibilityLabel" (Json.Encode.string val)


{-| -}
type ImageResizeMode
    = ImageResizeModeCover
    | ImageResizeModeContain
    | ImageResizeModeStretch


{-| -}
resizeMode : ImageResizeMode -> Property msg
resizeMode val =
    let
        stringValue =
            case val of
                ImageResizeModeCover ->
                    "cover"

                ImageResizeModeContain ->
                    "contain"

                ImageResizeModeStretch ->
                    "stretch"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "resizeMode" jsonValue


{-| -}
animating : Bool -> Property msg
animating val =
    property "animating" (Json.Encode.bool val)


{-| -}
color : String -> Property msg
color val =
    property "color" (Json.Encode.string val)


{-| -}
hidesWhenStopped : Bool -> Property msg
hidesWhenStopped val =
    property "hidesWhenStopped" (Json.Encode.bool val)


{-| -}
type ActivityIndicatorSize
    = ActivityIndicatorSizeSmall
    | ActivityIndicatorSizeLarge


{-| -}
size : ActivityIndicatorSize -> Property msg
size val =
    let
        stringValue =
            case val of
                ActivityIndicatorSizeSmall ->
                    "small"

                ActivityIndicatorSizeLarge ->
                    "large"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "size" jsonValue


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
type MapViewMapType
    = MapViewMapTypeStandard
    | MapViewMapTypeSatellite
    | MapViewMapTypeHybrid


{-| -}
mapType : MapViewMapType -> Property msg
mapType val =
    let
        stringValue =
            case val of
                MapViewMapTypeStandard ->
                    "standard"

                MapViewMapTypeSatellite ->
                    "satellite"

                MapViewMapTypeHybrid ->
                    "hybrid"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "mapType" jsonValue


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
progress : Float -> Property msg
progress val =
    property "progress" (Json.Encode.float val)


{-| -}
type ProgressViewProgressViewStyle
    = ProgressViewProgressViewStyleDefault
    | ProgressViewProgressViewStyleBar


{-| -}
progressViewStyle : ProgressViewProgressViewStyle -> Property msg
progressViewStyle val =
    let
        stringValue =
            case val of
                ProgressViewProgressViewStyleDefault ->
                    "default"

                ProgressViewProgressViewStyleBar ->
                    "bar"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "progressViewStyle" jsonValue


{-| -}
progressTintColor : String -> Property msg
progressTintColor val =
    property "progressTintColor" (Json.Encode.string val)


{-| -}
trackTintColor : String -> Property msg
trackTintColor val =
    property "trackTintColor" (Json.Encode.string val)


{-| -}
refreshing : Bool -> Property msg
refreshing val =
    property "refreshing" (Json.Encode.bool val)


{-| -}
title : String -> Property msg
title val =
    property "title" (Json.Encode.string val)


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
sendMomentumEvents : Bool -> Property msg
sendMomentumEvents val =
    property "sendMomentumEvents" (Json.Encode.bool val)


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
selectedIndex : Float -> Property msg
selectedIndex val =
    property "selectedIndex" (Json.Encode.float val)


{-| -}
tintColor : String -> Property msg
tintColor val =
    property "tintColor" (Json.Encode.string val)


{-| -}
momentary : Bool -> Property msg
momentary val =
    property "momentary" (Json.Encode.bool val)


{-| -}
sliderValue : Float -> Property msg
sliderValue val =
    property "sliderValue" (Json.Encode.float val)


{-| -}
step : Float -> Property msg
step val =
    property "step" (Json.Encode.float val)


{-| -}
minimumValue : Float -> Property msg
minimumValue val =
    property "minimumValue" (Json.Encode.float val)


{-| -}
maximumValue : Float -> Property msg
maximumValue val =
    property "maximumValue" (Json.Encode.float val)


{-| -}
minimumTrackTintColor : String -> Property msg
minimumTrackTintColor val =
    property "minimumTrackTintColor" (Json.Encode.string val)


{-| -}
maximumTrackTintColor : String -> Property msg
maximumTrackTintColor val =
    property "maximumTrackTintColor" (Json.Encode.string val)


{-| -}
disabled : Bool -> Property msg
disabled val =
    property "disabled" (Json.Encode.bool val)


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
type TextInputAutoCapitalize
    = TextInputAutoCapitalizeNone
    | TextInputAutoCapitalizeSentences
    | TextInputAutoCapitalizeWords
    | TextInputAutoCapitalizeCharacters


{-| -}
autoCapitalize : TextInputAutoCapitalize -> Property msg
autoCapitalize val =
    let
        stringValue =
            case val of
                TextInputAutoCapitalizeNone ->
                    "none"

                TextInputAutoCapitalizeSentences ->
                    "sentences"

                TextInputAutoCapitalizeWords ->
                    "words"

                TextInputAutoCapitalizeCharacters ->
                    "characters"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "autoCapitalize" jsonValue


{-| -}
autoCorrect : Bool -> Property msg
autoCorrect val =
    property "autoCorrect" (Json.Encode.bool val)


{-| -}
autoFocus : Bool -> Property msg
autoFocus val =
    property "autoFocus" (Json.Encode.bool val)


{-| -}
editable : Bool -> Property msg
editable val =
    property "editable" (Json.Encode.bool val)


{-| -}
type TextInputKeyboardType
    = TextInputKeyboardTypeDefault
    | TextInputKeyboardTypeEmailAddress
    | TextInputKeyboardTypeNumeric
    | TextInputKeyboardTypePhonePad
    | TextInputKeyboardTypeAsciiCapable
    | TextInputKeyboardTypeNumbersAndPunctuation
    | TextInputKeyboardTypeUrl
    | TextInputKeyboardTypeNumberPad
    | TextInputKeyboardTypeNamePhonePad
    | TextInputKeyboardTypeDecimalPad
    | TextInputKeyboardTypeTwitter
    | TextInputKeyboardTypeWebSearch


{-| -}
keyboardType : TextInputKeyboardType -> Property msg
keyboardType val =
    let
        stringValue =
            case val of
                TextInputKeyboardTypeDefault ->
                    "default"

                TextInputKeyboardTypeEmailAddress ->
                    "email-address"

                TextInputKeyboardTypeNumeric ->
                    "numeric"

                TextInputKeyboardTypePhonePad ->
                    "phone-pad"

                TextInputKeyboardTypeAsciiCapable ->
                    "ascii-capable"

                TextInputKeyboardTypeNumbersAndPunctuation ->
                    "numbers-and-punctuation"

                TextInputKeyboardTypeUrl ->
                    "url"

                TextInputKeyboardTypeNumberPad ->
                    "number-pad"

                TextInputKeyboardTypeNamePhonePad ->
                    "name-phone-pad"

                TextInputKeyboardTypeDecimalPad ->
                    "decimal-pad"

                TextInputKeyboardTypeTwitter ->
                    "twitter"

                TextInputKeyboardTypeWebSearch ->
                    "web-search"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "keyboardType" jsonValue


{-| -}
type TextInputKeyboardAppearance
    = TextInputKeyboardAppearanceDefault
    | TextInputKeyboardAppearanceLight
    | TextInputKeyboardAppearanceDark


{-| -}
keyboardAppearance : TextInputKeyboardAppearance -> Property msg
keyboardAppearance val =
    let
        stringValue =
            case val of
                TextInputKeyboardAppearanceDefault ->
                    "default"

                TextInputKeyboardAppearanceLight ->
                    "light"

                TextInputKeyboardAppearanceDark ->
                    "dark"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "keyboardAppearance" jsonValue


{-| -}
type TextInputReturnKeyType
    = TextInputReturnKeyTypeDefault
    | TextInputReturnKeyTypeGo
    | TextInputReturnKeyTypeGoogle
    | TextInputReturnKeyTypeJoin
    | TextInputReturnKeyTypeNext
    | TextInputReturnKeyTypeRoute
    | TextInputReturnKeyTypeSearch
    | TextInputReturnKeyTypeSend
    | TextInputReturnKeyTypeYahoo
    | TextInputReturnKeyTypeDone
    | TextInputReturnKeyTypeEmergencyCall


{-| -}
returnKeyType : TextInputReturnKeyType -> Property msg
returnKeyType val =
    let
        stringValue =
            case val of
                TextInputReturnKeyTypeDefault ->
                    "default"

                TextInputReturnKeyTypeGo ->
                    "go"

                TextInputReturnKeyTypeGoogle ->
                    "google"

                TextInputReturnKeyTypeJoin ->
                    "join"

                TextInputReturnKeyTypeNext ->
                    "next"

                TextInputReturnKeyTypeRoute ->
                    "route"

                TextInputReturnKeyTypeSearch ->
                    "search"

                TextInputReturnKeyTypeSend ->
                    "send"

                TextInputReturnKeyTypeYahoo ->
                    "yahoo"

                TextInputReturnKeyTypeDone ->
                    "done"

                TextInputReturnKeyTypeEmergencyCall ->
                    "emergency-call"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "returnKeyType" jsonValue


{-| -}
maxLength : Float -> Property msg
maxLength val =
    property "maxLength" (Json.Encode.float val)


{-| -}
enablesReturnKeyAutomatically : Bool -> Property msg
enablesReturnKeyAutomatically val =
    property "enablesReturnKeyAutomatically" (Json.Encode.bool val)


{-| -}
multiline : Bool -> Property msg
multiline val =
    property "multiline" (Json.Encode.bool val)


{-| -}
placeholder : String -> Property msg
placeholder val =
    property "placeholder" (Json.Encode.string val)


{-| -}
placeholderTextColor : String -> Property msg
placeholderTextColor val =
    property "placeholderTextColor" (Json.Encode.string val)


{-| -}
secureTextEntry : Bool -> Property msg
secureTextEntry val =
    property "secureTextEntry" (Json.Encode.bool val)


{-| -}
selectionColor : String -> Property msg
selectionColor val =
    property "selectionColor" (Json.Encode.string val)


{-| -}
value : String -> Property msg
value val =
    property "value" (Json.Encode.string val)


{-| -}
defaultValue : String -> Property msg
defaultValue val =
    property "defaultValue" (Json.Encode.string val)


{-| -}
type TextInputClearButtonMode
    = TextInputClearButtonModeNever
    | TextInputClearButtonModeWhileEditing
    | TextInputClearButtonModeUnlessEditing
    | TextInputClearButtonModeAlways


{-| -}
clearButtonMode : TextInputClearButtonMode -> Property msg
clearButtonMode val =
    let
        stringValue =
            case val of
                TextInputClearButtonModeNever ->
                    "never"

                TextInputClearButtonModeWhileEditing ->
                    "while-editing"

                TextInputClearButtonModeUnlessEditing ->
                    "unless-editing"

                TextInputClearButtonModeAlways ->
                    "always"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "clearButtonMode" jsonValue


{-| -}
clearTextOnFocus : Bool -> Property msg
clearTextOnFocus val =
    property "clearTextOnFocus" (Json.Encode.bool val)


{-| -}
selectTextOnFocus : Bool -> Property msg
selectTextOnFocus val =
    property "selectTextOnFocus" (Json.Encode.bool val)


{-| -}
blurOnSubmit : Bool -> Property msg
blurOnSubmit val =
    property "blurOnSubmit" (Json.Encode.bool val)


{-| -}
underlineColorAndroid : String -> Property msg
underlineColorAndroid val =
    property "underlineColorAndroid" (Json.Encode.string val)


{-| -}
subtitle : String -> Property msg
subtitle val =
    property "subtitle" (Json.Encode.string val)


{-| -}
contentInsetStart : Float -> Property msg
contentInsetStart val =
    property "contentInsetStart" (Json.Encode.float val)


{-| -}
contentInsetEnd : Float -> Property msg
contentInsetEnd val =
    property "contentInsetEnd" (Json.Encode.float val)


{-| -}
rtl : Bool -> Property msg
rtl val =
    property "rtl" (Json.Encode.bool val)


{-| -}
type ViewAccessibilityLiveRegion
    = ViewAccessibilityLiveRegionNone
    | ViewAccessibilityLiveRegionPolite
    | ViewAccessibilityLiveRegionAssertive


{-| -}
accessibilityLiveRegion : ViewAccessibilityLiveRegion -> Property msg
accessibilityLiveRegion val =
    let
        stringValue =
            case val of
                ViewAccessibilityLiveRegionNone ->
                    "none"

                ViewAccessibilityLiveRegionPolite ->
                    "polite"

                ViewAccessibilityLiveRegionAssertive ->
                    "assertive"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "accessibilityLiveRegion" jsonValue


{-| -}
type ViewImportantForAccessibility
    = ViewImportantForAccessibilityAuto
    | ViewImportantForAccessibilityYes
    | ViewImportantForAccessibilityNo
    | ViewImportantForAccessibilityNoHideDescendants


{-| -}
importantForAccessibility : ViewImportantForAccessibility -> Property msg
importantForAccessibility val =
    let
        stringValue =
            case val of
                ViewImportantForAccessibilityAuto ->
                    "auto"

                ViewImportantForAccessibilityYes ->
                    "yes"

                ViewImportantForAccessibilityNo ->
                    "no"

                ViewImportantForAccessibilityNoHideDescendants ->
                    "no-hide-descendants"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "importantForAccessibility" jsonValue


{-| -}
type ViewPointerEvents
    = ViewPointerEventsBoxNone
    | ViewPointerEventsNone
    | ViewPointerEventsBoxOnly
    | ViewPointerEventsAuto


{-| -}
pointerEvents : ViewPointerEvents -> Property msg
pointerEvents val =
    let
        stringValue =
            case val of
                ViewPointerEventsBoxNone ->
                    "box-none"

                ViewPointerEventsNone ->
                    "none"

                ViewPointerEventsBoxOnly ->
                    "box-only"

                ViewPointerEventsAuto ->
                    "auto"

        jsonValue =
            Json.Encode.string stringValue
    in
        property "pointerEvents" jsonValue


{-| -}
renderToHardwareTextureAndroid : Bool -> Property msg
renderToHardwareTextureAndroid val =
    property "renderToHardwareTextureAndroid" (Json.Encode.bool val)


{-| -}
shouldRasterizeIOS : Bool -> Property msg
shouldRasterizeIOS val =
    property "shouldRasterizeIOS" (Json.Encode.bool val)


{-| -}
collapsable : Bool -> Property msg
collapsable val =
    property "collapsable" (Json.Encode.bool val)


{-| -}
needsOffscreenAlphaCompositing : Bool -> Property msg
needsOffscreenAlphaCompositing val =
    property "needsOffscreenAlphaCompositing" (Json.Encode.bool val)
