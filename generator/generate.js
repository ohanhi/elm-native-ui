#!/usr/bin/env node
'use strict';

const reactDocs = require('react-docgen');
const fs = require("fs");
const _ = require("lodash");
const decapitalize = require("underscore.string/decapitalize");
const ElmTransformer = require("./elm-transformer");
const exec = require("child_process").exec;
const rimraf = require("rimraf");

const elmModulesDir = "../src/NativeUi/";
const rnLibPath = "node_modules/react-native/Libraries/";
const rnModulePathPrefixes = ["Components", "Text"];
const rnModuleFiles = [
  // "DatePicker/DatePicker.js",
  // "Intent/Intent.js",
  // "ViewPager/ViewPager.js",
  // "WebView/WebView.js",
  // "DrawerAndroid/DrawerLayoutAndroid.android.js",
  "Text/Text.js",
  "Image/Image.ios.js",
  "Components/ActivityIndicator/ActivityIndicatorIOS.ios.js",
  "Components/MapView/MapView.js",
  "Components/Picker/Picker.js",
  "Components/ProgressBarAndroid/ProgressBarAndroid.android.js",
  "Components/ProgressViewIOS/ProgressViewIOS.ios.js",
  "Components/RefreshControl/RefreshControl.js",
  "Components/ScrollView/ScrollView.js",
  "Components/SegmentedControlIOS/SegmentedControlIOS.ios.js",
  "Components/SliderIOS/SliderIOS.ios.js",
  "Components/StatusBar/StatusBar.js",
  "Components/Switch/Switch.js",
  "Components/SwitchAndroid/SwitchAndroid.android.js",
  "Components/SwitchIOS/SwitchIOS.ios.js",
  "Components/TabBarIOS/TabBarIOS.ios.js",
  "Components/TextInput/TextInput.js",
  "Components/ToolbarAndroid/ToolbarAndroid.android.js",
  "Components/Touchable/TouchableHighlight.js",
  "Components/Touchable/TouchableOpacity.js",
  "Components/View/View.js",
  "CustomComponents/NavigationExperimental/NavigationCardStack.js",
  "CustomComponents/NavigationExperimental/NavigationHeader.js",
  "CustomComponents/NavigationExperimental/NavigationHeaderTitle.js"
];
const exceptions = {
  "Slider": {
    "onValueChange": {
      "newName": "onSliderValueChange",
      "paramName": "value",
      "paramType": "float"
    },
    "value": {
      "newName": "sliderValue",
      "paramName": "value",
      "paramType": "float"
    }
  },
  "Switch": {
    "onValueChange": {
      "newName": "onSwitchValueChange",
      "paramName": "value",
      "paramType": "int"
    },
    "value": {
      "newName": "sliderValue",
      "paramName": "value",
      "paramType": "int"
    }
  },
  "SegmentedControl": {
    "onValueChange": {
      "newName": "onSegmentedControlValueChange",
      "paramName": "value",
      "paramType": "int"
    }
  },
  "Picker": {
    "onValueChange": {
      "newName": "onPickerValueChange",
      "paramName": "value",
      "paramType": "string"
    }
  },
  "TextInput": {
    "onChangeText": {
      "newName": "onChangeText",
      "paramName": "text",
      "paramType": "string"
    }
  }
}
const elmPropTypes = {
  "bool": {
    "type": "Bool",
    "encoder": "bool"
  },
  "string": {
    "type": "String",
    "encoder": "string"
  },
  "number": {
    "type": "Float",
    "encoder": "float"
  },
  "float": {
    "type": "Float",
    "encoder": "float"
  },
  "int": {
    "type": "Int",
    "encoder": "int"
  }
};
const allowedPropTypes = [
  "bool",
  "string",
  "number",
  "enum",
  "func"
];
const elmTransformer = new ElmTransformer();

function enumValues(jsonValues) {
  return jsonValues.map(function(val) {
    return val.value.replace(/'/g, "").replace(/"/g, "");
  });
}

function rnModuleName(fileName) {
  rnModulePathPrefixes.forEach(function(prefix) {
    fileName = fileName.replace(prefix + "/", "");
  });
  return fileName
    .replace(/^([^\/]*\/|)/, "")
    .replace("IOS.ios.js", "")
    .replace("Android.android.js", "")
    .replace(".ios.js", "")
    .replace(".js", "");
}

function generateElm(moduleJson) {
  var elements = {};
  var events = {};
  var properties = {};

  _(moduleJson).each(function(module, moduleName) {
    let propNames = Object.keys(module.props);

    let elementFuncName = decapitalize(moduleName);
    elements[elementFuncName] = elmTransformer.element(moduleName, elementFuncName);
    propNames.forEach(function(propName) {
      if (module.props[propName].type) { // Ignore props without type for now
        let propType = module.props[propName].type.name;

        if (allowedPropTypes.indexOf(propType) !== -1) {
          if (propType === "enum") {
            let values = module.props[propName].type.value;
            let validValues = _.some(values, function(x) {
              return x.value.indexOf('.') === -1; // ignore enum type with a dot in its value
            });
            if (_.isArray(values) && validValues) { // Ignore non-Array enums for now
              if (!properties[propName]) {
                properties[propName] = elmTransformer.enumProperty(
                    propName,
                    moduleName,
                    enumValues(module.props[propName].type.value)
                );
              }
            }
          } else if (propType === "func") {
            var funcParams;
            var funcName = propName;
            if (exceptions[moduleName] && exceptions[moduleName][propName]) {
              funcName = exceptions[moduleName][propName].newName;
              funcParams = {
                name: exceptions[moduleName][propName].paramName,
                type: exceptions[moduleName][propName].paramType
              }
            }

            if (!events[funcName] &&
                !/^render/.test(funcName)) { // ignore render functions as they are component properties
              events[funcName] = elmTransformer.funcProperty(
                funcName,
                funcParams
              );
            }
          } else {
            var type = propType;
            var name = propName;
            if (exceptions[moduleName] && exceptions[moduleName][propName]) {
              name = exceptions[moduleName][propName].newName;
              type = exceptions[moduleName][propName].paramType;
            }
            if (!properties[name]) {
              properties[name] = elmTransformer.property(
                name,
                elmPropTypes[type]
              );
            }
          }
        } else {
          if (moduleName === "Image") {
            if (propName === "source" || propName === "defaultSource") {
              if (!properties[propName]) {
                properties[propName] = elmTransformer.uriProperty(propName);
              }
            }
          }
        }
      }
    });
  });
  generateElmModuleFile("Properties.elm", "properties-module.ejs", properties);
  generateElmModuleFile("Events.elm", "events-module.ejs", events);
  generateElmModuleFile("Elements.elm", "elements-module.ejs", elements);
}

function generateElmModuleFile(fileName, templateFile, content) {
  let moduleContent = elmTransformer.module(
    templateFile,
    _.values(content).join("\n\n"),
    Object.keys(content).join(", ")
  );
  fs.writeFileSync(
    elmModulesDir + fileName,
    moduleContent,
    "utf8"
  );
}

function generateRNModuleSpec(moduleJson) {
  fs.writeFileSync(
    "rn-modules.json",
    JSON.stringify(moduleJson, null, 2),
    "utf8"
  );
}

(function() {
  var rnModulesJson = {};

  rnModuleFiles.forEach(function(file) {
    var source = fs.readFileSync(rnLibPath + file, 'utf8');
    let moduleName = rnModuleName(file);

    // View.js doesn’t export it’s class in a way that react-docgen can parse it.
    // Reset export to fix this.
    source = source.replace(
      "module.exports = ViewToExport;",
      "module.exports = " + moduleName + ";"
    );

    try {
      let json = reactDocs.parse(source);
      if (json) {
        rnModulesJson[moduleName] = json;
      }
    } catch (e) {
      console.log(moduleName + " – " + e);
    }
  });
  if (Object.keys(rnModulesJson).length > 0) {
    rimraf.sync(elmModulesDir + "Elements.elm");
    rimraf.sync(elmModulesDir + "Properties.elm");
    rimraf.sync(elmModulesDir + "Events.elm");
    rimraf.sync(elmModulesDir + "rn-modules.json");
    generateElm(rnModulesJson);
    generateRNModuleSpec(rnModulesJson);
    exec("elm-format --yes " + elmModulesDir, function(error, stdout, stderr) {
      console.log(stdout);
    });
  }
})();
