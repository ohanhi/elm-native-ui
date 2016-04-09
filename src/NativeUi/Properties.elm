module NativeUi.Properties (..) where

{-| elm-native-ui Properties

@docs numberOfLines, suppressHighlighting, testID, allowFontScaling, source,
defaultSource, accessible, accessibilityLabel, resizeMode, animating,
color, hidesWhenStopped, size, showsUserLocation, followUserLocation,
showsPointsOfInterest, showsCompass, zoomEnabled, rotateEnabled, pitchEnabled,
scrollEnabled, mapType, maxDelta, minDelta, active, enabled, mode, prompt,
progress, progressViewStyle, progressTintColor, trackTintColor, refreshing,
title, automaticallyAdjustContentInsets, bounces, bouncesZoom,
alwaysBounceHorizontal, alwaysBounceVertical, centerContent, horizontal,
indicatorStyle, directionalLockEnabled, canCancelContentTouches,
keyboardDismissMode, keyboardShouldPersistTaps, maximumZoomScale,
minimumZoomScale, pagingEnabled, scrollEventThrottle, scrollsToTop,
sendMomentumEvents, showsHorizontalScrollIndicator,
showsVerticalScrollIndicator, snapToInterval, snapToAlignment,
removeClippedSubviews, zoomScale, selectedIndex, tintColor, momentary,
sliderValue, step, minimumValue, maximumValue, minimumTrackTintColor,
maximumTrackTintColor, disabled, hidden, animated, translucent, barStyle,
networkActivityIndicatorVisible, showHideTransition, autoCapitalize,
autoCorrect, autoFocus, editable, keyboardType, keyboardAppearance,
returnKeyType, maxLength, enablesReturnKeyAutomatically, multiline,
placeholder, placeholderTextColor, secureTextEntry, selectionColor,
value, defaultValue, clearButtonMode, clearTextOnFocus, selectTextOnFocus,
blurOnSubmit, underlineColorAndroid, subtitle, contentInsetStart,
contentInsetEnd, rtl, accessibilityLiveRegion, importantForAccessibility,
pointerEvents, renderToHardwareTextureAndroid, shouldRasterizeIOS, collapsable,
needsOffscreenAlphaCompositing
-}

import Json.Encode
import NativeUi exposing (Property, property)


numberOfLines : Float -> Property
numberOfLines val =
  property "numberOfLines" (Json.Encode.float val)


suppressHighlighting : Bool -> Property
suppressHighlighting val =
  property "suppressHighlighting" (Json.Encode.bool val)


testID : String -> Property
testID val =
  property "testID" (Json.Encode.string val)


allowFontScaling : Bool -> Property
allowFontScaling val =
  property "allowFontScaling" (Json.Encode.bool val)


source : String -> Property
source uri =
  property "source" (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


defaultSource : String -> Property
defaultSource uri =
  property "defaultSource" (Json.Encode.object [ ( "uri", Json.Encode.string uri ) ])


accessible : Bool -> Property
accessible val =
  property "accessible" (Json.Encode.bool val)


accessibilityLabel : String -> Property
accessibilityLabel val =
  property "accessibilityLabel" (Json.Encode.string val)


type ImageResizeMode
  = ImageResizeModeCover
  | ImageResizeModeContain
  | ImageResizeModeStretch


resizeMode : ImageResizeMode -> Property
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


animating : Bool -> Property
animating val =
  property "animating" (Json.Encode.bool val)


color : String -> Property
color val =
  property "color" (Json.Encode.string val)


hidesWhenStopped : Bool -> Property
hidesWhenStopped val =
  property "hidesWhenStopped" (Json.Encode.bool val)


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
    property "size" jsonValue


showsUserLocation : Bool -> Property
showsUserLocation val =
  property "showsUserLocation" (Json.Encode.bool val)


followUserLocation : Bool -> Property
followUserLocation val =
  property "followUserLocation" (Json.Encode.bool val)


showsPointsOfInterest : Bool -> Property
showsPointsOfInterest val =
  property "showsPointsOfInterest" (Json.Encode.bool val)


showsCompass : Bool -> Property
showsCompass val =
  property "showsCompass" (Json.Encode.bool val)


zoomEnabled : Bool -> Property
zoomEnabled val =
  property "zoomEnabled" (Json.Encode.bool val)


rotateEnabled : Bool -> Property
rotateEnabled val =
  property "rotateEnabled" (Json.Encode.bool val)


pitchEnabled : Bool -> Property
pitchEnabled val =
  property "pitchEnabled" (Json.Encode.bool val)


scrollEnabled : Bool -> Property
scrollEnabled val =
  property "scrollEnabled" (Json.Encode.bool val)


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
    property "mapType" jsonValue


maxDelta : Float -> Property
maxDelta val =
  property "maxDelta" (Json.Encode.float val)


minDelta : Float -> Property
minDelta val =
  property "minDelta" (Json.Encode.float val)


active : Bool -> Property
active val =
  property "active" (Json.Encode.bool val)


enabled : Bool -> Property
enabled val =
  property "enabled" (Json.Encode.bool val)


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
    property "mode" jsonValue


prompt : String -> Property
prompt val =
  property "prompt" (Json.Encode.string val)


progress : Float -> Property
progress val =
  property "progress" (Json.Encode.float val)


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
    property "progressViewStyle" jsonValue


progressTintColor : String -> Property
progressTintColor val =
  property "progressTintColor" (Json.Encode.string val)


trackTintColor : String -> Property
trackTintColor val =
  property "trackTintColor" (Json.Encode.string val)


refreshing : Bool -> Property
refreshing val =
  property "refreshing" (Json.Encode.bool val)


title : String -> Property
title val =
  property "title" (Json.Encode.string val)


automaticallyAdjustContentInsets : Bool -> Property
automaticallyAdjustContentInsets val =
  property "automaticallyAdjustContentInsets" (Json.Encode.bool val)


bounces : Bool -> Property
bounces val =
  property "bounces" (Json.Encode.bool val)


bouncesZoom : Bool -> Property
bouncesZoom val =
  property "bouncesZoom" (Json.Encode.bool val)


alwaysBounceHorizontal : Bool -> Property
alwaysBounceHorizontal val =
  property "alwaysBounceHorizontal" (Json.Encode.bool val)


alwaysBounceVertical : Bool -> Property
alwaysBounceVertical val =
  property "alwaysBounceVertical" (Json.Encode.bool val)


centerContent : Bool -> Property
centerContent val =
  property "centerContent" (Json.Encode.bool val)


horizontal : Bool -> Property
horizontal val =
  property "horizontal" (Json.Encode.bool val)


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
    property "indicatorStyle" jsonValue


directionalLockEnabled : Bool -> Property
directionalLockEnabled val =
  property "directionalLockEnabled" (Json.Encode.bool val)


canCancelContentTouches : Bool -> Property
canCancelContentTouches val =
  property "canCancelContentTouches" (Json.Encode.bool val)


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
    property "keyboardDismissMode" jsonValue


keyboardShouldPersistTaps : Bool -> Property
keyboardShouldPersistTaps val =
  property "keyboardShouldPersistTaps" (Json.Encode.bool val)


maximumZoomScale : Float -> Property
maximumZoomScale val =
  property "maximumZoomScale" (Json.Encode.float val)


minimumZoomScale : Float -> Property
minimumZoomScale val =
  property "minimumZoomScale" (Json.Encode.float val)


pagingEnabled : Bool -> Property
pagingEnabled val =
  property "pagingEnabled" (Json.Encode.bool val)


scrollEventThrottle : Float -> Property
scrollEventThrottle val =
  property "scrollEventThrottle" (Json.Encode.float val)


scrollsToTop : Bool -> Property
scrollsToTop val =
  property "scrollsToTop" (Json.Encode.bool val)


sendMomentumEvents : Bool -> Property
sendMomentumEvents val =
  property "sendMomentumEvents" (Json.Encode.bool val)


showsHorizontalScrollIndicator : Bool -> Property
showsHorizontalScrollIndicator val =
  property "showsHorizontalScrollIndicator" (Json.Encode.bool val)


showsVerticalScrollIndicator : Bool -> Property
showsVerticalScrollIndicator val =
  property "showsVerticalScrollIndicator" (Json.Encode.bool val)


snapToInterval : Float -> Property
snapToInterval val =
  property "snapToInterval" (Json.Encode.float val)


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
    property "snapToAlignment" jsonValue


removeClippedSubviews : Bool -> Property
removeClippedSubviews val =
  property "removeClippedSubviews" (Json.Encode.bool val)


zoomScale : Float -> Property
zoomScale val =
  property "zoomScale" (Json.Encode.float val)


selectedIndex : Float -> Property
selectedIndex val =
  property "selectedIndex" (Json.Encode.float val)


tintColor : String -> Property
tintColor val =
  property "tintColor" (Json.Encode.string val)


momentary : Bool -> Property
momentary val =
  property "momentary" (Json.Encode.bool val)


sliderValue : Float -> Property
sliderValue val =
  property "sliderValue" (Json.Encode.float val)


step : Float -> Property
step val =
  property "step" (Json.Encode.float val)


minimumValue : Float -> Property
minimumValue val =
  property "minimumValue" (Json.Encode.float val)


maximumValue : Float -> Property
maximumValue val =
  property "maximumValue" (Json.Encode.float val)


minimumTrackTintColor : String -> Property
minimumTrackTintColor val =
  property "minimumTrackTintColor" (Json.Encode.string val)


maximumTrackTintColor : String -> Property
maximumTrackTintColor val =
  property "maximumTrackTintColor" (Json.Encode.string val)


disabled : Bool -> Property
disabled val =
  property "disabled" (Json.Encode.bool val)


hidden : Bool -> Property
hidden val =
  property "hidden" (Json.Encode.bool val)


animated : Bool -> Property
animated val =
  property "animated" (Json.Encode.bool val)


translucent : Bool -> Property
translucent val =
  property "translucent" (Json.Encode.bool val)


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
    property "barStyle" jsonValue


networkActivityIndicatorVisible : Bool -> Property
networkActivityIndicatorVisible val =
  property "networkActivityIndicatorVisible" (Json.Encode.bool val)


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
    property "showHideTransition" jsonValue


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
    property "autoCapitalize" jsonValue


autoCorrect : Bool -> Property
autoCorrect val =
  property "autoCorrect" (Json.Encode.bool val)


autoFocus : Bool -> Property
autoFocus val =
  property "autoFocus" (Json.Encode.bool val)


editable : Bool -> Property
editable val =
  property "editable" (Json.Encode.bool val)


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
    property "keyboardType" jsonValue


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
    property "keyboardAppearance" jsonValue


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
    property "returnKeyType" jsonValue


maxLength : Float -> Property
maxLength val =
  property "maxLength" (Json.Encode.float val)


enablesReturnKeyAutomatically : Bool -> Property
enablesReturnKeyAutomatically val =
  property "enablesReturnKeyAutomatically" (Json.Encode.bool val)


multiline : Bool -> Property
multiline val =
  property "multiline" (Json.Encode.bool val)


placeholder : String -> Property
placeholder val =
  property "placeholder" (Json.Encode.string val)


placeholderTextColor : String -> Property
placeholderTextColor val =
  property "placeholderTextColor" (Json.Encode.string val)


secureTextEntry : Bool -> Property
secureTextEntry val =
  property "secureTextEntry" (Json.Encode.bool val)


selectionColor : String -> Property
selectionColor val =
  property "selectionColor" (Json.Encode.string val)


value : String -> Property
value val =
  property "value" (Json.Encode.string val)


defaultValue : String -> Property
defaultValue val =
  property "defaultValue" (Json.Encode.string val)


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
    property "clearButtonMode" jsonValue


clearTextOnFocus : Bool -> Property
clearTextOnFocus val =
  property "clearTextOnFocus" (Json.Encode.bool val)


selectTextOnFocus : Bool -> Property
selectTextOnFocus val =
  property "selectTextOnFocus" (Json.Encode.bool val)


blurOnSubmit : Bool -> Property
blurOnSubmit val =
  property "blurOnSubmit" (Json.Encode.bool val)


underlineColorAndroid : String -> Property
underlineColorAndroid val =
  property "underlineColorAndroid" (Json.Encode.string val)


subtitle : String -> Property
subtitle val =
  property "subtitle" (Json.Encode.string val)


contentInsetStart : Float -> Property
contentInsetStart val =
  property "contentInsetStart" (Json.Encode.float val)


contentInsetEnd : Float -> Property
contentInsetEnd val =
  property "contentInsetEnd" (Json.Encode.float val)


rtl : Bool -> Property
rtl val =
  property "rtl" (Json.Encode.bool val)


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
    property "accessibilityLiveRegion" jsonValue


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
    property "importantForAccessibility" jsonValue


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
    property "pointerEvents" jsonValue


renderToHardwareTextureAndroid : Bool -> Property
renderToHardwareTextureAndroid val =
  property "renderToHardwareTextureAndroid" (Json.Encode.bool val)


shouldRasterizeIOS : Bool -> Property
shouldRasterizeIOS val =
  property "shouldRasterizeIOS" (Json.Encode.bool val)


collapsable : Bool -> Property
collapsable val =
  property "collapsable" (Json.Encode.bool val)


needsOffscreenAlphaCompositing : Bool -> Property
needsOffscreenAlphaCompositing val =
  property "needsOffscreenAlphaCompositing" (Json.Encode.bool val)

--DatePickerIOS Properties
date  Date

maximumDate Date

minimumDate Date

minuteInterval enum

mode -> DatePickerIOS  mode enum('date', 'time', 'datetime')

timeZoneOffsetInMinutes number

--DrawerLayoutAndroid Properties

drawerLockMode enum('unlocked', 'locked-closed', 'locked-open')


drawerPosition enum(DrawerConsts.DrawerPosition.Left, DrawerConsts.DrawerPosition.Right)

drawerWidth number


keyboardDismissMode enum('none', 'on-drag')


renderNavigationView function

statusBarBackgroundColor color

-- Image Component Properties
source {uri: string}, number

accessibilityLabel string

accessible bool

blurRadius number
capInsets {top: number, left: number, bottom: number, right: number}
defaultSource {uri: string}, number

-- List View Components Properties
dataSource ListViewDataSource
enableEmptySections bool
initialListSize number
pageSize number
removeClippedSubviews bool

renderFooter function
renderHeader function
renderRow function
renderScrollComponent function
renderSectionHeader function
renderSeparator function
scrollRenderAheadDistance number
stickyHeaderIndices [number]

-- Mapview Components Properties
pitchEnabled bool (true camera is associated with the map)
region {latitude: number, longitude: number, latitudeDelta: number, longitudeDelta: number}
rotateEnabled bool
scrollEnabled bool
showsUserLocation bool
zoomEnabled bool
active bool
annotations [{latitude: number, longitude: number, animateDrop: bool, draggable: bool, onDragStateChange: function, onFocus: function, onBlur: function, title: string, subtitle: string, leftCalloutView: element, rightCalloutView: element, detailCalloutView: element, tintColor: [object Object], image: Image.propTypes.source, view: element, id: string, hasLeftCallout: deprecatedPropType( React.PropTypes.bool, 'Use `leftCalloutView` instead.' ), hasRightCallout: deprecatedPropType( React.PropTypes.bool, 'Use `rightCalloutView` instead.' ), onLeftCalloutPress: deprecatedPropType( React.PropTypes.func, 'Use `leftCalloutView` instead.' ), onRightCalloutPress: deprecatedPropType( React.PropTypes.func, 'Use `rightCalloutView` instead.' )}
followUserLocation bool
legalLabelInsets {top: number, left: number, bottom: number, right: number}
mapType enum('standard', 'satellite', 'hybrid')
maxDelta number
minDelta number
overlays [{coordinates: [object Object], lineWidth: number, strokeColor: [object Object], fillColor: [object Object], id: string}]
showsCompass bool
showsPointsOfInterest bool

--Model Component Properties

animated bool
transparent bool
visible bool

--Navigator Component Properties

configureScene function ((route, routeStack) => Navigator.SceneConfigs.FloatFromRight)
initialRoute object
initialRouteStack [object]
navigationBar node
navigator object
renderScene function
sceneStyle View#style

--NavigatorIOS Components Properties

barTintColor string
initialRoute {component: function, title: string, passProps: object, backButtonIcon: Image.propTypes.source, backButtonTitle: string, leftButtonIcon: Image.propTypes.source, leftButtonTitle: string, onLeftButtonPress: function, rightButtonIcon: Image.propTypes.source, rightButtonTitle: string, onRightButtonPress: function, wrapperStyle: [object Object], navigationBarHidden: bool, shadowHidden: bool, tintColor: string, barTintColor: string, titleTextColor: string, translucent: bool}

itemWrapperStyle View#style
navigationBarHidden bool
shadowHidden bool
titleTextColor string

-- PickerIOS component Properties
itemStyle itemStylePropType
selectedValue any

--Progress Bar Android  Component Properties

indeterminate indeterminateType
progress number
styleAttr STYLE_ATTRIBUTES

-- Style of the ProgressBar. One of:
--
-- -- Horizontal
-- -- Normal (default)
-- -- Small
-- -- Large
-- -- Inverse
-- -- SmallInverse
-- -- LargeInverse

-- ProogressViewIOS Component Properties
progressImage Image.propTypes.source
trackImage Image.propTypes.source


-- Refresh Control Component Properties

colors [color]
progressBackgroundColor color

--ScrollView Component Properties

contentContainerStyle StyleSheetPropType(ViewStylePropTypes)
refreshControl element
endFillColor color
contentOffset PointPropType
decelerationRate enum('fast', 'normal'), number
scrollIndicatorInsets {top: number, left: number, bottom: number, right: number}


-- Segmented Control IOS Component Properties
values [string]


-- Slider Component Properties
maximumTrackImage Image.propTypes.source
maximumTrackTintColor string
thumbImage Image.propTypes.source


--StatusBar Component Properties
backgroundColor color


--Switch Component Properties
thumbTintColor color


--TabBarIOS.Item Component Properties

badge string, number
icon Image.propTypes.source
selectedIcon Image.propTypes.source
systemIcon enum('bookmarks', 'contacts', 'downloads', 'favorites', 'featured', 'history', 'more', 'most-recent', 'most-viewed', 'recents', 'search', 'top-rated')


--Text Component Properties


accessible
numberOfLines number
allowFontScaling bool
suppressHighlighting bool

-- TextInput Component Properties
autoCapitalize enum('none', 'sentences', 'words', 'characters')
autoCorrect bool
autoFocus bool
blurOnSubmit bool
defaultValue string
editable bool
keyboardType enum('default', 'email-address', 'numeric', 'phone-pad', 'ascii-capable', 'numbers-and-punctuation', 'url', 'number-pad', 'name-phone-pad', 'decimal-pad', 'twitter', 'web-search')
maxLength number
multiline bool
placeholder string
placeholderTextColor string
secureTextEntry bool
selectTextOnFocus bool
selectionColor string
underlineColorAndroid string
clearButtonMode enum('never', 'while-editing', 'unless-editing', 'always')
clearTextOnFocus bool
enablesReturnKeyAutomatically bool
keyboardAppearance enum('default', 'light', 'dark')
returnKeyType enum('default', 'go', 'google', 'join', 'next', 'route', 'search', 'send', 'yahoo', 'done', 'emergency-call')
selectionState


--ToolbarAndroid Component Properties
actions [{title: string, icon: optionalImageSource, show: enum('always', 'ifRoom', 'never'), showWithText: bool}]
contentInsetEnd number
contentInsetStart number
logo optionalImageSource
navIcon optionalImageSource
overflowIcon optionalImageSource
rtl bool
subtitle string
titleColor color


-- TouchableHighlight Component Properties

activeOpacity number
underlayColor color


--TouchableNativeFeedback Component Properties
background backgroundPropType


--TouchableOpacity  Component Properties
activeOpacity number

--TouchableWithoutFeedback Component Properties

accessibilityComponentType View.AccessibilityComponentType
accessibilityTraits View.AccessibilityTraits, [object Object]
accessible bool
delayLongPress number
delayPressIn number
delayPressOut number
hitSlop {top: number, left: number, bottom: number, right: number}
pressRetentionOffset {top: number, left: number, bottom: number, right: number}


--View Component Properties

accessibilityLabel string
pointerEvents enum('box-none', 'none', 'box-only', 'auto')
removeClippedSubviews bool
accessibilityComponentType AccessibilityComponentType
accessibilityLiveRegion enum('none', 'polite', 'assertive')
collapsable bool
importantForAccessibility enum('auto', 'yes', 'no', 'no-hide-descendants')
needsOffscreenAlphaCompositing bool
renderToHardwareTextureAndroid bool
accessibilityTraits AccessibilityTraits, [object Object
shouldRasterizeIOS bool


--ViewPagerAndroid Component Properties
initialPage number


--WebView Component Properties
automaticallyAdjustContentInsets bool
contentInset {top: number, left: number, bottom: number, right: number}
injectedJavaScript string
mediaPlaybackRequiresUserAction bool
renderError function
renderLoading function
scalesPageToFit bool
source {uri: string, method: string, headers: object, body: string}, {html: string, baseUrl: string}, number
startInLoadingState bool
domStorageEnabled bool
javaScriptEnabled bool
allowsInlineMediaPlayback bool
bounces bool
scrollEnabled bool
decelerationRate ScrollView.propTypes.decelerationRate
