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
var _b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/TestAbility/app.js?entry":
/*!************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/TestAbility/app.js?entry ***!
  \************************************************************************************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

var $app_script$ = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-loader.js?path=D:\3_new_plat\storage\storagestatfsjstest\entry\src\ohosTest\js\TestAbility\app.js!./app.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagestatfsjstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/TestAbility/app.js")

      $app_define$('@app-application/app', [], function($app_require$, $app_exports$, $app_module$) {
      
      $app_script$($app_module$, $app_exports$, $app_require$)
      if ($app_exports$.__esModule && $app_exports$.default) {
        $app_module$.exports = $app_exports$.default
      }
      
      })
      $app_bootstrap$('@app-application/app',undefined,undefined)

/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/Common.js":
/*!**************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/Common.js ***!
  \**************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.FILE_CONTENT = void 0;
Object.defineProperty(exports, "afterAll", ({
  enumerable: true,
  get: function () {
    return _hypium.afterAll;
  }
}));
Object.defineProperty(exports, "afterEach", ({
  enumerable: true,
  get: function () {
    return _hypium.afterEach;
  }
}));
Object.defineProperty(exports, "beforeAll", ({
  enumerable: true,
  get: function () {
    return _hypium.beforeAll;
  }
}));
Object.defineProperty(exports, "beforeEach", ({
  enumerable: true,
  get: function () {
    return _hypium.beforeEach;
  }
}));
Object.defineProperty(exports, "describe", ({
  enumerable: true,
  get: function () {
    return _hypium.describe;
  }
}));
Object.defineProperty(exports, "expect", ({
  enumerable: true,
  get: function () {
    return _hypium.expect;
  }
}));
exports.isIntNum = isIntNum;
Object.defineProperty(exports, "it", ({
  enumerable: true,
  get: function () {
    return _hypium.it;
  }
}));
Object.defineProperty(exports, "statfs", ({
  enumerable: true,
  get: function () {
    return _ohos.default;
  }
}));
Object.defineProperty(exports, "statvfs", ({
  enumerable: true,
  get: function () {
    return _ohosFile.default;
  }
}));
var _ohos = _interopRequireDefault(requireModule("@ohos.statfs"));
var _ohosFile = _interopRequireDefault(requireModule("@ohos.file.statvfs"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
const FILE_CONTENT = 'hello world';
exports.FILE_CONTENT = FILE_CONTENT;
function isIntNum(val) {
  return typeof val === 'number' && val % 1 === 0;
}

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


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/List.test.js":
/*!*****************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/List.test.js ***!
  \*****************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = testsuite;
var _statfsTest = _interopRequireDefault(__webpack_require__(/*! ./statfs.test.js */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/statfs.test.js"));
var _statvfsTest = _interopRequireDefault(__webpack_require__(/*! ./statvfs.test.js */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/statvfs.test.js"));
function testsuite() {
  (0, _statfsTest.default)();
  (0, _statvfsTest.default)();
}

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


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/statfs.test.js":
/*!*******************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/statfs.test.js ***!
  \*******************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = statfs_test;
var _Common = __webpack_require__(/*! ./Common */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/Common.js");
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
function statfs_test() {
  (0, _Common.describe)('statfs_test', function () {
    (0, _Common.it)('statfs_test_get_free_bytes_async_000', 0, async function (done) {
      try {
        let context = _ohosAbility.default.getContext();
        let data = await context.getFilesDir();
        let number = await _Common.statfs.getFreeBytes(data);
        console.info("getFreeBytes getFilesDir===>" + number / 1024);
        (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
        done();
      } catch (e) {
        console.info('statfs_test_get_free_bytes_async_000 has failed for ' + e);
        (0, _Common.expect)(null).assertFail();
      }
    });
    (0, _Common.it)('statfs_test_get_free_bytes_async_001', 0, async function (done) {
      try {
        _Common.statfs.getFreeBytes("/dev", (err, number) => {
          console.info("getFreeBytesNumber dev===>:" + number / 1024);
          (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('statfs_test_get_free_bytes_async_001 has failed for ' + e);
        (0, _Common.expect)(null).assertFail();
      }
    });
    (0, _Common.it)('statfs_test_get_free_bytes_async_002', 0, async function (done) {
      try {
        await _Common.statfs.getFreeBytes(1);
      } catch (err) {
        console.info('statfs_test_get_free_bytes_async_002 has failed for ' + err);
        (0, _Common.expect)(err.message == "Invalid path").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statfs_test_get_free_bytes_async_003', 0, async function (done) {
      try {
        await _Common.statfs.getFreeBytes();
      } catch (err) {
        console.info('statfs_test_get_free_bytes_async_003 has failed for ' + err);
        (0, _Common.expect)(err.message == "Number of arguments unmatched").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statfs_test_get_free_bytes_async_004', 0, async function (done) {
      try {
        await _Common.statfs.getFreeBytes("");
      } catch (err) {
        console.info('statfs_test_get_free_bytes_async_004 has failed for ' + err);
        (0, _Common.expect)(err.message == "No such file or directory").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statfs_test_get_total_bytes_async_000', 0, async function (done) {
      try {
        let context = _ohosAbility.default.getContext();
        let data = await context.getFilesDir();
        let number = await _Common.statfs.getTotalBytes(data);
        console.info("getTotalBytesNumber GetFilesDir====>:" + number / 1024);
        (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
        done();
      } catch (e) {
        console.info('statfs_test_get_total_bytes_async_000 has failed for ' + e);
        (0, _Common.expect)(null).assertFail();
      }
    });
    (0, _Common.it)('statfs_test_get_total_bytes_async_001', 0, async function (done) {
      try {
        _Common.statfs.getTotalBytes("/dev", (err, number) => {
          console.info("getTotalBytesNumber dev===>:" + number / 1024);
          (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
          done();
        });
      } catch (e) {
        console.info('statfs_test_get_total_bytes_async_001 has failed for ' + e);
        (0, _Common.expect)(null).assertFail();
      }
    });
    (0, _Common.it)('statfs_test_get_total_bytes_async_002', 0, async function (done) {
      try {
        await _Common.statfs.getTotalBytes(1);
      } catch (err) {
        console.info('statfs_test_get_total_bytes_async_002 has failed for ' + err);
        (0, _Common.expect)(err.message == "Invalid path").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statfs_test_get_total_bytes_async_003', 0, async function (done) {
      try {
        await _Common.statfs.getTotalBytes();
      } catch (err) {
        console.info('statfs_test_get_total_bytes_async_003 has failed for ' + err);
        (0, _Common.expect)(err.message == "Number of arguments unmatched").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statfs_test_get_total_bytes_async_004', 0, async function (done) {
      try {
        await _Common.statfs.getTotalBytes("");
      } catch (err) {
        console.info('statfs_test_get_total_bytes_async_004 has failed for ' + err);
        (0, _Common.expect)(err.message == "No such file or directory").assertTrue();
        done();
      }
    });
  });
}

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


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/statvfs.test.js":
/*!********************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/statvfs.test.js ***!
  \********************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = statvfs_test;
var _Common = __webpack_require__(/*! ./Common */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/Common.js");
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
function statvfs_test() {
  (0, _Common.describe)('statvfs_test', function () {
    (0, _Common.it)('statvfs_test_get_free_size_async_000', 0, async function (done) {
      try {
        let context = _ohosAbility.default.getContext();
        let data = await context.getFilesDir();
        let number = await _Common.statvfs.getFreeSize(data);
        console.log("getFreeSize getFilesDir===>" + number / 1024);
        (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
        done();
      } catch (e) {
        console.log('statvfs_test_get_free_size_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('statvfs_test_get_free_size_async_001', 0, async function (done) {
      try {
        _Common.statvfs.getFreeSize("/dev", (err, number) => {
          if (err) {
            console.log('statvfs_test_get_free_size_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          console.log("getFreeSizeNumber dev===>:" + number / 1024);
          (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
          done();
        });
      } catch (e) {
        console.log('statvfs_test_get_free_size_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('statvfs_test_get_free_size_async_002', 0, async function (done) {
      try {
        await _Common.statvfs.getFreeSize(1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('statvfs_test_get_free_size_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statvfs_test_get_free_size_async_003', 0, async function (done) {
      try {
        await _Common.statvfs.getFreeSize();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('statvfs_test_get_free_size_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statvfs_test_get_free_size_async_004', 0, async function (done) {
      try {
        await _Common.statvfs.getFreeSize("");
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('statvfs_test_get_free_size_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('statvfs_test_get_free_size_async_005', 0, async function (done) {
      try {
        _Common.statvfs.getFreeSize("", err => {
          if (err) {
            console.log('statvfs_test_get_free_size_async_005 error package: {' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('statvfs_test_get_free_size_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('statvfs_test_get_total_size_async_000', 0, async function (done) {
      try {
        let context = _ohosAbility.default.getContext();
        let data = await context.getFilesDir();
        let number = await _Common.statvfs.getTotalSize(data);
        console.log("getTotalSizeNumber GetFilesDir====>:" + number / 1024);
        (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
        done();
      } catch (e) {
        console.log('statvfs_test_get_total_size_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('statvfs_test_get_total_size_async_001', 0, async function (done) {
      try {
        _Common.statvfs.getTotalSize("/dev", (err, number) => {
          if (err) {
            console.log('statvfs_test_get_total_size_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          console.log("getTotalSizeNumber dev===>:" + number / 1024);
          (0, _Common.expect)((0, _Common.isIntNum)(number)).assertTrue();
          done();
        });
      } catch (e) {
        console.log('statvfs_test_get_total_size_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('statvfs_test_get_total_size_async_002', 0, async function (done) {
      try {
        await _Common.statvfs.getTotalSize(1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('statvfs_test_get_total_size_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statvfs_test_get_total_size_async_003', 0, async function (done) {
      try {
        await _Common.statvfs.getTotalSize();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('statvfs_test_get_total_size_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('statvfs_test_get_total_size_async_004', 0, async function (done) {
      try {
        await _Common.statvfs.getTotalSize("");
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('statvfs_test_get_total_size_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('statvfs_test_get_total_size_async_005', 0, async function (done) {
      try {
        _Common.statvfs.getTotalSize("", err => {
          if (err) {
            console.log('statvfs_test_get_total_size_async_005 error package: {' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('statvfs_test_get_total_size_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
  });
}

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


/***/ }),

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagestatfsjstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/TestAbility/app.js":
/*!**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\3_new_plat\storage\storagestatfsjstest\entry\src\ohosTest\js\TestAbility\app.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/TestAbility/app.js ***!
  \**************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = function(module, exports, $app_require$){"use strict";

var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _ohos = _interopRequireDefault(requireModule("@ohos.hilog"));
var _ohosAppAbility = _interopRequireDefault(requireModule("@ohos.app.ability.abilityDelegatorRegistry"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
var _List = _interopRequireDefault(__webpack_require__(/*! ../test/List.test */ "../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/test/List.test.js"));
var _default = {
  onCreate() {
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'TestApplication onCreate');
    var abilityDelegator = _ohosAppAbility.default.getAbilityDelegator();
    var abilityDelegatorArguments = _ohosAppAbility.default.getArguments();
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    _hypium.Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, _List.default);
  },
  onDestroy() {
    _ohos.default.info(0x0000, 'testTag', '%{public}s', 'TestApplication onDestroy');
  }
};
exports.default = _default;
;
(exports.default || module.exports).manifest = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-plugin.js!../../../../build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json */ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json");

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

/***/ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json":
/*!********************************************************************************************************************************************************************************!*\
  !*** ./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json ***!
  \********************************************************************************************************************************************************************************/
/***/ ((module) => {

"use strict";
module.exports = JSON.parse('{"appID":"ohos.acts.storage.statfs","versionName":"1.0.0","versionCode":1000000,"minPlatformVersion":10,"appName":".TestAbility","deviceType":["tablet","default"],"window":{"autoDesignWidth":false,"designWidth":720},"pages":["pages/index/index"]}');

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"] ? globalThis["__common_module_cache___b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"][moduleId]: null;
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
/******/ 		              if (globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"]) {
/******/ 		                const length = globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"].length;
/******/ 		                switch (length) {
/******/ 		                  case 1:
/******/ 		                    return globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"][0][1][moduleId];
/******/ 		                  case 2:
/******/ 		                    return globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"][0][1][moduleId] ||
/******/ 		                    globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"][1][1][moduleId];
/******/ 		                }
/******/ 		              }
/******/ 		              return undefined;
/******/ 		            }
/******/ 		if (globalThis["__common_module_cache___b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"][moduleId] = module;
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
/******/ 		var chunkLoadingGlobal = globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"] = globalThis["webpackChunk_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["vendors"], () => (__webpack_require__("../../../../../../../../../3_new_plat/storage/storagestatfsjstest/entry/src/ohosTest/js/TestAbility/app.js?entry")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	_b6fb6d31b9b4d850203150cd2d85e7c8f998f0b8032e0e447c78efa9b21cdd71 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=app.js.map
})(this.__appProto__);
})