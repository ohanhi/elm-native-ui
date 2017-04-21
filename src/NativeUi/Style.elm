module NativeUi.Style
    exposing
        ( Style
        , StyleSheet
        , encode
        , encodeSheet
        , color
        , fontFamily
        , fontSize
        , fontStyle
        , fontWeight
        , letterSpacing
        , lineHeight
        , textAlign
        , textDecorationLine
        , textDecorationStyle
        , textDecorationColor
        , writingDirection
        , backfaceVisibility
        , backgroundColor
        , borderColor
        , borderStyle
        , borderWidth
        , borderRadius
        , borderTopColor
        , borderTopWidth
        , borderTopLeftRadius
        , borderTopRightRadius
        , borderLeftColor
        , borderLeftWidth
        , borderBottomColor
        , borderBottomWidth
        , borderBottomLeftRadius
        , borderBottomRightRadius
        , borderRightColor
        , borderRightWidth
        , overflow
        , opacity
        , shadowColor
        , shadowOffset
        , shadowRadius
        , shadowOpacity
        , resizeMode
        , tintColor
        , alignItems
        , alignSelf
        , bottom
        , flex
        , flexDirection
        , flexWrap
        , height
        , justifyContent
        , left
        , margin
        , marginBottom
        , marginLeft
        , marginRight
        , marginTop
        , marginHorizontal
        , marginVertical
        , minHeight
        , maxHeight
        , padding
        , paddingLeft
        , paddingRight
        , paddingTop
        , paddingBottom
        , paddingHorizontal
        , paddingVertical
        , position
        , right
        , top
        , width
        , zIndex
        , Transform
        , defaultTransform
        , transform
        )

{-| Style your elements

@docs Style, StyleSheet, encode, encodeSheet, color, fontFamily, fontSize, fontStyle, fontWeight, letterSpacing, lineHeight, textAlign, textDecorationLine, textDecorationStyle, textDecorationColor, writingDirection, backfaceVisibility, backgroundColor, borderColor, borderStyle, borderWidth, borderRadius, borderTopColor, borderTopWidth, borderTopLeftRadius, borderTopRightRadius, borderLeftColor, borderLeftWidth, borderBottomColor, borderBottomWidth, borderBottomLeftRadius, borderBottomRightRadius, borderRightColor, borderRightWidth, overflow, opacity, shadowColor, shadowOffset, shadowRadius, shadowOpacity, resizeMode, tintColor, alignItems, alignSelf, bottom, flex, flexDirection, flexWrap, height, justifyContent, left, margin, marginBottom, marginLeft, marginRight, marginTop, marginHorizontal, marginVertical, maxHeight, minHeight, padding, paddingLeft, paddingRight, paddingTop, paddingBottom, paddingHorizontal, paddingVertical, position, right, top, width, Transform, defaultTransform, transform, zIndex

-}

import Json.Encode


type Value
    = StringValue String
    | NumberValue Float
    | ObjectValue (List Declaration)
    | ListValue (List (Maybe Declaration))
    | StyleSheetValue StyleSheet


stringDeclaration : String -> String -> Declaration
stringDeclaration name value =
    ( name, StringValue value )


numberDeclaration : String -> Float -> Declaration
numberDeclaration name value =
    ( name, NumberValue value )


objectDeclaration : String -> List Declaration -> Declaration
objectDeclaration name value =
    ( name, ObjectValue value )


listDeclaration : String -> List (Maybe Declaration) -> Declaration
listDeclaration name value =
    ( name, ListValue value )


stringStyle : String -> String -> Style
stringStyle name value =
    StringStyle (stringDeclaration name value)


numberStyle : String -> Float -> Style
numberStyle name value =
    NumberStyle (numberDeclaration name value)


objectStyle : String -> List Declaration -> Style
objectStyle name list =
    ObjectStyle (objectDeclaration name list)


listStyle : String -> List (Maybe Declaration) -> Style
listStyle name list =
    ListStyle (listDeclaration name list)


type alias Declaration =
    ( String, Value )


{-| -}
type Style
    = StringStyle Declaration
    | NumberStyle Declaration
    | ObjectStyle Declaration
    | ListStyle Declaration


{-| -}
type StyleSheet
    = StyleSheet Int


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

        StyleSheetValue (StyleSheet styleSheet) ->
            Json.Encode.int styleSheet


encodeDeclaration : ( String, Value ) -> ( String, Json.Encode.Value )
encodeDeclaration ( name, value ) =
    ( name, encodeValue value )


encodeObject : ( String, Value ) -> Json.Encode.Value
encodeObject ( name, value ) =
    Json.Encode.object [ ( name, (encodeValue value) ) ]


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


{-| -}
encode : List Style -> Json.Encode.Value
encode styles =
    styles
        |> List.map toJsonProperty
        |> Json.Encode.object


{-| -}
encodeSheet : List StyleSheet -> Json.Encode.Value
encodeSheet styleSheets =
    styleSheets
        |> List.map (encodeValue << StyleSheetValue)
        |> Json.Encode.list



-- Text Styles


{-| -}
color : String -> Style
color =
    stringStyle "color"


{-| -}
fontFamily : String -> Style
fontFamily =
    stringStyle "fontFamily"


{-| -}
fontSize : Float -> Style
fontSize =
    numberStyle "fontSize"


{-| enum('normal', 'italic')
-}
fontStyle : String -> Style
fontStyle =
    stringStyle "fontStyle"


{-| enum("normal", 'bold', '100', '200', '300', '400', '500', '600', '700', '800', '900')
-}
fontWeight : String -> Style
fontWeight =
    stringStyle "fontWeight"


{-| -}
letterSpacing : Float -> Style
letterSpacing =
    numberStyle "letterSpacing"


{-| -}
lineHeight : Float -> Style
lineHeight =
    numberStyle "lineHeight"


{-| enum("auto", 'left', 'right', 'center', 'justify')
-}
textAlign : String -> Style
textAlign =
    stringStyle "textAlign"


{-| enum("none", 'underline', 'line-through', 'underline line-through')
-}
textDecorationLine : String -> Style
textDecorationLine =
    stringStyle "textDecorationLine"


{-| enum("solid", 'double', 'dotted', 'dashed')
-}
textDecorationStyle : String -> Style
textDecorationStyle =
    stringStyle "textDecorationStyle"


{-| -}
textDecorationColor : String -> Style
textDecorationColor =
    stringStyle "textDecorationColor"


{-| enum("auto", 'ltr', 'rtl')
-}
writingDirection : String -> Style
writingDirection =
    stringStyle "writingDirection"



--View Styles


{-| enum('visible', 'hidden')
-}
backfaceVisibility : String -> Style
backfaceVisibility =
    stringStyle "backfaceVisibility"


{-| -}
backgroundColor : String -> Style
backgroundColor =
    stringStyle "backgroundColor"


{-| -}
borderColor : String -> Style
borderColor =
    stringStyle "borderColor"


{-| -}
borderTopColor : String -> Style
borderTopColor =
    stringStyle "borderTopColor"


{-| -}
borderRightColor : String -> Style
borderRightColor =
    stringStyle "borderRightColor"


{-| -}
borderBottomColor : String -> Style
borderBottomColor =
    stringStyle "borderBottomColor"


{-| -}
borderLeftColor : String -> Style
borderLeftColor =
    stringStyle "borderLeftColor"


{-| -}
borderRadius : Float -> Style
borderRadius =
    numberStyle "borderRadius"


{-| -}
borderTopLeftRadius : Float -> Style
borderTopLeftRadius =
    numberStyle "borderTopLeftRadius"


{-| -}
borderTopRightRadius : Float -> Style
borderTopRightRadius =
    numberStyle "borderTopRightRadius"


{-| -}
borderBottomLeftRadius : Float -> Style
borderBottomLeftRadius =
    numberStyle "borderBottomLeftRadius"


{-| -}
borderBottomRightRadius : Float -> Style
borderBottomRightRadius =
    numberStyle "borderBottomRightRadius"


{-| enum('solid', 'dotted', 'dashed')
-}
borderStyle : String -> Style
borderStyle =
    stringStyle "borderStyle"


{-| -}
borderWidth : Float -> Style
borderWidth =
    numberStyle "borderWidth"


{-| -}
borderTopWidth : Float -> Style
borderTopWidth =
    numberStyle "borderTopWidth"


{-| -}
borderRightWidth : Float -> Style
borderRightWidth =
    numberStyle "borderRightWidth"


{-| -}
borderBottomWidth : Float -> Style
borderBottomWidth =
    numberStyle "borderBottomWidth"


{-| -}
borderLeftWidth : Float -> Style
borderLeftWidth =
    numberStyle "borderLeftWidth"


{-| -}
opacity : Float -> Style
opacity =
    numberStyle "opacity"


{-| enum('visible', 'hidden')
-}
overflow : String -> Style
overflow =
    stringStyle "overflow"


{-| -}
shadowColor : String -> Style
shadowColor =
    stringStyle "shadowColor"


{-| -}
shadowOffset : Float -> Float -> Style
shadowOffset width height =
    objectStyle "shadowOffset"
        [ numberDeclaration "width" width
        , numberDeclaration "height" height
        ]


{-| -}
shadowOpacity : Float -> Style
shadowOpacity =
    numberStyle "shadowOpacity"


{-| -}
shadowRadius : Float -> Style
shadowRadius =
    numberStyle "shadowRadius"



--Image Styles


{-| enum('cover', 'contain', 'stretch')
-}
resizeMode : String -> Style
resizeMode =
    stringStyle "resizeMode"


{-| -}
tintColor : String -> Style
tintColor =
    stringStyle "tintColor"



--Flex Styles


{-| enum('flex-start', 'flex-end', 'center', 'stretch')
-}
alignItems : String -> Style
alignItems =
    stringStyle "alignItems"


{-| enum('auto', 'flex-start', 'flex-end', 'center', 'stretch')
-}
alignSelf : String -> Style
alignSelf =
    stringStyle "alignSelf"


{-| -}
bottom : Float -> Style
bottom =
    numberStyle "bottom"


{-| -}
flex : Float -> Style
flex =
    numberStyle "flex"


{-| enum('row', 'column')
-}
flexDirection : String -> Style
flexDirection =
    stringStyle "flexDirection"


{-| enum('wrap', 'nowrap')
-}
flexWrap : String -> Style
flexWrap =
    stringStyle "flexWrap"


{-| -}
height : Float -> Style
height =
    numberStyle "height"


{-| enum('flex-start', 'flex-end', 'center', 'space-between', 'space-around')
-}
justifyContent : String -> Style
justifyContent =
    stringStyle "justifyContent"


{-| -}
left : Float -> Style
left =
    numberStyle "left"


{-| -}
margin : Float -> Style
margin =
    numberStyle "margin"


{-| -}
marginBottom : Float -> Style
marginBottom =
    numberStyle "marginBottom"


{-| -}
marginHorizontal : Float -> Style
marginHorizontal =
    numberStyle "marginHorizontal"


{-| -}
marginLeft : Float -> Style
marginLeft =
    numberStyle "marginLeft"


{-| -}
marginRight : Float -> Style
marginRight =
    numberStyle "marginRight"


{-| -}
marginTop : Float -> Style
marginTop =
    numberStyle "marginTop"


{-| -}
marginVertical : Float -> Style
marginVertical =
    numberStyle "marginVertical"


{-| -}
minHeight : Float -> Style
minHeight =
    numberStyle "minHeight"


{-| -}
maxHeight : Float -> Style
maxHeight =
    numberStyle "maxHeight"


{-| -}
padding : Float -> Style
padding =
    numberStyle "padding"


{-| -}
paddingBottom : Float -> Style
paddingBottom =
    numberStyle "paddingBottom"


{-| -}
paddingHorizontal : Float -> Style
paddingHorizontal =
    numberStyle "paddingHorizontal"


{-| -}
paddingLeft : Float -> Style
paddingLeft =
    numberStyle "paddingLeft"


{-| -}
paddingRight : Float -> Style
paddingRight =
    numberStyle "paddingRight"


{-| -}
paddingTop : Float -> Style
paddingTop =
    numberStyle "paddingTop"


{-| -}
paddingVertical : Float -> Style
paddingVertical =
    numberStyle "paddingVertical"


{-| enum('absolute', 'relative')
-}
position : String -> Style
position =
    stringStyle "position"


{-| -}
right : Float -> Style
right =
    numberStyle "right"


{-| -}
top : Float -> Style
top =
    numberStyle "top"


{-| -}
width : Float -> Style
width =
    numberStyle "width"


{-| -}
zIndex : Float -> Style
zIndex =
    numberStyle "zIndex"



--Transform Styles


{-| -}
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


{-| -}
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


{-| -}
transform : Transform -> Style
transform options =
    listStyle "transform"
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
