module NativeUi.NavigationExperimental exposing (NavigationPagerPanResponder, NavigationPanPanHandlers, NavigationSceneRenderer, NavigationRoute, NavigationScene, NavigationState, NavigationTransition, NavigationTransitionSpec, configureTransition, layout, navigationState, pagerPanResponderForHorizontal, pagerStyleInterpolatorForHorizontal, render, renderHeader, renderScene, renderTitleComponent, scene, navigationSceneRendererToPropertyList, transitionToNavigationSceneRenderer)

import Json.Decode as Decode
import Json.Encode as Encode exposing (Value, bool, int, list, object, string)
import Native.NativeUi
import Native.NavigationExperimental
import NativeApi.Animated exposing (AnimatedValue, decodeAnimatedValue, encodeAnimatedValue)
import NativeApi.Internal exposing (encodeFilterMap)
import NativeUi exposing (NativeEventHandler, Node, Property, on, onReact, property, renderProperty, renderListProperty)
import NativeUi.Style as Style


-- RENDER


render : (NavigationTransition -> List (Node a)) -> Property msg
render =
    renderListProperty "render" decodeNavigationTransition


renderHeader : (NavigationSceneRenderer -> Node a) -> Property msg
renderHeader =
    renderProperty "renderHeader" decodeNavigationSceneRenderer


renderScene : (NavigationSceneRenderer -> Node a) -> Property msg
renderScene =
    renderProperty "renderScene" decodeNavigationSceneRenderer


renderTitleComponent : (NavigationSceneRenderer -> Node a) -> Property msg
renderTitleComponent =
    renderProperty "renderTitleComponent" decodeNavigationSceneRenderer



-- NAVIGATION PAGER PAN RESPONDER


type alias NavigationPagerPanResponder msg =
    { layout : NavigationLayout
    , navigationState : NavigationState
    , position : AnimatedValue
    , progress : AnimatedValue
    , scene : NavigationScene
    , scenes : List NavigationScene
    , onNavigateBack : ( msg, NavigationState -> Bool )
    , onNavigateForward : ( msg, NavigationState -> Bool )
    }


type alias NavigationPanPanHandlers msg =
    { onMoveShouldSetResponder : Property msg
    , onMoveShouldSetResponderCapture : Property msg
    , onResponderEnd : Property msg
    , onResponderGrant : Property msg
    , onResponderMove : Property msg
    , onResponderReject : Property msg
    , onResponderRelease : Property msg
    , onResponderStart : Property msg
    , onResponderTerminate : Property msg
    , onResponderTerminationRequest : Property msg
    , onStartShouldSetResponder : Property msg
    , onStartShouldSetResponderCapture : Property msg
    }


pagerPanResponderForHorizontal : NavigationPagerPanResponder msg -> List (Property msg)
pagerPanResponderForHorizontal props =
    let
        encodedProps =
            encodeNavigationPagerPanResponder props

        backMsg =
            (fst props.onNavigateBack)

        forwardMsg =
            (fst props.onNavigateForward)

        handlers =
            Native.NavigationExperimental.pagerPanResponderForHorizontal encodedProps backMsg forwardMsg
    in
        [ onReact "MoveShouldSetResponder" handlers.onMoveShouldSetResponder
        , onReact "MoveShouldSetResponderCapture" handlers.onMoveShouldSetResponderCapture
        , onReact "ResponderEnd" handlers.onResponderEnd
        , onReact "ResponderGrant" handlers.onResponderGrant
        , onReact "ResponderMove" handlers.onResponderMove
        , onReact "ResponderReject" handlers.onResponderReject
        , onReact "ResponderRelease" handlers.onResponderRelease
        , onReact "ResponderStart" handlers.onResponderStart
        , onReact "ResponderTerminate" handlers.onResponderTerminate
        , onReact "ResponderTerminationRequest" handlers.onResponderTerminationRequest
        , onReact "StartShouldSetResponder" handlers.onStartShouldSetResponder
        , onReact "StartShouldSetResponderCapture" handlers.onStartShouldSetResponderCapture
        ]


encodeNavigationPagerPanResponder : NavigationPagerPanResponder msg -> Value
encodeNavigationPagerPanResponder props =
    Encode.object <|
        [ ( "layout", encodeNavigationLayout props.layout )
        , ( "navigationState", encodeNavigationState props.navigationState )
        , ( "position", encodeAnimatedValue props.position )
        , ( "progress", encodeAnimatedValue props.progress )
        , ( "scene", encodeNavigationScene props.scene )
        , ( "scenes", Encode.list <| List.map encodeNavigationScene props.scenes )
        , ( "onNavigateBack", Native.NativeUi.encodeFunction (\_ -> (snd props.onNavigateBack) props.navigationState) )
        , ( "onNavigateForward", Native.NativeUi.encodeFunction (\_ -> (snd props.onNavigateForward) props.navigationState) )
        ]


pagerStyleInterpolatorForHorizontal : NavigationSceneRenderer -> Style.NativeStyle
pagerStyleInterpolatorForHorizontal props =
    Native.NavigationExperimental.pagerStyleInterpolatorForHorizontal (encodeNavigationSceneRenderer props)



-- NAVIGATION GESTURE


type NavigationGestureDirection
    = Horizontal
    | Vertical



-- NAVIGATION LAYOUT


type alias NavigationLayout =
    { height : AnimatedValue
    , initHeight : Float
    , initWidth : Float
    , isMeasured : Bool
    , width : AnimatedValue
    }


layout : NavigationLayout -> Property msg
layout val =
    property "layout" (encodeNavigationLayout val)


encodeNavigationLayout : NavigationLayout -> Value
encodeNavigationLayout layout =
    Encode.object <|
        [ ( "height", encodeAnimatedValue layout.height )
        , ( "initHeight", Encode.float layout.initHeight )
        , ( "initWidth", Encode.float layout.initWidth )
        , ( "isMeasured", Encode.bool layout.isMeasured )
        , ( "width", encodeAnimatedValue layout.width )
        ]


decodeLayout : Decode.Decoder NavigationLayout
decodeLayout =
    Decode.map5 NavigationLayout
        (Decode.field "height" decodeAnimatedValue)
        (Decode.field "initHeight" Decode.float)
        (Decode.field "initWidth" Decode.float)
        (Decode.field "isMeasured" Decode.bool)
        (Decode.field "width" decodeAnimatedValue)



-- NAVIGATION ROUTE


type alias NavigationRoute =
    { key : String
    , title : Maybe String
    }


encodeRoute : NavigationRoute -> Value
encodeRoute route =
    Encode.object <|
        [ ( "key", Encode.string route.key )
        , ( "title", Maybe.map Encode.string route.title |> Maybe.withDefault Encode.null )
        ]


decodeRoute : Decode.Decoder NavigationRoute
decodeRoute =
    Decode.map2 NavigationRoute
        (Decode.field "key" Decode.string)
        (Decode.maybe (Decode.field "title" Decode.string))



-- NAVIGATION SCENE


type alias NavigationScene =
    { index : Int
    , isActive : Bool
    , isStale : Bool
    , key : String
    , route : NavigationRoute
    }


scene : NavigationScene -> Property msg
scene val =
    property "scene" (encodeNavigationScene val)


encodeNavigationScene : NavigationScene -> Value
encodeNavigationScene scene =
    Encode.object <|
        [ ( "index", Encode.int scene.index )
        , ( "isActive", Encode.bool scene.isActive )
        , ( "isStale", Encode.bool scene.isStale )
        , ( "key", Encode.string scene.key )
        , ( "route", encodeRoute scene.route )
        ]


decodeNavigationScene : Decode.Decoder NavigationScene
decodeNavigationScene =
    Decode.map5 NavigationScene
        (Decode.field "index" Decode.int)
        (Decode.field "isActive" Decode.bool)
        (Decode.field "isStale" Decode.bool)
        (Decode.field "key" Decode.string)
        (Decode.field "route" decodeRoute)



-- NAVIGATION STATE


type alias NavigationState =
    { index : Int
    , routes : List NavigationRoute
    }


navigationState : NavigationState -> Property msg
navigationState val =
    property "navigationState" (encodeNavigationState val)


encodeNavigationState : NavigationState -> Value
encodeNavigationState state =
    Encode.object <|
        [ ( "index", Encode.int state.index )
        , ( "routes", Encode.list <| List.map encodeRoute state.routes )
        ]


decodeNavigationState : Decode.Decoder NavigationState
decodeNavigationState =
    Decode.map2 NavigationState
        (Decode.field "index" Decode.int)
        (Decode.field "routes" (Decode.list decodeRoute))



-- NAVIGATION TRANSITION PROPS


type alias NavigationTransition =
    { layout : NavigationLayout
    , navigationState : NavigationState
    , position : AnimatedValue
    , progress : AnimatedValue
    , scene : NavigationScene
    , scenes : List NavigationScene
    , gestureResponseDistance : Maybe Float
    }


decodeNavigationTransition : Decode.Decoder NavigationTransition
decodeNavigationTransition =
    Decode.map7 NavigationTransition
        (Decode.field "layout" decodeLayout)
        (Decode.field "navigationState" decodeNavigationState)
        (Decode.field "position" decodeAnimatedValue)
        (Decode.field "progress" decodeAnimatedValue)
        (Decode.field "scene" decodeNavigationScene)
        (Decode.field "scenes" (Decode.list decodeNavigationScene))
        (Decode.maybe (Decode.field "gestureResponseDistance" Decode.float))


transitionToNavigationSceneRenderer : NavigationTransition -> NavigationScene -> NavigationSceneRenderer
transitionToNavigationSceneRenderer props scene =
    { layout = props.layout
    , navigationState = props.navigationState
    , position = props.position
    , progress = props.progress
    , scene = scene
    , scenes = props.scenes
    }



-- NAVIGATION TRANSITION SPEC


type alias NavigationTransitionSpec =
    { duration : Maybe Float
    , easing : Maybe (Float -> Float)
    , timing : Maybe ({ value : AnimatedValue, config : Value } -> Float)
    }


configureTransition : NavigationTransitionSpec -> Property msg
configureTransition val =
    property "configureTransition" <| Native.NativeUi.encodeFunction (\_ -> encodeNavigationTransitionSpec val)


{-|
encodes values that exist into the transition spec, such that Nothing values are not encoded and
the defaults are used when react-native merges the props with the defaults
-}
encodeNavigationTransitionSpec : NavigationTransitionSpec -> Value
encodeNavigationTransitionSpec spec =
    [ ( "duration", Maybe.map Encode.float spec.duration )
    , ( "easing", Maybe.map Native.NativeUi.encodeFunction spec.easing )
    , ( "timing", Maybe.map Native.NativeUi.encodeFunction spec.timing )
    ]
        |> encodeFilterMap
        |> Encode.object



-- NAVIGATION SCENE RENDERER PROPS


type alias NavigationSceneRenderer =
    { layout : NavigationLayout
    , navigationState : NavigationState
    , position : AnimatedValue
    , progress : AnimatedValue
    , scene : NavigationScene
    , scenes : List NavigationScene
    }


encodeNavigationSceneRenderer : NavigationSceneRenderer -> Value
encodeNavigationSceneRenderer props =
    Encode.object <|
        [ ( "layout", encodeNavigationLayout props.layout )
        , ( "navigationState", encodeNavigationState props.navigationState )
        , ( "position", encodeAnimatedValue props.position )
        , ( "progress", encodeAnimatedValue props.progress )
        , ( "scene", encodeNavigationScene props.scene )
        , ( "scenes", Encode.list <| List.map encodeNavigationScene props.scenes )
        ]


decodeNavigationSceneRenderer : Decode.Decoder NavigationSceneRenderer
decodeNavigationSceneRenderer =
    Decode.map6 NavigationSceneRenderer
        (Decode.field "layout" decodeLayout)
        (Decode.field "navigationState" decodeNavigationState)
        (Decode.field "position" decodeAnimatedValue)
        (Decode.field "progress" decodeAnimatedValue)
        (Decode.field "scene" decodeNavigationScene)
        (Decode.field "scenes" (Decode.list decodeNavigationScene))


position : AnimatedValue -> Property msg
position val =
    property "position" (encodeAnimatedValue val)


progress : AnimatedValue -> Property msg
progress val =
    property "progress" (encodeAnimatedValue val)


scenes : List NavigationScene -> Property msg
scenes val =
    property "scenes" (Encode.list <| List.map encodeNavigationScene val)


navigationSceneRendererToPropertyList : NavigationSceneRenderer -> List (Property msg)
navigationSceneRendererToPropertyList props =
    [ layout props.layout
    , navigationState props.navigationState
    , position props.position
    , progress props.progress
    , scene props.scene
    , scenes props.scenes
    ]
