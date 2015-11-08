module PoC where

import Time
import Signal
import Json.Encode
import ElNativo.ElNativo exposing (..)


type alias Model = Int


type Action = NoOp | Increment | Decrement


update : Action -> Model -> Model
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
    NoOp -> model


actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoOp


view : Signal.Address Action -> Model -> VTree
view address count =
  view
    [ text
      []
      (onPress address NoOp)
      ("Counter: " ++ toString count)
    , text
      [("color", "blue")]
      (onPress address Increment)
      "Increment"
    ]


initialModel : Model
initialModel = 0


model : Signal Model
model = Signal.constant 0
  --Signal.foldp update initialModel actions.signal


port vtreeOutput : Signal Json.Encode.Value
port vtreeOutput =
  model
  |> Signal.map (view actions.address)
  |> Signal.map encode

