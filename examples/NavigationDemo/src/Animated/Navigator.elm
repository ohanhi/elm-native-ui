module Animated.Navigator exposing (NavigatorModel, NavigatorMsg, update, view)

import Animated.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))
import Animated.Scene as Scene
import NativeUi.NavigationExperimental as NE
import NativeApi.Easing as Easing
import NativeUi as Ui exposing (Node, node, map)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.Properties exposing (enableGestures)
import NativeUi.Style as Style


type alias NavigatorModel =
    { navigationState : NE.NavigationState }


type NavigatorMsg
    = Back
    | Scene NavigationMsg


update : NavigatorMsg -> NavigatorModel -> ( NavigatorModel, NavigationMsg )
update msg model =
    case msg of
        Back ->
            ( model, Pop )

        Scene navigationMsg ->
            ( model, navigationMsg )



-- VIEW


view : NavigatorModel -> Node NavigatorMsg
view model =
    Elements.navigationTransitioner
        [ Ui.style
            [ Style.flex 1 ]
        , NE.navigationState model.navigationState
        , NE.render viewTransition
        , NE.configureTransition configureTransition
        ]
        []


configureTransition : NE.NavigationTransitionSpec
configureTransition =
    { duration = Just 500
    , easing = Just <| Easing.inOut Easing.ease Easing.ease
    , timing = Nothing
    }


viewTransition : NE.NavigationTransition -> List (Node NavigatorMsg)
viewTransition props =
    List.map (viewScene props) props.scenes


viewScene : NE.NavigationTransition -> NE.NavigationScene -> Node NavigatorMsg
viewScene props scene =
    NE.transitionToNavigationSceneRenderer props scene
        |> Scene.view
        |> Ui.map Scene
