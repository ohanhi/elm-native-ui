module Main exposing (..)

import NativeUi as Ui exposing (Node)
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Properties exposing (..)
import NativeUi.Events exposing (..)
import NativeUi.FlatList exposing (..)
import Json.Encode as Encode
import Json.Decode as Decode


encodeItem : Item -> Encode.Value
encodeItem item =
    Encode.object <|
        [ ( "title", Encode.string item.title )
        , ( "key", Encode.string item.key )
        ]


encodeItems : List Item -> Encode.Value
encodeItems items =
    Encode.list <| List.map encodeItem items


decodeItem : Decode.Decoder Item
decodeItem =
    Decode.map2 Item
        (Decode.field "title" Decode.string)
        (Decode.field "key" Decode.string)



-- MODEL


type alias Item =
    { title : String
    , key : String
    }


type alias Model =
    { counter : Int
    , items : List Item
    }


items : List Item
items =
    [ { title = "Item 1", key = "item1" }
    , { title = "Item 2", key = "item2" }
    , { title = "Item 3", key = "item3" }
    , { title = "Item 4", key = "item4" }
    , { title = "Item 5", key = "item5" }
    ]


model : Model
model =
    { counter = 9000
    , items = items
    }



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | counter = model.counter + 1 }, Cmd.none )

        Decrement ->
            ( { model | counter = model.counter - 1 }, Cmd.none )



-- VIEW


view : Model -> Node Msg
view model =
    Elements.view
        [ Ui.style
            [ Style.alignItems "center"
            , Style.flex 1
            , Style.paddingTop 40
            ]
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
            [ Ui.string ("Counter: " ++ toString model.counter)
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
        , flatList
            [ Ui.style
                [ Style.flex 1
                , Style.alignSelf "stretch"
                , Style.marginTop 30
                ]
            , data <| encodeItems model.items
            , renderRow decodeItem renderItem
            ]
        ]


renderItem : IndexItem Item -> Node Msg
renderItem { item, index } =
    Elements.touchableOpacity
        [ Ui.style
            [ Style.height 44
            , Style.alignItems "center"
            , Style.justifyContent "center"
            , Style.backgroundColor "#efefef"
            , Style.padding 10
            , Style.borderBottomWidth 1
            , Style.borderColor "#DDD"
            ]
        , key item.key
        ]
        [ text
            [ Ui.style
                [ Style.textAlign "center"
                ]
            ]
            [ Ui.string item.title
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
