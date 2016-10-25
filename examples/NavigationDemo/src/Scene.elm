module Scene exposing (view)

import NativeApi.NavigationStateUtil exposing (NavigationScene)
import NativeUi exposing (Node, Property, node)
import NativeUi.Elements as Elements
import Navigation exposing (NavigationChangeMsg(Exit, None, Pop, Push))
import NavigationExampleRow as Row


view : { scene: NavigationScene } -> Node NavigationChangeMsg
view props =
    Elements.scrollView
        []
        [ Row.label props.scene.route.key
        , Row.button "Push Route" Push
        , Row.button "Pop Route" Pop
        , Row.button "Exit Card Stack Example" Exit
        ]
