module NativeUi.Properties (..) where

{-| elm-native-ui Properties

  @docs animating, color, hidesWhenStopped, size, showsUserLocation, followUserLocation, showsPointsOfInterest, showsCompass, zoomEnabled, rotateEnabled, pitchEnabled, scrollEnabled, mapType, maxDelta, minDelta, active, enabled, mode, prompt, testID, progress, progressViewStyle, progressTintColor, trackTintColor, refreshing, title, automaticallyAdjustContentInsets, bounces, bouncesZoom, alwaysBounceHorizontal, alwaysBounceVertical, centerContent, horizontal, indicatorStyle, directionalLockEnabled, canCancelContentTouches, keyboardDismissMode, keyboardShouldPersistTaps, maximumZoomScale, minimumZoomScale, pagingEnabled, scrollEventThrottle, scrollsToTop, sendMomentumEvents, showsHorizontalScrollIndicator, showsVerticalScrollIndicator, snapToInterval, snapToAlignment, removeClippedSubviews, zoomScale, selectedIndex, tintColor, momentary, sliderValue, step, minimumValue, maximumValue, minimumTrackTintColor, maximumTrackTintColor, disabled, hidden, animated, translucent, barStyle, networkActivityIndicatorVisible, showHideTransition, numberOfLines, suppressHighlighting, allowFontScaling, autoCapitalize, autoCorrect, autoFocus, editable, keyboardType, keyboardAppearance, returnKeyType, maxLength, enablesReturnKeyAutomatically, multiline, placeholder, placeholderTextColor, secureTextEntry, selectionColor, value, defaultValue, clearButtonMode, clearTextOnFocus, selectTextOnFocus, blurOnSubmit, underlineColorAndroid, subtitle, contentInsetStart, contentInsetEnd, rtl, accessible, accessibilityLabel, accessibilityLiveRegion, importantForAccessibility, pointerEvents, renderToHardwareTextureAndroid, shouldRasterizeIOS, collapsable, needsOffscreenAlphaCompositing
-}

import Json.Encode
import NativeUi exposing (Property, jsonProperty)


animating : Bool -> Property
animating val =
  jsonProperty "animating" (Json.Encode.bool val)


color : String -> Property
color val =
  jsonProperty "color" (Json.Encode.string val)


hidesWhenStopped : Bool -> Property
hidesWhenStopped val =
  jsonProperty "hidesWhenStopped" (Json.Encode.bool val)


type ActivityIndicatorSize
  = ActivityIndicatorSizeSmall
  | ActivityIndicatorSizeLarge


size : ActivityIndicatorSize -> Property
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
    jsonProperty "size" jsonValue


showsUserLocation : Bool -> Property
showsUserLocation val =
  jsonProperty "showsUserLocation" (Json.Encode.bool val)


followUserLocation : Bool -> Property
followUserLocation val =
  jsonProperty "followUserLocation" (Json.Encode.bool val)


showsPointsOfInterest : Bool -> Property
showsPointsOfInterest val =
  jsonProperty "showsPointsOfInterest" (Json.Encode.bool val)


showsCompass : Bool -> Property
showsCompass val =
  jsonProperty "showsCompass" (Json.Encode.bool val)


zoomEnabled : Bool -> Property
zoomEnabled val =
  jsonProperty "zoomEnabled" (Json.Encode.bool val)


rotateEnabled : Bool -> Property
rotateEnabled val =
  jsonProperty "rotateEnabled" (Json.Encode.bool val)


pitchEnabled : Bool -> Property
pitchEnabled val =
  jsonProperty "pitchEnabled" (Json.Encode.bool val)


scrollEnabled : Bool -> Property
scrollEnabled val =
  jsonProperty "scrollEnabled" (Json.Encode.bool val)


type MapViewMapType
  = MapViewMapTypeStandard
  | MapViewMapTypeSatellite
  | MapViewMapTypeHybrid


mapType : MapViewMapType -> Property
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
    jsonProperty "mapType" jsonValue


maxDelta : Float -> Property
maxDelta val =
  jsonProperty "maxDelta" (Json.Encode.float val)


minDelta : Float -> Property
minDelta val =
  jsonProperty "minDelta" (Json.Encode.float val)


active : Bool -> Property
active val =
  jsonProperty "active" (Json.Encode.bool val)


enabled : Bool -> Property
enabled val =
  jsonProperty "enabled" (Json.Encode.bool val)


type PickerMode
  = PickerModeDialog
  | PickerModeDropdown


mode : PickerMode -> Property
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
    jsonProperty "mode" jsonValue


prompt : String -> Property
prompt val =
  jsonProperty "prompt" (Json.Encode.string val)


testID : String -> Property
testID val =
  jsonProperty "testID" (Json.Encode.string val)


progress : Float -> Property
progress val =
  jsonProperty "progress" (Json.Encode.float val)


type ProgressViewProgressViewStyle
  = ProgressViewProgressViewStyleDefault
  | ProgressViewProgressViewStyleBar


progressViewStyle : ProgressViewProgressViewStyle -> Property
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
    jsonProperty "progressViewStyle" jsonValue


progressTintColor : String -> Property
progressTintColor val =
  jsonProperty "progressTintColor" (Json.Encode.string val)


trackTintColor : String -> Property
trackTintColor val =
  jsonProperty "trackTintColor" (Json.Encode.string val)


refreshing : Bool -> Property
refreshing val =
  jsonProperty "refreshing" (Json.Encode.bool val)


title : String -> Property
title val =
  jsonProperty "title" (Json.Encode.string val)


automaticallyAdjustContentInsets : Bool -> Property
automaticallyAdjustContentInsets val =
  jsonProperty "automaticallyAdjustContentInsets" (Json.Encode.bool val)


bounces : Bool -> Property
bounces val =
  jsonProperty "bounces" (Json.Encode.bool val)


bouncesZoom : Bool -> Property
bouncesZoom val =
  jsonProperty "bouncesZoom" (Json.Encode.bool val)


alwaysBounceHorizontal : Bool -> Property
alwaysBounceHorizontal val =
  jsonProperty "alwaysBounceHorizontal" (Json.Encode.bool val)


alwaysBounceVertical : Bool -> Property
alwaysBounceVertical val =
  jsonProperty "alwaysBounceVertical" (Json.Encode.bool val)


centerContent : Bool -> Property
centerContent val =
  jsonProperty "centerContent" (Json.Encode.bool val)


horizontal : Bool -> Property
horizontal val =
  jsonProperty "horizontal" (Json.Encode.bool val)


type ScrollViewIndicatorStyle
  = ScrollViewIndicatorStyleDefault
  | ScrollViewIndicatorStyleBlack
  | ScrollViewIndicatorStyleWhite


indicatorStyle : ScrollViewIndicatorStyle -> Property
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
    jsonProperty "indicatorStyle" jsonValue


directionalLockEnabled : Bool -> Property
directionalLockEnabled val =
  jsonProperty "directionalLockEnabled" (Json.Encode.bool val)


canCancelContentTouches : Bool -> Property
canCancelContentTouches val =
  jsonProperty "canCancelContentTouches" (Json.Encode.bool val)


type ScrollViewKeyboardDismissMode
  = ScrollViewKeyboardDismissModeNone
  | ScrollViewKeyboardDismissModeInteractive
  | ScrollViewKeyboardDismissModeOnDrag


keyboardDismissMode : ScrollViewKeyboardDismissMode -> Property
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
    jsonProperty "keyboardDismissMode" jsonValue


keyboardShouldPersistTaps : Bool -> Property
keyboardShouldPersistTaps val =
  jsonProperty "keyboardShouldPersistTaps" (Json.Encode.bool val)


maximumZoomScale : Float -> Property
maximumZoomScale val =
  jsonProperty "maximumZoomScale" (Json.Encode.float val)


minimumZoomScale : Float -> Property
minimumZoomScale val =
  jsonProperty "minimumZoomScale" (Json.Encode.float val)


pagingEnabled : Bool -> Property
pagingEnabled val =
  jsonProperty "pagingEnabled" (Json.Encode.bool val)


scrollEventThrottle : Float -> Property
scrollEventThrottle val =
  jsonProperty "scrollEventThrottle" (Json.Encode.float val)


scrollsToTop : Bool -> Property
scrollsToTop val =
  jsonProperty "scrollsToTop" (Json.Encode.bool val)


sendMomentumEvents : Bool -> Property
sendMomentumEvents val =
  jsonProperty "sendMomentumEvents" (Json.Encode.bool val)


showsHorizontalScrollIndicator : Bool -> Property
showsHorizontalScrollIndicator val =
  jsonProperty "showsHorizontalScrollIndicator" (Json.Encode.bool val)


showsVerticalScrollIndicator : Bool -> Property
showsVerticalScrollIndicator val =
  jsonProperty "showsVerticalScrollIndicator" (Json.Encode.bool val)


snapToInterval : Float -> Property
snapToInterval val =
  jsonProperty "snapToInterval" (Json.Encode.float val)


type ScrollViewSnapToAlignment
  = ScrollViewSnapToAlignmentStart
  | ScrollViewSnapToAlignmentCenter
  | ScrollViewSnapToAlignmentEnd


snapToAlignment : ScrollViewSnapToAlignment -> Property
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
    jsonProperty "snapToAlignment" jsonValue


removeClippedSubviews : Bool -> Property
removeClippedSubviews val =
  jsonProperty "removeClippedSubviews" (Json.Encode.bool val)


zoomScale : Float -> Property
zoomScale val =
  jsonProperty "zoomScale" (Json.Encode.float val)


selectedIndex : Float -> Property
selectedIndex val =
  jsonProperty "selectedIndex" (Json.Encode.float val)


tintColor : String -> Property
tintColor val =
  jsonProperty "tintColor" (Json.Encode.string val)


momentary : Bool -> Property
momentary val =
  jsonProperty "momentary" (Json.Encode.bool val)


sliderValue : Float -> Property
sliderValue val =
  jsonProperty "sliderValue" (Json.Encode.float val)


step : Float -> Property
step val =
  jsonProperty "step" (Json.Encode.float val)


minimumValue : Float -> Property
minimumValue val =
  jsonProperty "minimumValue" (Json.Encode.float val)


maximumValue : Float -> Property
maximumValue val =
  jsonProperty "maximumValue" (Json.Encode.float val)


minimumTrackTintColor : String -> Property
minimumTrackTintColor val =
  jsonProperty "minimumTrackTintColor" (Json.Encode.string val)


maximumTrackTintColor : String -> Property
maximumTrackTintColor val =
  jsonProperty "maximumTrackTintColor" (Json.Encode.string val)


disabled : Bool -> Property
disabled val =
  jsonProperty "disabled" (Json.Encode.bool val)


hidden : Bool -> Property
hidden val =
  jsonProperty "hidden" (Json.Encode.bool val)


animated : Bool -> Property
animated val =
  jsonProperty "animated" (Json.Encode.bool val)


translucent : Bool -> Property
translucent val =
  jsonProperty "translucent" (Json.Encode.bool val)


type StatusBarBarStyle
  = StatusBarBarStyleDefault
  | StatusBarBarStyleLightContent


barStyle : StatusBarBarStyle -> Property
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
    jsonProperty "barStyle" jsonValue


networkActivityIndicatorVisible : Bool -> Property
networkActivityIndicatorVisible val =
  jsonProperty "networkActivityIndicatorVisible" (Json.Encode.bool val)


type StatusBarShowHideTransition
  = StatusBarShowHideTransitionFade
  | StatusBarShowHideTransitionSlide


showHideTransition : StatusBarShowHideTransition -> Property
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
    jsonProperty "showHideTransition" jsonValue


numberOfLines : Float -> Property
numberOfLines val =
  jsonProperty "numberOfLines" (Json.Encode.float val)


suppressHighlighting : Bool -> Property
suppressHighlighting val =
  jsonProperty "suppressHighlighting" (Json.Encode.bool val)


allowFontScaling : Bool -> Property
allowFontScaling val =
  jsonProperty "allowFontScaling" (Json.Encode.bool val)


type TextInputAutoCapitalize
  = TextInputAutoCapitalizeNone
  | TextInputAutoCapitalizeSentences
  | TextInputAutoCapitalizeWords
  | TextInputAutoCapitalizeCharacters


autoCapitalize : TextInputAutoCapitalize -> Property
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
    jsonProperty "autoCapitalize" jsonValue


autoCorrect : Bool -> Property
autoCorrect val =
  jsonProperty "autoCorrect" (Json.Encode.bool val)


autoFocus : Bool -> Property
autoFocus val =
  jsonProperty "autoFocus" (Json.Encode.bool val)


editable : Bool -> Property
editable val =
  jsonProperty "editable" (Json.Encode.bool val)


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


keyboardType : TextInputKeyboardType -> Property
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
    jsonProperty "keyboardType" jsonValue


type TextInputKeyboardAppearance
  = TextInputKeyboardAppearanceDefault
  | TextInputKeyboardAppearanceLight
  | TextInputKeyboardAppearanceDark


keyboardAppearance : TextInputKeyboardAppearance -> Property
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
    jsonProperty "keyboardAppearance" jsonValue


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


returnKeyType : TextInputReturnKeyType -> Property
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
    jsonProperty "returnKeyType" jsonValue


maxLength : Float -> Property
maxLength val =
  jsonProperty "maxLength" (Json.Encode.float val)


enablesReturnKeyAutomatically : Bool -> Property
enablesReturnKeyAutomatically val =
  jsonProperty "enablesReturnKeyAutomatically" (Json.Encode.bool val)


multiline : Bool -> Property
multiline val =
  jsonProperty "multiline" (Json.Encode.bool val)


placeholder : String -> Property
placeholder val =
  jsonProperty "placeholder" (Json.Encode.string val)


placeholderTextColor : String -> Property
placeholderTextColor val =
  jsonProperty "placeholderTextColor" (Json.Encode.string val)


secureTextEntry : Bool -> Property
secureTextEntry val =
  jsonProperty "secureTextEntry" (Json.Encode.bool val)


selectionColor : String -> Property
selectionColor val =
  jsonProperty "selectionColor" (Json.Encode.string val)


value : String -> Property
value val =
  jsonProperty "value" (Json.Encode.string val)


defaultValue : String -> Property
defaultValue val =
  jsonProperty "defaultValue" (Json.Encode.string val)


type TextInputClearButtonMode
  = TextInputClearButtonModeNever
  | TextInputClearButtonModeWhileEditing
  | TextInputClearButtonModeUnlessEditing
  | TextInputClearButtonModeAlways


clearButtonMode : TextInputClearButtonMode -> Property
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
    jsonProperty "clearButtonMode" jsonValue


clearTextOnFocus : Bool -> Property
clearTextOnFocus val =
  jsonProperty "clearTextOnFocus" (Json.Encode.bool val)


selectTextOnFocus : Bool -> Property
selectTextOnFocus val =
  jsonProperty "selectTextOnFocus" (Json.Encode.bool val)


blurOnSubmit : Bool -> Property
blurOnSubmit val =
  jsonProperty "blurOnSubmit" (Json.Encode.bool val)


underlineColorAndroid : String -> Property
underlineColorAndroid val =
  jsonProperty "underlineColorAndroid" (Json.Encode.string val)


subtitle : String -> Property
subtitle val =
  jsonProperty "subtitle" (Json.Encode.string val)


contentInsetStart : Float -> Property
contentInsetStart val =
  jsonProperty "contentInsetStart" (Json.Encode.float val)


contentInsetEnd : Float -> Property
contentInsetEnd val =
  jsonProperty "contentInsetEnd" (Json.Encode.float val)


rtl : Bool -> Property
rtl val =
  jsonProperty "rtl" (Json.Encode.bool val)


accessible : Bool -> Property
accessible val =
  jsonProperty "accessible" (Json.Encode.bool val)


accessibilityLabel : String -> Property
accessibilityLabel val =
  jsonProperty "accessibilityLabel" (Json.Encode.string val)


type ViewAccessibilityLiveRegion
  = ViewAccessibilityLiveRegionNone
  | ViewAccessibilityLiveRegionPolite
  | ViewAccessibilityLiveRegionAssertive


accessibilityLiveRegion : ViewAccessibilityLiveRegion -> Property
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
    jsonProperty "accessibilityLiveRegion" jsonValue


type ViewImportantForAccessibility
  = ViewImportantForAccessibilityAuto
  | ViewImportantForAccessibilityYes
  | ViewImportantForAccessibilityNo
  | ViewImportantForAccessibilityNoHideDescendants


importantForAccessibility : ViewImportantForAccessibility -> Property
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
    jsonProperty "importantForAccessibility" jsonValue


type ViewPointerEvents
  = ViewPointerEventsBoxNone
  | ViewPointerEventsNone
  | ViewPointerEventsBoxOnly
  | ViewPointerEventsAuto


pointerEvents : ViewPointerEvents -> Property
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
    jsonProperty "pointerEvents" jsonValue


renderToHardwareTextureAndroid : Bool -> Property
renderToHardwareTextureAndroid val =
  jsonProperty "renderToHardwareTextureAndroid" (Json.Encode.bool val)


shouldRasterizeIOS : Bool -> Property
shouldRasterizeIOS val =
  jsonProperty "shouldRasterizeIOS" (Json.Encode.bool val)


collapsable : Bool -> Property
collapsable val =
  jsonProperty "collapsable" (Json.Encode.bool val)


needsOffscreenAlphaCompositing : Bool -> Property
needsOffscreenAlphaCompositing val =
  jsonProperty "needsOffscreenAlphaCompositing" (Json.Encode.bool val)
