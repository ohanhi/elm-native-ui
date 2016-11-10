module NativeUi.AsyncStorage exposing (Error, getItem, setItem, removeItem)

{-| elm-native-ui AsyncStorage

@docs Error, setItem, getItem, removeItem
-}

import Native.NativeUi.AsyncStorage

import Task exposing (Task)

{-| -}
type Error = Error String

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
