module NativeApi.PushNotificationIOS exposing (register)

{-|
@docs register
-}

import Task exposing (Task)
import Native.NativeUi.PushNotificationIOS


{-| Returns a Task that resolves with the push token for this app installation
if the user accepts the system permissions dialog. If they don't accept the
dialog, the task doesn't resolve. If there is an error (like running on a
simulator), the Task will fail with an error message String.
-}
register : Task String String
register =
    Native.NativeUi.PushNotificationIOS.register
