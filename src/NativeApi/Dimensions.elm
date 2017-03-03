module NativeApi.Dimensions exposing (window)

{-| elm-native-ui Dimensions

@docs window
-}

import Native.NativeUi.Dimensions


{-| -}
type alias WindowSize =
    { height : Float, width : Float }


{-| -}
window : WindowSize
window =
    WindowSize
        Native.NativeUi.Dimensions.windowHeight
        Native.NativeUi.Dimensions.windowWidth
