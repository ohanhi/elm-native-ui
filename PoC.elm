module PoC where

import Time
import Signal
import Json.Encode
import ElNativo.ElNativo as EN


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


view : Signal.Address Action -> Model -> EN.VTree
view address count =
  EN.view
    [ EN.text
      []
      (EN.onPress address NoOp)
      ("Counter: " ++ toString count)
    , EN.text
      [("color", "blue")]
      (EN.onPress address Increment)
      "Increment"
    ]


initialModel : Model
initialModel = 0


model : Signal Model
model =
  Signal.foldp update initialModel actions.signal


port vtreeOutput : Signal Json.Encode.Value
port vtreeOutput =
  Signal.map2 (,) model init
  |> Signal.map fst
  |> Signal.map (view actions.address)
  |> Signal.map EN.encode

port init : Signal ()

