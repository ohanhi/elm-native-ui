module AnimatedPager.Example exposing (Model, Msg(Start), init, update, view)

import AnimatedPager.NavigationMsg exposing (NavigationMsg(Back, Exit, Forward))
import AnimatedPager.Navigator as Navigator
import Dict as Dict
import ExampleRow as Row
import NativeApi.NavigationStateUtil exposing (back, forward)
import NativeUi exposing (Node, Property, node, style)
import NativeUi.Elements as Elements
import NativeUi.NavigationExperimental exposing (NavigationRoute, NavigationState, navigationState)
import NativeUi.Style as Style


-- MODEL


type alias Model =
    { navigator : Navigator.NavigatorModel }


init : Model
init =
    { navigator =
        { navigationState =
            { index = 0
            , routes =
                [ { key = "Step 1", title = Nothing }
                , { key = "Step 2", title = Nothing }
                , { key = "Step 3", title = Nothing }
                , { key = "Step 4", title = Nothing }
                , { key = "Step 5", title = Nothing }
                , { key = "Step 6", title = Nothing }
                , { key = "Step 7", title = Nothing }
                ]
            }
        , colors =
            Dict.empty
                |> Dict.insert "Step 1" "#ff0000"
                |> Dict.insert "Step 2" "#ff7f00"
                |> Dict.insert "Step 3" "#ffff00"
                |> Dict.insert "Step 4" "#00ff00"
                |> Dict.insert "Step 5" "#0000ff"
                |> Dict.insert "Step 6" "#4b0082"
                |> Dict.insert "Step 7" "#8f00ff"
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

                    Back ->
                        let
                            newNavigator =
                                { navigator | navigationState = back navigator.navigationState }
                        in
                            ( { model
                                | navigator = newNavigator
                              }
                            , False
                            )

                    Forward ->
                        let
                            newNavigator =
                                { navigator | navigationState = forward navigator.navigationState }
                        in
                            ( { model
                                | navigator = newNavigator
                              }
                            , False
                            )



-- VIEW


view : Model -> Node Msg
view model =
    Elements.view
        [ style [ Style.flex 1 ]
        ]
        [ Navigator.view model.navigator
        , Row.button "Exit" Exit |> NativeUi.map Navigator.Scene
        ]
        |> NativeUi.map NavigationChange
