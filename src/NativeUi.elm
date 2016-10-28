module NativeUi exposing (Node, node, string, style, on, Property, property, map, program, componentProperty)

{-| Render your application as a React Native app.

# Common Helpers
@docs node, string, style, property, map

# Events
@docs on

# Types
@docs Node, Property

# Program
@docs program
-}

import Json.Decode as Decode exposing (Value, Decoder)
import Native.NativeUi
import NativeUi.Style as Style


{-| -}
type Node msg
    = Node


{-| -}
type Property msg
    = Property


{-| -}
node : String -> List (Property msg) -> List (Node msg) -> Node msg
node =
    Native.NativeUi.node


{-| -}
string : String -> Node msg
string =
    Native.NativeUi.string


{-| -}
property : String -> Value -> Property msg
property =
    Native.NativeUi.property


{-| -}
componentProperty : String -> Decoder a -> (a -> Node b) -> Property msg
componentProperty =
    Native.NativeUi.componentProperty


{-| -}
style : List Style.Style -> Property msg
style styles =
    Style.encode styles
        |> Native.NativeUi.style


{-| -}
on : String -> Decoder msg -> Property msg
on eventName =
    let
        realEventName =
            "on" ++ eventName
    in
        Native.NativeUi.on realEventName


{-| -}
map : (a -> b) -> Node a -> Node b
map tagger element =
    Native.NativeUi.map tagger element


{-| -}
program :
    { view : model -> Node msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , init : ( model, Cmd msg )
    }
    -> Program Never model msg
program stuff =
    Native.NativeUi.program stuff
