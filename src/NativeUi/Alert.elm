module NativeUi.Alert exposing (alert)

{-|
@docs alert
-}

import Task exposing (Task)
import Native.NativeUi.Alert


type alias AlertButton =
    { text : String
    , value : Bool
    }


{-| Show a system alert dialog, with the specified title, message, and list of
  buttons. The returned Task resolves to the Bool value of the button that was
  pressed.

    NativeUi.alert
        "Alert title"
        "Alert message"
        [ { text = "No thanks", value = False }
        , { text = "Yes please", value = True }
        ]
-}
alert : String -> String -> List AlertButton -> Task String Bool
alert title message buttons =
    Native.NativeUi.Alert.alert title message buttons
