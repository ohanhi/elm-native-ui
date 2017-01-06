module NativeUi exposing (Node, customNode, node, string, style, on, Property, property, map, program, renderProperty)

{-| Render your application as a React Native app.

# Common Helpers
@docs node, string, customNode, style, property, map, renderProperty

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


{-| This type represents a reference to a React component.

  You should not use this type from Elm. It only exists to keep track of
  JavaScript components that are passed through Elm to Native modules.
-}
type NativeComponent
    = NativeComponent


{-| -}
node : String -> List (Property msg) -> List (Node msg) -> Node msg
node =
    Native.NativeUi.node


{-| -}
customNode : String -> NativeComponent -> List (Property msg) -> List (Node msg) -> Node msg
customNode =
    Native.NativeUi.customNode


{-| -}
string : String -> Node msg
string =
    Native.NativeUi.string


{-| -}
property : String -> Value -> Property msg
property =
    Native.NativeUi.property


{-| -}
renderProperty : String -> Decoder a -> (a -> Node b) -> Property msg
renderProperty =
    Native.NativeUi.renderProperty


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
