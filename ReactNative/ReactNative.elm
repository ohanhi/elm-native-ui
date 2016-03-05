module ReactNative.ReactNative
    ( Node
    , Property
    , node, view, text, image
    , property
    , onPress
    ) where

import Json.Decode as Json
import Signal

import VirtualDom
import ReactNative.Style as RnStyle

import Native.ElmFunctions
import Native.ReactNative

type alias Node = VirtualDom.Node
type alias Property = VirtualDom.Property
type alias EventHandlerRef = Int


node : String -> List Property -> List Node -> Node
node =
  VirtualDom.node


property : String -> Json.Value -> Property
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


on : String -> Json.Decoder a -> (a -> Signal.Message) -> Property
on =
  VirtualDom.on


onPress : Signal.Address a -> a -> Property
onPress address msg =
  on "Press" Json.value (\_ -> Signal.message address msg)
