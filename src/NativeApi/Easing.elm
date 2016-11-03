module NativeApi.Easing exposing (Easing, ease, linear, inOut)

{-|
 Elm implementation of the NavigationExperimental example from the react-native UIExplorer example:
https://github.com/facebook/react-native/blob/master/Libraries/Animated/src/Easing.js
-}

-----------------------------
{- TODO: Once elm 0.18 is out add reference to http://package.elm-lang.org/packages/elm-community/easing-functions/latest
   and refactor this section
-}


{-|
TODO: Delete and use elm-community/easing-functions
-}
type alias Easing =
    Float -> Float


{-|
TODO: Delete and use elm-community/easing-functions
-}
linear : Easing
linear =
    identity


{-|
TODO: Delete and use elm-community/easing-functions
-}
bezier : Float -> Float -> Float -> Float -> Easing
bezier x1 y1 x2 y2 time =
    let
        lerp from to v =
            from + (to - from) * v

        pair interpolate ( a0, b0 ) ( a1, b1 ) v =
            ( interpolate a0 a1 v, interpolate b0 b1 v )

        casteljau ps =
            case ps of
                [ ( x, y ) ] ->
                    y

                xs ->
                    List.map2 (\x y -> pair lerp x y time) xs (Maybe.withDefault [] (List.tail xs))
                        |> casteljau
    in
        casteljau [ ( 0, 0 ), ( x1, y1 ), ( x2, y2 ), ( 1, 1 ) ]


{-|
TODO: Delete and use elm-community/easing-functions
-}
inOut : Easing -> Easing -> Easing
inOut e1 e2 time =
    if time < 0.5 then
        e1 (time * 2) / 2
    else
        0.5 + e2 ((time - 0.5) * 2) / 2



-----------------------------


ease : Easing
ease =
    bezier 0.42 0 1 1
