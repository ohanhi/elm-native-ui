module PoC where

import Time
import Signal
import Json.Encode
import ReactNative.ReactNative as RN
import ReactNative.Style as Style exposing ( defaultTransform )


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


button : Action -> String -> String -> RN.VTree
button action color content =
  RN.text
    [ Style.color "white"
    , Style.textAlign "center"
    , Style.backgroundColor color
    , Style.paddingTop 5
    , Style.paddingBottom 5
    , Style.width 30
    , Style.fontWeight "bold"
    , Style.shadowColor "#000"
    , Style.shadowOpacity 0.25
    , Style.shadowOffset 1 1
    , Style.shadowRadius 5
    , Style.transform { defaultTransform | scaleX = Just 2 }
    ]
    (RN.onPress actions.address action)
    content


view : Model -> RN.VTree
view count =
  RN.view
    [ Style.alignItems "center"
    ]
    [ RN.text
      [ Style.textAlign "center"
      , Style.marginBottom 30
      ]
      (RN.onPress actions.address NoOp)
      ("Counter: " ++ toString count)
    , RN.view
      [ Style.width 80
      , Style.flexDirection "row"
      , Style.justifyContent "space-between"
      ]
      [ button Decrement "#d33" "-"
      , button Increment "#3d3" "+"
      ]
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
  |> Signal.map view
  |> Signal.map RN.encode


port init : Signal ()
