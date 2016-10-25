module Main exposing (..)

import CardStack as CS
import NativeUi as Ui exposing (Node)
import NativeUi.Elements as Elements exposing (scrollView, text, touchableHighlight, view)
import NativeUi.Properties as Properties
import NativeUi.Events exposing (onPress)
import NativeUi.Style as Style
import Navigation exposing (underlayColor)


-- PROGRAM


main : Program Never Model Msg
main =
    Ui.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { current : Current
    , cardStack : CS.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { current = None
      , cardStack = CS.init
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = CardStack CS.Msg


type Current
    = None
    | CardStackExample


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CardStack cardStackMsg ->
            let
                ( cardStack, exit ) =
                    CS.update cardStackMsg model.cardStack
            in
                if exit then
                    ( { model | current = None }, Cmd.none )
                else
                    ( { model | current = CardStackExample, cardStack = cardStack }, Cmd.none )



-- VIEW


view : Model -> Node Msg
view model =
    case model.current of
        None ->
            viewNone

        CardStackExample ->
            viewCardStack model.cardStack


viewNone : Node Msg
viewNone =
    Elements.scrollView
        []
        [ label "Navigation Experimental"
        , row "Card Stack" (CardStack CS.Start)
        ]


viewCardStack : CS.Model -> Node Msg
viewCardStack model =
    CS.view model |> Ui.map CardStack


label : String -> Node a
label label =
    Elements.view [ Ui.style styleRow ]
        [ Elements.text
            [ Ui.style
                [ Style.fontSize 20
                , Style.textAlign "center"
                ]
            , Properties.numberOfLines 1.0
            ]
            [ Ui.string label ]
        ]


row : String -> msg -> Node msg
row label message =
    Elements.touchableHighlight
        [ Ui.style styleRow
        , underlayColor "#D0D0D0"
        , onPress message
        ]
        [ Elements.text
            [ Ui.style
                [ Style.fontSize 17
                , Style.fontWeight "500"
                ]
            ]
            [ Ui.string label ]
        ]


styleRow : List Style.Style
styleRow =
    [ Style.padding 15
    , Style.backgroundColor "white"
    , Style.borderBottomWidth 1
    , Style.borderBottomColor "#CDCDCD"
    ]
