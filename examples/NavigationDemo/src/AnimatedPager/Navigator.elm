module AnimatedPager.Navigator exposing (NavigatorModel, NavigatorMsg(Scene), update, view)

import AnimatedPager.NavigationMsg as Msg exposing (NavigationMsg(Back, Exit, Forward))
import AnimatedPager.Scene as Scene
import Dict as Dict
import NativeUi as Ui exposing (Node, node, map, style)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.NavigationExperimental as NE
import NativeUi.Properties exposing (enableGestures)
import NativeUi.Style as Style


type alias NavigatorModel =
    { navigationState : NE.NavigationState
    , colors : Dict.Dict String String
    }


type NavigatorMsg
    = Back
    | Scene NavigationMsg


update : NavigatorMsg -> NavigatorModel -> ( NavigatorModel, NavigationMsg )
update msg model =
    case msg of
        Back ->
            ( model, Msg.Back )

        Scene navigationMsg ->
            ( model, navigationMsg )



-- VIEW


view : NavigatorModel -> Node NavigatorMsg
view model =
    Elements.navigationTransitioner
        [ NE.navigationState model.navigationState
        , NE.render <| viewTransition model.colors
        ]
        []


viewTransition : Dict.Dict String String -> NE.NavigationTransition -> List (Node NavigatorMsg)
viewTransition colors props =
    [ Elements.view
        [ style [ Style.flex 1 ] ]
        (List.map (viewScene colors props) props.scenes)
    ]


viewScene : Dict.Dict String String -> NE.NavigationTransition -> NE.NavigationScene -> Node NavigatorMsg
viewScene colors props scene =
    NE.transitionToNavigationSceneRenderer props scene
        |> Scene.view (Dict.get scene.route.key colors)
        |> Ui.map Scene
