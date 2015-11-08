module ElNativo.ElNativo
    ( VTree
    , node, view, text
    , encode
    , onPress
    ) where

import Json.Encode
import Json.Decode
import Signal
import Native.ElNativo


type alias EventHandlerRef = Int


type VTree
  = VNode String (List VTree)
  | VText Style (String, EventHandlerRef) String


type alias Style = List (String, String)


-- BAD!! UGLY
-- ARGH MY EYES
-- CAN CAUSE RUNTIME ERROR BECAUSE NOT ALL VALUES ARE STRINGS IN REACT NATIVE
encodeStyle : List (String, String) -> Json.Encode.Value
encodeStyle props =
  props
    |> List.map (\(key, value) -> (key, Json.Encode.string value))
    |> Json.Encode.object


node : String -> List VTree -> VTree
node tagName children =
  VNode tagName children


view : List VTree -> VTree
view children =
  VNode "View" children


text : Style -> (String, EventHandlerRef) -> String -> VTree
text style handler textContent =
  VText style handler textContent


on : Json.Decode.Decoder a -> (a -> Signal.Message) -> EventHandlerRef
on decoder toMessage =
    Native.ElNativo.on decoder toMessage


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
    VText style (handlerName, handlerRef) textContent ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string "Text")
        , ("style", encodeStyle style)
        , (handlerName, Json.Encode.int handlerRef)
        , ("children", Json.Encode.list [Json.Encode.string textContent])
        ]

