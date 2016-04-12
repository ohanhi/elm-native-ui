module NativeUi.Style (..) where

{-| Render your application as a React Native app.


@docs JustifyContentEnum, FontStyleEnum

# Types
@docs Value
# Common Helpers
@docs Style, stringDeclaration
# Events
@docs Declaration, Transform, Value, alignItems, alignSelf, backfaceVisibility, backgroundColor
@docs borderBottomColor, borderBottomLeftRadius, borderBottomRightRadius
@docs borderBottomWidth, borderColor, borderLeftColor, borderLeftWidth, borderRadius
@docs borderRightColor, borderRightWidth, borderStyle, borderTopColor, borderTopLeftRadius
@docs borderTopRightRadius, borderTopWidth, borderWidth, bottom, color, defaultTransform
@docs encode, encodeDeclaration, encodeObject, encodeValue, flex, flexDirection, flexWrap
@docs fontFamily, fontSize, fontStyle, fontWeight, height, justifyContent, left
@docs letterSpacing, lineHeight, listDeclaration, listStyle, margin, marginBottom
@docs marginHorizontal, marginLeft, marginRight, marginTop, marginVertical
@docs numberDeclaration, numberStyle, objectDeclaration, objectStyle, opacity, overflow
@docs padding, paddingBottom, paddingHorizontal, paddingLeft, paddingRight, paddingTop
@docs paddingVertical, position, resizeMode, right, shadowColor, shadowOffset, shadowOpacity
@docs shadowRadius, stringDeclaration, stringStyle, textAlign, textDecorationColor
@docs textDecorationLine, textDecorationStyle, tintColor, toJsonProperty, top, transform
@docs width, writingDirection, PositionEnum
@docs AlignSelfEnum, BorderStyleEnum, DirectionEnum, FlexDirectionEnum
@docs FlexWrapEnum, FontWeightEnum, TextAlignEnum, TextDecorationLine
@docs VisibilityEnum
-}

import Json.Encode
import NativeUi.Utils exposing (..)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type Value
  = StringValue String
  | NumberValue Float
  | ObjectValue (List Declaration)
  | ListValue (List (Maybe Declaration))


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
stringDeclaration : String -> String -> Declaration
stringDeclaration name value =
  ( name, StringValue value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
numberDeclaration : String -> Float -> Declaration
numberDeclaration name value =
  ( name, NumberValue value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
objectDeclaration : String -> List Declaration -> Declaration
objectDeclaration name value =
  ( name, ObjectValue value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
listDeclaration : String -> List (Maybe Declaration) -> Declaration
listDeclaration name value =
  ( name, ListValue value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
stringStyle : String -> String -> Style
stringStyle name value =
  StringStyle (stringDeclaration name value)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
numberStyle : String -> Float -> Style
numberStyle name value =
  NumberStyle (numberDeclaration name value)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
objectStyle : String -> List Declaration -> Style
objectStyle name list =
  ObjectStyle (objectDeclaration name list)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
listStyle : String -> List (Maybe Declaration) -> Style
listStyle name list =
  ListStyle (listDeclaration name list)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type alias Declaration =
  ( String, Value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type Style
  = StringStyle Declaration
  | NumberStyle Declaration
  | ObjectStyle Declaration
  | ListStyle Declaration


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
encodeValue : Value -> Json.Encode.Value
encodeValue value =
  case value of
    NumberValue float ->
      Json.Encode.float float

    StringValue string ->
      Json.Encode.string string

    ObjectValue list ->
      Json.Encode.object (List.map encodeDeclaration list)

    ListValue list ->
      Json.Encode.list (List.map encodeObject (List.filterMap identity list))


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
encodeDeclaration : ( String, Value ) -> ( String, Json.Encode.Value )
encodeDeclaration ( name, value ) =
  ( name, encodeValue value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
encodeObject : ( String, Value ) -> Json.Encode.Value
encodeObject ( name, value ) =
  Json.Encode.object [ ( name, (encodeValue value) ) ]


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
toJsonProperty : Style -> ( String, Json.Encode.Value )
toJsonProperty style =
  case style of
    StringStyle ( name, value ) ->
      ( name, encodeValue value )

    NumberStyle ( name, value ) ->
      ( name, encodeValue value )

    ObjectStyle ( name, value ) ->
      ( name, encodeValue value )

    ListStyle ( name, value ) ->
      ( name, encodeValue value )


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
encode : List Style -> Json.Encode.Value
encode styles =
  styles
    |> List.map toJsonProperty
    |> Json.Encode.object



-- Text Styles


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
color : String -> Style
color =
  stringStyle "color"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
fontFamily : String -> Style
fontFamily =
  stringStyle "fontFamily"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
fontSize : Float -> Style
fontSize =
  numberStyle "fontSize"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type FontStyleEnum
  = Normal
  | Italic


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
fontStyle : FontStyleEnum -> Style
fontStyle fs =
  stringStyle "fontStyle" (enumToString fs)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type FontWeightEnum
  = FontWeightNormal
  | FontWeightBold
  | FontWeight100
  | FontWeight200
  | FontWeight300
  | FontWeight400
  | FontWeight500
  | FontWeight600
  | FontWeight700
  | FontWeight800
  | FontWeight900


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
fontWeight : FontWeightEnum -> Style
fontWeight fw =
  stringStyle "fontWeight" (enumToStringd 10 fw)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
letterSpacing : Float -> Style
letterSpacing =
  numberStyle "letterSpacing"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
lineHeight : Float -> Style
lineHeight =
  numberStyle "lineHeight"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type TextAlignEnum
  = TextAlignAuto
  | TextAlignLeft
  | TextAlignRight
  | TextAlignCenter
  | TextAlignJustify


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textAlign : TextAlignEnum -> Style
textAlign styl =
  stringStyle "textAlign" (enumToStringd 9 styl)



--enum("none", 'underline', 'line-through', 'underline line-through')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type TextDecorationLine
  = DecNone
  | DecUnderline
  | DecLineThrough
  | DecUnderline'LineThrough


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textDecorationLine : TextDecorationLine -> Style
textDecorationLine dec =
  stringStyle "textDecorationLine" (enumToStringd 3 dec)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textDecorationStyle : BorderStyleEnum -> Style
textDecorationStyle styl =
  stringStyle "textDecorationStyle" (enumToString styl)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textDecorationColor : String -> Style
textDecorationColor =
  stringStyle "textDecorationColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type DirectionEnum
  = DirAuto
  | DirLtr
  | DirRtl


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
writingDirection : DirectionEnum -> Style
writingDirection dir =
  stringStyle "writingDirection" (enumToStringd 3 dir)



--View Styles


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
backfaceVisibility : VisibilityEnum -> Style
backfaceVisibility vis =
  stringStyle "backfaceVisibility" (enumToString vis)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
backgroundColor : String -> Style
backgroundColor =
  stringStyle "backgroundColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderColor : String -> Style
borderColor =
  stringStyle "borderColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderTopColor : String -> Style
borderTopColor =
  stringStyle "borderTopColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderRightColor : String -> Style
borderRightColor =
  stringStyle "borderRightColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderBottomColor : String -> Style
borderBottomColor =
  stringStyle "borderBottomColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderLeftColor : String -> Style
borderLeftColor =
  stringStyle "borderLeftColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderRadius : Float -> Style
borderRadius =
  numberStyle "borderRadius"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderTopLeftRadius : Float -> Style
borderTopLeftRadius =
  numberStyle "borderTopLeftRadius"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderTopRightRadius : Float -> Style
borderTopRightRadius =
  numberStyle "borderTopRightRadius"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderBottomLeftRadius : Float -> Style
borderBottomLeftRadius =
  numberStyle "borderBottomLeftRadius"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderBottomRightRadius : Float -> Style
borderBottomRightRadius =
  numberStyle "borderBottomRightRadius"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type BorderStyleEnum
  = Solid
  | Dotted
  | Dashed
  | Double


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderStyle : BorderStyleEnum -> Style
borderStyle styl =
  stringStyle "borderStyle" (enumToString styl)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderWidth : Float -> Style
borderWidth =
  numberStyle "borderWidth"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderTopWidth : Float -> Style
borderTopWidth =
  numberStyle "borderTopWidth"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderRightWidth : Float -> Style
borderRightWidth =
  numberStyle "borderRightWidth"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderBottomWidth : Float -> Style
borderBottomWidth =
  numberStyle "borderBottomWidth"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderLeftWidth : Float -> Style
borderLeftWidth =
  numberStyle "borderLeftWidth"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
opacity : Float -> Style
opacity =
  numberStyle "opacity"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type VisibilityEnum
  = Visible
  | Hidden


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
overflow : VisibilityEnum -> Style
overflow ovrfl =
  stringStyle "overflow" (enumToString ovrfl)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
shadowColor : String -> Style
shadowColor =
  stringStyle "shadowColor"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
shadowOffset : Float -> Float -> Style
shadowOffset width height =
  objectStyle
    "shadowOffset"
    [ numberDeclaration "width" width
    , numberDeclaration "height" height
    ]


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
shadowOpacity : Float -> Style
shadowOpacity =
  numberStyle "shadowOpacity"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
shadowRadius : Float -> Style
shadowRadius =
  numberStyle "shadowRadius"



--Image Styles
--enum('cover', 'contain', 'stretch')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
resizeMode : String -> Style
resizeMode =
  stringStyle "resizeMode"



--backgroundColor : String -> Style
-- str = stringStyle "backgroundColor"
--borderColor : String -> Style
--borderColor = stringStyle "borderColor"
--borderWidth : Float -> Style
--borderWidth = numberStyle "borderWidth"
--borderRadius : Float -> Style
--borderRadius = numberStyle "borderRadius"
--overflow : String -> Style --enum('visible', 'hidden')
--overflow = stringStyle "overflow"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
tintColor : String -> Style
tintColor =
  stringStyle "tintColor"



-- opacity : Float -> Style
-- opacity =
--   numberStyle "opacity"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
alignItems : AlignSelfEnum -> Style
alignItems aligns =
  stringStyle "alignItems" (enumToString aligns)



--TODO
--Drop Align and then use the rest


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type AlignSelfEnum
  = AlignAuto
  | AlignFlexStart
  | AlignFlexEnd
  | AlignCenter
  | AlignStretch


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
alignSelf : AlignSelfEnum -> Style
alignSelf aligns =
  stringStyle "alignSelf" (enumToStringd 5 aligns)



-- borderBottomWidth : Float -> Style
-- borderBottomWidth = numberStyle "borderBottomWidth"
--borderLeftWidth : Float -> Style
--borderLeftWidth = numberStyle "borderLeftWidth"
--borderRightWidth : Float -> Style
--borderRightWidth = numberStyle "borderRightWidth"
--borderTopWidth : Float -> Style
--borderTopWidth = numberStyle "borderTopWidth"
--borderWidth : Float -> Style
--borderWidth = numberStyle "borderWidth"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
bottom : Float -> Style
bottom =
  numberStyle "bottom"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
flex : Float -> Style
flex =
  numberStyle "flex"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type FlexDirectionEnum
  = Row
  | Column


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
flexDirection : FlexDirectionEnum -> Style
flexDirection dir =
  stringStyle "flexDirection" (enumToString dir)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type FlexWrapEnum
  = Wrap
  | Nowrap


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
flexWrap : FlexWrapEnum -> Style
flexWrap wrp =
  stringStyle "flexWrap" (enumToString wrp)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
height : Float -> Style
height =
  numberStyle "height"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type JustifyContentEnum
  = FlexStart
  | FlexEnd
  | Center
  | SpaceBetween
  | SpaceAround


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
justifyContent : JustifyContentEnum -> Style
justifyContent jc =
  stringStyle "justifyContent" (enumToString jc)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
left : Float -> Style
left =
  numberStyle "left"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
margin : Float -> Style
margin =
  numberStyle "margin"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
marginBottom : Float -> Style
marginBottom =
  numberStyle "marginBottom"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
marginHorizontal : Float -> Style
marginHorizontal =
  numberStyle "marginHorizontal"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
marginLeft : Float -> Style
marginLeft =
  numberStyle "marginLeft"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
marginRight : Float -> Style
marginRight =
  numberStyle "marginRight"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
marginTop : Float -> Style
marginTop =
  numberStyle "marginTop"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
marginVertical : Float -> Style
marginVertical =
  numberStyle "marginVertical"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
padding : Float -> Style
padding =
  numberStyle "padding"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
paddingBottom : Float -> Style
paddingBottom =
  numberStyle "paddingBottom"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
paddingHorizontal : Float -> Style
paddingHorizontal =
  numberStyle "paddingHorizontal"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
paddingLeft : Float -> Style
paddingLeft =
  numberStyle "paddingLeft"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
paddingRight : Float -> Style
paddingRight =
  numberStyle "paddingRight"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
paddingTop : Float -> Style
paddingTop =
  numberStyle "paddingTop"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
paddingVertical : Float -> Style
paddingVertical =
  numberStyle "paddingVertical"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type PositionEnum
  = Absolute
  | Relative


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
position : PositionEnum -> Style
position pos =
  stringStyle "position" (enumToString pos)


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
right : Float -> Style
right =
  numberStyle "right"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
top : Float -> Style
top =
  numberStyle "top"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
width : Float -> Style
width =
  numberStyle "width"



--Transform Styles


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
type alias Transform =
  { perspective : Maybe Float
  , rotate : Maybe String
  , rotateX : Maybe String
  , rotateY : Maybe String
  , rotateZ : Maybe String
  , scale : Maybe Float
  , scaleX : Maybe Float
  , scaleY : Maybe Float
  , translateX : Maybe Float
  , translateY : Maybe Float
  , skewX : Maybe String
  , skewY : Maybe String
  }


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
defaultTransform : Transform
defaultTransform =
  { perspective = Nothing
  , rotate = Nothing
  , rotateX = Nothing
  , rotateY = Nothing
  , rotateZ = Nothing
  , scale = Nothing
  , scaleX = Nothing
  , scaleY = Nothing
  , translateX = Nothing
  , translateY = Nothing
  , skewX = Nothing
  , skewY = Nothing
  }


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
transform : Transform -> Style
transform options =
  listStyle
    "transform"
    [ Maybe.map (numberDeclaration "perspective") options.perspective
    , Maybe.map (stringDeclaration "rotate") options.rotate
    , Maybe.map (stringDeclaration "rotateX") options.rotateX
    , Maybe.map (stringDeclaration "rotateY") options.rotateY
    , Maybe.map (stringDeclaration "rotateZ") options.rotateZ
    , Maybe.map (numberDeclaration "scale") options.scale
    , Maybe.map (numberDeclaration "scaleX") options.scaleX
    , Maybe.map (numberDeclaration "scaleY") options.scaleY
    , Maybe.map (numberDeclaration "translateX") options.translateX
    , Maybe.map (numberDeclaration "translateY") options.translateY
    , Maybe.map (stringDeclaration "skewX") options.skewX
    , Maybe.map (stringDeclaration "skewY") options.skewY
    ]



--TODO
--transformMatrix : TransformMatrixPropType -> Style
