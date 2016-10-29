module Tab.Navigator exposing (NavigatorModel, NavigatorTabState, NavigatorMsg, getActiveTabKey, update, view)

import Dict as Dict
import NativeApi.NavigationStateUtil as NS
import NativeUi.NavigationExperimental as NE
import NativeUi as Ui exposing (Node, node, map)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.Properties as Properties
import NativeUi.Style as Style
import Tab.NavigationMsg exposing (NavigationMsg(Exit, Jump, None, Pop, Push))
import Tab.Header as Header
import Tab.Scene as Scene
import Tab.Tab as Tab


type alias NavigatorModel =
    { tabs : NE.NavigationState
    , tabState : Dict.Dict String NavigatorTabState
    }


type alias NavigatorTabState =
    { counter : Int
    , state : NE.NavigationState
    }


type NavigatorMsg
    = Back NavigationMsg
    | Scene NavigationMsg
    | SelectTab NavigationMsg


update : NavigatorMsg -> NavigatorModel -> ( NavigatorModel, NavigationMsg )
update msg model =
    case msg of
        Back navigationMsg ->
            ( model, navigationMsg )

        Scene navigationMsg ->
            ( model, navigationMsg )

        SelectTab navigationMsg ->
            ( model, navigationMsg )



-- VIEW


view : NavigatorModel -> Node NavigatorMsg
view model =
    let
        maybeTabKey =
            getActiveTabKey model

        maybeState =
            getTabState model maybeTabKey
    in
        case ( maybeTabKey, maybeState ) of
            ( Nothing, _ ) ->
                Debug.crash <| (++) "Tab not found at index: " <| toString model.tabs.index

            ( Just tabKey, Nothing ) ->
                Debug.crash <| "Unknown tab key: " ++ tabKey

            ( Just tabKey, Just tabState ) ->
                Elements.view
                    [ Ui.style [ Style.flex 1 ] ]
                    [ Elements.navigationCardStack
                        [ Ui.style
                            [ Style.flex 20 ]
                        , Properties.key <| "stack_" ++ tabKey
                        , NE.navigationState tabState.state
                        , Events.onNavigateBack <| Back Pop
                        , NE.renderHeader viewHeader
                        , NE.renderScene viewScene
                        ]
                        []
                    , Elements.view
                        [ Ui.style
                            [ Style.flex 1
                            , Style.flexDirection "row"
                            ]
                        , NE.navigationState model.tabs
                        ]
                        (List.map (viewTab tabState.state) model.tabs.routes)
                    ]


viewHeader : NE.SceneRendererProps -> Node NavigatorMsg
viewHeader props =
    Header.view props |> Ui.map Back


viewScene : NE.SceneRendererProps -> Node NavigatorMsg
viewScene props =
    Scene.view props |> Ui.map Scene


viewTab : NE.NavigationState -> NE.NavigationRoute -> Node NavigatorMsg
viewTab selectedState route =
    NS.has route selectedState
        |> Tab.tab route
        |> Ui.map SelectTab


getActiveTabKey : NavigatorModel -> Maybe String
getActiveTabKey model =
    NS.getRoute model.tabs.index model.tabs
        |> Maybe.map (\x -> x.key)


getTabState : NavigatorModel -> Maybe String -> Maybe NavigatorTabState
getTabState model maybeTabKey =
    case maybeTabKey of
        Nothing ->
            Nothing

        Just tabKey ->
            Dict.get tabKey model.tabState
