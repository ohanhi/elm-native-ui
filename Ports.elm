module Ports where

import Time

port seconds : Signal Time.Time
port seconds =
  Time.every Time.second

