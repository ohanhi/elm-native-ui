module ReactNative.NativeApp (start) where

import Json.Encode
import ReactNative.ReactNative as RN

type Action a = Init | ConfigAction a


type alias Config model action =
  { model : model
  , view : Signal.Address action -> model -> RN.VTree
  , update : action -> model -> model
  , init : Signal ()
  }


start : Config model action -> Signal Json.Encode.Value
start config =
  let
    actions =
      Signal.mailbox Nothing

    merged =
      Signal.mergeMany
        [ Signal.map ConfigAction actions.signal
        , Signal.map (always Init) config.init
        ]

    address =
      Signal.forwardTo actions.address Just

    update action model =
      case action of
        ConfigAction action' ->
          normalUpdate action' model

        Init ->
          model

    normalUpdate maybeAction model =
      case maybeAction of
        Just action ->
            config.update action model

        Nothing ->
            Debug.crash "This should never happen."

    model =
      Signal.foldp update config.model merged
  in
    model
    |> Signal.map (config.view address)
    |> Signal.map RN.encode
