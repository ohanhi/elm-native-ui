module NativeUi.AsyncStorage exposing (Error, getItem, setItem, removeItem, multiGet)

{-| elm-native-ui AsyncStorage

@docs Error, setItem, getItem, removeItem, multiGet
-}

import Native.NativeUi.AsyncStorage
import Task exposing (Task)
import Dict exposing (Dict, fromList)


{-| -}
type Error
    = Error String


{-| -}
getItem : String -> Task Error (Maybe String)
getItem =
    Native.NativeUi.AsyncStorage.getItem


{-| -}
setItem : String -> String -> Task Error ()
setItem =
    Native.NativeUi.AsyncStorage.setItem


{-| -}
removeItem : String -> Task Error ()
removeItem =
    Native.NativeUi.AsyncStorage.removeItem


{-| -}
multiGet : List String -> Task Error (Dict String (Maybe String))
multiGet strings =
    Task.map Dict.fromList (Native.NativeUi.AsyncStorage.multiGet strings)
