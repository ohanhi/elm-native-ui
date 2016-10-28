module CardStackScene exposing (view)

import NativeUi.NavigationExperimental exposing (SceneRendererProps)
import NativeUi exposing (Node)
import NativeUi.Elements as Elements
import Navigation exposing (NavigationChangeMsg(Exit, None, Pop, Push))
import NavigationExampleRow as Row


view : SceneRendererProps -> Node NavigationChangeMsg
view props =
    Elements.scrollView
        []
        [ Row.label props.scene.route.key
        , Row.button "Push Route" Push
        , Row.button "Pop Route" Pop
        , Row.button "Exit Card Stack Example" Exit
        ]
