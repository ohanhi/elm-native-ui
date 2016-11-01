module Animated.Scene exposing (view)

import Animated.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))
import Array as Array
import ExampleRow as Row
import Json.Decode as Decode
import Json.Encode as Encode
import NativeApi.Animated as Animated
import NativeApi.Internal as Internal
import NativeUi exposing (Node, Property, customNode, style)
import NativeUi.Elements as Elements
import NativeUi.NavigationExperimental exposing (NavigationSceneRenderer)
import NativeUi.Properties as Properties
import NativeUi.Style as Style


view : NavigationSceneRenderer -> Node NavigationMsg
view props =
    animatedView
        [ style
            [ Style.backgroundColor "#E9E9EF"
            , Style.bottom 0
            , Style.flex 1
            , Style.left 0
            , Style.position "absolute"
            , Style.right 0
            , Style.shadowColor "black"
            , Style.shadowOffset 0 0
            , Style.shadowOpacity 0.4
            , Style.shadowRadius 10
            , Style.top 0
            , getAnimatedStyle props
            ]
        , Properties.key props.scene.key
        ]
        [ Elements.scrollView
            [ style [ Style.flex 1 ] ]
            [ Row.label props.scene.route.key
            , Row.button "Push Route" Push
            , Row.button "Pop Route" Pop
            , Row.button "Exit NavigationTransitioner Example" Exit
            ]
        ]


{-|
Custom element definition - for when items are missing from elm-native-ui
-}
animatedView : List (Property msg) -> List (Node msg) -> Node msg
animatedView =
    customNode "Animated.View" "Animated" <| Just "View"


getAnimatedStyle : NavigationSceneRenderer -> Style.Style
getAnimatedStyle props =
    let
        index =
            toFloat props.scene.index

        width =
            props.layout.initWidth

        transform =
            Style.defaultTransform

        config =
            { inputRange = [ index - 1, index, index + 1 ]
            , outputRange = [ width, 0, -10 ]
            , easing = Nothing
            , extrapolate = Nothing
            , extrapolateLeft = Nothing
            , extrapolateRight = Nothing
            }

        translateX =
            Animated.animatedValueInterpolate props.position config
    in
        Style.transform { transform | translateX = Just <| Style.Animated translateX }
