module Navigator exposing (NavigatorMsg, update, view)

import NativeApi.NavigationStateUtil as NS
import NativeUi as Ui exposing (Node, node, map)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.Style as Style
import Navigation exposing (NavigationChangeMsg(Exit, None, Pop))
import Scene
import Json.Encode


type NavigatorMsg
    = Back
    | Scene NavigationChangeMsg


update : NavigatorMsg -> NS.NavigationState -> ( NS.NavigationState, NavigationChangeMsg )
update msg state =
    case msg of
        Back ->
            ( state, Pop )

        Scene changeMsg ->
            ( state, changeMsg )



-- VIEW


view : NS.NavigationState -> Node NavigatorMsg
view state =
    Elements.navigationCardStack
        [ Ui.style
            [ Style.flex 1 ]
        , NS.navigationState state
        , Events.onNavigateBack Back
        , NS.renderScene viewScene
        ]
        []


viewScene : { scene: NS.NavigationScene } -> Node NavigatorMsg
viewScene props =
    Scene.view props |> Ui.map Scene
