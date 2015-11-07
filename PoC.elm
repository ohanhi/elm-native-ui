module PoC where

import Time
import Signal

type alias VTree =
  { tagName : String
  , children : List String
  }

render : Float -> VTree
render seconds =
  { tagName = "Text"
  , children =
    [ "Elm says: " ++ toString seconds
    ]
  }

port vtree : Signal VTree
port vtree =
  Time.every (2 * Time.second)
  |> Signal.map Time.inSeconds
  |> Signal.map render
