module Navigation exposing (NavigationChangeMsg(Exit, None, Pop, Push), underlayColor)

import Json.Encode
import NativeUi exposing (Property, property)
import NativeUi.NavigationExperimental exposing (NavigationRoute)


type NavigationChangeMsg
    = Exit
    | None
    | Pop
    | Push


{-|
Custom property definition - for when items are missing from elm-native-ui
-}
underlayColor : String -> Property msg
underlayColor val =
    property "underlayColor" (Json.Encode.string val)
