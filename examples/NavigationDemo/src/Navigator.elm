module Navigator exposing (NavigatorModel, NavigatorMsg, update, view)

import CardStackScene
import NativeUi.NavigationExperimental as NE
import NativeUi as Ui exposing (Node, node, map)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.Properties exposing (enableGestures)
import NativeUi.Style as Style
import Navigation exposing (NavigationChangeMsg(Exit, None, Pop))


type alias NavigatorModel =
    { enableGestures : Bool
    , navigationState : NE.NavigationState
    }


type NavigatorMsg
    = Back
    | Scene NavigationChangeMsg


update : NavigatorMsg -> NavigatorModel -> ( NavigatorModel, NavigationChangeMsg )
update msg model =
    case msg of
        Back ->
            ( model, Pop )

        Scene changeMsg ->
            ( model, changeMsg )



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


viewScene : NE.SceneRendererProps -> Node NavigatorMsg
viewScene props =
    CardStackScene.view props |> Ui.map Scene
