module NativeUi.Enum.TextInput (..) where

{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}


type AutoCapitalize
  = None
  | Sentences
  | Words
  | Characters


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type KeyboardType
  = Default
  | EmailAddress
  | Numeric
  | PhonePad
  | AsciiCapable
  | NumbersAndPunctuation
  | Url
  | NumberPad
  | NamePhonePad
  | DecimalPad
  | Twitter
  | WebSearch


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type ClearButtonMode
  = Never
  | WhileEditing
  | UnlessEditing
  | Always
