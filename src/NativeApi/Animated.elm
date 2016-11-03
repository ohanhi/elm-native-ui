module NativeApi.Animated exposing (AnimatedValue, animatedValueInterpolate, decodeAnimatedValue, encodeAnimatedValue)

import Json.Decode as Decode
import Json.Encode as Encode exposing (Value)
import Native.Animated
import NativeApi.Internal as Internal


-- ANIMATED VALUE


type alias AnimatedValue =
    Decode.Value


encodeAnimatedValue : AnimatedValue -> Value
encodeAnimatedValue =
    identity


decodeAnimatedValue : Decode.Decoder AnimatedValue
decodeAnimatedValue =
    Decode.value



-- INTERPOLATE


type ExtrapolateType
    = Extend
    | Identity
    | Clamp


type alias InterpolationConfigType =
    { inputRange : List Float
    , outputRange : List Float
    , easing : Maybe (Float -> Float)
    , extrapolate : Maybe ExtrapolateType
    , extrapolateLeft : Maybe ExtrapolateType
    , extrapolateRight : Maybe ExtrapolateType
    }


animatedValueInterpolate : AnimatedValue -> InterpolationConfigType -> AnimatedValue
animatedValueInterpolate value config =
    let
        jsonValue =
            encodeAnimatedValue value

        jsonConfig =
            encodeInterpolationConfigType config

        jsonResult =
            Native.Animated.animatedValueInterpolate jsonValue jsonConfig
                |> Decode.decodeValue decodeAnimatedValue
    in
        case jsonResult of
            Ok result ->
                result

            Err reason ->
                Debug.crash reason


encodeInterpolationConfigType : InterpolationConfigType -> Value
encodeInterpolationConfigType config =
    [ ( "inputRange", Just <| Encode.list <| List.map Encode.float config.inputRange )
    , ( "outputRange", Just <| Encode.list <| List.map Encode.float config.outputRange )
    , ( "easing", Maybe.map Native.NativeUi.encodeFunction config.easing )
    , ( "extrapolate", Maybe.map encodeExtrapolateType config.extrapolate )
    , ( "extrapolateLeft", Maybe.map encodeExtrapolateType config.extrapolateLeft )
    , ( "extrapolateRight", Maybe.map encodeExtrapolateType config.extrapolateRight )
    ]
        |> Internal.encodeFilterMap
        |> Encode.object


encodeExtrapolateType : ExtrapolateType -> Value
encodeExtrapolateType val =
    let
        stringValue =
            case val of
                Extend ->
                    "extend"

                Identity ->
                    "identity"

                Clamp ->
                    "clamp"
    in
        Encode.string stringValue
