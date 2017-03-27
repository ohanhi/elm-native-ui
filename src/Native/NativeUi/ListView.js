const _ohanhi$elm_native_ui$Native_NativeUi_ListView = function () {
  const React = require('react');
  const { ListView, Text } = require('react-native');

  const emptyDataSource = new ListView.DataSource({
    rowHasChanged: function (a, b) { return a !== b; }
  });

  function unencodedProperty(dataSource) {
    return {
      type: 'prop',
      propName: 'dataSource',
      value: dataSource
    };
  }

  function updateDataSource(data, dataSource) {
    var result = _elm_lang$core$Native_List.toArray(data);
    return dataSource.cloneWithRows(result);
  }

  return {
    view: ListView,
    emptyDataSource: emptyDataSource,
    unencodedProperty: unencodedProperty,
    updateDataSource: F2(updateDataSource),
  };
}();
