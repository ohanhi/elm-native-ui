module NativeUi.Enum.View (..) where

{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}


type AccessibilityLiveRegion
  = None
  | Polite
  | Assertive


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type ImportantForAccessibility
  = Auto
  | Yes
  | No
  | NoHideDescendants
