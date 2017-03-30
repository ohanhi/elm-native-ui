module NativeUi.FlatList exposing (..)

{-| elm-native-ui FlatList

@docs
-}

import Json.Encode exposing (Value)
import Json.Decode as Decode
import NativeUi exposing (Property, Node, node, unsafeRenderDecodedProperty, property)


type alias IndexItem a =
    { item : a
    , index : Int
    }


decodeIndexItem : Decode.Decoder a -> Decode.Decoder (IndexItem a)
decodeIndexItem itemDecoder =
    Decode.map2 IndexItem
        (Decode.field "item" itemDecoder)
        (Decode.field "index" Decode.int)


{-| -}
flatList : List (Property msg) -> Node msg
flatList props =
    node "FlatList" props []


{-| -}
data : Value -> Property msg
data =
    property "data"


{-| -}
renderRow : Decode.Decoder a -> (IndexItem a -> Node msg) -> Property msg
renderRow itemDecoder =
    unsafeRenderDecodedProperty "renderItem" (decodeIndexItem itemDecoder)
