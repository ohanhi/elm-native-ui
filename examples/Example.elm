module Main (..) where

import Signal
import NativeUi as Ui
import NativeUi.NativeApp as NativeApp
import NativeUi.Style as Style exposing (defaultTransform)


app : Signal Ui.NativeUi
app =
  NativeApp.start { model = model, view = view, update = update }


main : Signal Ui.NativeUi
main =
  app


type alias Model =
  Int


model : Model
model =
  9000


view : Signal.Address Action -> Model -> Ui.NativeUi
view address count =
  Ui.view
    [ Ui.style [ Style.alignItems "center" ]
    ]
    [ Ui.image
        [ Ui.style
            [ Style.height 64
            , Style.width 64
            , Style.marginBottom 30
            ]
        , Ui.imageSource "https://raw.githubusercontent.com/futurice/spiceprogram/master/assets/img/logo/chilicorn_no_text-128.png"
        ]
        []
    , Ui.text
        [ Ui.style
            [ Style.textAlign "center"
            , Style.marginBottom 30
            ]
        ]
        [ Ui.string ("Counter: " ++ toString count)
        ]
    , Ui.view
        [ Ui.style
            [ Style.width 80
            , Style.flexDirection "row"
            , Style.justifyContent "space-between"
            ]
        ]
        [ button address Decrement "#d33" "-"
        , button address Increment "#3d3" "+"
        ]
    ]


type Action
  = Increment
  | Decrement


update : Action -> Model -> Model
update action model =
  case action of
    Increment ->
      model + 1

    Decrement ->
      model - 1


button : Signal.Address Action -> Action -> String -> String -> Ui.NativeUi
button address action color content =
  Ui.text
    [ Ui.style
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
    , Ui.onPress address action
    ]
    [ Ui.string content ]
