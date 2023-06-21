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
var _c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/TestAbility/app.js?entry":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/TestAbility/app.js?entry ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

var $app_script$ = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-loader.js?path=D:\3_new_plat\storage\storagesecuritylabeljstest\entry\src\ohosTest\js\TestAbility\app.js!./app.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagesecuritylabeljstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/TestAbility/app.js")

      $app_define$('@app-application/app', [], function($app_require$, $app_exports$, $app_module$) {
      
      $app_script$($app_module$, $app_exports$, $app_require$)
      if ($app_exports$.__esModule && $app_exports$.default) {
        $app_module$.exports = $app_exports$.default
      }
      
      })
      $app_bootstrap$('@app-application/app',undefined,undefined)

/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/Common.js":
/*!*********************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/Common.js ***!
  \*********************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
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
Object.defineProperty(exports, "fileIO", ({
  enumerable: true,
  get: function () {
    return _ohosFile2.default;
  }
}));
Object.defineProperty(exports, "fileio", ({
  enumerable: true,
  get: function () {
    return _ohos.default;
  }
}));
Object.defineProperty(exports, "it", ({
  enumerable: true,
  get: function () {
    return _hypium.it;
  }
}));
exports.nextFileName = nextFileName;
Object.defineProperty(exports, "securityLabel", ({
  enumerable: true,
  get: function () {
    return _ohosFile.default;
  }
}));
var _ohosFile = _interopRequireDefault(requireModule("@ohos.file.securityLabel"));
var _ohos = _interopRequireDefault(requireModule("@ohos.fileio"));
var _ohosFile2 = _interopRequireDefault(requireModule("@ohos.file.fs"));
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
async function nextFileName(testName) {
  let context = _ohosAbility.default.getContext();
  let data = await context.getFilesDir();
  let BASE_PATH = data.substring(0, data.length - 5) + 'cache/';
  return BASE_PATH + testName;
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

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/List.test.js":
/*!************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/List.test.js ***!
  \************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = testsuite;
var _securitylabelTest = _interopRequireDefault(__webpack_require__(/*! ./securitylabel.test.js */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/securitylabel.test.js"));
function testsuite() {
  (0, _securitylabelTest.default)();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/securitylabel.test.js":
/*!*********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/securitylabel.test.js ***!
  \*********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = security_label;
var _Common = __webpack_require__(/*! ./Common */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/Common.js");
function security_label() {
  (0, _Common.describe)('security_label', function () {
    (0, _Common.it)('securitylabel_test_set_security_label_sync_000', 0, async function () {
      try {
        let dataLevel = ["s0", "s1", "s2", "s3", "s4"];
        for (let i = 0; i < dataLevel.length; i++) {
          let fpath = await (0, _Common.nextFileName)("test" + dataLevel[i] + '.txt');
          _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
          _Common.securityLabel.setSecurityLabelSync(fpath, dataLevel[i]);
          let level = _Common.securityLabel.getSecurityLabelSync(fpath);
          (0, _Common.expect)(level == dataLevel[i]).assertTrue();
          _Common.fileio.unlinkSync(fpath);
        }
      } catch (e) {
        console.log('securitylabel_test_set_security_label_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)("test.txt");
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.setSecurityLabelSync(fpath, "abc");
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_sync_002', 0, async function () {
      try {
        _Common.securityLabel.setSecurityLabelSync("/data/aaa.txt", "s0");
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_set_security_label_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)("test.txt");
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.setSecurityLabelSync(fpath, 1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)("test.txt");
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.setSecurityLabelSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.setSecurityLabel(fpath, 's0', err => {
          if (err) {
            console.log('securitylabel_test_set_security_label_async_000 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.securityLabel.getSecurityLabel(fpath, (err, dataLevel) => {
            if (err) {
              console.log('securitylabel_test_set_security_label_async_000 error package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(dataLevel == 's0').assertTrue();
            _Common.fileio.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test1.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.setSecurityLabel(fpath, 's1', err => {
          if (err) {
            console.log('securitylabel_test_set_security_label_async_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.securityLabel.getSecurityLabel(fpath, (err, dataLevel) => {
            if (err) {
              console.log('securitylabel_test_set_security_label_async_001 error package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(dataLevel == 's1').assertTrue();
            _Common.fileio.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test2.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.securityLabel.setSecurityLabel(fpath, 's2');
        _Common.securityLabel.getSecurityLabel(fpath, (err, dataLevel) => {
          if (err) {
            console.log('securitylabel_test_set_security_label_async_002 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dataLevel == 's2').assertTrue();
          _Common.fileio.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test3.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.securityLabel.setSecurityLabel(fpath, 's3');
        let dataLevel = await _Common.securityLabel.getSecurityLabel(fpath);
        (0, _Common.expect)(dataLevel == 's3').assertTrue();
        _Common.fileio.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test4.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.securityLabel.setSecurityLabel(fpath, 's4');
        let dataLevel = await _Common.securityLabel.getSecurityLabel(fpath);
        (0, _Common.expect)(dataLevel == 's4').assertTrue();
        _Common.fileio.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_005', 0, async function (done) {
      try {
        await _Common.securityLabel.setSecurityLabel(123, 's0');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_006', 0, async function (done) {
      try {
        await _Common.securityLabel.setSecurityLabel('/data/test.txt', 's0');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_007', 0, async function (done) {
      try {
        await _Common.securityLabel.setSecurityLabel('s0');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test5.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.securityLabel.setSecurityLabel(fpath, 1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test6.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.securityLabel.setSecurityLabel(fpath, 'ss');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test7.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.securityLabel.setSecurityLabel(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test8.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.setSecurityLabel(fpath, 's0', '', () => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_set_security_label_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_set_security_label_async_012', 0, async function (done) {
      try {
        _Common.securityLabel.setSecurityLabel('/data/test.txt', 's0', err => {
          if (err) {
            console.log('securitylabel_test_set_security_label_async_012 error package: {' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('securitylabel_test_set_security_label_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_sync_000', 0, function () {
      try {
        let dataLevel = _Common.securityLabel.getSecurityLabelSync('');
        (0, _Common.expect)(dataLevel == '').assertTrue();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_sync_001', 0, function () {
      try {
        let dataLevel = _Common.securityLabel.getSecurityLabelSync('/data/test.txt');
        (0, _Common.expect)(dataLevel == '').assertTrue();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_sync_002', 0, function () {
      try {
        _Common.securityLabel.getSecurityLabelSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_sync_003', 0, function () {
      try {
        _Common.securityLabel.getSecurityLabelSync(123);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_async_000', 0, async function (done) {
      try {
        await _Common.securityLabel.getSecurityLabel(123);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_async_001', 0, async function (done) {
      try {
        let dataLevel = await _Common.securityLabel.getSecurityLabel('/data/test.txt');
        (0, _Common.expect)(dataLevel == '').assertTrue();
        done();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_async_002', 0, async function (done) {
      try {
        await _Common.securityLabel.getSecurityLabel();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('securitylabel_test_get_security_label_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });
    (0, _Common.it)('securitylabel_test_get_security_label_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('test9.txt');
      _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.securityLabel.getSecurityLabel(fpath, '', () => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileio.unlinkSync(fpath);
        console.log('securitylabel_test_get_security_label_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
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

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagesecuritylabeljstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/TestAbility/app.js":
/*!****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\3_new_plat\storage\storagesecuritylabeljstest\entry\src\ohosTest\js\TestAbility\app.js!../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/TestAbility/app.js ***!
  \****************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = function(module, exports, $app_require$){"use strict";

var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _ohos = _interopRequireDefault(requireModule("@ohos.hilog"));
var _ohosAppAbility = _interopRequireDefault(requireModule("@ohos.app.ability.abilityDelegatorRegistry"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
var _List = _interopRequireDefault(__webpack_require__(/*! ../test/List.test */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/test/List.test.js"));
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
(exports.default || module.exports).manifest = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-plugin.js!../../../../build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json */ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json");

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

/***/ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json":
/*!***************************************************************************************************************************************************************************************!*\
  !*** ./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json ***!
  \***************************************************************************************************************************************************************************************/
/***/ ((module) => {

"use strict";
module.exports = JSON.parse('{"appID":"ohos.acts.storage.securitylabel","versionName":"1.0.0","versionCode":1000000,"minPlatformVersion":10,"appName":".TestAbility","deviceType":["tablet","default"],"window":{"autoDesignWidth":false,"designWidth":720},"pages":["pages/index/index"]}');

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] ? globalThis["__common_module_cache___c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"][moduleId]: null;
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
/******/ 		              if (globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"]) {
/******/ 		                const length = globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"].length;
/******/ 		                switch (length) {
/******/ 		                  case 1:
/******/ 		                    return globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"][0][1][moduleId];
/******/ 		                  case 2:
/******/ 		                    return globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"][0][1][moduleId] ||
/******/ 		                    globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"][1][1][moduleId];
/******/ 		                }
/******/ 		              }
/******/ 		              return undefined;
/******/ 		            }
/******/ 		if (globalThis["__common_module_cache___c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"][moduleId] = module;
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
/******/ 		var chunkLoadingGlobal = globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] = globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["vendors"], () => (__webpack_require__("../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/entry/src/ohosTest/js/TestAbility/app.js?entry")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=app.js.map
})(this.__appProto__);
})