module NativeApi.Animated exposing (AnimatedValue, decodeAnimatedValue, encodeAnimatedValue)

{-|
@docs AnimatedValue, decodeAnimatedValue, encodeAnimatedValue
-}

import Json.Decode as Decode
import Json.Encode as Encode


-- ANIMATED VALUE


{-| -}
type alias AnimatedValue =
    Decode.Value


{-| -}
encodeAnimatedValue : AnimatedValue -> Encode.Value
encodeAnimatedValue =
    identity


{-| -}
decodeAnimatedValue : Decode.Decoder AnimatedValue
decodeAnimatedValue =
    Decode.value
