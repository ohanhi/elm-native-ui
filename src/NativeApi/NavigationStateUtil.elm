module NativeApi.NavigationStateUtil exposing (pop, push)

import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationScene, NavigationState)


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
