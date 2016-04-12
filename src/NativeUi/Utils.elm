module NativeUi.Utils (..) where

import Char
import String


{-| -}
firstLower : List Char -> List Char
firstLower lst =
  case lst of
    [] ->
      []

    x :: xs ->
      Char.toLower (x) :: xs


{-| -}
toHyphenated : List Char -> List Char
toHyphenated x =
  case x of
    [] ->
      []

    x' :: xs ->
      case (Char.isUpper x') of
        True ->
          '-' :: Char.toLower x' :: toHyphenated xs

        False ->
          x' :: toHyphenated xs


{-| -}
enumToString : a -> String
enumToString o =
  o
    |> toString
    |> String.toList
    |> firstLower
    |> toHyphenated
    |> String.fromList


{-| -}
enumToStringd : Int -> a -> String
enumToStringd d o =
  enumToString o
    |> String.dropLeft d
