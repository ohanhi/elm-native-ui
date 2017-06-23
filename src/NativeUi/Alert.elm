module NativeUi.Alert exposing (Error, alert)

{-|
@docs Error, alert
-}

import Native.NativeUi.Alert
import Task exposing (Task)


{-| -}
type Error
    = Error String


type alias AlertButton =
    { text : String
    , value : Bool
    }


{-| -}
alert : String -> String -> List AlertButton -> Task Error Bool
alert =
    Native.NativeUi.Alert.alert
