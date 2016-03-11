module RandomGif (..) where

import Effects exposing (Effects, Never)
import ReactNative.ReactNative as RN
import ReactNative.Style as Style
import Http
import Json.Decode as Json
import Task


-- MODEL


type alias Model =
  { topic : String
  , gifUrl : String
  }


init : String -> ( Model, Effects Action )
init topic =
  ( Model topic "image!waiting.gif"
  , getRandomGif topic
  )



-- UPDATE


type Action
  = RequestMore
  | NewGif (Maybe String)


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    RequestMore ->
      ( model, getRandomGif model.topic )

    NewGif maybeUrl ->
      ( Model model.topic (Maybe.withDefault model.gifUrl maybeUrl)
      , Effects.none
      )



-- VIEW


view : Signal.Address Action -> Model -> RN.Node
view address model =
  RN.view
    [ RN.style
        [ Style.flex 1
        , Style.flexDirection "column"
        , Style.alignItems "center"
        , Style.justifyContent "center"
        ]
    ]
    [ RN.text [ headerStyle ] model.topic
    , RN.image [ imgStyle, RN.imageSource model.gifUrl ] []
    , moreButton address
    ]


moreButton : Signal.Address Action -> RN.Node
moreButton address =
  RN.text
    [ RN.onPress address RequestMore
    , RN.style
        [ Style.backgroundColor "#ccc"
        , Style.borderRadius 5
        , Style.margin 10
        , Style.padding 10
        ]
    ]
    "More Please!"


headerStyle : RN.Property
headerStyle =
  RN.style
    [ Style.fontSize 36
    , Style.textAlign "center"
    ]


imgStyle : RN.Property
imgStyle =
  RN.style
    [ Style.width 200
    , Style.height 200
    , Style.resizeMode "cover"
    ]



-- EFFECTS


getRandomGif : String -> Effects Action
getRandomGif topic =
  Http.get decodeUrl (randomUrl topic)
    |> Task.toMaybe
    |> Task.map NewGif
    |> Effects.task


randomUrl : String -> String
randomUrl topic =
  Http.url
    "http://api.giphy.com/v1/gifs/random"
    [ ( "api_key", "dc6zaTOxFJmzC" )
    , ( "tag", topic )
    ]


decodeUrl : Json.Decoder String
decodeUrl =
  Json.at [ "data", "image_url" ] Json.string
