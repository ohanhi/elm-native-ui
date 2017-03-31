module NativeUi.ListView
    exposing
        ( DataSource
        , emptyDataSource
        , listView
        , updateDataSource
        , initialListSize
        , pageSize
        , removeClippedSubviews
        , scrollRenderAheadDistance
        )

{-| elm-native-ui ListView

@docs DataSource, emptyDataSource, listView, updateDataSource, initialListSize, pageSize, removeClippedSubviews, scrollRenderAheadDistance
-}

import Json.Encode
import NativeUi exposing (Property, Node, node, renderProperty, property)
import Native.NativeUi.ListView


{-| -}
type DataSource a
    = DataSource a


{-| -}
listView : DataSource a -> (a -> Node msg) -> List (Property msg) -> Node msg
listView ds render props =
    node "ListView"
        ((unencodedProperty
            ds
         )
            :: renderRow render
            :: props
        )
        []


{-| -}
renderRow : (a -> Node msg) -> Property msg
renderRow =
    renderProperty "renderRow"


{-| -}
emptyDataSource : DataSource a
emptyDataSource =
    Native.NativeUi.ListView.emptyDataSource


{-| -}
updateDataSource : List a -> DataSource a -> DataSource a
updateDataSource =
    Native.NativeUi.ListView.updateDataSource


{-| -}
unencodedProperty : DataSource a -> Property msg
unencodedProperty =
    Native.NativeUi.ListView.unencodedProperty


{-| -}
initialListSize : Int -> Property msg
initialListSize =
    property "initialListSize" << Json.Encode.int


{-| -}
pageSize : Int -> Property msg
pageSize =
    property "pageSize" << Json.Encode.int


{-| -}
removeClippedSubviews : Bool -> Property msg
removeClippedSubviews =
    property "removeClippedSubviews" << Json.Encode.bool


{-| -}
scrollRenderAheadDistance : Int -> Property msg
scrollRenderAheadDistance =
    property "scrollRenderAheadDistance" << Json.Encode.int
