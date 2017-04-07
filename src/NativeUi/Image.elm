module NativeUi.Image
    exposing
        ( Source
        , CacheStrategy(..)
        , source
        , defaultSource
        )

{-| elm-native-ui Image

@docs Source, CacheStrategy, source
-}

import Json.Encode as Encode
import Json.Decode as Decode
import NativeUi exposing (Property, Node, property)


{-| -}
type CacheStrategy
    = Default
    | Reload
    | ForceCache
    | OnlyIfCached


{-| -}
type alias Source =
    { uri : String
    , cache : Maybe CacheStrategy
    }


{-| -}
defaultSource : String -> Source
defaultSource uri =
    { uri = uri, cache = Nothing }


{-| -}
source : Source -> Property msg
source val =
    property "source" (encodeSource val)


encodeSource : Source -> Encode.Value
encodeSource source =
    let
        uriEncode =
            ( "uri", Encode.string source.uri )

        mapFunc x =
            ( "cache", encodeCacheStrategy x )

        encoding =
            [ Just uriEncode, Maybe.map mapFunc source.cache ]
    in
        Encode.object <| (List.filterMap identity encoding)


encodeCacheStrategy : CacheStrategy -> Encode.Value
encodeCacheStrategy cacheStrategy =
    case cacheStrategy of
        Default ->
            Encode.string "default"

        Reload ->
            Encode.string "reload"

        ForceCache ->
            Encode.string "force-cache"

        OnlyIfCached ->
            Encode.string "only-if-cached"


decodeSource : Decode.Decoder Source
decodeSource =
    Decode.map2 Source
        (Decode.field "uri" Decode.string)
        (Decode.field "cache" (Decode.nullable Decode.string) |> Decode.andThen decodeCacheStrategy)


decodeCacheStrategy : Maybe String -> Decode.Decoder (Maybe CacheStrategy)
decodeCacheStrategy optionalStringValue =
    case optionalStringValue of
        Nothing ->
            Decode.succeed Nothing

        Just stringValue ->
            case stringValue of
                "default" ->
                    Decode.succeed (Just Default)

                "reload" ->
                    Decode.succeed (Just Reload)

                "force-cache" ->
                    Decode.succeed (Just ForceCache)

                "only-if-cached" ->
                    Decode.succeed (Just OnlyIfCached)

                _ ->
                    Decode.fail (stringValue ++ " is not a valid image cache value")
