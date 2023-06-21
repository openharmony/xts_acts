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

/***/ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/app.js?entry":
/*!********************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/app.js?entry ***!
  \********************************************************************************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

var $app_script$ = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-loader.js?path=D:\3_new_plat\storage\storagestatfsjstest\entry\src\main\js\MainAbility\app.js!./app.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagestatfsjstest\\entry\\src\\main\\js\\MainAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/app.js")

      $app_define$('@app-application/app', [], function($app_require$, $app_exports$, $app_module$) {
      
      $app_script$($app_module$, $app_exports$, $app_require$)
      if ($app_exports$.__esModule && $app_exports$.default) {
        $app_module$.exports = $app_exports$.default
      }
      
      })
      $app_bootstrap$('@app-application/app',undefined,undefined)

/***/ }),

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagestatfsjstest\\entry\\src\\main\\js\\MainAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/app.js":
/*!******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\3_new_plat\storage\storagestatfsjstest\entry\src\main\js\MainAbility\app.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/app.js ***!
  \******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = function(module, exports, $app_require$){"use strict";

var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _ohos = _interopRequireDefault(requireModule("@ohos.hilog"));
var _default = {
  onCreate() {
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
  },
  onDestroy() {
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  }
};
exports.default = _default;
(exports.default || module.exports).manifest = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-plugin.js!../../../../build/default/intermediates/manifest/default/MainAbility/manifest.json */ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/build/default/intermediates/manifest/default/MainAbility/manifest.json");

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
}
/* generated by ace-loader */


/***/ }),

/***/ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/build/default/intermediates/manifest/default/MainAbility/manifest.json":
/*!*******************************************************************************************************************************************************************************!*\
  !*** ./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/build/default/intermediates/manifest/default/MainAbility/manifest.json ***!
  \*******************************************************************************************************************************************************************************/
/***/ ((module) => {

"use strict";
module.exports = JSON.parse('{"appID":"ohos.acts.storage.statfs","versionName":"1.0.0","versionCode":1000000,"minPlatformVersion":10,"appName":".MainAbility","deviceType":["tablet","default"],"window":{"autoDesignWidth":false,"designWidth":720},"pages":["pages/index/index"]}');

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
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = __webpack_modules__;
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/chunk loaded */
/******/ 	(() => {
/******/ 		var deferred = [];
/******/ 		__webpack_require__.O = (result, chunkIds, fn, priority) => {
/******/ 			if(chunkIds) {
/******/ 				priority = priority || 0;
/******/ 				for(var i = deferred.length; i > 0 && deferred[i - 1][2] > priority; i--) deferred[i] = deferred[i - 1];
/******/ 				deferred[i] = [chunkIds, fn, priority];
/******/ 				return;
/******/ 			}
/******/ 			var notFulfilled = Infinity;
/******/ 			for (var i = 0; i < deferred.length; i++) {
/******/ 				var [chunkIds, fn, priority] = deferred[i];
/******/ 				var fulfilled = true;
/******/ 				for (var j = 0; j < chunkIds.length; j++) {
/******/ 					if ((priority & 1 === 0 || notFulfilled >= priority) && Object.keys(__webpack_require__.O).every((key) => (__webpack_require__.O[key](chunkIds[j])))) {
/******/ 						chunkIds.splice(j--, 1);
/******/ 					} else {
/******/ 						fulfilled = false;
/******/ 						if(priority < notFulfilled) notFulfilled = priority;
/******/ 					}
/******/ 				}
/******/ 				if(fulfilled) {
/******/ 					deferred.splice(i--, 1)
/******/ 					var r = fn();
/******/ 					if (r !== undefined) result = r;
/******/ 				}
/******/ 			}
/******/ 			return result;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/jsonp chunk loading */
/******/ 	(() => {
/******/ 		// no baseURI
/******/ 		
/******/ 		// object to store loaded and loading chunks
/******/ 		// undefined = chunk not loaded, null = chunk preloaded/prefetched
/******/ 		// [resolve, reject, Promise] = chunk loading, 0 = chunk loaded
/******/ 		var installedChunks = {
/******/ 			"./app": 0
/******/ 		};
/******/ 		
/******/ 		// no chunk on demand loading
/******/ 		
/******/ 		// no prefetching
/******/ 		
/******/ 		// no preloaded
/******/ 		
/******/ 		// no HMR
/******/ 		
/******/ 		// no HMR manifest
/******/ 		
/******/ 		__webpack_require__.O.j = (chunkId) => (installedChunks[chunkId] === 0);
/******/ 		
/******/ 		// install a JSONP callback for chunk loading
/******/ 		var webpackJsonpCallback = (parentChunkLoadingFunction, data) => {
/******/ 			var [chunkIds, moreModules, runtime] = data;
/******/ 			// add "moreModules" to the modules object,
/******/ 			// then flag all "chunkIds" as loaded and fire callback
/******/ 			var moduleId, chunkId, i = 0;
/******/ 			if(chunkIds.some((id) => (installedChunks[id] !== 0))) {
/******/ 				for(moduleId in moreModules) {
/******/ 					if(__webpack_require__.o(moreModules, moduleId)) {
/******/ 						__webpack_require__.m[moduleId] = moreModules[moduleId];
/******/ 					}
/******/ 				}
/******/ 				if(runtime) var result = runtime(__webpack_require__);
/******/ 			}
/******/ 			if(parentChunkLoadingFunction) parentChunkLoadingFunction(data);
/******/ 			for(;i < chunkIds.length; i++) {
/******/ 				chunkId = chunkIds[i];
/******/ 				if(__webpack_require__.o(installedChunks, chunkId) && installedChunks[chunkId]) {
/******/ 					installedChunks[chunkId][0]();
/******/ 				}
/******/ 				installedChunks[chunkId] = 0;
/******/ 			}
/******/ 			return __webpack_require__.O(result);
/******/ 		}
/******/ 		
/******/ 		var chunkLoadingGlobal = globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"] = globalThis["webpackChunk_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["vendors"], () => (__webpack_require__("../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/main/js/MainAbility/app.js?entry")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	_7c4d6cf557767f6a498c0599bd55453c24632a3b3797d7cca9ff60b41a744f32 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=app.js.map
})(this.__appProto__);
})