module NativeUi.Elements where
-- Reactive Native Components

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






activityIndicatorIos : List Property -> List NativeUi -> NativeUi
activityIndicatorIos =
  node "ActivityIndicatorIOS"


datePickerIos : List Property -> List NativeUi -> NativeUi
datePickerIos =
  node "DatePickerIOS"


drawerLayoutAndroid : List Property -> List NativeUi -> NativeUi
drawerLayoutAndroid =
  node "DrawerLayoutAndroid"


mapView : List Property -> List NativeUi -> NativeUi
mapView =
  node "MapView"


picker : List Property -> List NativeUi -> NativeUi
picker =
  node "Picker"


progressBar : List Property -> List NativeUi -> NativeUi
progressBar =
  node "ProgressBar"


progressView : List Property -> List NativeUi -> NativeUi
progressView =
  node "ProgressView"


refreshControl : List Property -> List NativeUi -> NativeUi
refreshControl =
  node "RefreshControl"


scrollView : List Property -> List NativeUi -> NativeUi
scrollView =
  node "ScrollView"


segmentedControl : List Property -> List NativeUi -> NativeUi
segmentedControl =
  node "SegmentedControl"


slider : List Property -> List NativeUi -> NativeUi
slider =
  node "Slider"


statusBar : List Property -> List NativeUi -> NativeUi
statusBar =
  node "StatusBar"


switch : List Property -> List NativeUi -> NativeUi
switch =
  node "Switch"


tabBar : List Property -> List NativeUi -> NativeUi
tabBar =
  node "TabBar"


textInput : List Property -> List NativeUi -> NativeUi
textInput =
  node "TextInput"


toolbar : List Property -> List NativeUi -> NativeUi
toolbar =
  node "Toolbar"



listView : List Property -> List NativeUi -> NativeUi
listView =
  node "ListView"


modal : List Property -> List NativeUi -> NativeUi
modal =
  node "Modal"


navigator : List Property -> List NativeUi -> NativeUi
navigator =
  node "Navigator"


navigatorIos : List Property -> List NativeUi -> NativeUi
navigatorIos =
  node "NavigatorIOS"


pickerIos : List Property -> List NativeUi -> NativeUi
pickerIos =
  node "PickerIOS"


progressBarAndroid : List Property -> List NativeUi -> NativeUi
progressBarAndroid =
  node "ProgressBarAndroid"


progressViewIos : List Property -> List NativeUi -> NativeUi
progressViewIos =
  node "ProgressViewIOS"


segmentedControlIos : List Property -> List NativeUi -> NativeUi
segmentedControlIos =
  node "SegmentedControlIOS"


sliderIos : List Property -> List NativeUi -> NativeUi
sliderIos =
  node "SliderIOS"


tabBarIos : List Property -> List NativeUi -> NativeUi
tabBarIos =
  node "TabBarIOS"


tabBarIosItem : List Property -> List NativeUi -> NativeUi
tabBarIosItem =
  node "TabBarIOS.Item"


toolbarAndroid : List Property -> List NativeUi -> NativeUi
toolbarAndroid =
  node "ToolbarAndroid"


touchableHighlight : List Property -> List NativeUi -> NativeUi
touchableHighlight =
  node "TouchableHighlight"


touchableNativeFeedback : List Property -> List NativeUi -> NativeUi
touchableNativeFeedback =
  node "TouchableNativeFeedback"


touchableOpacity : List Property -> List NativeUi -> NativeUi
touchableOpacity =
  node "TouchableOpacity"


touchableWithoutFeedback : List Property -> List NativeUi -> NativeUi
touchableWithoutFeedback =
  node "TouchableWithoutFeedback"


viewPagerAndroid : List Property -> List NativeUi -> NativeUi
viewPagerAndroid =
  node "ViewPagerAndroid"


webView : List Property -> List NativeUi -> NativeUi
webView =
  node "WebView"
