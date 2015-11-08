module ReactNative.ReactNative
    ( VTree
    , node, view, text
    , encode
    , onPress
    ) where

import Json.Encode
import Json.Decode
import Signal
import Native.ReactNative
import ReactNative.Style as RnStyle

type alias EventHandlerRef = Int


type VTree
  = VNode String (List VTree)
  | VText (List RnStyle.Style) (String, EventHandlerRef) String


node : String -> List VTree -> VTree
node tagName children =
  VNode tagName children


view : List VTree -> VTree
view children =
  VNode "View" children


text : List RnStyle.Style -> (String, EventHandlerRef) -> String -> VTree
text styles handler textContent =
  VText styles handler textContent


on : Json.Decode.Decoder a -> (a -> Signal.Message) -> EventHandlerRef
on decoder toMessage =
    Native.ReactNative.on decoder toMessage


onPress : Signal.Address a -> a -> (String, EventHandlerRef)
onPress address msg =
    ("onPress", on Json.Decode.value (\_ -> Signal.message address msg))


encode : VTree -> Json.Encode.Value
encode vtree =
  case vtree of
    VNode tagName children ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string tagName)
        , ("children", Json.Encode.list (List.map encode children))
        ]
    VText styles (handlerName, handlerRef) textContent ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string "Text")
        , ("style", RnStyle.encode styles)
        , (handlerName, Json.Encode.int handlerRef)
        , ("children", Json.Encode.list [Json.Encode.string textContent])
        ]

