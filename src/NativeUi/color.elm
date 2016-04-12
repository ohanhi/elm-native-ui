module NativeUi.Color (..) where

import Color


type Color
  = RGB Int Int Int
  | RGBA Int Int Int Float
  | HSL Int Int Int
  | HSLA Int Int Int Float
  | Hex Int Int Int Int
  | AsString String



-- TODO
-- More thought required tp handle color
