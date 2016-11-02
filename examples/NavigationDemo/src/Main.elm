module Main exposing (..)

{-|
 Elm implementation of the NavigationExperimental example from the react-native UIExplorer example:
https://github.com/facebook/react-native/tree/master/Examples/UIExplorer/js/NavigationExperimental
-}

import CardStack.Example as CS
import ExampleRow exposing (underlayColor)
import NativeUi as Ui exposing (Node)
import NativeUi.Elements as Elements exposing (scrollView, text, touchableHighlight, view)
import NativeUi.Events exposing (onPress)
import NativeUi.Properties as Properties
import NativeUi.Style as Style


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
    , cardStackNoGesture : CS.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { current = None
      , cardStack = CS.init True
      , cardStackNoGesture = CS.init False
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = CardStack CS.Msg



type Current
    = None
    | ExampleCardStack


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CardStack cardStackMsg ->
            let
                ( current, cardStack ) =
                    updateSubModel cardStackMsg model.cardStack CS.update ExampleCardStack
            in
                ( { model | current = current, cardStack = cardStack }, Cmd.none )


updateSubModel : msg -> model -> (msg -> model -> ( model, Bool )) -> Current -> ( Current, model )
updateSubModel subMsg subModel updateFunc current =
    let
        ( newSubModel, exit ) =
            updateFunc subMsg subModel
    in
        if exit then
            ( None, newSubModel )
        else
            ( current, newSubModel )



-- VIEW


view : Model -> Node Msg
view model =
    case model.current of
        None ->
            viewNone

        ExampleCardStack ->
            viewCardStack model.cardStack


viewNone : Node Msg
viewNone =
    Elements.scrollView
        []
        [ label "Navigation Experimental"
        , row "CardStack Example" <| CardStack <| CS.Start True
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
