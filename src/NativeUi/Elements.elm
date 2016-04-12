module NativeUi.Elements where
{-|

# Common Helpers
@docs activityIndicatorIos, datePickerIos, drawerLayoutAndroid, image, listView, mapView
@docs modal ,navigator, navigatorIos, picker ,pickerIos ,progressBar ,progressBarAndroid
@docs progressView, progressViewIos, refreshControl ,scrollView, segmentedControl
@docs segmentedControlIos ,slider, sliderIos, statusBar, switch, tabBar, tabBarIos
@docs tabBarIosItem , text ,textInput ,toolbar, toolbarAndroid ,touchableHighlight
@docs touchableNativeFeedback ,touchableOpacity, touchableWithoutFeedback ,view
@docs viewPagerAndroid, webView

-}
import NativeUi exposing (..)

{-| Create a React Native `View` element with the given properties and children.

`View` is the fundamental building block of React Native's UI component system.
It represents a rectangle on the screen, and is commonly used as a container for
other UI elements, similar to a `div` in HTML.
-}
view : List Property -> List NativeUi -> NativeUi
view =
  node "View"


{-| Create a React Native `Text` element.

`Text` elements let you add styles, event handlers, and other React Native properties to
text strings.  They can be nested, for example, if you want part of a string to be bold:

    text
      [ onPress address SayHello ]
      [ string "This text has default styling, but "
      , text
          [ style [ Style.fontWeight "bold" ] ]
          [ string "this is BOLD!" ]
      ]

Since the `onPress` handler is attached to the outer `text` element, you can press on
either the bold or unstyled text to `SayHello`.
-}
text : List Property -> List NativeUi -> NativeUi
text =
  node "Text"


{-| Create a React Native `Image` element.

Use these for displaying images from the web, or (soon!) images that are bundled
in with your app.

To tell the image element what to render, you need to give it an `imageSource` property
with the URI of the image.

Unlike the HTML `image` tag, a React Native `Image` element will not resize to fit its contents,
so you must provide some way for the layout engine to determine the size,
or else it won't show up onscreen.  You can either set an explicit `width` and `height` in the
`style` property, or you can use flexbox to have the image size itself proportionally to its
container.

An image element can have children, in which case it acts similarly to the `background-image`
CSS property on the web:

    image
      [ imageSource "http://example.com/fuzzy_kitten.png"
      , style
        [ Style.width 100
        , Style.height 100
        , Style.alignItems "center"
        ]
      ]
      [ text
          [ style [ Style.fontSize 30 ] ]
          [ string "This text will be rendered inside the image.  It's meme time!" ]
      ]
-}
image : List Property -> List NativeUi -> NativeUi
image =
  node "Image"



{-| Animated Loading Indicators
-}
activityIndicatorIos : List Property -> List NativeUi -> NativeUi
activityIndicatorIos =
  node "ActivityIndicatorIOS"


{-| Selects Date and Time Using NativeUi Picker
-}

datePickerIos : List Property -> List NativeUi -> NativeUi
datePickerIos =
  node "DatePickerIOS"


{-| Acts Like a Drawer
-}
drawerLayoutAndroid : List Property -> List NativeUi -> NativeUi
drawerLayoutAndroid =
  node "DrawerLayoutAndroid"


{-| Base Components To Display Maps
-}
mapView : List Property -> List NativeUi -> NativeUi
mapView =
  node "MapView"

{-| Render Lists of Selectable Options with Picker
-}
picker : List Property -> List NativeUi -> NativeUi
picker =
  node "Picker"

{-| Component for Controlling the Progress
-}
progressBar : List Property -> List NativeUi -> NativeUi
progressBar =
  node "ProgressBar"

{-| Base component for Display Progress
-}
progressView : List Property -> List NativeUi -> NativeUi
progressView =
  node "ProgressView"

{-| Adds Pull-to refresh to Scroll View
-}
refreshControl : List Property -> List NativeUi -> NativeUi
refreshControl =
  node "RefreshControl"

{-| Component that enable Scrolling through Child Components
-}
scrollView : List Property -> List NativeUi -> NativeUi
scrollView =
  node "ScrollView"

{-| Native Segmented Control
-}
segmentedControl : List Property -> List NativeUi -> NativeUi
segmentedControl =
  node "SegmentedControl"

{-| Slider Input For Numeric Values
-}
slider : List Property -> List NativeUi -> NativeUi
slider =
  node "Slider"

{-| Component For Controlling Status Bar
-}
statusBar : List Property -> List NativeUi -> NativeUi
statusBar =
  node "StatusBar"

{-| Native Boolean Input
-}
switch : List Property -> List NativeUi -> NativeUi
switch =
  node "Switch"

{-| Tab Based Navigation
-}
tabBar : List Property -> List NativeUi -> NativeUi
tabBar =
  node "TabBar"

{-| Single and Multi Line Text Input
-}
textInput : List Property -> List NativeUi -> NativeUi
textInput =
  node "TextInput"

{-| A Toolbar can display a logo,
navigation icon (e.g. hamburger menu), a title & subtitle and a list of actions.
-}
toolbar : List Property -> List NativeUi -> NativeUi
toolbar =
  node "Toolbar"


{-| Performant Scrollable liat of data
-}
listView : List Property -> List NativeUi -> NativeUi
listView =
  node "ListView"

{-| Component for presenting Modal view
-}
modal : List Property -> List NativeUi -> NativeUi
modal =
  node "Modal"

{-| Js Implemented Navigation
-}
navigator : List Property -> List NativeUi -> NativeUi
navigator =
  node "Navigator"

{-| Ios Navigation with custom nav bar colors
-}
navigatorIos : List Property -> List NativeUi -> NativeUi
navigatorIos =
  node "NavigatorIOS"

{-|Render List of Selectable options with PickerIOS
-}
pickerIos : List Property -> List NativeUi -> NativeUi
pickerIos =
  node "PickerIOS"

{-| Andriod Component for showing Progress
-}
progressBarAndroid : List Property -> List NativeUi -> NativeUi
progressBarAndroid =
  node "ProgressBarAndroid"

{-| IOS Base component for Displaying Progress
-}
progressViewIos : List Property -> List NativeUi -> NativeUi
progressViewIos =
  node "ProgressViewIOS"


{-| Native Component for Segmanted Control
-}
segmentedControlIos : List Property -> List NativeUi -> NativeUi
segmentedControlIos =
  node "SegmentedControlIOS"

{-| IOS Base component for sliding Input values
-}
sliderIos : List Property -> List NativeUi -> NativeUi
sliderIos =
  node "SliderIOS"

{-| Tab Based Navigation for IOS
-}
tabBarIos : List Property -> List NativeUi -> NativeUi
tabBarIos =
  node "TabBarIOS"

{-| IOS Base component for tab Bar
-}
tabBarIosItem : List Property -> List NativeUi -> NativeUi
tabBarIosItem =
  node "TabBarIOS.Item"

{-| Android Base component for Tool Bar
-}
toolbarAndroid : List Property -> List NativeUi -> NativeUi
toolbarAndroid =
  node "ToolbarAndroid"

{-| A wrapper for making views respond properly to touches
-}
touchableHighlight : List Property -> List NativeUi -> NativeUi
touchableHighlight =
  node "TouchableHighlight"

{-| Touchable A wrapper for making views respond properly to touches
-}
touchableNativeFeedback : List Property -> List NativeUi -> NativeUi
touchableNativeFeedback =
  node "TouchableNativeFeedback"

{-| Touchable A wrapper for making views respond properly to touches
-}
touchableOpacity : List Property -> List NativeUi -> NativeUi
touchableOpacity =
  node "TouchableOpacity"

{-| Touchable A wrapper for making views respond properly to touches
-}
touchableWithoutFeedback : List Property -> List NativeUi -> NativeUi
touchableWithoutFeedback =
  node "TouchableWithoutFeedback"

{-| Building Blocks For UI Component
-}
viewPagerAndroid : List Property -> List NativeUi -> NativeUi
viewPagerAndroid =
  node "ViewPagerAndroid"

{-| Base Component to display web content
-}
webView : List Property -> List NativeUi -> NativeUi
webView =
  node "WebView"
