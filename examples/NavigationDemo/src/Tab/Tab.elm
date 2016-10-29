module Tab.Tab exposing (tab)

import NativeUi.NavigationExperimental exposing (NavigationRoute)
import NativeUi as Ui exposing (Node, Property, string, style)
import NativeUi.Elements exposing (touchableOpacity, text, view)
import NativeUi.Events as Events exposing (onPress)
import NativeUi.Style as Style
import Tab.NavigationMsg exposing (NavigationMsg(Jump))


tab : NavigationRoute -> Bool -> Node NavigationMsg
tab route selected =
    touchableOpacity
        [ style styleTab
        , Events.onPress <| Jump route.key
        ]
        [ text
            [ style <| styleText selected ]
            [ Ui.string route.key ]
        ]


styleTab : List Style.Style
styleTab =
    [ Style.alignItems "center"
    , Style.backgroundColor "#FFF"
    , Style.flex 1
    , Style.justifyContent "center"
    ]


styleText : Bool -> List Style.Style
styleText selected =
    let
        baseStyle =
            [ Style.fontWeight "500" ]
    in
        if selected then
            Style.color "blue" :: baseStyle
        else
            Style.color "#222" :: baseStyle
