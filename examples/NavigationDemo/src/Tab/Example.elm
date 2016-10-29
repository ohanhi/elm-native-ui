module Tab.Example exposing (Model, Msg(Start), init, update, view)

import Dict as Dict
import NativeApi.NavigationStateUtil exposing (jumpTo, pop, push)
import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationState, navigationState)
import NativeUi exposing (Node, Property, node)
import Tab.NavigationMsg exposing (NavigationMsg(Exit, Jump, None, Pop, Push))
import Tab.Navigator as Navigator


-- MODEL


type alias Model =
    { navigator : Navigator.NavigatorModel
    }


init : Model
init =
    let
        apple =
            { counter = 1
            , state =
                { index = 0
                , routes = [ { key = "apple", title = Just "Apple Home" } ]
                }
            }

        banana =
            { counter = 1
            , state =
                { index = 0
                , routes = [ { key = "banana", title = Just "Banana Home" } ]
                }
            }

        orange =
            { counter = 1
            , state =
                { index = 0
                , routes = [ { key = "orange", title = Just "Orange Home" } ]
                }
            }

        tabState =
            Dict.empty
                |> Dict.insert "apple" apple
                |> Dict.insert "banana" banana
                |> Dict.insert "orange" orange
    in
        { navigator =
            { tabs =
                { index = 0
                , routes =
                    [ { key = "apple", title = Nothing }
                    , { key = "banana", title = Nothing }
                    , { key = "orange", title = Nothing }
                    ]
                }
            , tabState = tabState
            }
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

                    Jump key ->
                        ( { model | navigator = changeTab key model.navigator }, False )

                    None ->
                        ( { model | navigator = navigator }, False )

                    Pop ->
                        ( { model | navigator = updateNavigator popTabState model.navigator }, False )

                    Push ->
                        ( { model | navigator = updateNavigator pushTabState model.navigator }, False )


updateNavigator : (Maybe Navigator.NavigatorTabState -> Maybe Navigator.NavigatorTabState) -> Navigator.NavigatorModel -> Navigator.NavigatorModel
updateNavigator updateValue model =
    case Navigator.getActiveTabKey model of
        Nothing ->
            model

        Just key ->
            { model | tabState = Dict.update key updateValue model.tabState }


changeTab : String -> Navigator.NavigatorModel -> Navigator.NavigatorModel
changeTab key model =
    { model | tabs = jumpTo key model.tabs }


popTabState : Maybe Navigator.NavigatorTabState -> Maybe Navigator.NavigatorTabState
popTabState maybeTabState =
    case maybeTabState of
        Nothing ->
            Nothing

        Just tabState ->
            Just
                { tabState
                    | counter = tabState.counter - 1
                    , state = pop tabState.state
                }


pushTabState : Maybe Navigator.NavigatorTabState -> Maybe Navigator.NavigatorTabState
pushTabState maybeTabState =
    case maybeTabState of
        Nothing ->
            Nothing

        Just tabState ->
            let
                route =
                    { key = "route - " ++ toString tabState.counter, title = Nothing }
            in
                Just
                    { tabState
                        | counter = tabState.counter + 1
                        , state = push route tabState.state
                    }



-- VIEW


view : Model -> Node Msg
view model =
    Navigator.view model.navigator |> NativeUi.map NavigationChange
