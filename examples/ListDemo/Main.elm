module Main exposing (..)

import NativeUi as Ui exposing (Node)
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Events exposing (..)
import NativeUi.Properties exposing (..)
import NativeUi.FlatList exposing (..)
import Json.Encode as Encode
import Json.Decode as Decode
import Time exposing (Time, every, second)


encodeItem : Item -> Encode.Value
encodeItem item =
    Encode.object <|
        [ ( "title", Encode.string item.title )
        , ( "key", Encode.string item.key )
        , ( "seconds", Encode.int item.seconds )
        ]


encodeItems : List Item -> Encode.Value
encodeItems items =
    Encode.list <| List.map encodeItem items


decodeItem : Decode.Decoder Item
decodeItem =
    Decode.map3 Item
        (Decode.field "title" Decode.string)
        (Decode.field "key" Decode.string)
        (Decode.field "seconds" Decode.int)



-- MODEL


type alias Item =
    { title : String
    , key : String
    , seconds : Int
    }


type alias Model =
    { items : List Item
    , isRefreshing : Bool
    }


items : List Item
items =
    [ Item "Item 1" "item1" 0
    , Item "Item 2" "item2" 0
    , Item "Item 3" "item3" 0
    , Item "Item 4" "item4" 0
    , Item "Item 5" "item5" 0
    , Item "Item 6" "item6" 0
    ]


model : Model
model =
    { items = items
    , isRefreshing = False
    }



-- UPDATE


type Msg
    = RefreshList
    | Tick Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        RefreshList ->
            ( { model | isRefreshing = True }, Cmd.none )

        Tick _ ->
            let
                updateFunc x =
                    { x | seconds = (x.seconds + 1) }
            in
                ( { model | items = List.map updateFunc model.items }, Cmd.none )



-- VIEW


view : Model -> Node Msg
view { items, isRefreshing } =
    Elements.view
        [ Ui.style
            [ Style.alignItems "center"
            , Style.flex 1
            , Style.paddingTop 40
            ]
        ]
        [ flatList
            [ Ui.style
                [ Style.flex 1
                , Style.alignSelf "stretch"
                , Style.marginTop 30
                ]
            , data <| encodeItems items
            , renderRow decodeItem renderItem
            , refreshing isRefreshing
            , onRefresh RefreshList
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
            [ Ui.string <| item.title ++ " " ++ (toString item.seconds)
            ]
        ]



-- PROGRAM


main : Program Never Model Msg
main =
    Ui.program
        { init = ( model, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> every second Tick
        }
