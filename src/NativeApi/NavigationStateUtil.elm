module NativeApi.NavigationStateUtil exposing (back, get, getRoute, forward, has, indexOf, jumpTo, jumpToIndex, pop, push, replaceAt, replaceAtIndex, reset)

{-|
 Elm implementation of the NavigationExperimental example from the react-native UIExplorer example:
https://github.com/facebook/react-native/blob/master/Libraries/NavigationExperimental/NavigationStateUtils.js
-}

import Array as Array
import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationScene, NavigationState)


getRoute : Int -> NavigationState -> Maybe NavigationRoute
getRoute index state =
    List.indexedMap (\i r -> ( i, r )) state.routes
        |> List.filter (\( i, r ) -> i == index)
        |> List.head
        |> Maybe.map snd


get : String -> NavigationState -> Maybe NavigationRoute
get key state =
    List.filter (\r -> r.key == key) state.routes
        |> List.head


indexOf : String -> NavigationState -> Maybe Int
indexOf key state =
    List.indexedMap (\i r -> ( i, r )) state.routes
        |> List.filter (\( i, r ) -> r.key == key)
        |> List.head
        |> Maybe.map fst


has : NavigationRoute -> NavigationState -> Bool
has route state =
    List.filter (\x -> x.key == route.key) state.routes
        |> List.isEmpty
        |> not


pop : NavigationState -> NavigationState
pop state =
    case List.reverse state.routes of
        [] ->
            state

        [ x ] ->
            state

        x :: xs ->
            let
                routes =
                    List.reverse xs
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
                routes =
                    List.append state.routes [ route ]
            in
                { state
                    | index = (List.length routes) - 1
                    , routes = routes
                }


jumpToIndex : Int -> NavigationState -> NavigationState
jumpToIndex index state =
    if index == state.index then
        state
    else if index + 1 > (List.length state.routes) then
        Debug.crash <| "invalid index " ++ (toString index) ++ " to jump to"
    else
        { state | index = index }


jumpTo : String -> NavigationState -> NavigationState
jumpTo key state =
    case indexOf key state of
        Nothing ->
            Debug.crash <| "invalid key '" ++ key ++ "' to jump to"

        Just index ->
            jumpToIndex index state


back : NavigationState -> NavigationState
back state =
    jumpToIndex (state.index - 1) state


forward : NavigationState -> NavigationState
forward state =
    jumpToIndex (state.index + 1) state


replaceAt : String -> NavigationRoute -> NavigationState -> NavigationState
replaceAt key route state =
    case indexOf key state of
        Nothing ->
            Debug.crash <| "invalid key '" ++ key ++ "' for replacing route " ++ route.key

        Just index ->
            replaceAtIndex index route state


replaceAtIndex : Int -> NavigationRoute -> NavigationState -> NavigationState
replaceAtIndex index route state =
    let
        maybeOriginal =
            getRoute index state
    in
        case maybeOriginal of
            Nothing ->
                Debug.crash <| "invalid index " ++ (toString index) ++ " for replacing route " ++ route.key

            Just original ->
                if original == route then
                    { state | index = index }
                else
                    { state | index = index, routes = List.map (substitute original route) state.routes }


substitute : NavigationRoute -> NavigationRoute -> NavigationRoute -> NavigationRoute
substitute old new value =
    if old.key == value.key then
        new
    else
        value


reset : Maybe Int -> List NavigationRoute -> NavigationState
reset maybeIndex routes =
    let
        maxIndex =
            (List.length routes) - 1

        index =
            Maybe.withDefault maxIndex maybeIndex
    in
        { index = index
        , routes = routes
        }
