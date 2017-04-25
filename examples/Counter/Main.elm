module Main exposing (..)

import NativeUi as Ui exposing (Node)
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Properties exposing (..)
import NativeUi.Events exposing (..)


-- MODEL


type alias Model =
    Int


model : Model
model =
    9000



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )



-- VIEW


view : Model -> Node Msg
view count =
    Elements.view
        [ Ui.style [ Style.alignItems "center" ]
        ]
        [ image
            [ Ui.style
                [ Style.height 64
                , Style.width 64
                , Style.marginBottom 30
                ]
            , sourceUri "https://raw.githubusercontent.com/futurice/spiceprogram/master/assets/img/logo/chilicorn_no_text-128.png"
            ]
            []
        , text
            [ Ui.style
                [ Style.textAlign "center"
                , Style.marginBottom 30
                ]
            ]
            [ Ui.string ("Counter: " ++ toString count)
            ]
        , Elements.view
            [ Ui.style
                [ Style.width 80
                , Style.flexDirection "row"
                , Style.justifyContent "space-between"
                ]
            ]
            [ button Decrement "#d33" "-"
            , button Increment "#3d3" "+"
            ]
        ]


button : Msg -> String -> String -> Node Msg
button msg color content =
    text
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
        , onPress msg
        ]
        [ Ui.string content ]



-- PROGRAM


main : Program Never Model Msg
main =
    Ui.program
        { init = ( model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
