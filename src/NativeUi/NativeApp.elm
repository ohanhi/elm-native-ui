module NativeUi.NativeApp (start) where

import NativeUi as Ui


type Action a
  = Init
  | ConfigAction a


type alias Config model action =
  { model : model
  , view : Signal.Address action -> model -> Ui.NativeUi
  , update : action -> model -> model
  }


start : Config model action -> Signal Ui.NativeUi
start config =
  let
    actions =
      Signal.mailbox Nothing

    merged =
      Signal.mergeMany
        [ Signal.map ConfigAction actions.signal
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
