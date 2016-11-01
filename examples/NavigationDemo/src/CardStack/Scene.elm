module CardStack.Scene exposing (view)

import ExampleRow as Row
import CardStack.NavigationMsg exposing (NavigationMsg(Exit, None, Pop, Push))
import NativeUi.NavigationExperimental exposing (NavigationSceneRenderer)
import NativeUi exposing (Node)
import NativeUi.Elements as Elements


view : NavigationSceneRenderer -> Node NavigationMsg
view props =
    Elements.scrollView
        []
        [ Row.label props.scene.route.key
        , Row.button "Push Route" Push
        , Row.button "Pop Route" Pop
        , Row.button "Exit Card Stack Example" Exit
        ]
