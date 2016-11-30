module Tab.Header exposing (view)

import ExampleRow as Row
import NativeUi as Ui
import NativeUi exposing (Node)
import NativeUi.Elements as Elements
import NativeUi.Events as Events
import NativeUi.NavigationExperimental as NE
import Tab.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))


view : NE.NavigationSceneRenderer -> Node NavigationMsg
view props =
    let
        rendererProps =
            NE.navigationSceneRendererToPropertyList props

        headerProps =
            [ NE.renderTitleComponent viewTitle
            , Events.onNavigateBack Pop
            ]
    in
        Elements.navigationHeader
            (rendererProps ++ headerProps)
            []


viewTitle : NE.NavigationSceneRenderer -> Node NavigationMsg
viewTitle props =
    Elements.navigationHeaderTitle
        []
        [ Ui.string <| Maybe.withDefault props.scene.route.key props.scene.route.title ]
