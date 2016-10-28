module CardStack exposing (Model, Msg(Start), init, update, view)

import NativeApi.NavigationStateUtil exposing (pop, push)
import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationState, navigationState)
import NativeUi exposing (Node, Property, node)
import Navigation exposing (NavigationChangeMsg(Exit, None, Pop, Push))
import Navigator exposing (NavigatorModel, NavigatorMsg, update, view)


-- MODEL


type alias Model =
    { navigator : NavigatorModel
    , counter : Int
    }


init : Bool -> Model
init enableGestures =
    { navigator =
        { enableGestures = enableGestures
        , navigationState =
            { index = 0
            , routes = [ { key = "Welcome", title = Nothing } ]
            }
        }
    , counter = 1
    }



-- UPDATE


type Msg
    = Start Bool
    | NavigationChange NavigatorMsg


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case msg of
        Start enableGestures ->
            ( init enableGestures, False )

        NavigationChange navigatorMsg ->
            let
                ( navigator, changeMsg ) =
                    Navigator.update navigatorMsg model.navigator
            in
                case changeMsg of
                    Exit ->
                        ( model, True )

                    None ->
                        ( { model | navigator = navigator }, False )

                    Pop ->
                        let
                            newNavigator =
                                { navigator | navigationState = pop navigator.navigationState }
                        in
                            ( { model
                                | navigator = newNavigator
                                , counter = model.counter - 1
                              }
                            , False
                            )

                    Push ->
                        let
                            route =
                                { key = "route - " ++ toString model.counter, title = Nothing }

                            newNavigator =
                                { navigator | navigationState = push route navigator.navigationState }
                        in
                            ( { model
                                | navigator = newNavigator
                                , counter = model.counter + 1
                              }
                            , False
                            )



-- VIEW


view : Model -> Node Msg
view model =
    Navigator.view model.navigator |> NativeUi.map NavigationChange
