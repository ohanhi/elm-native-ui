module ReactNative.Style where

import Json.Encode

type Style
  = StringStyle String String
  | NumberStyle String Float


toJsonProperty : Style -> (String, Json.Encode.Value)
toJsonProperty style =
  case style of
    StringStyle name value ->
      (name, Json.Encode.string value)
    NumberStyle name value ->
      (name, Json.Encode.float value)
    _ ->
      ("", Json.Encode.null)

encode : List Style -> Json.Encode.Value
encode styles =
  styles
    |> List.map toJsonProperty
    |> Json.Encode.object

-- Text Styles
color : String -> Style
color str = StringStyle "color" str


fontFamily : String -> Style
fontFamily str = StringStyle "fontFamily" str


fontSize : Float -> Style
fontSize num = NumberStyle "fontSize" num


fontStyle : String -> Style --enum('normal', 'italic')
fontStyle str = StringStyle "fontStyle" str


fontWeight : String -> Style --enum("normal", 'bold', '100', '200', '300', '400', '500', '600', '700', '800', '900')
fontWeight str = StringStyle "fontWeight" str


letterSpacing : Float -> Style
letterSpacing num = NumberStyle "letterSpacing" num


lineHeight : Float -> Style
lineHeight num = NumberStyle "lineHeight" num


textAlign : String -> Style --enum("auto", 'left', 'right', 'center', 'justify')
textAlign str = StringStyle "textAlign" str


textDecorationLine : String -> Style --enum("none", 'underline', 'line-through', 'underline line-through')
textDecorationLine str = StringStyle "textDecorationLine" str


textDecorationStyle : String -> Style --enum("solid", 'double', 'dotted', 'dashed')
textDecorationStyle str = StringStyle "textDecorationStyle" str


textDecorationColor : String -> Style
textDecorationColor str = StringStyle "textDecorationColor" str


writingDirection : String -> Style --enum("auto", 'ltr', 'rtl')
writingDirection str = StringStyle "writingDirection" str


--View Styles
backfaceVisibility : String -> Style --enum('visible', 'hidden')
backfaceVisibility str = StringStyle "backfaceVisibility" str


backgroundColor : String -> Style
backgroundColor str = StringStyle "backgroundColor" str


borderColor : String -> Style
borderColor str = StringStyle "borderColor" str


borderTopColor : String -> Style
borderTopColor str = StringStyle "borderTopColor" str


borderRightColor : String -> Style
borderRightColor str = StringStyle "borderRightColor" str


borderBottomColor : String -> Style
borderBottomColor str = StringStyle "borderBottomColor" str


borderLeftColor : String -> Style
borderLeftColor str = StringStyle "borderLeftColor" str


borderRadius : Float -> Style
borderRadius num = NumberStyle "borderRadius" num


borderTopLeftRadius : Float -> Style
borderTopLeftRadius num = NumberStyle "borderTopLeftRadius" num


borderTopRightRadius : Float -> Style
borderTopRightRadius num = NumberStyle "borderTopRightRadius" num


borderBottomLeftRadius : Float -> Style
borderBottomLeftRadius num = NumberStyle "borderBottomLeftRadius" num


borderBottomRightRadius : Float -> Style
borderBottomRightRadius num = NumberStyle "borderBottomRightRadius" num


borderStyle : String -> Style --enum('solid', 'dotted', 'dashed')
borderStyle str = StringStyle "borderStyle" str


borderWidth : Float -> Style
borderWidth num = NumberStyle "borderWidth" num


borderTopWidth : Float -> Style
borderTopWidth num = NumberStyle "borderTopWidth" num


borderRightWidth : Float -> Style
borderRightWidth num = NumberStyle "borderRightWidth" num


borderBottomWidth : Float -> Style
borderBottomWidth num = NumberStyle "borderBottomWidth" num


borderLeftWidth : Float -> Style
borderLeftWidth num = NumberStyle "borderLeftWidth" num


opacity : Float -> Style
opacity num = NumberStyle "opacity" num


overflow : String -> Style --enum('visible', 'hidden')
overflow str = StringStyle "overflow" str


shadowColor : String -> Style
shadowColor str = StringStyle "shadowColor" str


-- TODO
--shadowOffset : {width: number, height: number}

shadowOpacity : Float -> Style
shadowOpacity num = NumberStyle "shadowOpacity" num


shadowRadius : Float -> Style
shadowRadius num = NumberStyle "shadowRadius" num


--Image Styles
resizeMode : String -> Style --enum('cover', 'contain', 'stretch')
resizeMode str = StringStyle "resizeMode" str


--backgroundColor : String -> Style
--backgroundColor str = StringStyle "backgroundColor" str


--borderColor : String -> Style
--borderColor str = StringStyle "borderColor" str


--borderWidth : Float -> Style
--borderWidth num = NumberStyle "borderWidth" num


--borderRadius : Float -> Style
--borderRadius num = NumberStyle "borderRadius" num


--overflow : String -> Style --enum('visible', 'hidden')
--overflow str = StringStyle "overflow" str


tintColor : String -> Style
tintColor str = StringStyle "tintColor" str


--opacity : Float -> Style
--opacity num = NumberStyle "opacity" num




--Flex Styles
alignItems : String -> Style --enum('flex-start', 'flex-end', 'center', 'stretch')
alignItems str = StringStyle "alignItems" str


alignSelf : String -> Style --enum('auto', 'flex-start', 'flex-end', 'center', 'stretch')
alignSelf str = StringStyle "alignSelf" str


--borderBottomWidth : Float -> Style
--borderBottomWidth num = NumberStyle "borderBottomWidth" num


--borderLeftWidth : Float -> Style
--borderLeftWidth num = NumberStyle "borderLeftWidth" num


--borderRightWidth : Float -> Style
--borderRightWidth num = NumberStyle "borderRightWidth" num


--borderTopWidth : Float -> Style
--borderTopWidth num = NumberStyle "borderTopWidth" num


--borderWidth : Float -> Style
--borderWidth num = NumberStyle "borderWidth" num


bottom : Float -> Style
bottom num = NumberStyle "bottom" num


flex : Float -> Style
flex num = NumberStyle "flex" num


flexDirection : String -> Style --enum('row', 'column')
flexDirection str = StringStyle "flexDirection" str


flexWrap : String -> Style --enum('wrap', 'nowrap')
flexWrap str = StringStyle "flexWrap" str


height : Float -> Style
height num = NumberStyle "height" num


justifyContent : String -> Style --enum('flex-start', 'flex-end', 'center', 'space-between', 'space-around')
justifyContent str = StringStyle "justifyContent" str


left : Float -> Style
left num = NumberStyle "left" num


margin : Float -> Style
margin num = NumberStyle "margin" num


marginBottom : Float -> Style
marginBottom num = NumberStyle "marginBottom" num


marginHorizontal : Float -> Style
marginHorizontal num = NumberStyle "marginHorizontal" num


marginLeft : Float -> Style
marginLeft num = NumberStyle "marginLeft" num


marginRight : Float -> Style
marginRight num = NumberStyle "marginRight" num


marginTop : Float -> Style
marginTop num = NumberStyle "marginTop" num


marginVertical : Float -> Style
marginVertical num = NumberStyle "marginVertical" num


padding : Float -> Style
padding num = NumberStyle "padding" num


paddingBottom : Float -> Style
paddingBottom num = NumberStyle "paddingBottom" num


paddingHorizontal : Float -> Style
paddingHorizontal num = NumberStyle "paddingHorizontal" num


paddingLeft : Float -> Style
paddingLeft num = NumberStyle "paddingLeft" num


paddingRight : Float -> Style
paddingRight num = NumberStyle "paddingRight" num


paddingTop : Float -> Style
paddingTop num = NumberStyle "paddingTop" num


paddingVertical : Float -> Style
paddingVertical num = NumberStyle "paddingVertical" num


position : String -> Style --enum('absolute', 'relative')
position str = StringStyle "position" str


right : Float -> Style
right num = NumberStyle "right" num


top : Float -> Style
top num = NumberStyle "top" num


width : Float -> Style
width num = NumberStyle "width" num


--TODO

--Transform Styles
--transform : [{perspective -> Style: number}, {rotate: String}, {rotateX: String}, {rotateY: String}, {rotateZ: String}, {scale: number}, {scaleX: number}, {scaleY: number}, {translateX: number}, {translateY: number}, {skewX: String}, {skewY: String}]
--transformMatrix : TransformMatrixPropType -> Style

