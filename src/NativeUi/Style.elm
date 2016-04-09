module NativeUi.Style (..) where

{-| Render your application as a React Native app.

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
@docs width, writingDirection

-}

import Json.Encode


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



--enum('normal', 'italic')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
fontStyle : String -> Style
fontStyle =
  stringStyle "fontStyle"



--enum("normal", 'bold', '100', '200', '300', '400', '500', '600', '700', '800', '900')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
fontWeight : String -> Style
fontWeight =
  stringStyle "fontWeight"


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



--enum("auto", 'left', 'right', 'center', 'justify')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textAlign : String -> Style
textAlign =
  stringStyle "textAlign"



--enum("none", 'underline', 'line-through', 'underline line-through')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textDecorationLine : String -> Style
textDecorationLine =
  stringStyle "textDecorationLine"



--enum("solid", 'double', 'dotted', 'dashed')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textDecorationStyle : String -> Style
textDecorationStyle =
  stringStyle "textDecorationStyle"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
textDecorationColor : String -> Style
textDecorationColor =
  stringStyle "textDecorationColor"



--enum("auto", 'ltr', 'rtl')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
writingDirection : String -> Style
writingDirection =
  stringStyle "writingDirection"



--View Styles
--enum('visible', 'hidden')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
backfaceVisibility : String -> Style
backfaceVisibility =
  stringStyle "backfaceVisibility"


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



--enum('solid', 'dotted', 'dashed')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
borderStyle : String -> Style
borderStyle =
  stringStyle "borderStyle"


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



--enum('visible', 'hidden')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
overflow : String -> Style
overflow =
  stringStyle "overflow"


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



--opacity : Float -> Style
--opacity = numberStyle "opacity"
--Flex Styles
--enum('flex-start', 'flex-end', 'center', 'stretch')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
alignItems : String -> Style
alignItems =
  stringStyle "alignItems"



--enum('auto', 'flex-start', 'flex-end', 'center', 'stretch')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
alignSelf : String -> Style
alignSelf =
  stringStyle "alignSelf"



--borderBottomWidth : Float -> Style
--borderBottomWidth = numberStyle "borderBottomWidth"
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



--enum('row', 'column')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
flexDirection : String -> Style
flexDirection =
  stringStyle "flexDirection"



--enum('wrap', 'nowrap')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
flexWrap : String -> Style
flexWrap =
  stringStyle "flexWrap"


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
height : Float -> Style
height =
  numberStyle "height"



--enum('flex-start', 'flex-end', 'center', 'space-between', 'space-around')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
justifyContent : String -> Style
justifyContent =
  stringStyle "justifyContent"


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



--enum('absolute', 'relative')


{-| A node in the virtual View Tree that forms the basis of the UI for your app.
-}
position : String -> Style
position =
  stringStyle "position"


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
