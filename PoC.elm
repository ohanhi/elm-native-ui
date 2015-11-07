module PoC where

import Time
import Signal
import Json.Encode
import ElNativo.Nativo exposing (..)


render : Float -> VTree
render seconds =
  view
    [ text [] ("Elm says: " ++ toString seconds)
    , text [("color", "red")] ("Elm says again: " ++ toString seconds)
    , view
      [ text [("color", "green")] ("Elm says nested: " ++ toString seconds) ]
    , text [("color", "blue")] ("Elm says 3: " ++ toString seconds)
    ]


port vtreeOutput : Signal Json.Encode.Value
port vtreeOutput =
  Time.every (2 * Time.second)
  |> Signal.map Time.inSeconds
  |> Signal.map render
  |> Signal.map encode

