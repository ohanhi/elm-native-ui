'use strict';

const fs = require("fs");
const ejs = require("ejs");
const _ = require("lodash");
const capitalize = require("underscore.string/capitalize");
const decapitalize = require("underscore.string/decapitalize");

class ElmTransformer {
  constructor() {
    this.propertyTemplate = fs.readFileSync("templates/property.ejs", 'utf8');
    this.enumPropertyTemplate = fs.readFileSync("templates/enum-property.ejs", 'utf8');
    this.funcPropertyTemplate = fs.readFileSync("templates/func-property.ejs", 'utf8');
    this.funcConstantPropertyTemplate = fs.readFileSync("templates/func-constant-property.ejs", 'utf8');
    this.elementTemplate = fs.readFileSync("templates/element.ejs", 'utf8');
    this.elementCustomTemplate = fs.readFileSync("templates/element-custom.ejs", 'utf8');
    this.uriPropertyTemplate = fs.readFileSync("templates/uri-property.ejs", 'utf8');
  }

  module(templateFile, content, moduleExports) {
    var template = fs.readFileSync("templates/" + templateFile, 'utf8');
    return ejs.render(template, { content: content, moduleExports: moduleExports });
  }

  element(elementName, elementFuncName) {
    return ejs.render(this.elementTemplate, { elementName: elementName, elementFuncName: elementFuncName });
  }

  elementCustom(elementName, elementFuncName, moduleName, exportedName) {
    return ejs.render(this.elementCustomTemplate, { elementName: elementName, elementFuncName: elementFuncName,
      moduleName: moduleName, exportedName: exportedName });
  }

  property(propName, propType) {
    return ejs.render(this.propertyTemplate, { propName: propName, propType: propType });
  }

  uriProperty(propName) {
    return ejs.render(this.uriPropertyTemplate, { propName: propName });
  }

  enumProperty(propName, moduleName, values) {
    var unionTypeName = capitalize(moduleName) + capitalize(propName);
    var unionTypeValue = function(value) {
      return unionTypeName + value.split("-").map(function(val) {
        return capitalize(val);
      }).join("");
    }
    var unionTypeValues = values.map(function(value) {
      return unionTypeValue(value);
    }).join("\n    | ");
    var valueToStringCaseBody = values.map(function(value) {
      return "        " + unionTypeValue(value) + " ->\n" + '                    "' + value + '"\n';
    }).join("\n        ");

    return ejs.render(this.enumPropertyTemplate, {
      propName: propName,
      unionTypeName: unionTypeName,
      unionTypeValues: unionTypeValues,
      valueToStringCaseBody: valueToStringCaseBody
    });
  }

  funcProperty(funcName, args) {
    if (args) {
      var decoder = "(Decode.map tagger Decode." + args.type + ")";

      return ejs.render(this.funcPropertyTemplate, {
        funcName: funcName,
        handlerName: funcName.replace(/^on/, ""),
        decoder: decoder
      });
    } else {
      return ejs.render(this.funcConstantPropertyTemplate, {
        funcName: funcName,
        handlerName: funcName.replace(/^on/, "")
      });
    }

  }
}

module.exports = ElmTransformer;
