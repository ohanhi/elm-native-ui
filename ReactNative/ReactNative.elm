module ReactNative.ReactNative
    ( Node
    , Property
    , node, view, text, image
    , property
    , imageSource
    , onPress
    ) where

import Json.Encode
import Json.Decode
import Signal

import VirtualDom

import Native.ElmFunctions
import Native.ReactNative

type alias Node = VirtualDom.Node
type alias Property = VirtualDom.Property
type alias EventHandlerRef = Int


node : String -> List Property -> List Node -> Node
node =
  VirtualDom.node


property : String -> Json.Decode.Value -> Property
property =
  VirtualDom.property


view : List Property -> List Node -> Node
view =
  node "View"


text : List Property -> String -> Node
text props str =
  node "Text" props [VirtualDom.text str]


image : List Property -> List Node -> Node
image =
  node "Image"


imageSource : String -> Property
imageSource uri =
  Json.Encode.object [("uri", Json.Encode.string uri)]
    |> property "source"


on : String -> Json.Decode.Decoder a -> (a -> Signal.Message) -> Property
on =
  VirtualDom.on


onPress : Signal.Address a -> a -> Property
onPress address msg =
  on "Press" Json.Decode.value (\_ -> Signal.message address msg)
