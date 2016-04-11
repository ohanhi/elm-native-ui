module NativeUi.Properties (..) where

{-| Properties of components
@docs propEnum, Date, DrawerLockMode
@docs accessibilityLabel, propEnumInt
@docs accessibilityLiveRegion, accessible, active, activeOpacity
@docs allowFontScaling, allowsInlineMediaPlayback, alwaysBounceHorizontal
@docs alwaysBounceVertical, animated, animating, annotations, autoCapitalize
@docs autoCorrect, autoFocus, automaticallyAdjustContentInsets, badgeString
@docs barStyle, barTintColor, blurOnSubmit, blurRadius, bounces, bouncesZoom
@docs canCancelContentTouches, capInsets, centerContent, clearButtonMode
@docs clearTextOnFocus, collapsable, color, contentInset, contentInsetEnd
@docs contentInsetStart, date, datePickerMode, defaultSource, defaultSourceNum
@docs defaultValue, delayLongPress, delayPressIn, delayPressOut
@docs directionalLockEnabled, disabled, domStorageEnabled, drawerLockMode
@docs drawerPosition, drawerWidth, editable, enableEmptySections, enabled
@docs enablesReturnKeyAutomatically, endFillColor, enumToString
@docs followUserLocation, hidden, hidesWhenStopped, hitSlop, horizontal
@docs importantForAccessibility, indicatorStyle, initialListSize, initialPage
@docs initialRoute, injectedJavaScript, javaScriptEnabled, keyboardAppearance
@docs keyboardDismissMode, keyboardShouldPersistTaps, keyboardType
@docs legalLabelInsets, mapType, maxDelta, maxLength, maximumDate
@docs maximumTrackTintColor, maximumValue, maximumZoomScale
@docs mediaPlaybackRequiresUserAction, minDelta, minimumDate
@docs minimumTrackTintColor, minimumValue, minimumZoomScale, minuteInterval
@docs momentary, multiline, navigationBarHidden, navigator
@docs needsOffscreenAlphaCompositing, networkActivityIndicatorVisible
@docs numberOfLines, overlays, pageSize, pagingEnabled, pickerMode
@docs pitchEnabled, placeholder, placeholderTextColor, pointerEvents
@docs pressRetentionOffset, progress, progressBackgroundColor
@docs progressTintColor, progressViewStyle, prompt, propBool, propFloat, propInt
@docs propString, propUri, refreshing, region, removeClippedSubviews
@docs renderError, renderFooter, renderHeader, renderLoading
@docs renderNavigationView, renderRow, renderScene, renderScrollComponent
@docs renderSectionHeader, renderSeparator, renderToHardwareTextureAndroid
@docs resizeMode, returnKeyType, rotateEnabled, rtl, scalesPageToFit
@docs scrollEnabled, scrollEventThrottle, scrollIndicatorInsets
@docs scrollRenderAheadDistance, scrollsToTop, secureTextEntry
@docs selectTextOnFocus, selectedIndex, selectionColor, sendMomentumEvents
@docs shadowHidden, shouldRasterizeIOS, showHideTransition, showsCompass
@docs showsHorizontalScrollIndicator, showsPointsOfInterest, showsUserLocation
@docs showsVerticalScrollIndicator, size, sliderValue, snapToAlignment
@docs snapToInterval, source, sourceNum, startInLoadingState
@docs statusBarBackgroundColor, step, stickyHeaderIndices, subtitle
@docs suppressHighlighting, testID, thumbTintColor, timeZoneOffsetInMinutes
@docs tintColor, title, titleColor, titleTextColor, trackTintColor, translucent
@docs transparent, underlayColor, underlineColorAndroid, value, zoomEnabled
@docs zoomScale, propTlbr, propLatLong, firstLower, toHyphenated
-}

import Json.Encode
import NativeUi exposing (Property, property)
import NativeUi.Enum.DatePicker as Dpe
import NativeUi.Enum.ImageResize as Ire
import NativeUi.Enum.ActivityIndicator as Aie
import NativeUi.Enum.MapView as MapType
import NativeUi.Enum.Picker as PickerMode
import NativeUi.Enum.ProgressView as ProgressViewStyle
import NativeUi.Enum.ScrollView as ScrollViewEnum
import NativeUi.Enum.DrawerLayoutAndroid as DrawerLayoutEnum
import NativeUi.Enum.StatusBar as StatusBarEnum
import NativeUi.Enum.TextInput as TextInputEnum
import NativeUi.Enum.TextInputKA as TextInputKAEnum
import NativeUi.Enum.ReturnKeyType as ReturnKeyTypeEnum
import NativeUi.Enum.View as ViewEnum
import NativeUi.Enum.Pointer as PointerEnum
import NativeUi.Enum.DatePickerIos as DatePickerIosEnum
import String
import Char
import String


{-| -}
firstLower : List Char -> List Char
firstLower lst =
  case lst of
    [] ->
      []

    x :: xs ->
      Char.toLower (x) :: xs


{-| -}
toHyphenated : List Char -> List Char
toHyphenated x =
  case x of
    [] ->
      []

    x' :: xs ->
      case (Char.isUpper x') of
        True ->
          '-' :: Char.toLower x' :: toHyphenated xs

        False ->
          x' :: toHyphenated xs


{-| -}
propInt : String -> Int -> Property
propInt name val =
  property name (Json.Encode.int val)


{-| -}
propEnum : String -> a -> Property
propEnum name val =
  propString name (enumToString val)


{-| -}
propEnumInt : String -> Int -> a -> Property
propEnumInt name dc val =
  val
    |> enumToString
    |> String.dropLeft dc
    |> String.toInt
    |> Result.withDefault 0
    |> propInt name


{-| -}
propTlbr : String -> Int -> Int -> Int -> Int -> Property
propTlbr name top left bottom right =
  property
    name
    (Json.Encode.object
      [ ( "top", Json.Encode.int top )
      , ( "left", Json.Encode.int left )
      , ( "bottom", Json.Encode.int bottom )
      , ( "right", Json.Encode.int right )
      ]
    )


{-| -}
propLatLong : String -> Int -> Int -> Int -> Int -> Property
propLatLong name a b c d =
  property
    name
    (Json.Encode.object
      [ ( "latitude", Json.Encode.int a )
      , ( "longitude", Json.Encode.int b )
      , ( "latitudeDelta", Json.Encode.int c )
      , ( "longitudeDelta", Json.Encode.int d )
      ]
    )


{-| -}
propFloat : String -> Float -> Property
propFloat name val =
  property name (Json.Encode.float val)


{-| -}
propString : String -> String -> Property
propString name val =
  property name (Json.Encode.string val)


{-| -}
propBool : String -> Bool -> Property
propBool name val =
  property name (Json.Encode.bool val)


{-| -}
propUri : String -> String -> Property
propUri name uri =
  property name (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


{-| -}
enumToString : a -> String
enumToString o =
  o
    |> toString
    |> String.toList
    |> firstLower
    |> toHyphenated
    |> String.fromList


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
numberOfLines : Int -> Property
numberOfLines =
  propInt "numberOfLines"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
suppressHighlighting : Bool -> Property
suppressHighlighting =
  propBool "suppressHighlighting"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
testID : String -> Property
testID =
  propString "testID"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
allowFontScaling : Bool -> Property
allowFontScaling =
  propBool "allowFontScaling"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
source : String -> Property
source uri =
  propUri "source" uri


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
defaultSource : String -> Property
defaultSource uri =
  propUri "defaultSource" uri


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
accessible : Bool -> Property
accessible =
  propBool "accessible"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
accessibilityLabel : String -> Property
accessibilityLabel =
  propString "accessibilityLabel"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
resizeMode : Ire.Mode -> Property
resizeMode =
  propEnum "resizeMode"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
animating : Bool -> Property
animating =
  propBool "animating"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
color : String -> Property
color =
  propString "color"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
hidesWhenStopped : Bool -> Property
hidesWhenStopped =
  propBool "hidesWhenStopped"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
size : Aie.Size -> Property
size =
  propEnum "size"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
showsUserLocation : Bool -> Property
showsUserLocation =
  propBool "showsUserLocation"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
followUserLocation : Bool -> Property
followUserLocation =
  propBool "followUserLocation"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
showsPointsOfInterest : Bool -> Property
showsPointsOfInterest =
  propBool "showsPointsOfInterest"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
showsCompass : Bool -> Property
showsCompass =
  propBool "showsCompass"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
zoomEnabled : Bool -> Property
zoomEnabled =
  propBool "zoomEnabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
rotateEnabled : Bool -> Property
rotateEnabled =
  propBool "rotateEnabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
pitchEnabled : Bool -> Property
pitchEnabled =
  propBool "pitchEnabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
scrollEnabled : Bool -> Property
scrollEnabled =
  propBool "scrollEnabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
mapType : MapType.MapType -> Property
mapType =
  propEnum "mapType"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
maxDelta : Float -> Property
maxDelta =
  propFloat "maxDelta"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
minDelta : Float -> Property
minDelta =
  propFloat "minDelta"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
active : Bool -> Property
active =
  propBool "active"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
enabled : Bool -> Property
enabled =
  propBool "enabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
pickerMode : PickerMode.Mode -> Property
pickerMode =
  propEnum "mode"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
prompt : String -> Property
prompt =
  propString "prompt"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
progress : Float -> Property
progress =
  propFloat "progress"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
progressViewStyle : ProgressViewStyle.Style -> Property
progressViewStyle =
  propEnum "progressViewStyle"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
progressTintColor : String -> Property
progressTintColor =
  propString "progressTintColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
trackTintColor : String -> Property
trackTintColor =
  propString "trackTintColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
refreshing : Bool -> Property
refreshing =
  propBool "refreshing"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
title : String -> Property
title =
  propString "title"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
automaticallyAdjustContentInsets : Bool -> Property
automaticallyAdjustContentInsets =
  propBool "automaticallyAdjustContentInsets"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
bounces : Bool -> Property
bounces =
  propBool "bounces"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
bouncesZoom : Bool -> Property
bouncesZoom =
  propBool "bouncesZoom"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
alwaysBounceHorizontal : Bool -> Property
alwaysBounceHorizontal =
  propBool "alwaysBounceHorizontal"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
alwaysBounceVertical : Bool -> Property
alwaysBounceVertical =
  propBool "alwaysBounceVertical"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
centerContent : Bool -> Property
centerContent =
  propBool "centerContent"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
horizontal : Bool -> Property
horizontal =
  propBool "horizontal"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
indicatorStyle : ScrollViewEnum.IndicatorStyle -> Property
indicatorStyle =
  propEnum "indicatorStyle"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
directionalLockEnabled : Bool -> Property
directionalLockEnabled =
  propBool "directionalLockEnabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
canCancelContentTouches : Bool -> Property
canCancelContentTouches =
  propBool "canCancelContentTouches"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
keyboardDismissMode : ScrollViewEnum.KeyboardDismissMode -> Property
keyboardDismissMode =
  propEnum "keyboardDismissMode"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
keyboardShouldPersistTaps : Bool -> Property
keyboardShouldPersistTaps =
  propBool "keyboardShouldPersistTaps"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
maximumZoomScale : Float -> Property
maximumZoomScale =
  propFloat "maximumZoomScale"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
minimumZoomScale : Float -> Property
minimumZoomScale =
  propFloat "minimumZoomScale"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
pagingEnabled : Bool -> Property
pagingEnabled =
  propBool "pagingEnabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
scrollEventThrottle : Float -> Property
scrollEventThrottle =
  propFloat "scrollEventThrottle"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
scrollsToTop : Bool -> Property
scrollsToTop =
  propBool "scrollsToTop"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
sendMomentumEvents : Bool -> Property
sendMomentumEvents =
  propBool "sendMomentumEvents"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
showsHorizontalScrollIndicator : Bool -> Property
showsHorizontalScrollIndicator =
  propBool "showsHorizontalScrollIndicator"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
showsVerticalScrollIndicator : Bool -> Property
showsVerticalScrollIndicator =
  propBool "showsVerticalScrollIndicator"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
snapToInterval : Float -> Property
snapToInterval =
  propFloat "snapToInterval"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
snapToAlignment : ScrollViewEnum.SnapToAlignment -> Property
snapToAlignment =
  propEnum "snapToAlignment"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
removeClippedSubviews : Bool -> Property
removeClippedSubviews =
  propBool "removeClippedSubviews"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
zoomScale : Float -> Property
zoomScale =
  propFloat "zoomScale"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
selectedIndex : Float -> Property
selectedIndex =
  propFloat "selectedIndex"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
tintColor : String -> Property
tintColor =
  propString "tintColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
momentary : Bool -> Property
momentary =
  propBool "momentary"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
sliderValue : Float -> Property
sliderValue =
  propFloat "sliderValue"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
step : Float -> Property
step =
  propFloat "step"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
minimumValue : Float -> Property
minimumValue =
  propFloat "minimumValue"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
maximumValue : Float -> Property
maximumValue =
  propFloat "maximumValue"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
minimumTrackTintColor : String -> Property
minimumTrackTintColor =
  propString "minimumTrackTintColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
maximumTrackTintColor : String -> Property
maximumTrackTintColor =
  propString "maximumTrackTintColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
disabled : Bool -> Property
disabled =
  propBool "disabled"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
hidden : Bool -> Property
hidden =
  propBool "hidden"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
animated : Bool -> Property
animated =
  propBool "animated"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
translucent : Bool -> Property
translucent =
  propBool "translucent"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
barStyle : StatusBarEnum.BarStyle -> Property
barStyle =
  propEnum "barStyle"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
networkActivityIndicatorVisible : Bool -> Property
networkActivityIndicatorVisible =
  propBool "networkActivityIndicatorVisible"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
showHideTransition : StatusBarEnum.ShowHideTransition -> Property
showHideTransition =
  propEnum "showHideTransition"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
autoCapitalize : TextInputEnum.AutoCapitalize -> Property
autoCapitalize =
  propEnum "autoCapitalize"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
autoCorrect : Bool -> Property
autoCorrect =
  propBool "autoCorrect"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
autoFocus : Bool -> Property
autoFocus =
  propBool "autoFocus"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
editable : Bool -> Property
editable =
  propBool "editable"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
keyboardType : TextInputEnum.KeyboardType -> Property
keyboardType =
  propEnum "keyboardType"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
keyboardAppearance : TextInputKAEnum.KeyboardAppearance -> Property
keyboardAppearance =
  propEnum "keyboardAppearance"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
returnKeyType : ReturnKeyTypeEnum.ReturnKeyType -> Property
returnKeyType =
  propEnum "returnKeyType"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
maxLength : Float -> Property
maxLength =
  propFloat "maxLength"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
enablesReturnKeyAutomatically : Bool -> Property
enablesReturnKeyAutomatically =
  propBool "enablesReturnKeyAutomatically"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
multiline : Bool -> Property
multiline =
  propBool "multiline"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
placeholder : String -> Property
placeholder =
  propString "placeholder"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
placeholderTextColor : String -> Property
placeholderTextColor =
  propString "placeholderTextColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
secureTextEntry : Bool -> Property
secureTextEntry =
  propBool "secureTextEntry"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
selectionColor : String -> Property
selectionColor =
  propString "selectionColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
value : String -> Property
value =
  propString "value"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
defaultValue : String -> Property
defaultValue =
  propString "defaultValue"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
clearButtonMode : TextInputEnum.ClearButtonMode -> Property
clearButtonMode =
  propEnum "clearButtonMode"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
clearTextOnFocus : Bool -> Property
clearTextOnFocus =
  propBool "clearTextOnFocus"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
selectTextOnFocus : Bool -> Property
selectTextOnFocus =
  propBool "selectTextOnFocus"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
blurOnSubmit : Bool -> Property
blurOnSubmit =
  propBool "blurOnSubmit"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
underlineColorAndroid : String -> Property
underlineColorAndroid =
  propString "underlineColorAndroid"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
subtitle : String -> Property
subtitle =
  propString "subtitle"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
contentInsetStart : Float -> Property
contentInsetStart =
  propFloat "contentInsetStart"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
contentInsetEnd : Float -> Property
contentInsetEnd =
  propFloat "contentInsetEnd"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
rtl : Bool -> Property
rtl =
  propBool "rtl"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
accessibilityLiveRegion : ViewEnum.AccessibilityLiveRegion -> Property
accessibilityLiveRegion =
  propEnum "accessibilityLiveRegion"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
importantForAccessibility : ViewEnum.ImportantForAccessibility -> Property
importantForAccessibility =
  propEnum "importantForAccessibility"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
pointerEvents : PointerEnum.PointerEvents -> Property
pointerEvents =
  propEnum "pointerEvents"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
renderToHardwareTextureAndroid : Bool -> Property
renderToHardwareTextureAndroid =
  propBool "renderToHardwareTextureAndroid"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
shouldRasterizeIOS : Bool -> Property
shouldRasterizeIOS =
  propBool "shouldRasterizeIOS"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
collapsable : Bool -> Property
collapsable =
  propBool "collapsable"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
needsOffscreenAlphaCompositing : Bool -> Property
needsOffscreenAlphaCompositing =
  propBool "needsOffscreenAlphaCompositing"



--custom property handlers handled by me
--DatePickerIOS Properties


{-| -}
type Date
  = String



--date  Date


{-| -}
date : String -> Property
date =
  propString "date"



--maximumDate Date


{-| -}
maximumDate : String -> Property
maximumDate =
  propString "maximumDate"



--minimumDate Date


{-| -}
minimumDate : String -> Property
minimumDate =
  propString "minimumDate"


{-| -}
minuteInterval : DatePickerIosEnum.MinuteInterval -> Property
minuteInterval =
  propEnumInt "minuteInterval" 2


{-| -}
datePickerMode : Dpe.Mode -> Property
datePickerMode =
  propEnum "mode"



--timeZoneOffsetInMinutes number


{-| -}
timeZoneOffsetInMinutes : Int -> Property
timeZoneOffsetInMinutes =
  propInt "timeZoneOffsetInMinutes"


{-| -}
type DrawerLockMode
  = UnLocked
  | LockedClosed
  | LockedOpen


{-| -}
drawerLockMode : DrawerLockMode -> Property
drawerLockMode =
  propEnum "drawerLockMode"



--drawerPosition enum(DrawerConsts.DrawerPosition.Left, DrawerConsts.DrawerPosition.Right)


{-| -}
drawerPosition : DrawerLayoutEnum.DrawerPosition -> Property
drawerPosition =
  propEnum "drawerPosition"


{-| -}
drawerWidth : Int -> Property
drawerWidth =
  propInt "drawerWidth"


{-| -}
renderNavigationView : Json.Encode.Value -> Property
renderNavigationView f =
  property "drawerWidth" f


{-| -}
statusBarBackgroundColor : String -> Property
statusBarBackgroundColor =
  propString "statusBarBackgroundColor"


{-| -}
sourceNum : Int -> Property
sourceNum =
  propInt "source"


{-| -}
blurRadius : Int -> Property
blurRadius =
  propInt "blurRadius"


{-| -}
capInsets : Int -> Int -> Int -> Int -> Property
capInsets =
  propTlbr
    "capInsets"


{-| -}
defaultSourceNum : Int -> Property
defaultSourceNum =
  propInt "defaultSource"


{-| -}
enableEmptySections : Bool -> Property
enableEmptySections =
  propBool "enableEmptySections"


{-| -}
initialListSize : Int -> Property
initialListSize =
  propInt "initialListSize"


{-| -}
pageSize : Int -> Property
pageSize =
  propInt "pageSize"


{-| -}
renderFooter : Json.Encode.Value -> Property
renderFooter f =
  property "renderFooter" f


{-| -}
renderHeader : Json.Encode.Value -> Property
renderHeader f =
  property "renderHeader" f


{-| -}
renderRow : Json.Encode.Value -> Property
renderRow f =
  property "renderRow" f


{-| -}
renderScrollComponent : Json.Encode.Value -> Property
renderScrollComponent f =
  property "renderScrollComponent" f


{-| -}
renderSectionHeader : Json.Encode.Value -> Property
renderSectionHeader f =
  property "renderSectionHeader" f


{-| -}
renderSeparator : Json.Encode.Value -> Property
renderSeparator f =
  property "renderSeparator" f


{-| -}
scrollRenderAheadDistance : Int -> Property
scrollRenderAheadDistance =
  propInt "scrollRenderAheadDistance"


{-| -}
stickyHeaderIndices : List Int -> Property
stickyHeaderIndices val =
  property "stickyHeaderIndices" (Json.Encode.list (List.map Json.Encode.int val))


{-| -}
transparent : Bool -> Property
transparent =
  propBool "transparent"


{-| -}
barTintColor : String -> Property
barTintColor =
  propString "barTintColor"


{-| -}
navigationBarHidden : Bool -> Property
navigationBarHidden =
  propBool "navigationBarHidden"


{-| -}
shadowHidden : Bool -> Property
shadowHidden =
  propBool "shadowHidden"


{-| -}
titleTextColor : String -> Property
titleTextColor =
  propString "titleTextColor"


{-| -}
allowsInlineMediaPlayback : Bool -> Property
allowsInlineMediaPlayback =
  propBool "allowsInlineMediaPlayback"


{-| -}
javaScriptEnabled : Bool -> Property
javaScriptEnabled =
  propBool "javaScriptEnabled"


{-| -}
domStorageEnabled : Bool -> Property
domStorageEnabled =
  propBool "domStorageEnabled"


{-| -}
startInLoadingState : Bool -> Property
startInLoadingState =
  propBool "startInLoadingState"


{-| -}
scalesPageToFit : Bool -> Property
scalesPageToFit =
  propBool "scalesPageToFit"


{-| -}
mediaPlaybackRequiresUserAction : Bool -> Property
mediaPlaybackRequiresUserAction =
  propBool "mediaPlaybackRequiresUserAction"


{-| -}
injectedJavaScript : String -> Property
injectedJavaScript =
  propString "injectedJavaScript"


{-| -}
activeOpacity : Int -> Property
activeOpacity =
  propInt "activeOpacity"


{-| -}
delayLongPress : Int -> Property
delayLongPress =
  propInt "delayLongPress"


{-| -}
delayPressIn : Int -> Property
delayPressIn =
  propInt "delayPressIn"


{-| -}
delayPressOut : Int -> Property
delayPressOut =
  propInt "delayPressOut"


{-| -}
initialPage : Int -> Property
initialPage =
  propInt "initialPage"


{-| -}
hitSlop : Int -> Int -> Int -> Int -> Property
hitSlop =
  propTlbr
    "hitSlop"


{-| -}
contentInset : Int -> Int -> Int -> Int -> Property
contentInset =
  propTlbr
    "contentInset"


{-| -}
legalLabelInsets : Int -> Int -> Int -> Int -> Property
legalLabelInsets =
  propTlbr
    "legalLabelInsets"


{-| -}
scrollIndicatorInsets : Int -> Int -> Int -> Int -> Property
scrollIndicatorInsets =
  propTlbr
    "scrollIndicatorInsets"


{-| -}
pressRetentionOffset : Int -> Int -> Int -> Int -> Property
pressRetentionOffset =
  propTlbr
    "pressRetentionOffset"


{-| -}
initialRoute : Json.Encode.Value -> Property
initialRoute f =
  property "initialRoute" f


{-| -}
renderError : Json.Encode.Value -> Property
renderError f =
  property "renderError" f


{-| -}
renderLoading : Json.Encode.Value -> Property
renderLoading f =
  property "renderLoading" f


{-| -}
navigator : Json.Encode.Value -> Property
navigator f =
  property "navigator" f


{-| -}
renderScene : Json.Encode.Value -> Property
renderScene f =
  property "renderScene" f


{-| -}
progressBackgroundColor : String -> Property
progressBackgroundColor =
  propString "progressBackgroundColor"


{-| -}
endFillColor : String -> Property
endFillColor =
  propString "endFillColor"


{-| -}
thumbTintColor : String -> Property
thumbTintColor =
  propString "thumbTintColor"


{-| -}
titleColor : String -> Property
titleColor =
  propString "titleColor"


{-| -}
underlayColor : String -> Property
underlayColor =
  propString "underlayColor"


{-| -}
region : Int -> Int -> Int -> Int -> Property
region =
  propLatLong
    "region"


{-| -}
overlays : Int -> Int -> Int -> Int -> Property
overlays =
  propTlbr
    "overlays"


{-| -}
annotations : Int -> Int -> Int -> Int -> Property
annotations =
  propTlbr
    "annotations"


{-| -}
badgeString : String -> Property
badgeString =
  propString "badgeString"



-- -- List View Components Properties
-- dataSource ListViewDataSource
--
--
-- -- Mapview Components Properties
--
-- --Navigator Component Properties
--
-- configureScene function ((route, routeStack) => Navigator.SceneConfigs.FloatFromRight)
-- initialRouteStack [object]
-- navigationBar node
-- sceneStyle View#style
--
-- --NavigatorIOS Components Properties
--
-- initialRoute {component: function, title: string, passProps: object, backButtonIcon: Image.propTypes.source, backButtonTitle: string, leftButtonIcon: Image.propTypes.source, leftButtonTitle: string, onLeftButtonPress: function, rightButtonIcon: Image.propTypes.source, rightButtonTitle: string, onRightButtonPress: function, wrapperStyle: [object Object], navigationBarHidden: bool, shadowHidden: bool, tintColor: string, barTintColor: string, titleTextColor: string, translucent: bool}
--
-- itemWrapperStyle View#style
--
-- -- PickerIOS component Properties
-- itemStyle itemStylePropType
-- selectedValue any
--
-- --Progress Bar Android  Component Properties
--
-- indeterminate indeterminateType
-- styleAttr STYLE_ATTRIBUTES
--
-- -- Style of the ProgressBar. One of:
-- --
-- -- -- Horizontal
-- -- -- Normal (default)
-- -- -- Small
-- -- -- Large
-- -- -- Inverse
-- -- -- SmallInverse
-- -- -- LargeInverse
--
-- -- ProogressViewIOS Component Properties
-- progressImage Image.propTypes.source
-- trackImage Image.propTypes.source
--
--
-- -- Refresh Control Component Properties
--
-- colors [color]
--
-- --ScrollView Component Properties
--
-- contentContainerStyle StyleSheetPropType(ViewStylePropTypes)
-- refreshControl element
-- contentOffset PointPropType
-- decelerationRate enum('fast', 'normal'), number
--
--
-- -- Segmented Control IOS Component Properties
-- values [string]
--
--
-- -- Slider Component Properties
-- maximumTrackImage Image.propTypes.source
-- thumbImage Image.propTypes.source
--
--
-- --StatusBar Component Properties
--
--
-- --Switch Component Properties
--
--
-- --TabBarIOS.Item Component Properties
--
-- icon Image.propTypes.source
-- selectedIcon Image.propTypes.source
-- systemIcon enum('bookmarks', 'contacts', 'downloads', 'favorites', 'featured', 'history', 'more', 'most-recent', 'most-viewed', 'recents', 'search', 'top-rated')
-- -- TextInput Component Properties
-- autoCapitalize enum('none', 'sentences', 'words', 'characters')
-- keyboardType enum('default', 'email-address', 'numeric', 'phone-pad', 'ascii-capable', 'numbers-and-punctuation', 'url', 'number-pad', 'name-phone-pad', 'decimal-pad', 'twitter', 'web-search')
-- clearButtonMode enum('never', 'while-editing', 'unless-editing', 'always')
-- keyboardAppearance enum('default', 'light', 'dark')
-- returnKeyType enum('default', 'go', 'google', 'join', 'next', 'route', 'search', 'send', 'yahoo', 'done', 'emergency-call')
-- selectionState
--
--
-- --ToolbarAndroid Component Properties
-- actions [{title: string, icon: optionalImageSource, show: enum('always', 'ifRoom', 'never'), showWithText: bool}]
-- logo optionalImageSource
-- navIcon optionalImageSource
-- overflowIcon optionalImageSource
--
--
-- -- TouchableHighlight Component Properties
--
--
--
-- --TouchableNativeFeedback Component Properties
-- background backgroundPropType
--
--
-- --TouchableOpacity  Component Properties
--
-- --TouchableWithoutFeedback Component Properties
--
-- accessibilityComponentType View.AccessibilityComponentType
-- accessibilityTraits View.AccessibilityTraits, [object Object]
--
--
-- --View Component Properties
--
-- pointerEvents enum('box-none', 'none', 'box-only', 'auto')
-- accessibilityComponentType AccessibilityComponentType
-- accessibilityLiveRegion enum('none', 'polite', 'assertive')
-- importantForAccessibility enum('auto', 'yes', 'no', 'no-hide-descendants')
-- accessibilityTraits AccessibilityTraits, [object Object
--
-- --ViewPagerAndroid Component Properties
--
-- --WebView Component Properties
-- source {uri: string, method: string, headers: object, body: string}, {html: string, baseUrl: string}, number
-- decelerationRate ScrollView.propTypes.decelerationRate
