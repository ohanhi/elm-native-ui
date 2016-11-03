module NativeApi.Internal exposing (encodeFilterMap)

import Json.Encode exposing (Value)


encodeFilterMap : List ( String, Maybe Value ) -> List ( String, Value )
encodeFilterMap =
    List.filterMap (\( name, maybeValue ) -> Maybe.map (\val -> ( name, val )) maybeValue)
