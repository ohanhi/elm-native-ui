module NativeApi.Platform exposing (OS(..), os)

{-| elm-native-ui Platform

@docs OS, os
-}

import Native.NativeUi.Platform


{-| -}
type OS
    = Android
    | IOS


{-| -}
os : OS
os =
    if Native.NativeUi.Platform.os == "ios" then
        IOS
    else
        Android
