module ReactNative.ReactNative
    ( VTree
    , node, string, view, text, image
    , style, imageSource
    , onPress
    ) where

import Json.Encode
import Json.Decode
import Signal
import ReactNative.Style as RnStyle

import Native.ElmFunctions
import Native.ReactNative


type VTree
  = VNode String (List Property) (List VTree)
  | VString String


type Property
  = JsonProperty String Json.Decode.Value
  | NativeProperty String NativeValue


type NativeValue = NativeValue


node : String -> List Property -> List VTree -> VTree
node tagName props children =
  VNode tagName props children


string : String -> VTree
string =
  VString


view : List Property -> List VTree -> VTree
view =
  VNode "View"


text : List Property -> List VTree -> VTree
text =
  VNode "Text"


image : List Property -> List VTree -> VTree
image props source =
  VNode "Image" props source


-- Properties


property : String -> Json.Decode.Value -> Property
property =
  JsonProperty


imageSource : String -> Property
imageSource uri =
  Json.Encode.object [ ("uri", Json.Encode.string uri) ]
    |> property "source"

style : List RnStyle.Style -> Property
style styles =
  RnStyle.encode styles
    |> property "style"


-- Events


nativeEventHandler : Json.Decode.Decoder a -> (a -> Signal.Message) -> NativeValue
nativeEventHandler =
  Native.ReactNative.nativeEventHandler


on : String -> Json.Decode.Decoder a -> (a -> Signal.Message) -> Property
on name decoder toMessage =
  let
    fullName = "on" ++ name
    handler = nativeEventHandler decoder toMessage
  in
    NativeProperty fullName handler


onPress : Signal.Address a -> a -> Property
onPress address msg =
  on "Press" Json.Decode.value (\_ -> Signal.message address msg)
