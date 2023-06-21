var _3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestRunner/OpenHarmonyTestRunner.js":
/*!************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestRunner/OpenHarmonyTestRunner.js ***!
  \************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = function(module, exports, $app_require$){"use strict";

var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _ohos = _interopRequireDefault(requireModule("@ohos.hilog"));
var _ohosAppAbility = _interopRequireDefault(requireModule("@ohos.app.ability.abilityDelegatorRegistry"));
var _default = {
  onPrepare() {
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  },
  onRun() {
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'OpenHarmonyTestRunner onRun run');
    var abilityDelegatorArguments = _ohosAppAbility.default.getArguments();
    var abilityDelegator = _ohosAppAbility.default.getAbilityDelegator();
    var testAbilityName = abilityDelegatorArguments.parameters['-p'] + '.TestAbility';
    var cmd = 'aa start -d 0 -a ' + testAbilityName + ' -b ' + abilityDelegatorArguments.bundleName;
    var debug = abilityDelegatorArguments.parameters["-D"];
    if (debug == 'true') {
      cmd += ' -D';
    }
    _ohos.default.info(0x0000, 'testTag', 'cmd : %{public}s', cmd);
    abilityDelegator.executeShellCommand(cmd, (err, data) => {
      var _JSON$stringify, _data$stdResult, _data$exitCode;
      _ohos.default.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', (_JSON$stringify = JSON.stringify(err)) !== null && _JSON$stringify !== void 0 ? _JSON$stringify : '');
      _ohos.default.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', (_data$stdResult = data.stdResult) !== null && _data$stdResult !== void 0 ? _data$stdResult : '');
      _ohos.default.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', (_data$exitCode = data.exitCode) !== null && _data$exitCode !== void 0 ? _data$exitCode : '');
    });
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


/***/ }),

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"] ? globalThis["__common_module_cache___3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"][moduleId]: null;
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
/******/ 		              if (globalThis["webpackChunk_3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"]) {
/******/ 		                const length = globalThis["webpackChunk_3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"].length;
/******/ 		                switch (length) {
/******/ 		                  case 1:
/******/ 		                    return globalThis["webpackChunk_3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"][0][1][moduleId];
/******/ 		                  case 2:
/******/ 		                    return globalThis["webpackChunk_3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"][0][1][moduleId] ||
/******/ 		                    globalThis["webpackChunk_3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"][1][1][moduleId];
/******/ 		                }
/******/ 		              }
/******/ 		              return undefined;
/******/ 		            }
/******/ 		if (globalThis["__common_module_cache___3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02"][moduleId] = module;
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
/*!*********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestRunner/OpenHarmonyTestRunner.js ***!
  \*********************************************************************************************************************************/
var $app_script$ = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!./OpenHarmonyTestRunner.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestRunner/OpenHarmonyTestRunner.js")

      $app_define$('@app-application/OpenHarmonyTestRunner', [], function($app_require$, $app_exports$, $app_module$) {
      
      $app_script$($app_module$, $app_exports$, $app_require$)
      if ($app_exports$.__esModule && $app_exports$.default) {
        $app_module$.exports = $app_exports$.default
      }
      
      })
      
})();

_3e19dd521bdc41b7de92452753cfd354a93b59498a03431a929e811e89581b02 = __webpack_exports__;
/******/ })()
;
//# sourceMappingURL=\OpenHarmonyTestRunner.js.map