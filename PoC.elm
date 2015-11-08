module PoC where

import Time
import Signal
import Json.Encode
import ReactNative.ReactNative as RN
import ReactNative.Style as S


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


view : Signal.Address Action -> Model -> RN.VTree
view address count =
  RN.view
    [ RN.text
      []
      (RN.onPress address NoOp)
      ("Counter: " ++ toString count)
    , RN.text
      [S.color "blue"]
      (RN.onPress address Increment)
      "Increment"
    , RN.text
      [S.color "red"]
      (RN.onPress address Decrement)
      "Decrement"
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
  |> Signal.map RN.encode


port init : Signal ()

