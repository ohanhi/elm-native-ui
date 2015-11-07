module ElNativo.Nativo
    ( VTree
    , node, view, text
    , encode
    ) where

import Json.Encode


type VTree
  = VNode String (List VTree)
  | VText Style String


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


text : Style -> String -> VTree
text style textContent =
  VText style textContent


encode : VTree -> Json.Encode.Value
encode vtree =
  case vtree of
    VNode tagName children ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string tagName)
        , ("children", Json.Encode.list (List.map encode children))
        ]
    VText style textContent ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string "Text")
        , ("style", encodeStyle style)
        , ("children", Json.Encode.list [Json.Encode.string textContent])
        ]

