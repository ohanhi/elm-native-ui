module Tab.Scene exposing (view)

import ExampleRow as Row
import NativeUi exposing (Node)
import NativeUi.Elements as Elements
import NativeUi.NavigationExperimental exposing (NavigationSceneRenderer)
import Tab.NavigationMsg exposing (NavigationMsg(Exit, Pop, Push))


view : NavigationSceneRenderer -> Node NavigationMsg
view props =
    Elements.scrollView
        []
        [ Row.button "Push Route" Push
        , Row.button "Pop Route" Pop
        , Row.button "Exit Header + Scenes + Tabs Example" Exit
        ]
