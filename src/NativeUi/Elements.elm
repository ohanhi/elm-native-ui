module NativeUi.Elements (..) where

{-| elm-native-ui Elements

@docs text, image, activityIndicator, mapView, picker, progressBar, progressView, refreshControl, scrollView, segmentedControl, slider, statusBar, switch, tabBar, textInput, toolbar
-}

import NativeUi exposing (Property, NativeUi, node)


text : List Property -> List NativeUi -> NativeUi
text =
  node "Text"


image : List Property -> List NativeUi -> NativeUi
image =
  node "Image"


activityIndicator : List Property -> List NativeUi -> NativeUi
activityIndicator =
  node "ActivityIndicator"


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
