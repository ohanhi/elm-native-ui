const _ohanhi$elm_native_ui$Native_NativeUi_StyleSheet = function () {
  const { StyleSheet } = require("react-native");

  const listFromArray = _elm_lang$core$Native_List.fromArray;
  const dictFromList = _elm_lang$core$Dict$fromList;

  function tuple2(a, b) {
    return { ctor: '_Tuple2', _0: a, _1: b };
  }

  function create(style){
    const stylesheet = StyleSheet.create(style);

    const array =
      Object.keys(stylesheet)
        .map(function(key){
          return tuple2(key, stylesheet[key]);
        });

    return dictFromList(listFromArray(array));
  }

  return {
    create: create,
  };
}();
