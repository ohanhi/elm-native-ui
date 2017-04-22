module NativeUi
    exposing
        ( Node
        , customNode
        , node
        , string
        , style
        , styleSheet
        , on
        , ref
        , Property
        , property
        , map
        , program
        , programWithFlags
        , renderProperty
        , unsafeRenderDecodedProperty
        )

{-| Render your application as a React Native app.

# Common Helpers
@docs node, string, customNode, style, styleSheet, property, map, renderProperty, unsafeRenderDecodedProperty

# Events
@docs on

# Ref
@docs ref

# Types
@docs Node, Property

# Program
@docs program, programWithFlags
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


{-| Returns a property representing a rendering function

This is usually used for properties where the values passed to the rendering
function where created in Elm. To decode values passed from JavaScript, use
`unsafeRenderDecodedProperty`.

-}
renderProperty : String -> (a -> Node b) -> Property msg
renderProperty =
    Native.NativeUi.renderProperty


{-| Returns a property representing a rendering function

Runs values through the decoder before being passed to the rendering function.

This is usually used for properties where the values passed to the
rendering function were created in JavaScript, and thus need to be decoded. If
the values are passed from Elm, you can use `renderProperty` to avoid
encoding/decoding.

Crashes the program if decoding fails.
-}
unsafeRenderDecodedProperty : String -> Decoder a -> (a -> Node b) -> Property msg
unsafeRenderDecodedProperty =
    Native.NativeUi.unsafeRenderDecodedProperty


{-| -}
style : List Style.Style -> Property msg
style =
    Native.NativeUi.style << Style.encode


{-| -}
styleSheet : List Style.StyleSheet -> Property msg
styleSheet =
    Native.NativeUi.style << Style.encodeSheet


{-| -}
on : String -> Decoder msg -> Property msg
on eventName =
    let
        realEventName =
            if String.startsWith "on" eventName then
                eventName
            else
                "on" ++ eventName
    in
        Native.NativeUi.on realEventName


{-| -}
ref : (a -> b) -> Property msg
ref =
    Native.NativeUi.ref


{-| -}
map : (a -> b) -> Node a -> Node b
map =
    Native.NativeUi.map


{-| -}
program :
    { view : model -> Node msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , init : ( model, Cmd msg )
    }
    -> Program Never model msg
program =
    Native.NativeUi.program


{-| -}
programWithFlags :
    { view : model -> Node msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , init : flags -> ( model, Cmd msg )
    }
    -> Program flags model msg
programWithFlags =
    Native.NativeUi.programWithFlags
