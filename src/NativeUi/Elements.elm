module NativeUi.Elements exposing (text, image, activityIndicator, mapView, picker, progressBar, progressView, refreshControl, scrollView, segmentedControl, slider, statusBar, switch, tabBar, textInput, toolbar, touchableHighlight, touchableOpacity, view, navigationCardStack, navigationHeader, navigationHeaderTitle)

{-| elm-native-ui Elements

@docs text, image, activityIndicator, mapView, picker, progressBar, progressView, refreshControl, scrollView, segmentedControl, slider, statusBar, switch, tabBar, textInput, toolbar, touchableHighlight, touchableOpacity, view, navigationCardStack, navigationHeader, navigationHeaderTitle
-}

import NativeUi exposing (Property, Node, customNode, node)


{-| -}
text : List (Property msg) -> List (Node msg) -> Node msg
text =
    node "Text"


{-| -}
image : List (Property msg) -> List (Node msg) -> Node msg
image =
    node "Image"


{-| -}
activityIndicator : List (Property msg) -> List (Node msg) -> Node msg
activityIndicator =
    node "ActivityIndicator"


{-| -}
mapView : List (Property msg) -> List (Node msg) -> Node msg
mapView =
    node "MapView"


{-| -}
picker : List (Property msg) -> List (Node msg) -> Node msg
picker =
    node "Picker"


{-| -}
progressBar : List (Property msg) -> List (Node msg) -> Node msg
progressBar =
    node "ProgressBar"


{-| -}
progressView : List (Property msg) -> List (Node msg) -> Node msg
progressView =
    node "ProgressView"


{-| -}
refreshControl : List (Property msg) -> List (Node msg) -> Node msg
refreshControl =
    node "RefreshControl"


{-| -}
scrollView : List (Property msg) -> List (Node msg) -> Node msg
scrollView =
    node "ScrollView"


{-| -}
segmentedControl : List (Property msg) -> List (Node msg) -> Node msg
segmentedControl =
    node "SegmentedControl"


{-| -}
slider : List (Property msg) -> List (Node msg) -> Node msg
slider =
    node "Slider"


{-| -}
statusBar : List (Property msg) -> List (Node msg) -> Node msg
statusBar =
    node "StatusBar"


{-| -}
switch : List (Property msg) -> List (Node msg) -> Node msg
switch =
    node "Switch"


{-| -}
tabBar : List (Property msg) -> List (Node msg) -> Node msg
tabBar =
    node "TabBar"


{-| -}
textInput : List (Property msg) -> List (Node msg) -> Node msg
textInput =
    node "TextInput"


{-| -}
toolbar : List (Property msg) -> List (Node msg) -> Node msg
toolbar =
    node "Toolbar"


{-| -}
touchableHighlight : List (Property msg) -> List (Node msg) -> Node msg
touchableHighlight =
    node "TouchableHighlight"


{-| -}
touchableOpacity : List (Property msg) -> List (Node msg) -> Node msg
touchableOpacity =
    node "TouchableOpacity"


{-| -}
view : List (Property msg) -> List (Node msg) -> Node msg
view =
    node "View"


{-| -}
navigationCardStack : List (Property msg) -> List (Node msg) -> Node msg
navigationCardStack =
    customNode "NavigationCardStack" "NavigationCardStack" Nothing


{-| -}
navigationHeader : List (Property msg) -> List (Node msg) -> Node msg
navigationHeader =
    customNode "NavigationHeader" "NavigationHeader" Nothing


{-| -}
navigationHeaderTitle : List (Property msg) -> List (Node msg) -> Node msg
navigationHeaderTitle =
    customNode "NavigationHeaderTitle" "NavigationHeaderTitle" Nothing
