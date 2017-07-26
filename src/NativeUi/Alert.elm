module NativeUi.Alert exposing (alert)

{-|
@docs alert
-}

import Native.NativeUi.Alert
import Task exposing (Task)


type alias AlertButton =
    { text : String
    , value : Bool
    }


{-| -}
alert : String -> String -> List AlertButton -> Task String Bool
alert =
    Native.NativeUi.Alert.alert
