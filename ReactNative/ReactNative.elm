module ReactNative.ReactNative
    ( Node
    , Property
    , node, view, text, image
    , property
    , style
    , imageSource
    , onPress
    ) where

import Json.Encode
import Json.Decode
import Signal

import VirtualDom
import Native.ElmFunctions
import ReactNative.Style as Style

type alias Node = VirtualDom.Node
type alias Property = VirtualDom.Property

-- Nodes

node : String -> List Property -> List Node -> Node
node =
  VirtualDom.node


view : List Property -> List Node -> Node
view =
  node "View"


text : List Property -> String -> Node
text props str =
  node "Text" props [VirtualDom.text str]


image : List Property -> List Node -> Node
image =
  node "Image"

-- Properties

property : String -> Json.Decode.Value -> Property
property =
  VirtualDom.property


style : List Style.Style -> Property
style styles =
  styles
  |> Style.encode
  |> property "style"


imageSource : String -> Property
imageSource uri =
  Json.Encode.object [("uri", Json.Encode.string uri)]
    |> property "source"

-- Events

on : String -> Json.Decode.Decoder a -> (a -> Signal.Message) -> Property
on =
  VirtualDom.on


onPress : Signal.Address a -> a -> Property
onPress address msg =
  on "Press" Json.Decode.value (\_ -> Signal.message address msg)
