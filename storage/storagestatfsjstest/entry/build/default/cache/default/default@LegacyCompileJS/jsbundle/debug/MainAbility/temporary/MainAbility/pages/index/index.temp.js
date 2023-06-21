(global.___mainEntry___ = function (globalObjects) {
  var define = globalObjects.define;
  var require = globalObjects.require;
  var bootstrap = globalObjects.bootstrap;
  var register = globalObjects.register;
  var render = globalObjects.render;
  var $app_define$ = globalObjects.$app_define$;
  var $app_bootstrap$ = globalObjects.$app_bootstrap$;
  var $app_require$ = globalObjects.$app_require$;
  var history = globalObjects.history;
  var Image = globalObjects.Image;
  var OffscreenCanvas = globalObjects.OffscreenCanvas;
  (function(global) {
    "use strict";
var _7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./lib/json.js!./lib/style.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.css":
/*!**********************************************************************************************************************************************************!*\
  !*** ./lib/json.js!./lib/style.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.css ***!
  \**********************************************************************************************************************************************************/
/***/ ((module) => {

module.exports = {
  ".container": {
    "flexDirection": "column",
    "justifyContent": "center",
    "alignItems": "center",
    "width": "100%",
    "height": "100%"
  },
  ".title": {
    "fontSize": "40px",
    "color": "#000000",
    "opacity": 0.9
  },
  "@MEDIA": [
    {
      "condition": "screen and (device-type: tablet) and (orientation: landscape)",
      ".title": {
        "fontSize": "100px"
      }
    },
    {
      "condition": "screen and (device-type: wearable)",
      ".title": {
        "fontSize": "28px",
        "color": "#FFFFFF"
      }
    },
    {
      "condition": "screen and (device-type: tv)",
      ".container": {
        "backgroundImage": "/common/images/Wallpaper.png",
        "backgroundSize": "cover",
        "backgroundRepeat": "no-repeat",
        "backgroundPosition": "center"
      },
      ".title": {
        "fontSize": "100px",
        "color": "#FFFFFF"
      }
    },
    {
      "condition": "screen and (device-type: phone) and (orientation: landscape)",
      ".title": {
        "fontSize": "60px"
      }
    }
  ]
}

/***/ }),

/***/ "./lib/json.js!./lib/template.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.hml":
/*!*************************************************************************************************************************************************************!*\
  !*** ./lib/json.js!./lib/template.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.hml ***!
  \*************************************************************************************************************************************************************/
/***/ ((module) => {

module.exports = {
  "attr": {
    "debugLine": "pages/index/index:15",
    "className": "container"
  },
  "type": "div",
  "classList": [
    "container"
  ],
  "children": [
    {
      "attr": {
        "debugLine": "pages/index/index:16",
        "className": "title",
        "value": function () {return (this.$t('strings.hello'))+ decodeURI('') +decodeURI('%20')+ decodeURI('') +(this.title)}
      },
      "type": "text",
      "classList": [
        "title"
      ]
    }
  ]
}

/***/ }),

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.js":
/*!*******************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.js ***!
  \*******************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module) => {

module.exports = function(module, exports, $app_require$){"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _default = {
  data: {
    title: ""
  },
  onInit() {
    this.title = this.$t('strings.world');
  }
};
exports.default = _default;

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

var moduleOwn = exports.default || module.exports;
var accessors = ['public', 'protected', 'private'];
if (moduleOwn.data && accessors.some(function (acc) {
    return moduleOwn[acc];
  })) {
  throw new Error('For VM objects, attribute data must not coexist with public, protected, or private. Please replace data with public.');
} else if (!moduleOwn.data) {
  moduleOwn.data = {};
  moduleOwn._descriptor = {};
  accessors.forEach(function(acc) {
    var accType = typeof moduleOwn[acc];
    if (accType === 'object') {
      moduleOwn.data = Object.assign(moduleOwn.data, moduleOwn[acc]);
      for (var name in moduleOwn[acc]) {
        moduleOwn._descriptor[name] = {access : acc};
      }
    } else if (accType === 'function') {
      console.warn('For VM objects, attribute ' + acc + ' value must not be a function. Change the value to an object.');
    }
  });
}}
/* generated by ace-loader */


/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"] ? globalThis["__common_module_cache___7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"][moduleId]: null;
/******/ 		if (commonCachedModule) { return commonCachedModule.exports; }
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		function isCommonModue(moduleId) {
/******/ 		              if (globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"]) {
/******/ 		                const length = globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"].length;
/******/ 		                switch (length) {
/******/ 		                  case 1:
/******/ 		                    return globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"][0][1][moduleId];
/******/ 		                  case 2:
/******/ 		                    return globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"][0][1][moduleId] ||
/******/ 		                    globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"][1][1][moduleId];
/******/ 		                }
/******/ 		              }
/******/ 		              return undefined;
/******/ 		            }
/******/ 		if (globalThis["__common_module_cache___7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"][moduleId] = module;
/******/ 		}
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!***********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.hml?entry ***!
  \***********************************************************************************************************************************/
var $app_template$ = __webpack_require__(/*! !!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/json.js!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/template.js!./index.hml */ "./lib/json.js!./lib/template.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.hml")
var $app_style$ = __webpack_require__(/*! !!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/json.js!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/style.js!./index.css */ "./lib/json.js!./lib/style.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.css")
var $app_script$ = __webpack_require__(/*! !!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!./index.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/pages/index/index.js")

$app_define$('@app-component/index', [], function($app_require$, $app_exports$, $app_module$) {

$app_script$($app_module$, $app_exports$, $app_require$)
if ($app_exports$.__esModule && $app_exports$.default) {
$app_module$.exports = $app_exports$.default
}

$app_module$.exports.template = $app_template$

$app_module$.exports.style = $app_style$

})
$app_bootstrap$('@app-component/index',undefined,undefined)
})();

_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32 = __webpack_exports__;
/******/ })()
;
//# sourceMappingURL=index.js.map
})(this.__appProto__);
})