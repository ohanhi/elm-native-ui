module ReactNative.ReactNative
    ( VTree
    , node, view, text, image
    , encode
    , onPress
    ) where

import Json.Encode
import Json.Decode
import Signal
import ReactNative.Style as RnStyle

import Native.ElmFunctions
import Native.ReactNative


type alias EventHandlerRef = Int


type VTree
  = VNode String (List RnStyle.Style) (List VTree)
  | VText (List RnStyle.Style) (Maybe (String, EventHandlerRef)) String
  | VImage (List RnStyle.Style) String


node : String -> List RnStyle.Style -> List VTree -> VTree
node tagName styles children =
  VNode tagName styles children


view : List RnStyle.Style -> List VTree -> VTree
view styles children =
  VNode "View" styles children


text : List RnStyle.Style -> Maybe (String, EventHandlerRef) -> String -> VTree
text styles handler textContent =
  VText styles handler textContent


image : List RnStyle.Style -> String -> VTree
image styles source =
  VImage styles source


on : Json.Decode.Decoder a -> (a -> Signal.Message) -> EventHandlerRef
on decoder toMessage =
  Native.ReactNative.on decoder toMessage


onPress : Signal.Address a -> a -> (String, EventHandlerRef)
onPress address msg =
  ("onPress", on Json.Decode.value (\_ -> Signal.message address msg))


encode : VTree -> Json.Encode.Value
encode vtree =
  case vtree of
    VNode tagName styles children ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string tagName)
        , ("style", RnStyle.encode styles)
        , ("children", Json.Encode.list (List.map encode children))
        ]
    VText styles handler textContent ->
      Json.Encode.object <|
        (maybeEncodeHandler handler) ++
        [ ("tagName", Json.Encode.string "Text")
        , ("style", RnStyle.encode styles)
        , ("children", Json.Encode.list [Json.Encode.string textContent])
        ]
    VImage styles source ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string "Image")
        , ("style", RnStyle.encode styles)
        , ("source", Json.Encode.string source)
        ]


maybeEncodeHandler : Maybe (String, EventHandlerRef) -> List (String, Json.Encode.Value)
maybeEncodeHandler handler =
  case handler of
    Just (handlerName, handlerRef) ->
      (handlerName, Json.Encode.int handlerRef) :: []
    Nothing ->
      []
