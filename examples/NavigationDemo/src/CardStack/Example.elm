module CardStack.Example exposing (Model, Msg(Start), init, update, view)

import CardStack.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))
import CardStack.Navigator as Navigator
import NativeApi.NavigationStateUtil exposing (pop, push)
import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationState, navigationState)
import NativeUi exposing (Node, Property, node)


-- MODEL


type alias Model =
    { navigator : Navigator.NavigatorModel
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
    | NavigationChange Navigator.NavigatorMsg


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case msg of
        Start enableGestures ->
            ( init enableGestures, False )

        NavigationChange navigatorMsg ->
            let
                ( navigator, navigationMsg ) =
                    Navigator.update navigatorMsg model.navigator
            in
                case navigationMsg of
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
