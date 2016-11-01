module CardStack.Navigator exposing (NavigatorModel, NavigatorMsg, update, view)

import CardStack.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))
import CardStack.Scene as Scene
import NativeUi.NavigationExperimental as NE
import NativeUi as Ui exposing (Node, node, map)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.Properties exposing (enableGestures)
import NativeUi.Style as Style


type alias NavigatorModel =
    { enableGestures : Bool
    , navigationState : NE.NavigationState
    }


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
    Elements.navigationCardStack
        [ Ui.style
            [ Style.flex 1 ]
        , NE.navigationState model.navigationState
        , Events.onNavigateBack Back
        , NE.renderScene viewScene
        , enableGestures model.enableGestures
        ]
        []


viewScene : NE.NavigationSceneRenderer -> Node NavigatorMsg
viewScene props =
    Scene.view props |> Ui.map Scene
