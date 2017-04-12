module NativeApi.StyleSheet exposing (create)

{-| elm-native-ui StyleSheet

@docs create
-}

import Native.NativeUi.StyleSheet
import NativeUi.Style exposing (Style, StyleSheet)
import Json.Encode
import Dict exposing (Dict)


{-| -}
create : List ( String, List Style ) -> Dict String StyleSheet
create list =
    list
        |> List.map (Tuple.mapSecond NativeUi.Style.encode)
        |> Json.Encode.object
        |> Native.NativeUi.StyleSheet.create
