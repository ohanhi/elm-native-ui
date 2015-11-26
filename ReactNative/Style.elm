module ReactNative.Style where

import List exposing ( map )
import Json.Encode


type Value
  = StringValue String
  | NumberValue Float
  | ListValue (List Declaration)

stringDeclaration : String -> String -> Declaration
stringDeclaration name value =
  (name, StringValue value)

numberDeclaration : String -> Float -> Declaration
numberDeclaration name value =
  (name, NumberValue value)

listDeclaration : String -> List Declaration -> Declaration
listDeclaration name value =
  (name, ListValue value)

stringStyle : String -> String -> Style
stringStyle name value =
  StringStyle (stringDeclaration name value)

numberStyle : String -> Float -> Style
numberStyle name value =
  NumberStyle (numberDeclaration name value)

listStyle : String -> List Declaration -> Style
listStyle name list =
  ListStyle (listDeclaration name list)

type alias Declaration = (String, Value)

type Style
  = StringStyle Declaration
  | NumberStyle Declaration
  | ListStyle Declaration

encodeValue : Value -> Json.Encode.Value
encodeValue value =
  case value of
    NumberValue float ->
      Json.Encode.float float
    StringValue string ->
      Json.Encode.string string
    ListValue list ->
      Json.Encode.object (map encodeDeclaration list)

encodeDeclaration : (String, Value) -> (String, Json.Encode.Value)
encodeDeclaration (name, value) =
  (name, encodeValue value)

toJsonProperty : Style -> (String, Json.Encode.Value)
toJsonProperty style =
  case style of
    StringStyle (name, value) ->
      (name, encodeValue value)
    NumberStyle (name, value) ->
      (name, encodeValue value)
    ListStyle (name, value) ->
      (name, encodeValue value)

encode : List Style -> Json.Encode.Value
encode styles =
  styles
    |> List.map toJsonProperty
    |> Json.Encode.object

-- Text Styles
color : String -> Style
color = stringStyle "color"


fontFamily : String -> Style
fontFamily = stringStyle "fontFamily"


fontSize : Float -> Style
fontSize = numberStyle "fontSize"


fontStyle : String -> Style --enum('normal', 'italic')
fontStyle = stringStyle "fontStyle"


fontWeight : String -> Style --enum("normal", 'bold', '100', '200', '300', '400', '500', '600', '700', '800', '900')
fontWeight = stringStyle "fontWeight"


letterSpacing : Float -> Style
letterSpacing = numberStyle "letterSpacing"


lineHeight : Float -> Style
lineHeight = numberStyle "lineHeight"


textAlign : String -> Style --enum("auto", 'left', 'right', 'center', 'justify')
textAlign = stringStyle "textAlign"


textDecorationLine : String -> Style --enum("none", 'underline', 'line-through', 'underline line-through')
textDecorationLine = stringStyle "textDecorationLine"


textDecorationStyle : String -> Style --enum("solid", 'double', 'dotted', 'dashed')
textDecorationStyle = stringStyle "textDecorationStyle"


textDecorationColor : String -> Style
textDecorationColor = stringStyle "textDecorationColor"


writingDirection : String -> Style --enum("auto", 'ltr', 'rtl')
writingDirection = stringStyle "writingDirection"


--View Styles
backfaceVisibility : String -> Style --enum('visible', 'hidden')
backfaceVisibility = stringStyle "backfaceVisibility"


backgroundColor : String -> Style
backgroundColor = stringStyle "backgroundColor"


borderColor : String -> Style
borderColor = stringStyle "borderColor"


borderTopColor : String -> Style
borderTopColor = stringStyle "borderTopColor"


borderRightColor : String -> Style
borderRightColor = stringStyle "borderRightColor"


borderBottomColor : String -> Style
borderBottomColor = stringStyle "borderBottomColor"


borderLeftColor : String -> Style
borderLeftColor = stringStyle "borderLeftColor"


borderRadius : Float -> Style
borderRadius = numberStyle "borderRadius"


borderTopLeftRadius : Float -> Style
borderTopLeftRadius = numberStyle "borderTopLeftRadius"


borderTopRightRadius : Float -> Style
borderTopRightRadius = numberStyle "borderTopRightRadius"


borderBottomLeftRadius : Float -> Style
borderBottomLeftRadius = numberStyle "borderBottomLeftRadius"


borderBottomRightRadius : Float -> Style
borderBottomRightRadius = numberStyle "borderBottomRightRadius"


borderStyle : String -> Style --enum('solid', 'dotted', 'dashed')
borderStyle = stringStyle "borderStyle"


borderWidth : Float -> Style
borderWidth = numberStyle "borderWidth"


borderTopWidth : Float -> Style
borderTopWidth = numberStyle "borderTopWidth"


borderRightWidth : Float -> Style
borderRightWidth = numberStyle "borderRightWidth"


borderBottomWidth : Float -> Style
borderBottomWidth = numberStyle "borderBottomWidth"


borderLeftWidth : Float -> Style
borderLeftWidth = numberStyle "borderLeftWidth"


opacity : Float -> Style
opacity = numberStyle "opacity"


overflow : String -> Style --enum('visible', 'hidden')
overflow = stringStyle "overflow"


shadowColor : String -> Style
shadowColor = stringStyle "shadowColor"


shadowOffset : Float -> Float -> Style
shadowOffset width height = listStyle "shadowOffset" [ numberDeclaration "width" width
                                                     , numberDeclaration "height" height
                                                     ]

shadowOpacity : Float -> Style
shadowOpacity = numberStyle "shadowOpacity"


shadowRadius : Float -> Style
shadowRadius = numberStyle "shadowRadius"


--Image Styles
resizeMode : String -> Style --enum('cover', 'contain', 'stretch')
resizeMode = stringStyle "resizeMode"


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


tintColor : String -> Style
tintColor = stringStyle "tintColor"


--opacity : Float -> Style
--opacity = numberStyle "opacity"




--Flex Styles
alignItems : String -> Style --enum('flex-start', 'flex-end', 'center', 'stretch')
alignItems = stringStyle "alignItems"


alignSelf : String -> Style --enum('auto', 'flex-start', 'flex-end', 'center', 'stretch')
alignSelf = stringStyle "alignSelf"


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


bottom : Float -> Style
bottom = numberStyle "bottom"


flex : Float -> Style
flex = numberStyle "flex"


flexDirection : String -> Style --enum('row', 'column')
flexDirection = stringStyle "flexDirection"


flexWrap : String -> Style --enum('wrap', 'nowrap')
flexWrap = stringStyle "flexWrap"


height : Float -> Style
height = numberStyle "height"


justifyContent : String -> Style --enum('flex-start', 'flex-end', 'center', 'space-between', 'space-around')
justifyContent = stringStyle "justifyContent"


left : Float -> Style
left = numberStyle "left"


margin : Float -> Style
margin = numberStyle "margin"


marginBottom : Float -> Style
marginBottom = numberStyle "marginBottom"


marginHorizontal : Float -> Style
marginHorizontal = numberStyle "marginHorizontal"


marginLeft : Float -> Style
marginLeft = numberStyle "marginLeft"


marginRight : Float -> Style
marginRight = numberStyle "marginRight"


marginTop : Float -> Style
marginTop = numberStyle "marginTop"


marginVertical : Float -> Style
marginVertical = numberStyle "marginVertical"


padding : Float -> Style
padding = numberStyle "padding"


paddingBottom : Float -> Style
paddingBottom = numberStyle "paddingBottom"


paddingHorizontal : Float -> Style
paddingHorizontal = numberStyle "paddingHorizontal"


paddingLeft : Float -> Style
paddingLeft = numberStyle "paddingLeft"


paddingRight : Float -> Style
paddingRight = numberStyle "paddingRight"


paddingTop : Float -> Style
paddingTop = numberStyle "paddingTop"


paddingVertical : Float -> Style
paddingVertical = numberStyle "paddingVertical"


position : String -> Style --enum('absolute', 'relative')
position = stringStyle "position"


right : Float -> Style
right = numberStyle "right"


top : Float -> Style
top = numberStyle "top"


width : Float -> Style
width = numberStyle "width"


--TODO

--Transform Styles
--transform : [{perspective -> Style: number}, {rotate: String}, {rotateX: String}, {rotateY: String}, {rotateZ: String}, {scale: number}, {scaleX: number}, {scaleY: number}, {translateX: number}, {translateY: number}, {skewX: String}, {skewY: String}]
--transformMatrix : TransformMatrixPropType -> Style
