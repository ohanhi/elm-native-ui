module PoC where

import Time
import Signal
import Json.Encode


type VTree
  = VNode String (List VTree)
  | VText String


node : String -> List VTree -> VTree
node tagName children =
  VNode tagName children


text : String -> VTree
text str =
  VText str


render : Float -> VTree
render seconds =
  node "View"
    [ text ("Elm says: " ++ toString seconds)
    , text ("Elm says again: " ++ toString seconds)
    , node "View"
      [ text ("Elm says nested: " ++ toString seconds) ]
    , text ("Elm says 3: " ++ toString seconds)
    ]


valueify : VTree -> Json.Encode.Value
valueify vtree =
  case vtree of
    VNode tagName children ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string tagName)
        , ("children", Json.Encode.list (List.map valueify children))
        ]
    VText textContent ->
      Json.Encode.object
        [ ("tagName", Json.Encode.string "Text")
        , ("children", Json.Encode.list [Json.Encode.string textContent])
        ]


port vtreeOutput : Signal Json.Encode.Value
port vtreeOutput =
  Time.every (2 * Time.second)
  |> Signal.map Time.inSeconds
  |> Signal.map render
  |> Signal.map valueify

