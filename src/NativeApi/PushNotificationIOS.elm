module NativeApi.PushNotificationIOS exposing (register)

{-|
@docs register
-}

import Native.NativeUi.PushNotificationIOS
import Task exposing (Task)


{-| -}
register : Task String String
register =
    Native.NativeUi.PushNotificationIOS.register "ignored"
