module CardStack exposing (Model, Msg(Start), init, update, view)

import NativeApi.NavigationStateUtil exposing (NavigationRoute, NavigationState, navigationState, pop, push)
import NativeUi exposing (Node, Property, node)
import Navigation exposing (NavigationChangeMsg(Exit, None, Pop, Push))
import Navigator exposing (NavigatorMsg, view)


-- MODEL


type alias Model =
    { navigationState : NavigationState
    , counter : Int
    }


init : Model
init =
    { navigationState =
        { index = 0
        , routes = [ { key = "Welcome", title = "Foo" } ]
        }
    , counter = 1
    }



-- UPDATE


type Msg
    = Start
    | NavigationChange NavigatorMsg


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case msg of
        Start ->
            ( init, False )

        NavigationChange navigatorMsg ->
            let
                ( state, changeMsg ) =
                    Navigator.update navigatorMsg model.navigationState
            in
                case changeMsg of
                    Exit ->
                        ( model, True )

                    None ->
                        ( { model | navigationState = state }, False )

                    Pop ->
                        ( { model | navigationState = pop state
                                  , counter = model.counter - 1 }
                         , False )

                    Push ->
                        ( { model
                            | navigationState = push { key = "route - " ++ toString model.counter, title = "Bar" } state
                            , counter = model.counter + 1
                          }
                        , False
                        )



-- VIEW

view : Model -> Node Msg
view model =
    Navigator.view model.navigationState |> NativeUi.map NavigationChange
