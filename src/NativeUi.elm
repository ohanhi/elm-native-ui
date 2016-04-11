module NativeUi (NativeUi, node, string, style, imageSource, onPress, Property) where

{-| Render your application as a React Native app.

# Types
@docs NativeUi
# Common Helpers
@docs node, string, style, imageSource, Property
# Events
@docs onPress
-}

import Json.Encode
import Json.Decode
import Signal
import NativeUi.Style as Style
import Native.ElmFunctions
import Native.NativeUi


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type NativeUi
  = VNode String (List Property) (List NativeUi)
  | VString String


{-| `NativeUi` nodes take a List of Properties (or "props") to specify their behavior and presentation.
Most Properties can be represented as Json values, and you should always try to do so if possible.
If you must use a property that can't be encoded as Json, the NativeProperty tag can be used
to attach an opaque `NativeValue`.
-}
type Property
  = JsonProperty String Json.Decode.Value
  | NativeProperty String NativeValue


{-| An opaque value that is backed by a Native javascript value.
This is used to attach event handlers to `NativeUi` nodes, since functions can't be encoded
as Json values.

Try not to use `NativeValue` if you can avoid it, since the compiler can't help you
catch any mistakes that might lead to runtime errors.
-}
type NativeValue
  = NativeValue


{-| Create a `NativeUi` node with the given `tagName`, a list of properties,
and a list of child `NativeUi` nodes.

The `tagName` will be used to look up a React Component class with the same name,
so e.g. `node "View"` will render a React Native `View` component.
-}
node : String -> List Property -> List NativeUi -> NativeUi
node tagName props children =
  VNode tagName props children

{-| Just turn a plain text string into a `NativeUi` node, so that you can add it
as a child of another node.

    text
      [ style
        [ Style.fontSize 20
        , Style.color "blue"
        ]
      ]
      [ string "Hello World!" ]
-}
string : String -> NativeUi
string =
  VString



-- Properties


{-| Attach arbitrary properties to `NativeUi` nodes.

Use this for properties that can be represented as Json values.
-}
property : String -> Json.Decode.Value -> Property
property name value =
  JsonProperty name value


{-| Turns a String URI into the "source" property for an image element.
-}
imageSource : String -> Property
imageSource uri =
  Json.Encode.object [ ( "uri", Json.Encode.string uri ) ]
    |> property "source"


{-| Turns a list of `Style`s into a property you can attach to a `NativeUi` node.
-}
style : List Style.Style -> Property
style styles =
  Style.encode styles
    |> property "style"



-- Events


nativeEventHandler : Json.Decode.Decoder a -> (a -> Signal.Message) -> NativeValue
nativeEventHandler =
  Native.NativeUi.nativeEventHandler


on : String -> Json.Decode.Decoder a -> (a -> Signal.Message) -> Property
on name decoder toMessage =
  let
    fullName =
      "on" ++ name

    handler =
      nativeEventHandler decoder toMessage
  in
    NativeProperty fullName handler


{-| Binds an event handler into the `onPress` event.
-}
onPress : Signal.Address a -> a -> Property
onPress address msg =
  on "Press" Json.Decode.value (\_ -> Signal.message address msg)
