"use strict";
(globalThis["webpackChunk_938ec78a1f686bf8db31d5a23ce7e15d4029fc7e4b46e439a92a0437e855fdce"] = globalThis["webpackChunk_938ec78a1f686bf8db31d5a23ce7e15d4029fc7e4b46e439a92a0437e855fdce"] || []).push([["vendors"],{

/***/ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js":
/*!**********************************************************************!*\
  !*** ./node_modules/@babel/runtime/helpers/interopRequireDefault.js ***!
  \**********************************************************************/
/***/ ((module) => {



function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : {
    "default": obj
  };
}
module.exports = _interopRequireDefault, module.exports.__esModule = true, module.exports["default"] = module.exports;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ })

}]);
      globalThis["__common_module_cache___938ec78a1f686bf8db31d5a23ce7e15d4029fc7e4b46e439a92a0437e855fdce"] = globalThis["__common_module_cache___938ec78a1f686bf8db31d5a23ce7e15d4029fc7e4b46e439a92a0437e855fdce"] || {};
//# sourceMappingURL=vendors.js.map