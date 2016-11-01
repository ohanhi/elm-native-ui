module AnimatedPager.Scene exposing (view)

import AnimatedPager.NavigationMsg exposing (NavigationMsg(Back, Exit, Forward))
import ExampleRow as Row
import Json.Decode as Decode
import Json.Encode as Encode
import NativeApi.Animated as Animated
import NativeApi.Internal as Internal
import NativeApi.NavigationStateUtil exposing (back, forward)
import NativeUi exposing (Node, Property, customNode, map, style, mergeStyles)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.NavigationExperimental exposing (NavigationSceneRenderer, NavigationState, pagerPanResponderForHorizontal, pagerStyleInterpolatorForHorizontal)
import NativeUi.Properties as Properties
import NativeUi.Style as Style


onNavigateForward : NavigationState -> Bool
onNavigateForward state =
    let
        newState =
            forward state
    in
        state /= newState


onNavigateBack : NavigationState -> Bool
onNavigateBack state =
    let
        newState =
            back state
    in
        state /= newState


view : Maybe String -> NavigationSceneRenderer -> Node NavigationMsg
view backgroundColor props =
    let
        panHandlerProps =
            { layout = props.layout
            , navigationState = props.navigationState
            , position = props.position
            , progress = props.progress
            , scene = props.scene
            , scenes = props.scenes
            , onNavigateBack = ( Back, onNavigateBack )
            , onNavigateForward = ( Forward, onNavigateForward )
            }

        panHandlers =
            pagerPanResponderForHorizontal panHandlerProps

        baseStyle =
            Style.encode
                [ Style.backgroundColor <| Maybe.withDefault "#000" backgroundColor
                , Style.bottom 0
                , Style.flex 1
                , Style.left 0
                , Style.position "absolute"
                , Style.right 0
                , Style.top 0
                ]

        properties =
            [ mergeStyles [ baseStyle, pagerStyle ]
            , Properties.key <| props.scene.key ++ "scene"
            ]

        pagerStyle =
            pagerStyleInterpolatorForHorizontal props
    in
        animatedView
            (List.append properties panHandlers)
            [ Elements.view
                [ style
                    [ Style.alignItems "center"
                    , Style.flex 1
                    , Style.justifyContent "center"
                    ]
                ]
                [ Elements.text
                    [ style
                        [ Style.color "#222"
                        , Style.fontSize 24
                        , Style.fontWeight "bold"
                        ]
                    ]
                    [ NativeUi.string props.scene.route.key ]
                ]
            ]


{-|
Custom element definition - for when items are missing from elm-native-ui
-}
animatedView : List (Property msg) -> List (Node msg) -> Node msg
animatedView =
    customNode "Animated.View" "Animated" <| Just "View"
