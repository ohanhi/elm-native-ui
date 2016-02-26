module Main where

import Time
import Signal
import Json.Encode
import ReactNative.ReactNative as RN
import ReactNative.NativeApp as NativeApp
import ReactNative.Style as Style exposing ( defaultTransform )


-- "main"
port viewTree : Signal Json.Encode.Value
port viewTree =
  NativeApp.start { model = model, view = view, update = update, init = init }


type alias Model = Int


model : Model
model = 9000


view : Signal.Address Action -> Model -> RN.VTree
view address count =
  RN.view
    [ Style.alignItems "center"
    ]
    [ RN.image
      [ Style.height 64
      , Style.width 64
      , Style.marginBottom 30
      ]
      "https://raw.githubusercontent.com/futurice/spiceprogram/master/assets/img/logo/chilicorn_no_text-128.png"
    , RN.text
      [ Style.textAlign "center"
      , Style.marginBottom 30
      ]
      Nothing
      ("Counter: " ++ toString count)
    , RN.view
      [ Style.width 80
      , Style.flexDirection "row"
      , Style.justifyContent "space-between"
      ]
      [ button address Decrement "#d33" "-"
      , button address Increment "#3d3" "+"
      ]
    ]


type Action = Increment | Decrement


update : Action -> Model -> Model
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1


button : Signal.Address Action -> Action -> String -> String -> RN.VTree
button address action color content =
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
    , Style.transform { defaultTransform | rotate = Just "10deg" }
    ]
    (Just <| RN.onPress address action)
    content


-- for the first vtree
port init : Signal ()
