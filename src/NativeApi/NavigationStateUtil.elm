module NativeApi.NavigationStateUtil exposing (NavigationGestureDirection, NavigationRoute, NavigationScene, NavigationState, navigationState, pop, push, renderScene)

import Json.Encode as Encode exposing (Value, bool, int, list, object, string)
import NativeUi exposing (Node, Property, property, componentProperty)


type NavigationGestureDirection
    = Horizontal
    | Vertical


type alias NavigationRoute =
    { key : String
    , title : String
    }


type alias NavigationState =
    { index : Int
    , routes : List NavigationRoute
    }


{-|
 todo add:
 height: NavigationAnimatedValue
 width: NavigationAnimatedValue
-}
type alias NavigationLayout =
    { initHeight : Float
    , initWidth : Float
    , isMeasured : Bool
    }


type alias NavigationScene =
    { index : Int
    , isActive : Bool
    , isStale : Bool
    , key : String
    , route : NavigationRoute
    }


pop : NavigationState -> NavigationState
pop state =
    case List.reverse state.routes of
        [] ->
            state

        [ x ] ->
            state

        x :: xs ->
            let
                routes = List.reverse xs
            in
            { state
                | index = (List.length routes) - 1
                , routes = routes
            }


push : NavigationRoute -> NavigationState -> NavigationState
push route state =
    let
        exists =
            List.any (\x -> x.key == route.key) state.routes
    in
        if exists then
            Debug.crash <| "should not push route with duplicated key " ++ route.key
        else
            let
                routes = List.append state.routes [ route ]
            in
            { state
                | index = (List.length routes) - 1
                , routes = routes
            }


navigationState : NavigationState -> Property msg
navigationState val =
    let
        value = (encodeNavigationState) |> Debug.log "navigationState Elm"
    in
    property "navigationState" (encodeNavigationState val)


encodeNavigationState : NavigationState -> Value
encodeNavigationState state =
    Encode.object <|
        [ ( "index", Encode.int state.index )
        , ( "routes", Encode.list <| List.map encodeRoute state.routes )
        ]


encodeRoute : NavigationRoute -> Value
encodeRoute route =
    Encode.object <|
        [ ( "key", Encode.string route.key )
        , ( "title", Encode.string route.title )
        ]


renderScene : ({ scene: NavigationScene } -> Node a) -> Property msg
renderScene =
    componentProperty "renderScene"