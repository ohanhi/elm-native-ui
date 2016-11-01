module Animated.Example exposing (Model, Msg(Start), init, update, view)

import Animated.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))
import Animated.Navigator as Navigator
import NativeApi.NavigationStateUtil exposing (pop, push)
import NativeUi exposing (Node, Property, node)
import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationState, navigationState)


-- MODEL


type alias Model =
    { navigator : Navigator.NavigatorModel
    , counter : Int
    }


init : Model
init =
    { navigator =
        { navigationState =
            { index = 0
            , routes = [ { key = "Welcome", title = Nothing } ]
            }
        }
    , counter = 1
    }



-- UPDATE


type Msg
    = Start
    | NavigationChange Navigator.NavigatorMsg


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case msg of
        Start ->
            ( init, False )

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
