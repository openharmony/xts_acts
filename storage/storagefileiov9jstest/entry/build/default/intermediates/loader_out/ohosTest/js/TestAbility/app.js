var _f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/TestAbility/app.js?entry":
/*!**************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/TestAbility/app.js?entry ***!
  \**************************************************************************************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

var $app_script$ = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-loader.js?path=D:\3_new_plat\storage\storagefileiov9jstest\entry\src\ohosTest\js\TestAbility\app.js!./app.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagefileiov9jstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/TestAbility/app.js")

      $app_define$('@app-application/app', [], function($app_require$, $app_exports$, $app_module$) {
      
      $app_script$($app_module$, $app_exports$, $app_require$)
      if ($app_exports$.__esModule && $app_exports$.default) {
        $app_module$.exports = $app_exports$.default
      }
      
      })
      $app_bootstrap$('@app-application/app',undefined,undefined)

/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js":
/*!****************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js ***!
  \****************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.FILE_CONTENT = void 0;
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
    return _ohosFile.default;
  }
}));
exports.fileName = fileName;
exports.isBigInt = isBigInt;
exports.isIntNum = isIntNum;
exports.isString = isString;
Object.defineProperty(exports, "it", ({
  enumerable: true,
  get: function () {
    return _hypium.it;
  }
}));
exports.nextFileName = nextFileName;
exports.prepare200MFile = prepare200MFile;
exports.prepareFile = prepareFile;
exports.randomString = randomString;
Object.defineProperty(exports, "util", ({
  enumerable: true,
  get: function () {
    return _ohos.default;
  }
}));
var _ohosFile = _interopRequireDefault(requireModule("@ohos.file.fs"));
var _ohos = _interopRequireDefault(requireModule("@ohos.util"));
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
const FILE_CONTENT = 'hello world';
exports.FILE_CONTENT = FILE_CONTENT;
function prepareFile(fpath, content) {
  try {
    let file = _ohosFile.default.openSync(fpath, _ohosFile.default.OpenMode.CREATE | _ohosFile.default.OpenMode.READ_WRITE);
    _ohosFile.default.truncateSync(file.fd);
    _ohosFile.default.writeSync(file.fd, content);
    _ohosFile.default.fsyncSync(file.fd);
    _ohosFile.default.closeSync(file);
    return true;
  } catch (e) {
    console.log('Failed to prepareFile for ' + e);
    return false;
  }
}
function prepare200MFile(fpath) {
  try {
    let file = _ohosFile.default.openSync(fpath, _ohosFile.default.OpenMode.CREATE | _ohosFile.default.OpenMode.READ_WRITE);
    _ohosFile.default.truncateSync(file.fd);
    let bf = new ArrayBuffer(1024 * 1024 * 20);
    for (let i = 0; i < 10; i++) {
      let position = bf.byteLength * i;
      let writeLen = _ohosFile.default.writeSync(file.fd, bf, {
        offset: 0,
        length: bf.byteLength,
        position: position,
        encoding: 'utf-8'
      });
    }
    _ohosFile.default.fsyncSync(file.fd);
    _ohosFile.default.closeSync(file);
    return true;
  } catch (e) {
    console.log('Failed to prepare200MFile for ' + e);
    return false;
  }
}
async function nextFileName(testName) {
  let context = _ohosAbility.default.getContext();
  let data = await context.getCacheDir();
  let BASE_PATH = data + '/';
  return BASE_PATH + testName + '_' + randomString(testName.length);
}
async function fileName(testName) {
  let context = _ohosAbility.default.getContext();
  let data = await context.getFilesDir();
  let BASE_PATH = data + '/';
  return BASE_PATH + testName + '_' + randomString(testName.length);
}
function randomString(num) {
  let len = num;
  var $chars = 'aaaabbbbcccc';
  var maxPos = $chars.length;
  var pwd = '';
  for (var i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}
function isIntNum(val) {
  return typeof val === 'number' && val % 1 === 0;
}
function isBigInt(val) {
  return typeof val === 'bigint';
}
function isString(str) {
  return typeof str == 'string' && str.constructor == String;
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/List.test.js":
/*!*******************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/List.test.js ***!
  \*******************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = testsuite;
var _accessTest = _interopRequireDefault(__webpack_require__(/*! ./members/access.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/access.test.js"));
var _closeTest = _interopRequireDefault(__webpack_require__(/*! ./members/close.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/close.test.js"));
var _copyDir = _interopRequireDefault(__webpack_require__(/*! ./members/copyDir.test */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/copyDir.test.js"));
var _copyFileTest = _interopRequireDefault(__webpack_require__(/*! ./members/copyFile.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/copyFile.test.js"));
var _createStreamTest = _interopRequireDefault(__webpack_require__(/*! ./members/createStream.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/createStream.test.js"));
var _fdatasyncTest = _interopRequireDefault(__webpack_require__(/*! ./members/fdatasync.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fdatasync.test.js"));
var _fdopenStreamTest = _interopRequireDefault(__webpack_require__(/*! ./members/fdopenStream.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fdopenStream.test.js"));
var _fileLockTest = _interopRequireDefault(__webpack_require__(/*! ./members/fileLock.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fileLock.test.js"));
var _fsyncTest = _interopRequireDefault(__webpack_require__(/*! ./members/fsync.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fsync.test.js"));
var _hashTest = _interopRequireDefault(__webpack_require__(/*! ./members/hash.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/hash.test.js"));
var _listFileTest = _interopRequireDefault(__webpack_require__(/*! ./members/listFile.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/listFile.test.js"));
var _lstatTest = _interopRequireDefault(__webpack_require__(/*! ./members/lstat.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/lstat.test.js"));
var _mkdirTest = _interopRequireDefault(__webpack_require__(/*! ./members/mkdir.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/mkdir.test.js"));
var _mkdtempTest = _interopRequireDefault(__webpack_require__(/*! ./members/mkdtemp.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/mkdtemp.test.js"));
var _moveDirTest = _interopRequireDefault(__webpack_require__(/*! ./members/moveDir.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/moveDir.test.js"));
var _moveFileTest = _interopRequireDefault(__webpack_require__(/*! ./members/moveFile.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/moveFile.test.js"));
var _openTest = _interopRequireDefault(__webpack_require__(/*! ./members/open.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/open.test.js"));
var _readTest = _interopRequireDefault(__webpack_require__(/*! ./members/read.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/read.test.js"));
var _readtextTest = _interopRequireDefault(__webpack_require__(/*! ./members/readtext.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/readtext.test.js"));
var _renameTest = _interopRequireDefault(__webpack_require__(/*! ./members/rename.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/rename.test.js"));
var _rmdir = _interopRequireDefault(__webpack_require__(/*! ./members/rmdir.test */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/rmdir.test.js"));
var _statTest = _interopRequireDefault(__webpack_require__(/*! ./members/stat.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/stat.test.js"));
var _closeTest2 = _interopRequireDefault(__webpack_require__(/*! ./class_stream/close.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/close.test.js"));
var _flushTest = _interopRequireDefault(__webpack_require__(/*! ./class_stream/flush.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/flush.test.js"));
var _readTest2 = _interopRequireDefault(__webpack_require__(/*! ./class_stream/read.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/read.test.js"));
var _writeTest = _interopRequireDefault(__webpack_require__(/*! ./class_stream/write.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/write.test.js"));
var _symlinkTest = _interopRequireDefault(__webpack_require__(/*! ./members/symlink.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/symlink.test.js"));
var _truncateTest = _interopRequireDefault(__webpack_require__(/*! ./members/truncate.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/truncate.test.js"));
var _unlinkTest = _interopRequireDefault(__webpack_require__(/*! ./members/unlink.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/unlink.test.js"));
var _writeTest2 = _interopRequireDefault(__webpack_require__(/*! ./members/write.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/write.test.js"));
var _filerwTest = _interopRequireDefault(__webpack_require__(/*! ./members/filerw.test.js */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/filerw.test.js"));
function testsuite() {
  (0, _accessTest.default)();
  (0, _closeTest.default)();
  (0, _copyDir.default)();
  (0, _copyFileTest.default)();
  (0, _createStreamTest.default)();
  (0, _fdatasyncTest.default)();
  (0, _fdopenStreamTest.default)();
  (0, _fileLockTest.default)();
  (0, _fsyncTest.default)();
  (0, _hashTest.default)();
  (0, _listFileTest.default)();
  (0, _lstatTest.default)();
  (0, _mkdirTest.default)();
  (0, _mkdtempTest.default)();
  (0, _moveDirTest.default)();
  (0, _moveFileTest.default)();
  (0, _openTest.default)();
  (0, _readTest.default)();
  (0, _readtextTest.default)();
  (0, _renameTest.default)();
  (0, _rmdir.default)();
  (0, _statTest.default)();
  (0, _closeTest2.default)();
  (0, _flushTest.default)();
  (0, _readTest2.default)();
  (0, _writeTest.default)();
  (0, _symlinkTest.default)();
  (0, _truncateTest.default)();
  (0, _unlinkTest.default)();
  (0, _writeTest2.default)();
  (0, _filerwTest.default)();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/close.test.js":
/*!*********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/close.test.js ***!
  \*********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOStreamClose;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOStreamClose() {
  (0, _Common.describe)('fileIO_fs_stream_close', function () {
    (0, _Common.it)('fileIO_test_stream_close_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_close_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_close_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.closeSync(1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_close_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_close_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.closeSync();
        sr.closeSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_close_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_close_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.close();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_close_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_close_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.close(err => {
          if (err) {
            console.log('fileIO_test_stream_close_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('fileIO_test_stream_close_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_close_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.close();
        await sr.close();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_close_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_close_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_close_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.close(1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_close_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/flush.test.js":
/*!*********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/flush.test.js ***!
  \*********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOStreamFlush;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOStreamFlush() {
  (0, _Common.describe)('fileIO_fs_stream_flush', function () {
    (0, _Common.it)('fileIO_test_stream_flush_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_flush_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sr.flushSync();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_flush_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_flush_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_flush_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.flushSync(1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_flush_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_flush_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_flush_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = await _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sr.flush().then(() => {
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_test_stream_flush_async_000 error package' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_stream_flush_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_flush_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_flush_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = await _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sr.flush(err => {
          if (err) {
            console.log('fileIO_test_stream_flush_async_001 error package' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_flush_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_flush_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_flush_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.flush(1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_flush_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/read.test.js":
/*!********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/read.test.js ***!
  \********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOStreamRead;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOStreamRead() {
  (0, _Common.describe)('fileIO_fs_stream_read', function () {
    (0, _Common.it)('fileIO_test_stream_read_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen1 = sr.readSync(new ArrayBuffer(16));
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = sr.readSync(new ArrayBuffer(8));
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_read_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          length: 2
        });
        (0, _Common.expect)(readLen == 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_read_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 2
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_read_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 1,
          length: _Common.FILE_CONTENT.length
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_read_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.readSync("");
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidLength = 4097;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.readSync(new ArrayBuffer(4096), {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidOffset = -1;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.readSync(new ArrayBuffer(4096), {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_007', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen1 = sr.readSync(new ArrayBuffer(16), undefined);
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = sr.readSync(new ArrayBuffer(8), undefined);
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_read_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_sync_008', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen1 = sr.readSync(new ArrayBuffer(16), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = sr.readSync(new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_read_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen1 = await sr.read(new ArrayBuffer(16));
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = await sr.read(new ArrayBuffer(8));
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(16), (err, readLen1) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
          sr.read(new ArrayBuffer(8), (err, readLen2) => {
            if (err) {
              console.log('fileIO_test_stream_read_async_001 error package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(readLen2 == 0).assertTrue();
            sr.closeSync();
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {
          length: 5
        });
        (0, _Common.expect)(readLen == 5).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          length: 5
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_003 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == 5).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {
          offset: 5
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 5).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          offset: 5
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_005 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 5).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        const invalidLength = 4097;
        await sr.read(new ArrayBuffer(4096), {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        const invalidOffset = -1;
        sr.read(new ArrayBuffer(4096), {
          offset: invalidOffset
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {
          offset: 1,
          length: _Common.FILE_CONTENT.length
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          offset: 1,
          length: _Common.FILE_CONTENT.length
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_009 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {});
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {}, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_011 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.read();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.read("");
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read("", err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_read_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_015', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen1 = await sr.read(new ArrayBuffer(16), undefined);
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = await sr.read(new ArrayBuffer(8), undefined);
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_016', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(16), undefined, (err, readLen1) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_016 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
          sr.read(new ArrayBuffer(8), undefined, (err, readLen2) => {
            if (err) {
              console.log('fileIO_test_stream_read_async_016 error package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(readLen2 == 0).assertTrue();
            sr.closeSync();
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_017', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_017');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let readLen1 = await sr.read(new ArrayBuffer(16), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = await sr.read(new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_read_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_read_async_018', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_read_async_018');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          offset: undefined,
          length: undefined
        }, (err, readLen1) => {
          if (err) {
            console.log('fileIO_test_stream_read_async_018 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
          sr.read(new ArrayBuffer(8), {
            offset: undefined,
            length: undefined
          }, (err, readLen2) => {
            if (err) {
              console.log('fileIO_test_stream_read_async_018 error package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(readLen2 == 0).assertTrue();
            sr.closeSync();
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_stream_read_async_018 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/write.test.js":
/*!*********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/class_stream/write.test.js ***!
  \*********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOStreamWrite;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOStreamWrite() {
  (0, _Common.describe)('fileIO_fs_stream_write', function () {
    (0, _Common.it)('fileIO_test_stream_write_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten1 = sr.writeSync(_Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = sr.writeSync(new ArrayBuffer(_Common.FILE_CONTENT.length));
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(_Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(_Common.FILE_CONTENT, {
          offset: 1
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidOffset = -1;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.writeSync(new ArrayBuffer(4096), {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(_Common.FILE_CONTENT, {
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(_Common.FILE_CONTENT, {
          length: 5
        });
        (0, _Common.expect)(bytesWritten == 5).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        const invalidLength = 4097;
        sr.writeSync(new ArrayBuffer(4096), {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_007', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidLength = 9999;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.writeSync(_Common.FILE_CONTENT, {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(new ArrayBuffer(4096), {
          offset: 1,
          length: 4096,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_009', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(_Common.FILE_CONTENT, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_010', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(_Common.FILE_CONTENT, {});
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_011', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.writeSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_sync_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_012', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(new ArrayBuffer(4096), undefined);
        (0, _Common.expect)(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_sync_013', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_sync_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = sr.writeSync(new ArrayBuffer(4096), {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_stream_write_sync_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten1 = await sr.write(_Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await sr.write(new ArrayBuffer(_Common.FILE_CONTENT.length));
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, (err, bytesWritten1) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_001 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
          sr.write(new ArrayBuffer(_Common.FILE_CONTENT.length), (err, bytesWritten2) => {
            if (err) {
              console.log('fileIO_test_stream_write_async_001 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
            let readLen = sr.readSync(new ArrayBuffer(4096), {
              offset: 0
            });
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
            sr.closeSync();
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(_Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_003 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(_Common.FILE_CONTENT, {
          offset: 1
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {
          offset: 1
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_005 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidOffset = -1;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(new ArrayBuffer(4096), {
          offset: invalidOffset
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(_Common.FILE_CONTENT, {
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {
          encoding: 'utf-8'
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_008 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(_Common.FILE_CONTENT, {
          length: 5
        });
        (0, _Common.expect)(bytesWritten == 5).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {
          length: 5
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_010 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 5).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidLength = 4097;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(new ArrayBuffer(4096), {
          length: invalidLength
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      const invalidLength = 9999;
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {
          length: invalidLength
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(new ArrayBuffer(4096), {
          offset: 1,
          length: 4096,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(new ArrayBuffer(4096), {
          offset: 1,
          length: 4096,
          encoding: 'utf-8'
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_014 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 4096).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(_Common.FILE_CONTENT, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_016 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_017', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_017');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten = await sr.write(_Common.FILE_CONTENT, {});
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_018', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_018');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {}, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_018 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_019', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_019');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        await sr.write();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_stream_write_async_019 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_020', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_020');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten1 = await sr.write(_Common.FILE_CONTENT, undefined);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await sr.write(new ArrayBuffer(_Common.FILE_CONTENT.length), undefined);
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_020 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_021', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_021');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, undefined, (err, bytesWritten1) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_021 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
          sr.write(new ArrayBuffer(_Common.FILE_CONTENT.length), undefined, (err, bytesWritten2) => {
            if (err) {
              console.log('fileIO_test_stream_write_async_021 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
            let readLen = sr.readSync(new ArrayBuffer(4096), {
              offset: 0
            });
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
            sr.closeSync();
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_021 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_022', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_022');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        let bytesWritten1 = await sr.write(_Common.FILE_CONTENT, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await sr.write(new ArrayBuffer(_Common.FILE_CONTENT.length), {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_stream_write_async_022 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_stream_write_async_023', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_stream_write_async_023');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        sr.write(_Common.FILE_CONTENT, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        }, (err, bytesWritten1) => {
          if (err) {
            console.log('fileIO_test_stream_write_async_023 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
          sr.write(new ArrayBuffer(_Common.FILE_CONTENT.length), {
            offset: undefined,
            length: undefined,
            encoding: undefined
          }, (err, bytesWritten2) => {
            if (err) {
              console.log('fileIO_test_stream_write_async_023 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
            let readLen = sr.readSync(new ArrayBuffer(4096), {
              offset: 0
            });
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
            sr.closeSync();
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_stream_write_async_023 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/access.test.js":
/*!*****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/access.test.js ***!
  \*****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOAccess;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOAccess() {
  (0, _Common.describe)('fileIO_fs_access', function () {
    (0, _Common.it)('fileIO_test_access_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_access_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(fpath)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readlen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_access_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_access_sync_001');
      try {
        let ret = _Common.fileIO.accessSync(fpath);
        (0, _Common.expect)(ret === false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_access_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_sync_002', 0, async function () {
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(-1)).assertTrue();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_access_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_access_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let ret = await _Common.fileIO.access(fpath);
        (0, _Common.expect)(ret === true).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readlen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_access_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_access_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.access(fpath, (err, ret) => {
          if (err) {
            console.log('fileIO_test_access_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(ret === true).assertTrue();
          let file = _Common.fileIO.openSync(fpath);
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          let readlen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('fileIO_test_access_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_access_async_002');
      try {
        let ret = await _Common.fileIO.access(fpath);
        (0, _Common.expect)(ret === false).assertTrue();
        done();
      } catch (e) {
        console.log('fileIO_test_access_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_access_async_002');
      try {
        _Common.fileIO.access(fpath, (err, ret) => {
          if (err) {
            console.log('fileIO_test_access_async_003 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(ret === false).assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_access_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_access_async_004', 0, async function (done) {
      try {
        await _Common.fileIO.access(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_access_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_access_async_005', 0, async function (done) {
      try {
        _Common.fileIO.access(-1, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_access_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/close.test.js":
/*!****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/close.test.js ***!
  \****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOClose;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOClose() {
  (0, _Common.describe)('fileIO_fs_close', function () {
    (0, _Common.it)('fileIO_test_close_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.closeSync(file.fd);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_close_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_close_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fd = file.fd;
        _Common.fileIO.closeSync(file);
        _Common.fileIO.closeSync(fd);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_close_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.closeSync(file);
        _Common.fileIO.closeSync(file);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_close_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_sync_004', 0, function () {
      try {
        _Common.fileIO.closeSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_close_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_sync_005', 0, function () {
      try {
        _Common.fileIO.closeSync(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_close_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.close(file.fd, err => {
          if (err) {
            console.log('fileIO_test_close_async_000 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_close_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.close(file, err => {
          if (err) {
            console.log('fileIO_test_close_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_close_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.close(file.fd);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_close_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.close(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_close_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fd = file.fd;
        await _Common.fileIO.close(file);
        await _Common.fileIO.close(fd);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_close_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.close(file);
        await _Common.fileIO.close(file);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_close_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_close_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        await _Common.fileIO.close(file.fd, 2);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_close_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_007', 0, async function (done) {
      try {
        await _Common.fileIO.close(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_close_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_close_async_008', 0, async function (done) {
      try {
        await _Common.fileIO.close();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_close_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/copyDir.test.js":
/*!******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/copyDir.test.js ***!
  \******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOCopyDir;
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOCopyDir() {
  (0, _Common.describe)('fileIO_fs_copyDir', function () {
    const DIRMODE_FILE_COPY_THROW_ERR = 0;
    const DIRMODE_FILE_COPY_REPLACE = 1;
    let readyFiles = async testNum => {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/' + testNum;
      try {
        let ddpath1 = dpath + '/srcDir';
        let ddpath2 = dpath + '/destDir';
        let dddpath1 = ddpath1 + '/srcDir_first';
        let dddpath2 = ddpath2 + '/srcDir';
        let fpath1 = ddpath1 + '/srcFile_first_01';
        let fpath2 = ddpath1 + '/srcFile_first_02';
        let fpath3 = dddpath2 + '/srcFile_first_01';
        let fpath4 = dddpath2 + '/destFile_second_01';
        let ffpath1 = dddpath1 + '/srcFile_second_01';
        let ffpath2 = dddpath1 + '/srcFile_second_02';
        let ddddpath1 = dddpath1 + '/srcDir_second';
        let ddddpath2 = dddpath2 + '/srcDir_first';
        let fffpath1 = ddddpath1 + '/srcFile_third_01';
        let fffpath2 = ddddpath1 + '/srcFile_third_02';
        let fffpath3 = ddddpath2 + '/srcFile_second_01';
        let fffpath4 = ddddpath2 + '/destFile_third_01';
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.mkdirSync(ddpath1);
        _Common.fileIO.mkdirSync(ddpath2);
        _Common.fileIO.mkdirSync(dddpath1);
        _Common.fileIO.mkdirSync(dddpath2);
        _Common.fileIO.mkdirSync(ddddpath1);
        _Common.fileIO.mkdirSync(ddddpath2);
        (0, _Common.expect)((0, _Common.prepareFile)(fpath1, (0, _Common.randomString)(10))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fpath2, (0, _Common.randomString)(15))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fpath3, (0, _Common.randomString)(20))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fpath4, (0, _Common.randomString)(25))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, (0, _Common.randomString)(30))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, (0, _Common.randomString)(35))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath1, (0, _Common.randomString)(40))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, (0, _Common.randomString)(45))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath3, (0, _Common.randomString)(50))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath4, (0, _Common.randomString)(55))).assertTrue();
        return {
          baseDir: dpath,
          srcDir: ddpath1,
          destDir: ddpath2
        };
      } catch (e) {
        console.log(testNum + 'failed to readyFiles for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
        return {
          baseDir: dpath,
          srcDir: null,
          destDir: null
        };
      }
    };
    (0, _Common.it)('fileIO_test_copyDir_async_000', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_copyDir_async_000';
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
        let stat1 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        (0, _Common.expect)(stat1.size == _Common.FILE_CONTENT.length).assertTrue();
        let stat2 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        (0, _Common.expect)(stat2.size == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        (0, _Common.expect)(stat3.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_000 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_001', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_copyDir_async_001';
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_001 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
          (0, _Common.expect)(stat1.size == _Common.FILE_CONTENT.length).assertTrue();
          let stat2 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
          (0, _Common.expect)(stat2.size == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
          let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
          (0, _Common.expect)(stat3.size == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (err) {
        console.log('fileIO_test_copyDir_async_001 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_002', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_copyDir_async_002';
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      let dddpath2 = ddpath2 + '/srcDir_first';
      let fffpath2 = dddpath2 + '/destFile_second_01';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath);
      _Common.fileIO.mkdirSync(dddpath2);
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
        let stat1 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        (0, _Common.expect)(stat1.size == _Common.FILE_CONTENT.length).assertTrue();
        let stat2 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        (0, _Common.expect)(stat2.size == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        (0, _Common.expect)(stat3.size == _Common.FILE_CONTENT.length).assertTrue();
        let stat4 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
        (0, _Common.expect)(stat4.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_002 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_003', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_copyDir_async_003';
      let ddpath = dpath + '/srcDir_first';
      let ffpath = ddpath + '/srcFile_first_01';
      let ffpath2 = ddpath + '/srcFile_first_02';
      let dddpath = ddpath + '/srcDir_second';
      let fffpath = dddpath + '/srcFile_second_01';
      let ddpath2 = dpath + '/destDir_first';
      let ffpath3 = ddpath2 + '/destFile_first_01';
      let dddpath2 = ddpath2 + '/srcDir_first';
      let fffpath2 = dddpath2 + '/destFile_second_01';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath);
      _Common.fileIO.mkdirSync(dddpath2);
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_003 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
          (0, _Common.expect)(stat1.size == _Common.FILE_CONTENT.length).assertTrue();
          let stat2 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
          (0, _Common.expect)(stat2.size == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
          let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
          (0, _Common.expect)(stat3.size == _Common.FILE_CONTENT.length).assertTrue();
          let stat4 = _Common.fileIO.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
          (0, _Common.expect)(stat4.size == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (err) {
        console.log('fileIO_test_copyDir_async_003 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_004', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_004');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        await _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_004 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
        let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent2.length == 8).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertTrue();
        let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        (0, _Common.expect)(err.data.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_005', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_005');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_005 error:' + JSON.stringify(err));
            let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
              recursion: true
            });
            (0, _Common.expect)(dirent2.length == 8).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertTrue();
            let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
            let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
            let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
            let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
            (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 20).assertTrue();
            (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 50).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
            _Common.fileIO.rmdirSync(dpath.baseDir);
            (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
            (0, _Common.expect)(err.data.length == 2).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_copyDir_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_006', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_006');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        let stat1 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        await _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertTrue();
        let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent2.length == 8).assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_006 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_007', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_007');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        let stat1 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_007 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertTrue();
          let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 10).assertTrue();
          let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 30).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
          let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
            recursion: true
          });
          (0, _Common.expect)(dirent2.length == 8).assertTrue();
          _Common.fileIO.rmdirSync(dpath.baseDir);
          done();
        });
      } catch (err) {
        console.log('fileIO_test_copyDir_async_007 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_008', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_008');
      try {
        const INVALIDE_MODE = -1;
        await _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_008 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_009', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_009');
      try {
        const INVALIDE_MODE = -1;
        _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_009 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
        });
      } catch (e) {
        console.log('fileIO_test_copyDir_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_010', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_010');
      try {
        await _Common.fileIO.copyDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01');
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_010 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_011', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_011');
      try {
        _Common.fileIO.copyDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01', err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_011 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
        });
      } catch (e) {
        console.log('fileIO_test_copyDir_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_012', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_012');
      try {
        await _Common.fileIO.copyDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_COPY_REPLACE);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_012 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_013', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_013');
      try {
        _Common.fileIO.copyDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_COPY_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_013 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
        });
      } catch (e) {
        console.log('fileIO_test_copyDir_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_014', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_copyDir_async_014';
      let ddpath = dpath + '/srcDir_first';
      let dddpath = ddpath + '/srcDir_second';
      let ddddpath = dddpath + '/srcDir_third';
      let dddddpath = ddddpath + '/srcDir_fourth';
      let qfile = dddddpath + '/file.png';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(dddpath);
      _Common.fileIO.mkdirSync(ddddpath);
      _Common.fileIO.mkdirSync(dddddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(qfile, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyDir(ddpath, dddddpath, DIRMODE_FILE_COPY_REPLACE);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_014 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_015', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_copyDir_async_015';
      let ddpath = dpath + '/srcDir_first';
      let dddpath = ddpath + '/srcDir_second';
      let ddddpath = dddpath + '/srcDir_third';
      let dddddpath = ddddpath + '/srcDir_fourth';
      let qfile = dddddpath + '/file.png';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(dddpath);
      _Common.fileIO.mkdirSync(ddddpath);
      _Common.fileIO.mkdirSync(dddddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(qfile, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyDir(ddpath, dddddpath, DIRMODE_FILE_COPY_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_015 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
        });
      } catch (e) {
        console.log('fileIO_test_copyDir_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_016', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_016');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        await _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, undefined);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_copyDir_async_016 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
        let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent2.length == 8).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertTrue();
        let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        (0, _Common.expect)(err.data.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      }
    });
    (0, _Common.it)('fileIO_test_copyDir_async_017', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_copyDir_async_017');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        _Common.fileIO.copyDir(dpath.srcDir, dpath.destDir, undefined, err => {
          if (err) {
            console.log('fileIO_test_copyDir_async_017 error:' + JSON.stringify(err));
            let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
              recursion: true
            });
            (0, _Common.expect)(dirent2.length == 8).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertTrue();
            let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
            let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
            let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
            let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
            (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 20).assertTrue();
            (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 50).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
            _Common.fileIO.rmdirSync(dpath.baseDir);
            (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
            (0, _Common.expect)(err.data.length == 2).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_copyDir_async_017 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/copyFile.test.js":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/copyFile.test.js ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOCopyfile;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOCopyfile() {
  (0, _Common.describe)('fileIO_fs_copyfile', function () {
    (0, _Common.it)('fileIO_copy_file_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_000');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, fpathTarget);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
      } catch (e) {
        console.log('fileIO_copy_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_001');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.copyFileSync(file.fd, fpathTarget);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
      } catch (e) {
        console.log('fileIO_copy_file_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_002');
      let fpathTarget = fpath + 'tgt';
      try {
        _Common.fileIO.copyFileSync(fpath, fpathTarget);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_copy_file_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_003', 0, function () {
      try {
        _Common.fileIO.copyFileSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_copy_file_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_004');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, fpathTarget, '0');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_copy_file_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_005');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let fileTgt = _Common.fileIO.openSync(fpathTarget, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.copyFileSync(file.fd, fileTgt.fd);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.closeSync(fileTgt);
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
      } catch (e) {
        console.log('fileIO_copy_file_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_006');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let fileTgt = _Common.fileIO.openSync(fpathTarget, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.fileIO.copyFileSync(fpath, fileTgt.fd);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.closeSync(fileTgt);
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
      } catch (e) {
        console.log('fileIO_copy_file_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_007');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, fpathTarget, 1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_copy_file_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_008');
      let fpathTarget = fpath + (0, _Common.randomString)(250);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, fpathTarget);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_copy_file_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900030 && e.message == 'File name too long').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_sync_009', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_sync_009');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, fpathTarget, undefined);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
      } catch (e) {
        console.log('fileIO_copy_file_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_000');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyFile(fpath, fpathTarget);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        console.log('fileIO_copy_file_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_001');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget, err => {
          if (err) {
            console.log('fileIO_copy_file_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(fpath);
          let stat2 = _Common.fileIO.statSync(fpathTarget);
          (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_002');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.copyFile(file.fd, fpathTarget);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        console.log('fileIO_copy_file_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_003');
      let fpathTarget = fpath + 'tgt';
      try {
        await _Common.fileIO.copyFile(fpath, fpathTarget);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_copy_file_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_004');
      let fpathTarget = fpath + 'tgt';
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget, err => {
          if (err) {
            console.log('fileIO_copy_file_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_005');
      let fpathTarget = fpath + 'tgt';
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget).then(() => {
          (0, _Common.expect)(false).assertTrue();
        }).catch(err => {
          console.log('fileIO_copy_file_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_006');
      try {
        await _Common.fileIO.copyFile(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_copy_file_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_007');
      try {
        _Common.fileIO.copyFile(fpath, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_008');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyFile(fpath, fpathTarget, 0);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        console.log('fileIO_copy_file_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_009');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget, 0, err => {
          if (err) {
            console.log('fileIO_copy_file_async_007 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(fpath);
          let stat2 = _Common.fileIO.statSync(fpathTarget);
          (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_010');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget, 1, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_copy_file_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_011');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyFile(fpath, fpathTarget, '0');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_copy_file_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_012');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let fileTgt = _Common.fileIO.openSync(fpathTarget, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.copyFile(file.fd, fileTgt.fd);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.closeSync(fileTgt);
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        console.log('fileIO_copy_file_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_012');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let fileTgt = _Common.fileIO.openSync(fpathTarget, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.copyFile(file.fd, fileTgt.fd, err => {
          if (err) {
            console.log('fileIO_copy_file_async_013 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(fpath);
          let stat2 = _Common.fileIO.statSync(fpathTarget);
          (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.closeSync(fileTgt);
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_014');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpathTarget, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpathTarget, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.copyFile(fpath, file.fd, 0);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        console.log('fileIO_copy_file_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_014');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpathTarget, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
      try {
        _Common.fileIO.copyFile(fpath, file.fd, 0, err => {
          if (err) {
            console.log('fileIO_copy_file_async_013 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(fpath);
          let stat2 = _Common.fileIO.statSync(fpathTarget);
          (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_016');
      let fpathTarget = fpath + (0, _Common.randomString)(250);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyFile(fpath, fpathTarget);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_copy_file_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900030 && e.message == 'File name too long').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_017', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_017');
      let fpathTarget = fpath + (0, _Common.randomString)(250);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget, err => {
          if (err) {
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_copy_file_async_017 error: {message: ' + err.message + ', code: ' + err.code);
            (0, _Common.expect)(err.code == 13900030 && err.message == 'File name too long').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_018', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_018');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.copyFile(fpath, fpathTarget, undefined);
        let stat1 = _Common.fileIO.statSync(fpath);
        let stat2 = _Common.fileIO.statSync(fpathTarget);
        (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        console.log('fileIO_copy_file_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_copy_file_async_019', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_copy_file_async_019');
      let fpathTarget = fpath + 'tgt';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFile(fpath, fpathTarget, undefined, err => {
          if (err) {
            console.log('fileIO_copy_file_async_019 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat1 = _Common.fileIO.statSync(fpath);
          let stat2 = _Common.fileIO.statSync(fpathTarget);
          (0, _Common.expect)(stat1.size == stat2.size).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        console.log('fileIO_copy_file_async_019 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/createStream.test.js":
/*!***********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/createStream.test.js ***!
  \***********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOCreateStream;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOCreateStream() {
  (0, _Common.describe)('fileIO_fs_createStream', function () {
    (0, _Common.it)('fileIO_test_create_stream_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = _Common.fileIO.createStreamSync(fpath, 'r');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        sr.writeSync(_Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_create_stream_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_001');
      try {
        _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sr.writeSync(_Common.FILE_CONTENT, {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_003');
      try {
        _Common.fileIO.createStreamSync(fpath, 'r+');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.createStreamSync(fpath, 'ohos');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_005');
      try {
        _Common.fileIO.createStreamSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sw = _Common.fileIO.createStreamSync(fpath, 'w');
      try {
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sw.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_create_stream_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_007', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sw = _Common.fileIO.createStreamSync(fpath, 'w');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_008');
      try {
        let sw = _Common.fileIO.createStreamSync(fpath, 'w');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_009', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sw = _Common.fileIO.createStreamSync(fpath, 'w+');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sw.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_010', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_010');
      try {
        let sw = _Common.fileIO.createStreamSync(fpath, 'w+');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sw.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_011', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sa = _Common.fileIO.createStreamSync(fpath, 'a');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_012', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_012');
      try {
        let sa = _Common.fileIO.createStreamSync(fpath, 'a');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_013', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sa = _Common.fileIO.createStreamSync(fpath, 'a');
      try {
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sa.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_create_stream_sync_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_014', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sa = _Common.fileIO.createStreamSync(fpath, 'a+');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sa.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length * 2).assertTrue();
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_sync_015', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_sync_015');
      try {
        let sa = _Common.fileIO.createStreamSync(fpath, 'a+');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sa.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_create_stream_sync_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let sr = await _Common.fileIO.createStream(fpath, 'r');
      try {
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        sr.writeSync(_Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_create_stream_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.createStream(fpath, 'r', (err, sr) => {
          if (err) {
            console.log('fileIO_test_create_stream_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(sr !== null).assertTrue();
          (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
          sr.write(_Common.FILE_CONTENT, err => {
            if (err) {
              sr.closeSync();
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_create_stream_async_001 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900005 && err.message == 'I/O error').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_002');
      try {
        await _Common.fileIO.createStream(fpath, 'r');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_003');
      try {
        _Common.fileIO.createStream(fpath, 'r', err => {
          if (err) {
            console.log('fileIO_test_create_stream_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sr = await _Common.fileIO.createStream(fpath, 'r+');
        (0, _Common.expect)(sr !== null).assertTrue();
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sr.writeSync(_Common.FILE_CONTENT, {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.createStream(fpath, 'r+', (err, sr) => {
          if (err) {
            console.log('fileIO_test_create_stream_async_005 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(sr !== null).assertTrue();
          (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(sr.writeSync(_Common.FILE_CONTENT, {
            offset: 0
          }) == _Common.FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_006');
      try {
        await _Common.fileIO.createStream(fpath, 'r+');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_007');
      try {
        _Common.fileIO.createStream(fpath, 'r+', err => {
          console.log('fileIO_test_create_stream_async_007 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_008');
      try {
        await _Common.fileIO.createStream(fpath, 'ohos');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_009');
      try {
        await _Common.fileIO.createStream(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sw = await _Common.fileIO.createStream(fpath, 'w');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_011');
      let sw = await _Common.fileIO.createStream(fpath, 'w');
      try {
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sw.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_create_stream_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_012');
      try {
        _Common.fileIO.createStream(fpath, 'w', (err, sw) => {
          if (err) {
            console.log('fileIO_test_create_stream_async_012 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(sw !== null).assertTrue();
          (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          sw.read(new ArrayBuffer(4096), err => {
            if (err) {
              sw.closeSync();
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_create_stream_async_012 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900005 && err.message == 'I/O error').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sw = await _Common.fileIO.createStream(fpath, 'w+');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sw.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_014');
      try {
        let sw = await _Common.fileIO.createStream(fpath, 'w+');
        (0, _Common.expect)(sw !== null).assertTrue();
        (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sw.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.createStream(fpath, 'w+', (err, sw) => {
          if (err) {
            console.log('fileIO_test_create_stream_async_015 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(sw !== null).assertTrue();
          (0, _Common.expect)(sw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(sw.readSync(new ArrayBuffer(4096), {
            offset: 0
          }) == _Common.FILE_CONTENT.length).assertTrue();
          sw.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sa = await _Common.fileIO.createStream(fpath, 'a');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        let sr = _Common.fileIO.createStreamSync(fpath, 'r');
        (0, _Common.expect)(sr.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length * 2).assertTrue();
        sr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_017', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_017');
      let sa = await _Common.fileIO.createStream(fpath, 'a');
      try {
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        sa.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_create_stream_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_018', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_018');
      try {
        _Common.fileIO.createStream(fpath, 'a', (err, sa) => {
          if (err) {
            console.log('fileIO_test_create_stream_async_018 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(sa !== null).assertTrue();
          (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          sa.read(new ArrayBuffer(4096), err => {
            if (err) {
              sa.closeSync();
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_create_stream_async_018 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900005 && err.message == 'I/O error').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_019', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_019');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let sa = await _Common.fileIO.createStream(fpath, 'a+');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sa.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length * 2).assertTrue();
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_019 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_020', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_019');
      try {
        let sa = await _Common.fileIO.createStream(fpath, 'a+');
        (0, _Common.expect)(sa !== null).assertTrue();
        (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(sa.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        sa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_create_stream_async_020 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_create_stream_async_021', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_create_stream_async_021');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.createStream(fpath, 'a+', (err, sa) => {
          if (err) {
            console.log('fileIO_test_create_stream_async_021 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(sa !== null).assertTrue();
          (0, _Common.expect)(sa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(sa.readSync(new ArrayBuffer(4096), {
            offset: 0
          }) == _Common.FILE_CONTENT.length * 2).assertTrue();
          sa.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_create_stream_async_021 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fdatasync.test.js":
/*!********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fdatasync.test.js ***!
  \********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOFdatasync;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOFdatasync() {
  (0, _Common.describe)('fileIO_fs_fdatasync', async function () {
    (0, _Common.it)('fileIO_test_fdatasync_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdatasync_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.fdatasyncSync(file.fd);
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fdatasync_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_sync_001', 0, async function () {
      try {
        _Common.fileIO.fdatasyncSync(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdatasync_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_sync_002', 0, async function () {
      try {
        _Common.fileIO.fdatasyncSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdatasync_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdatasync_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.fdatasync(file.fd, err => {
          if (err) {
            console.log('fileIO_test_fdatasync_async_000 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdatasync_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.fdatasync(file.fd).then(() => {
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_test_fdatasync_async_001 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdatasync_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.fdatasync(file.fd);
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_003', 0, async function (done) {
      try {
        await _Common.fileIO.fdatasync(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_004', 0, async function (done) {
      try {
        _Common.fileIO.fdatasync(-1, err => {
          if (err) {
            console.log('fileIO_test_fdatasync_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_005', 0, async function (done) {
      try {
        _Common.fileIO.fdatasync(-1).then(() => {
          (0, _Common.expect)(false).assertTrue();
        }).catch(err => {
          console.log('fileIO_test_fdatasync_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_006', 0, async function (done) {
      try {
        await _Common.fileIO.fdatasync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdatasync_async_007', 0, async function (done) {
      try {
        _Common.fileIO.fdatasync(err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_fdatasync_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fdopenStream.test.js":
/*!***********************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fdopenStream.test.js ***!
  \***********************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOFdOpenStream;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOFdOpenStream() {
  (0, _Common.describe)('fileIO_fs_FdOpenStream', async function () {
    (0, _Common.it)('fileIO_test_fdopenstream_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
      let fpr = _Common.fileIO.fdopenStreamSync(file.fd, 'r');
      try {
        (0, _Common.expect)(fpr !== null).assertTrue();
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        fpr.writeSync(_Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_001', 0, async function () {
      try {
        _Common.fileIO.fdopenStreamSync(-1, 'r');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let fpr = _Common.fileIO.fdopenStreamSync(file.fd, 'r+');
        (0, _Common.expect)(fpr !== null).assertTrue();
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(fpr.writeSync(_Common.FILE_CONTENT, {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_003', 0, async function () {
      try {
        _Common.fileIO.fdopenStreamSync(-1, 'r+');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStreamSync(file.fd, 'ohos');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStreamSync(file.fd);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
      let fpw = _Common.fileIO.fdopenStreamSync(file.fd, 'w');
      try {
        (0, _Common.expect)(fpw !== null).assertTrue();
        (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpw.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        fpw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_007', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file1 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file1.fd)).assertTrue();
        let fpw = _Common.fileIO.fdopenStreamSync(file1.fd, 'w');
        (0, _Common.expect)(fpw !== null).assertTrue();
        (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        let file2 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        let fpr = _Common.fileIO.fdopenStreamSync(file2.fd, 'r');
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let fpw = _Common.fileIO.fdopenStreamSync(file.fd, 'w+');
        (0, _Common.expect)(fpw !== null).assertTrue();
        (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(fpw.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_009', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file1 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file1.fd)).assertTrue();
        let fpa = _Common.fileIO.fdopenStreamSync(file1.fd, 'a');
        (0, _Common.expect)(fpa !== null).assertTrue();
        (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpa.closeSync();
        let file2 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fpr = _Common.fileIO.fdopenStreamSync(file2.fd, 'r');
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length * 2).assertTrue();
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_010', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
      let fpa = _Common.fileIO.fdopenStreamSync(file.fd, 'a');
      try {
        (0, _Common.expect)(fpa !== null).assertTrue();
        (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpa.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        fpa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_sync_011', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_sync_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let fpa = _Common.fileIO.fdopenStreamSync(file.fd, 'a+');
        (0, _Common.expect)(fpa !== null).assertTrue();
        (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(fpa.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length * 2).assertTrue();
        fpa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fdopenstream_sync_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      let fpr = await _Common.fileIO.fdopenStream(file.fd, 'r');
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        (0, _Common.expect)(fpr !== null).assertTrue();
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
        fpr.writeSync(_Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStream(file.fd, 'r', (err, fpr) => {
          if (err) {
            console.log('fileIO_test_fdopenstream_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(fpr !== null).assertTrue();
          (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length).assertTrue();
          fpr.write(_Common.FILE_CONTENT, err => {
            if (err) {
              fpr.closeSync();
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_fdopenstream_async_001 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900005 && err.message == 'I/O error').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_002', 0, async function (done) {
      try {
        await _Common.fileIO.fdopenStream(-1, 'r');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_003', 0, async function (done) {
      try {
        _Common.fileIO.fdopenStream(-1, 'r', err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let fpr = await _Common.fileIO.fdopenStream(file.fd, 'r+');
        (0, _Common.expect)(fpr !== null).assertTrue();
        (0, _Common.expect)(fpr.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStream(file.fd, 'r+', (err, fpr) => {
          if (err) {
            console.log('fileIO_test_fdopenstream_async_005 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(fpr !== null).assertTrue();
          (0, _Common.expect)(fpr.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096), {
            offset: 0
          }) == _Common.FILE_CONTENT.length).assertTrue();
          fpr.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await _Common.fileIO.fdopenStream(file.fd, 'ohos');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await _Common.fileIO.fdopenStream(file.fd);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
      let fpw = await _Common.fileIO.fdopenStream(file.fd, 'w');
      try {
        (0, _Common.expect)(fpw !== null).assertTrue();
        (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpw.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        fpw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStream(file.fd, 'w', (err, fpw) => {
          if (err) {
            console.log('fileIO_test_fdopenstream_async_009 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(fpw !== null).assertTrue();
          (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          fpw.read(new ArrayBuffer(4096), err => {
            if (err) {
              fpw.closeSync();
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_fdopenstream_async_009 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900005 && err.message == 'I/O error').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file1 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fpw = await _Common.fileIO.fdopenStream(file1.fd, 'w');
        (0, _Common.expect)(fpw !== null).assertTrue();
        (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        let file2 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fpr = await _Common.fileIO.fdopenStream(file2.fd, 'r');
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let fpw = await _Common.fileIO.fdopenStream(file.fd, 'w+');
        (0, _Common.expect)(fpw !== null).assertTrue();
        (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(fpw.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStream(file.fd, 'w+', (err, fpw) => {
          if (err) {
            console.log('fileIO_test_fdopenstream_async_012 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(fpw !== null).assertTrue();
          (0, _Common.expect)(fpw.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(fpw.readSync(new ArrayBuffer(4096), {
            offset: 0
          }) == _Common.FILE_CONTENT.length).assertTrue();
          fpw.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file1 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fpa = await _Common.fileIO.fdopenStream(file1.fd, 'a');
        (0, _Common.expect)(fpa !== null).assertTrue();
        (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpa.closeSync();
        let file2 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        let fpr = await _Common.fileIO.fdopenStream(file2.fd, 'r');
        (0, _Common.expect)(fpr.readSync(new ArrayBuffer(4096)) == _Common.FILE_CONTENT.length * 2).assertTrue();
        fpr.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
      let fpa = await _Common.fileIO.fdopenStream(file.fd, 'a');
      try {
        (0, _Common.expect)(fpa !== null).assertTrue();
        (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        fpa.readSync(new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        fpa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_fdopenstream_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
      try {
        _Common.fileIO.fdopenStream(file.fd, 'a', (err, fpa) => {
          if (err) {
            console.log('fileIO_test_fdopenstream_async_015 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(fpa !== null).assertTrue();
          (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          fpa.read(new ArrayBuffer(4096), err => {
            if (err) {
              fpa.closeSync();
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_fdopenstream_async_015 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900005 && err.message == 'I/O error').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let fpa = await _Common.fileIO.fdopenStream(file.fd, 'a+');
        (0, _Common.expect)(fpa !== null).assertTrue();
        (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        (0, _Common.expect)(fpa.readSync(new ArrayBuffer(4096), {
          offset: 0
        }) == _Common.FILE_CONTENT.length * 2).assertTrue();
        fpa.closeSync();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fdopenstream_async_017', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fdopenstream_async_017');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.fdopenStream(file.fd, 'a+', (err, fpa) => {
          if (err) {
            console.log('fileIO_test_fdopenstream_async_017 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(fpa !== null).assertTrue();
          (0, _Common.expect)(fpa.writeSync(_Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
          (0, _Common.expect)(fpa.readSync(new ArrayBuffer(4096), {
            offset: 0
          }) == _Common.FILE_CONTENT.length * 2).assertTrue();
          fpa.closeSync();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_fdopenstream_async_017 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fileLock.test.js":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fileLock.test.js ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOFileLock;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOFileLock() {
  (0, _Common.describe)('fileIO_fs_file_lock', function () {
    (0, _Common.it)('fileIO_test_filelock_promise_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock(true);
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock(false);
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock();
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock(true);
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock(false);
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.tryLock();
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_008', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock(undefined);
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_009', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock(undefined);
        file.unlock();
        (0, _Common.expect)(true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_filelock_promise_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock(null);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock(true, true);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock(null);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock(true, true);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_promise_abnormal_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_promise_abnormal_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await file.lock();
        file.tryLock();
        file.unlock(true);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_promise_abnormal_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(err => {
          if (err) {
            console.log('fileIO_test_filelock_callback_000 err ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          file.unlock();
          (0, _Common.expect)(true).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_filelock_callback_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(true, err => {
          if (err) {
            console.log('fileIO_test_filelock_callback_001 err ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          file.unlock();
          (0, _Common.expect)(true).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_filelock_callback_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(false, err => {
          if (err) {
            console.log('fileIO_test_filelock_callback_002 err ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          file.unlock();
          (0, _Common.expect)(true).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_filelock_callback_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_003', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(undefined, err => {
          if (err) {
            console.log('fileIO_test_filelock_callback_003 err ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          file.unlock();
          (0, _Common.expect)(true).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_filelock_callback_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_abnormal_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_abnormal_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(null, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_callback_abnormal_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_abnormal_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_abnormal_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(true, true, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_callback_abnormal_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_filelock_callback_abnormal_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_filelock_callback_abnormal_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        file.lock(-1, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_filelock_callback_abnormal_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/filerw.test.js":
/*!*****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/filerw.test.js ***!
  \*****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = FileIOFilerw_test;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
const RAND_READ_BASELINE = 3.5;
const RAND_WRITE_BASELINE = 0.5;
const SEQUENCE_READ_BASELINE = 15;
const SEQUENCE_WRITE_BASELINE = 5;
function FileIOFilerw_test() {
  (0, _Common.describe)('FileIO_fs_filerw_test', function () {
    async function IOfunc(file, bf, total, rand, read, promise) {
      let date = new Date();
      let startTime = new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds(), date.getUTCMilliseconds()).getTime();
      try {
        var array = new ArrayBuffer(bf);
        var count = total / bf;
        for (let i = 0; i < count; i++) {
          var offset = i * bf;
          if (rand) {
            offset = Math.floor(Math.random() * (total - bf));
          }
          if (promise) {
            if (read) {
              _Common.fileIO.read(file.fd, array, {
                length: bf,
                offset: offset
              }).then(readLen => {}).catch(e => {
                console.log('fileIO_test_read_promise has failed for ' + e.message + ', code: ' + e.code);
                return -1;
              });
            } else {
              _Common.fileIO.write(file.fd, array, {
                length: bf,
                offset: offset,
                encoding: 'utf-8'
              }).then(writeLen => {}).catch(e => {
                console.log('fileIO_test_write_promise has failed for ' + e.message + ', code: ' + e.code);
                return -1;
              });
            }
          } else {
            if (read) {
              _Common.fileIO.read(file.fd, array, {
                length: bf,
                offset: offset
              }, (err, readLen) => {
                if (err) {
                  console.log('fileIO_test_read_callback has failed for ' + err.message + ', code: ' + err.code);
                  return -1;
                }
              });
            } else {
              _Common.fileIO.write(file.fd, array, {
                length: bf,
                offset: offset,
                encoding: 'utf-8'
              }, (err, writeLen) => {
                if (err) {
                  console.log('fileIO_test_write_callback has failed for ' + err.message + ', code: ' + err.code);
                  return -1;
                }
              });
            }
          }
        }
        _Common.fileIO.fsyncSync(file.fd);
      } catch (e) {
        console.log('FileIO_fs_filerw_test has failed for ' + e.message + ', code: ' + e.code);
      } finally {
        date = new Date();
        let endTime = new Date(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds(), date.getUTCMilliseconds()).getTime();
        console.log("FileIO_fs_filerw_test finally" + JSON.stringify(endTime));
        var interval = endTime - startTime;
        var average = total * 1000 / interval;
        var averagerate = average / 0x100000;
        return averagerate;
      }
    }
    (0, _Common.it)('fileIO_test_read_random_promise_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_random_promise_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, true, true, true);
        console.log("RAND_READ Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > RAND_READ_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_random_promise_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_random_promise_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_random_promise_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, true, false, true);
        console.log("RAND_WRITE Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > RAND_WRITE_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_random_promise_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sequence_promise_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sequence_promise_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, false, true, true);
        console.log("SEQUENCE_READ Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > SEQUENCE_READ_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_sequence_promise_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sequence_promise_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sequence_promise_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, false, false, true);
        console.log("SEQUENCE_WRITE Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > SEQUENCE_WRITE_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_sequence_promise_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_random_callback_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_random_callback_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, true, true, false);
        console.log("RAND_READ Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > RAND_READ_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_random_callback_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_random_callback_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_random_callback_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, true, false, false);
        console.log("RAND_WRITE Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > RAND_WRITE_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_random_callback_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sequence_callback_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sequence_callback_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, false, true, false);
        console.log("SEQUENCE_READ Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > SEQUENCE_READ_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_sequence_callback_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sequence_callback_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sequence_callback_000');
      (0, _Common.expect)((0, _Common.prepare200MFile)(fpath)).assertTrue;
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let averagerate = await IOfunc(file, 0x1000, 0xC800000, false, false, false);
        console.log("SEQUENCE_WRITE Rate is" + averagerate + "M/s");
        (0, _Common.expect)(averagerate > SEQUENCE_WRITE_BASELINE).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_sequence_callback_000 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fsync.test.js":
/*!****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/fsync.test.js ***!
  \****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOFsync;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOFsync() {
  (0, _Common.describe)('fileIO_fs_fsync', function () {
    (0, _Common.it)('fileIO_test_fsync_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fsync_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.fsyncSync(file.fd);
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_fsync_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_sync_001', 0, function () {
      try {
        _Common.fileIO.fsyncSync(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fsync_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_sync_002', 0, function () {
      try {
        _Common.fileIO.fsyncSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fsync_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fsync_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        await _Common.fileIO.fsync(file.fd);
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_fsync_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fsync_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.fsync(file.fd).then(() => {
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_test_fsync_async_001 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_fsync_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_fsync_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        _Common.fileIO.fsync(file.fd, err => {
          if (err) {
            console.log('fileIO_test_fsync_async_002 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('fileIO_test_fsync_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_003', 0, async function (done) {
      try {
        await _Common.fileIO.fsync(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fsync_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_004', 0, async function (done) {
      try {
        _Common.fileIO.fsync(-1, err => {
          if (err) {
            console.log('fileIO_test_fsync_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_fsync_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_005', 0, async function (done) {
      try {
        _Common.fileIO.fsync(-1).then(() => {
          (0, _Common.expect)(false).assertTrue();
        }).catch(err => {
          console.log('fileIO_test_fsync_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_fsync_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_006', 0, async function (done) {
      try {
        await _Common.fileIO.fsync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_fsync_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_fsync_async_007', 0, async function (done) {
      try {
        _Common.fileIO.fsync(err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_fsync_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/hash.test.js":
/*!***************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/hash.test.js ***!
  \***************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOHash;
var _ohosFile = _interopRequireDefault(requireModule("@ohos.file.hash"));
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOHash() {
  (0, _Common.describe)('fileIO_fs_hash', function () {
    (0, _Common.it)('fileIO_test_hash_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _ohosFile.default.hash(fpath, 'md5');
        console.log('fileIO_test_hash_async_000 hash value is ' + str);
        (0, _Common.expect)(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_hash_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _ohosFile.default.hash(fpath, 'md5', (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          console.log('fileIO_test_hash_async_001 hash value is ' + str);
          (0, _Common.expect)(str == '5EB63BBBE01EEED093CB22BB8F5ACDC3').assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_hash_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _ohosFile.default.hash(fpath, 'sha1');
        console.log('fileIO_test_hash_async_000 hash value is ' + str);
        (0, _Common.expect)(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_hash_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _ohosFile.default.hash(fpath, 'sha1', (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_async_003 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          console.log('fileIO_test_hash_async_003 hash value is ' + str);
          (0, _Common.expect)(str == '2AAE6C35C94FCFB415DBE95F408B9CE91EE846ED').assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_hash_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _ohosFile.default.hash(fpath, 'sha256');
        console.log('fileIO_test_hash_async_001 hash value is ' + str);
        (0, _Common.expect)(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_hash_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _ohosFile.default.hash(fpath, 'sha256', (err, str) => {
          if (err) {
            console.log('fileIO_test_hash_async_005 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          console.log('fileIO_test_hash_async_005 hash value is ' + str);
          (0, _Common.expect)(str == 'B94D27B9934D3E08A52E52D7DA7DABFAC484EFE37A5380EE9088F7ACE2EFCDE9').assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_hash_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _ohosFile.default.hash(fpath, '256');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_hash_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_hash_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_hash_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _ohosFile.default.hash(fpath, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_hash_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/listFile.test.js":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/listFile.test.js ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOListfile;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOListfile() {
  (0, _Common.describe)('fileIO_fs_listfile', function () {
    (0, _Common.it)('fileIO_test_listfile_sync_000', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_000');
      let fpath1 = dpath + '/listfile_sync_000.txt';
      let fpath2 = dpath + '/listfile_sync_000.doc';
      let fpath3 = dpath + '/listfile_sync_000.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = _Common.fileIO.listFileSync(dpath);
        (0, _Common.expect)(dirents.length == 3).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_000 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_001', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_001');
      let fpath1 = dpath + '/listfile_sync_001.txt';
      let fpath2 = dpath + '/listfile_sync_001.doc';
      let fpath3 = dpath + '/listfile_sync_001.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: 2,
          recursion: false
        });
        (0, _Common.expect)(dirents.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_001 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_002', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_002');
      let fpath1 = dpath + '/listfile_sync_002.txt';
      let fpath2 = dpath + '/listfile_sync_002.doc';
      let fpath3 = dpath + '/listfile_sync_002.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = _Common.fileIO.listFileSync(dpath, {
          recursion: false,
          filter: {
            suffix: [".txt", ".doc", ".png"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 3).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_002 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_003', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_003');
      let fpath1 = dpath + '/listfile_sync_003.txt';
      let fpath2 = dpath + '/listfile_sync_003.doc';
      let fpath3 = dpath + '/listfile_sync_003.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: 4,
          recursion: false,
          filter: {
            displayName: ["*listfile*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 3).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_003 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_004', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_004');
      let fpath1 = dpath + '/listfile_sync_004.txt';
      let fpath2 = dpath + '/listfile_sync_004.doc';
      let fpath3 = dpath + '/listfile_sync_004.png';
      let ddpath = dpath + '/kids';
      let ffpath1 = ddpath + '/firstc.txt';
      let ffpath2 = ddpath + '/firsta.txt';
      let ffpath3 = ddpath + '/aabbcc.hap';
      let dddpath = ddpath + '/' + (0, _Common.randomString)(5);
      let fffpath1 = dddpath + '/makef.doc';
      let fffpath2 = dddpath + '/akasd.txt';
      let fffpath3 = dddpath + '/tdd.log';
      let fffpath4 = dddpath + '/tdd.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: 6,
          recursion: true,
          filter: {
            suffix: [".txt", ".doc"],
            displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 6).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_004 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_005', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_005');
      let fpath1 = dpath + '/listfile_sync_005.txt';
      let fpath2 = dpath + '/listfile_sync_005.doc';
      let fpath3 = dpath + '/listfile_sync_005.png';
      let fpath4 = dpath + '/timer.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*", "*time*"],
            fileSizeOver: 4,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_005 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_006', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_006');
      let fpath1 = dpath + '/listfile_sync_006.txt';
      let fpath2 = dpath + '/listfile_sync_006.doc';
      let fpath3 = dpath + '/listfile_sync_006.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFileSync(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: ["%.txt%"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_listfile_sync_006 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_007', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_007');
      let fpath1 = dpath + '/listfile_sync_007.txt';
      let fpath2 = dpath + '/listfile_sync_007.doc';
      let fpath3 = dpath + '/listfile_sync_007.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*"],
            fileSizeOver: 12,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 0).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_007 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_008', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_008');
      let fpath1 = dpath + '/listfile_sync_008.txt';
      let fpath2 = dpath + '/listfile_sync_008.doc';
      let fpath3 = dpath + '/listfile_sync_008.png';
      let fpath4 = dpath + '/trespass.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: 0,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*", "*trespass*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_008 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_009', 0, async function () {
      try {
        _Common.fileIO.listFileSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_listfile_sync_009 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_010', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_010');
      let fpath1 = dpath + '/listfile_sync_009.txt';
      let fpath2 = dpath + '/listfile_sync_009.doc';
      let fpath3 = dpath + '/listfile_sync_009.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.listFileSync(dpath, 4);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_listfile_sync_010 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_011', 3, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_011');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_sync_010.txt';
      let fpath2 = dpath + '/listfile_sync_010.doc';
      let fpath3 = dpath + '/listfile_sync_010.png';
      let ffpath1 = ddpath + '/listfile_sync_second_010.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_010.doc';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = _Common.fileIO.listFileSync(dpath, {
          listNum: undefined,
          recursion: undefined,
          filter: {
            displayName: undefined,
            fileSizeOver: undefined,
            lastModifiedAfter: undefined
          }
        });
        (0, _Common.expect)(dirents.length == 4).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_011 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_sync_012', 3, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_sync_012');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_sync_011.txt';
      let fpath2 = dpath + '/listfile_sync_011.doc';
      let fpath3 = dpath + '/listfile_sync_011.png';
      let ffpath1 = ddpath + '/listfile_sync_second_011.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_011.doc';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = _Common.fileIO.listFileSync(dpath, undefined);
        (0, _Common.expect)(dirents.length == 4).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (err) {
        console.log('fileIO_test_listfile_sync_012 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_000', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_000');
      let fpath1 = dpath + '/listfile_async_000.txt';
      let fpath2 = dpath + '/listfile_async_000.doc';
      let fpath3 = dpath + '/listfile_async_000.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.listFile(dpath, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_000 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 3).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_000 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_001', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_001');
      let fpath1 = dpath + '/listfile_async_001.txt';
      let fpath2 = dpath + '/listfile_async_001_1.doc';
      let fpath3 = dpath + '/listfile_async_001.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = await _Common.fileIO.listFile(dpath);
        (0, _Common.expect)(dirents.length == 3).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_001 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_002', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_002');
      let fpath1 = dpath + '/listfile_async_002.txt';
      let fpath2 = dpath + '/listfile_async_002.doc';
      let fpath3 = dpath + '/listfile_async_002.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.listFile(dpath, {
          listNum: 2,
          recursion: false
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_002 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 2).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_002 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_003', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_003');
      let fpath1 = dpath + '/listfile_async_003.txt';
      let fpath2 = dpath + '/listfile_async_003.doc';
      let fpath3 = dpath + '/listfile_async_003.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: 2,
          recursion: false
        });
        (0, _Common.expect)(dirents.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_003 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_004', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_004');
      let fpath1 = dpath + '/listfile_async_004.txt';
      let fpath2 = dpath + '/listfile_async_004.doc';
      let fpath3 = dpath + '/listfile_async_004.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          recursion: false,
          filter: {
            suffix: [".txt", ".doc", ".png"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_004 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 3).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_004 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_005', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_005');
      let fpath1 = dpath + '/listfile_async_005.txt';
      let fpath2 = dpath + '/listfile_async_005.doc';
      let fpath3 = dpath + '/listfile_async_005.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = await _Common.fileIO.listFile(dpath, {
          recursion: false,
          filter: {
            suffix: [".txt", ".doc", ".png"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 3).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_005 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_006', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_006');
      let fpath1 = dpath + '/listfile_async_006.txt';
      let fpath2 = dpath + '/listfile_async_006.doc';
      let fpath3 = dpath + '/listfile_async_006.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          listNum: 4,
          recursion: false,
          filter: {
            displayName: ["*listfile*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_006 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 3).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_006 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_007', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_007');
      let fpath1 = dpath + '/listfile_async_007.txt';
      let fpath2 = dpath + '/listfile_async_007.doc';
      let fpath3 = dpath + '/listfile_async_007.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: 4,
          recursion: false,
          filter: {
            displayName: ["*listfile*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 3).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_007 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_008', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_008');
      let fpath1 = dpath + '/listfile_async_008.txt';
      let fpath2 = dpath + '/listfile_async_008.doc';
      let fpath3 = dpath + '/listfile_async_008.png';
      let ddpath = dpath + '/kids';
      let ffapth1 = ddpath + '/firstc.txt';
      let ffapth2 = ddpath + '/firsta.txt';
      let ffapth3 = ddpath + '/aabbcc.hap';
      let dddpath = ddpath + '/' + (0, _Common.randomString)(5);
      let fffpath1 = dddpath + '/makef.doc';
      let fffpath2 = dddpath + '/akasd.txt';
      let fffpath3 = dddpath + '/tdd.log';
      let fffpath4 = dddpath + '/tdd.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          listNum: 6,
          recursion: true,
          filter: {
            suffix: [".txt", ".doc"],
            displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_008 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 6).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_008 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_009', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_009');
      let fpath1 = dpath + '/listfile_async_009.txt';
      let fpath2 = dpath + '/listfile_async_009.doc';
      let fpath3 = dpath + '/listfile_async_009.png';
      let ddpath = dpath + '/kids';
      let ffapth1 = ddpath + '/firstc.txt';
      let ffapth2 = ddpath + '/firsta.txt';
      let ffapth3 = ddpath + '/aabbcc.hap';
      let dddpath = ddpath + '/' + (0, _Common.randomString)(5);
      let fffpath1 = dddpath + '/makef.doc';
      let fffpath2 = dddpath + '/akasd.txt';
      let fffpath3 = dddpath + '/tdd.log';
      let fffpath4 = dddpath + '/tdd.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: 6,
          recursion: true,
          filter: {
            suffix: [".txt", ".doc"],
            displayName: ["*listfile*", "*first*", "*akasd*", "*tdd*", "*makef*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 6).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_009 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_010', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_010');
      let fapth1 = dpath + '/listfile_async_010.txt';
      let fapth2 = dpath + '/listfile_async_010.doc';
      let fapth3 = dpath + '/listfile_async_010.png';
      let fapth4 = dpath + '/timer.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*", "*time*"],
            fileSizeOver: 4,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_010 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 2).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_010 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_011', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_011');
      let fapth1 = dpath + '/listfile_async_011.txt';
      let fapth2 = dpath + '/listfile_async_011.doc';
      let fapth3 = dpath + '/listfile_async_011.png';
      let fapth4 = dpath + '/timer.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*", "*time*"],
            fileSizeOver: 4,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_011 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_012', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_012');
      let fapth1 = dpath + '/listfile_async_012.txt';
      let fapth2 = dpath + '/listfile_async_012.doc';
      let fapth3 = dpath + '/listfile_async_012.png';
      let fapth4 = dpath + '/timer.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: ["%.txt%"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_listfile_async_012 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_013', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_013');
      let fapth1 = dpath + '/listfile_async_013.txt';
      let fapth2 = dpath + '/listfile_async_013.doc';
      let fapth3 = dpath + '/listfile_async_013.png';
      let fapth4 = dpath + '/timer.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        await _Common.fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: ["%.txt%"],
            displayName: ["*listfile*"],
            fileSizeOver: 0,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_listfile_async_013 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_014', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_014');
      let fapth1 = dpath + '/listfile_async_014.txt';
      let fapth2 = dpath + '/listfile_async_014.doc';
      let fapth3 = dpath + '/listfile_async_014.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*"],
            fileSizeOver: 12,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_014 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 0).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_014 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_015', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_015');
      let fapth1 = dpath + '/listfile_async_015.txt';
      let fapth2 = dpath + '/listfile_async_015.doc';
      let fapth3 = dpath + '/listfile_async_015.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: 3,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*"],
            fileSizeOver: 12,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 0).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_015 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_016', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_016');
      let fapth1 = dpath + '/listfile_async_016.txt';
      let fapth2 = dpath + '/listfile_async_016.doc';
      let fapth3 = dpath + '/listfile_async_016.png';
      let fapth4 = dpath + '/trespass.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        _Common.fileIO.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*", "*trespass*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_016 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 2).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (err) {
        console.log('fileIO_test_listfile_async_016 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_017', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_017');
      let fapth1 = dpath + '/listfile_async_017.txt';
      let fapth2 = dpath + '/listfile_async_017.doc';
      let fapth3 = dpath + '/listfile_async_017.png';
      let fapth4 = dpath + '/trespass.txt';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth4, _Common.FILE_CONTENT)).assertTrue();
      try {
        let time = new Date().getTime() / 1000;
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: 0,
          recursion: false,
          filter: {
            suffix: [".txt"],
            displayName: ["*listfile*", "*trespass*"],
            fileSizeOver: 5,
            lastModifiedAfter: time - 3
          }
        });
        (0, _Common.expect)(dirents.length == 2).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_017 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_018', 0, async function (done) {
      try {
        await _Common.fileIO.listFile();
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_listfile_async_018 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_019', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_019');
      let fapth1 = dpath + '/listfile_async_019.txt';
      let fapth2 = dpath + '/listfile_async_019.doc';
      let fapth3 = dpath + '/listfile_async_019.png';
      _Common.fileIO.mkdirSync(dpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fapth1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fapth3, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.listFile(dpath, 4);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_listfile_async_019 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_020', 3, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_020');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_async_020.txt';
      let fpath2 = dpath + '/listfile_async_020.doc';
      let fpath3 = dpath + '/listfile_async_020.png';
      let ffpath1 = ddpath + '/listfile_sync_second_020.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_020.doc';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.listFile(dpath, {
          listNum: undefined,
          recursion: undefined,
          filter: {
            displayName: undefined,
            fileSizeOver: undefined,
            lastModifiedAfter: undefined
          }
        }, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_020 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 4).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_020 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_021', 3, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_021');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_async_021.txt';
      let fpath2 = dpath + '/listfile_async_021.doc';
      let fpath3 = dpath + '/listfile_async_021.png';
      let ffpath1 = ddpath + '/listfile_sync_second_021.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_021.doc';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.listFile(dpath, undefined, (err, dirents) => {
          if (err) {
            console.log('fileIO_test_listfile_async_021 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(dirents.length == 4).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
        });
      } catch (e) {
        console.log('fileIO_test_listfile_async_021 has failed for ' + e.message + ', code:' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_022', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_022');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_async_022.txt';
      let fpath2 = dpath + '/listfile_async_022.doc';
      let fpath3 = dpath + '/listfile_async_022.png';
      let ffpath1 = ddpath + '/listfile_sync_second_022.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_022.doc';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = await _Common.fileIO.listFile(dpath, {
          listNum: undefined,
          recursion: undefined,
          filter: {
            displayName: undefined,
            fileSizeOver: undefined,
            lastModifiedAfter: undefined
          }
        });
        (0, _Common.expect)(dirents.length == 4).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_022 has failed for ' + err.message + ', code:' + err.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_listfile_async_023', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_listfile_async_023');
      let ddpath = dpath + '/second_dir';
      let fpath1 = dpath + '/listfile_async_023.txt';
      let fpath2 = dpath + '/listfile_async_023.doc';
      let fpath3 = dpath + '/listfile_async_023.png';
      let ffpath1 = ddpath + '/listfile_sync_second_023.txt';
      let ffpath2 = ddpath + '/listfile_sync_second_023.doc';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath3, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, _Common.FILE_CONTENT)).assertTrue();
      try {
        let dirents = await _Common.fileIO.listFile(dpath, undefined);
        (0, _Common.expect)(dirents.length == 4).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (err) {
        console.log('fileIO_test_listfile_async_023 has failed for ' + err.message + ', code:' + err.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/lstat.test.js":
/*!****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/lstat.test.js ***!
  \****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOLstat;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOLstat() {
  (0, _Common.describe)('fileIO_fs_lstat', function () {
    (0, _Common.it)('fileIO_lstat_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat !== null).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_sync_001');
      try {
        _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_lstat_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_sync_002', 0, async function () {
      try {
        _Common.fileIO.lstatSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_lstat_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_ino_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_ino_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isBigInt)(stat.ino)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_ino_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_mode_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_mode_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mode)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_mode_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_uid_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_uid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.uid)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_uid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_gid_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_gid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.gid)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_gid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_size_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_size_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_size_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_atime_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_atime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.atime)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_atime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_mtime_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_mtime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mtime)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_ctime_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_ctime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.ctime)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_block_device_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_block_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isBlockDevice() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_lstat_is_block_device_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_lstat_is_block_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstatSync(fpath).isBlockDevice(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_lstat_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_character_device_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_character_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isCharacterDevice() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_lstat_is_character_device_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_lstat_is_character_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstatSync(fpath).isCharacterDevice(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_lstat_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_directory_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_directory_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isDirectory() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_directory_001', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_lstat_is_directory_001')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = _Common.fileIO.lstatSync(dpath);
        (0, _Common.expect)(stat.isDirectory() === true).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_lstat_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_directory_002', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_lstat_is_directory_002')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.lstatSync(dpath).isDirectory(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_lstat_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_fifo_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_fifo_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isFIFO() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_lstat_is_fifo_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_lstat_is_fifo_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstatSync(fpath).isFIFO(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_lstat_is_fifo_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_file_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_file_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isFile() === true).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_file_001', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_lstat_is_file_001');
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = _Common.fileIO.lstatSync(dpath);
        (0, _Common.expect)(stat.isFile() === false).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_lstat_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_lstat_is_file_002', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_lstat_is_file_002');
      try {
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.lstatSync(dpath).isFile(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_lstat_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_socket_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_socket_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isSocket() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_lstat_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_socket_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_socket_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstatSync(fpath).isSocket(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_lstat_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_symbolic_link_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_symbolic_link_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.isSymbolicLink() === false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_lstat_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_is_symbolic_link_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_is_symbolic_link_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstatSync(fpath).isSymbolicLink(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_lstat_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath).then(stat => {
          (0, _Common.expect)(stat !== null).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_lstat_async_000 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, err => {
          if (err) {
            console.log('fileIO_lstat_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat !== null).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_003');
      try {
        _Common.fileIO.lstat(fpath, err => {
          if (err) {
            console.log('fileIO_lstat_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_lstat_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_004');
      try {
        await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_lstat_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_ino_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_ino_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isBigInt)(stat.ino)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_ino_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_ino_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_ino_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_ino_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isBigInt)(stat.ino)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_ino_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_mode_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_mode_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mode)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_mode_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_mode_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_mode_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.mode)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_uid_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_uid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.uid)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_uid_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_uid_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_uid_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.uid)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_gid_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_gid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.gid)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_gid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_gid_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_gid_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_gid_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.gid)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_gid_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_size_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_size_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_size_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_size_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_size_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_atime_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_atime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.atime)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_atime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_atime_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_atime_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_atime_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.atime)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_atime_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_mtime_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_mtime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mtime)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_mtime_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_mtime_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_mtime_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.mtime)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_mtime_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_ctime_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_ctime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.ctime)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_ctime_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_ctime_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_ctime_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.ctime)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_block_device_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_block_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isBlockDevice() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_block_device_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_block_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_block_device_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isBlockDevice() === false).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_character_device_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_character_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isCharacterDevice() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_character_device_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_character_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_character_device_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isCharacterDevice() === false).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_directory_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_directory_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isDirectory() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_directory_001', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_lstat_async_is_directory_001')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = await _Common.fileIO.lstat(dpath);
        (0, _Common.expect)(stat.isDirectory() === true).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_directory_002', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_lstat_async_is_directory_002')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.lstat(dpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_directory_002 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isDirectory() === true).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_fifo_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_fifo_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isFIFO() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_fifo_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_fifo_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_character_device_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isFIFO() === false).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_file_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_file_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isFile() === true).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_file_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_file_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_file_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isFile() === true).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_file_002', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_file_002');
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = await _Common.fileIO.lstat(dpath);
        (0, _Common.expect)(stat.isFile() === false).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_socket_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_socket_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isSocket() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_socket_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_socket_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_socket_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isSocket() === false).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_symbolic_link_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_symbolic_link_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.lstat(fpath);
        (0, _Common.expect)(stat.isSymbolicLink() === false).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_lstat_async_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_lstat_async_is_symbolic_link_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_lstat_async_is_symbolic_link_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.lstat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_lstat_async_is_symbolic_link_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isSymbolicLink() === false).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_lstat_async_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_append_file_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_append_file_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.APPEND | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        stat = _Common.fileIO.lstatSync(fpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_append_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/mkdir.test.js":
/*!****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/mkdir.test.js ***!
  \****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOMkdir;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOMkdir() {
  (0, _Common.describe)('fileIO_fs_mkdir', function () {
    (0, _Common.it)('fileIO_test_mkdir_sync_000', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_mkdir_sync_000')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_test_mkdir_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_sync_001', 0, async function () {
      try {
        _Common.fileIO.mkdirSync('/');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdir_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_sync_002', 0, async function () {
      try {
        _Common.fileIO.mkdirSync('');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdir_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_mkdir_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.mkdirSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdir_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_async_000', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_mkdir_async_000')) + 'd';
      try {
        await _Common.fileIO.mkdir(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_mkdir_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_async_001', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_mkdir_async_001')) + 'd';
      try {
        _Common.fileIO.mkdir(dpath, err => {
          if (err) {
            console.log('fileIO_test_mkdir_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_mkdir_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_async_002', 0, async function (done) {
      try {
        await _Common.fileIO.mkdir();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdir_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_async_003', 0, async function (done) {
      try {
        _Common.fileIO.mkdir('/', err => {
          if (err) {
            console.log('fileIO_test_mkdir_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_mkdir_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdir_async_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_mkdir_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.mkdirSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdir_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900015 && e.message == 'File exists').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/mkdtemp.test.js":
/*!******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/mkdtemp.test.js ***!
  \******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOMkdtemp;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOMkdtemp() {
  (0, _Common.describe)('fileIO_fs_mkdtemp', function () {
    (0, _Common.it)('fileIO_test_mkdtemp_sync_000', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_mkdtemp_sync_000');
      try {
        dpath = dpath + 'XXXXXX';
        let res = _Common.fileIO.mkdtempSync(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(res)).assertTrue();
        _Common.fileIO.rmdirSync(res);
      } catch (e) {
        console.log('fileIO_test_mkdtemp_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_sync_001', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_mkdtemp_sync_000');
      try {
        _Common.fileIO.mkdtempSync(dpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdtemp_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_sync_002', 0, async function () {
      try {
        _Common.fileIO.mkdtempSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdtemp_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_async_000', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_mkdtemp_async_000');
      try {
        dpath = dpath + 'XXXXXX';
        let res = await _Common.fileIO.mkdtemp(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(res)).assertTrue();
        _Common.fileIO.rmdirSync(res);
        done();
      } catch (e) {
        console.log('fileIO_test_mkdtemp_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_async_001', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_mkdtemp_async_001');
      try {
        dpath = dpath + 'XXXXXX';
        _Common.fileIO.mkdtemp(dpath, (err, res) => {
          if (err) {
            console.log('fileIO_test_mkdtemp_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(res)).assertTrue();
          _Common.fileIO.rmdirSync(res);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_mkdtemp_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_async_002', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_mkdtemp_async_002');
      try {
        await _Common.fileIO.mkdtemp(dpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdtemp_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_async_003', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_mkdtemp_async_003');
      try {
        _Common.fileIO.mkdtemp(dpath, err => {
          if (err) {
            console.log('fileIO_test_mkdtemp_async_003 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_mkdtemp_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_mkdtemp_async_004', 0, async function (done) {
      try {
        await _Common.fileIO.mkdtemp();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mkdtemp_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/moveDir.test.js":
/*!******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/moveDir.test.js ***!
  \******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOMoveDir;
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOMoveDir() {
  (0, _Common.describe)('fileIO_fs_moveDir', function () {
    const DIRMODE_DIRECTORY_THROW_ERR = 0;
    const DIRMODE_FILE_THROW_ERR = 1;
    const DIRMODE_FILE_REPLACE = 2;
    const DIRMODE_DIRECTORY_REPLACE = 3;
    let readyFiles = async testNum => {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/' + testNum;
      try {
        let ddpath1 = dpath + '/srcDir';
        let ddpath2 = dpath + '/destDir';
        let dddpath1 = ddpath1 + '/srcDir_first';
        let dddpath2 = ddpath2 + '/srcDir';
        let fpath1 = ddpath1 + '/srcFile_first_01';
        let fpath2 = ddpath1 + '/srcFile_first_02';
        let fpath3 = dddpath2 + '/srcFile_first_01';
        let fpath4 = dddpath2 + '/destFile_second_01';
        let ffpath1 = dddpath1 + '/srcFile_second_01';
        let ffpath2 = dddpath1 + '/srcFile_second_02';
        let ddddpath1 = dddpath1 + '/srcDir_second';
        let ddddpath2 = dddpath2 + '/srcDir_first';
        let fffpath1 = ddddpath1 + '/srcFile_third_01';
        let fffpath2 = ddddpath1 + '/srcFile_third_02';
        let fffpath3 = ddddpath2 + '/srcFile_second_01';
        let fffpath4 = ddddpath2 + '/destFile_third_01';
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.mkdirSync(ddpath1);
        _Common.fileIO.mkdirSync(ddpath2);
        _Common.fileIO.mkdirSync(dddpath1);
        _Common.fileIO.mkdirSync(dddpath2);
        _Common.fileIO.mkdirSync(ddddpath1);
        _Common.fileIO.mkdirSync(ddddpath2);
        (0, _Common.expect)((0, _Common.prepareFile)(fpath1, (0, _Common.randomString)(10))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fpath2, (0, _Common.randomString)(15))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fpath3, (0, _Common.randomString)(20))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fpath4, (0, _Common.randomString)(25))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, (0, _Common.randomString)(30))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, (0, _Common.randomString)(35))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath1, (0, _Common.randomString)(40))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath2, (0, _Common.randomString)(45))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath3, (0, _Common.randomString)(50))).assertTrue();
        (0, _Common.expect)((0, _Common.prepareFile)(fffpath4, (0, _Common.randomString)(55))).assertTrue();
        return {
          baseDir: dpath,
          srcDir: ddpath1,
          destDir: ddpath2
        };
      } catch (e) {
        console.log(testNum + 'failed to readyFiles for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
        return {
          baseDir: dpath,
          srcDir: null,
          destDir: null
        };
      }
    };
    (0, _Common.it)('fileIO_test_moveDir_async_000', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_moveDir_async_000';
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath + '/srcFile_second_01';
      let ffpath2 = dddpath + '/srcFile_second_02';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath1);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, (0, _Common.randomString)(10))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, (0, _Common.randomString)(15))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, (0, _Common.randomString)(20))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, (0, _Common.randomString)(25))).assertTrue();
      try {
        let stat1 = _Common.fileIO.statSync(fpath1);
        let stat2 = _Common.fileIO.statSync(ffpath1);
        await _Common.fileIO.moveDir(ddpath1, ddpath2);
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath1)).assertFalse();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        (0, _Common.expect)(stat1.size == stat3.size).assertTrue();
        let stat4 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat2.size == stat4.size).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_001', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_moveDir_async_001';
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath + '/srcFile_second_01';
      let ffpath2 = dddpath + '/srcFile_second_02';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath1);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, (0, _Common.randomString)(10))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, (0, _Common.randomString)(15))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, (0, _Common.randomString)(20))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, (0, _Common.randomString)(25))).assertTrue();
      try {
        let stat1 = _Common.fileIO.statSync(fpath1);
        let stat2 = _Common.fileIO.statSync(ffpath1);
        _Common.fileIO.moveDir(ddpath1, ddpath2, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_001 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath1)).assertFalse();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
          (0, _Common.expect)(stat1.size == stat3.size).assertTrue();
          let stat4 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
          (0, _Common.expect)(stat2.size == stat4.size).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_002', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_moveDir_async_002';
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath1);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath1);
      _Common.fileIO.mkdirSync(dddpath2);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, (0, _Common.randomString)(10))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, (0, _Common.randomString)(15))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, (0, _Common.randomString)(20))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, (0, _Common.randomString)(25))).assertTrue();
      try {
        let stat1 = _Common.fileIO.statSync(fpath1);
        let stat2 = _Common.fileIO.statSync(ffpath1);
        await _Common.fileIO.moveDir(ddpath1, ddpath2);
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath1)).assertFalse();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        (0, _Common.expect)(stat1.size == stat3.size).assertTrue();
        let stat4 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat2.size == stat4.size).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_003', 3, async function (done) {
      let dpath = (await _ohosAbility.default.getContext().getFilesDir()) + '/fileIO_test_moveDir_async_003';
      let ddpath1 = dpath + '/srcDir';
      let ddpath2 = dpath + '/destDir';
      let dddpath2 = ddpath2 + '/srcDir';
      let fpath1 = ddpath1 + '/srcFile_first_01';
      let fpath2 = ddpath1 + '/srcFile_first_02';
      let dddpath1 = ddpath1 + '/srcDir_first';
      let ffpath1 = dddpath1 + '/srcFile_second_01';
      let ffpath2 = dddpath1 + '/srcFile_second_02';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath1);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath1);
      _Common.fileIO.mkdirSync(dddpath2);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath1, (0, _Common.randomString)(10))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fpath2, (0, _Common.randomString)(15))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath1, (0, _Common.randomString)(20))).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath2, (0, _Common.randomString)(25))).assertTrue();
      try {
        let stat1 = _Common.fileIO.statSync(fpath1);
        let stat2 = _Common.fileIO.statSync(ffpath1);
        _Common.fileIO.moveDir(ddpath1, ddpath2, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_003 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath1)).assertFalse();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          let stat3 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
          (0, _Common.expect)(stat1.size == stat3.size).assertTrue();
          let stat4 = _Common.fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
          (0, _Common.expect)(stat2.size == stat4.size).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_004', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_004');
      try {
        let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let dirent1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent1.length == 4).assertTrue();
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertFalse();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
        let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        (0, _Common.expect)(stat1.size == stat3.size).assertTrue();
        let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat2.size == stat4.size).assertTrue();
        let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent2.length == 6).assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_005', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_005');
      try {
        let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let dirent1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent1.length == 4).assertTrue();
        _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_005 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertFalse();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
          let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          (0, _Common.expect)(stat1.size == stat3.size).assertTrue();
          let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          (0, _Common.expect)(stat2.size == stat4.size).assertTrue();
          let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
            recursion: true
          });
          (0, _Common.expect)(dirent2.length == 6).assertTrue();
          _Common.fileIO.rmdirSync(dpath.baseDir);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_006', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_006');
      try {
        let stat1 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        let dirent1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent1.length == 4).assertTrue();
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertFalse();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent2.length == 8).assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_007', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_007');
      try {
        let stat1 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        let dirent1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent1.length == 4).assertTrue();
        _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_007 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.srcDir)).assertFalse();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
          let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 10).assertTrue();
          let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 30).assertTrue();
          let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
            recursion: true
          });
          (0, _Common.expect)(dirent2.length == 8).assertTrue();
          _Common.fileIO.rmdirSync(dpath.baseDir);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_008', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_008');
      try {
        let dirnet1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirnet1.length == 4).assertTrue();
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        console.log('fileIO_test_moveDir_async_008 has failed for ' + err.message + ', code: ' + err.code);
        let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
        let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
        let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 20).assertTrue();
        let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 50).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent2.length == 8).assertTrue();
        _Common.fileIO.rmdirSync(dpath.baseDir);
        (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
        (0, _Common.expect)(err.data.length == 2).assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_009', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_009');
      try {
        let dirent1 = _Common.fileIO.listFileSync(dpath.destDir, {
          recursion: true
        });
        (0, _Common.expect)(dirent1.length == 4).assertTrue();
        _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_009 error:' + JSON.stringify(err));
            let stat1 = _Common.fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
            let stat2 = _Common.fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
            let stat3 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
            (0, _Common.expect)(stat1.size != stat3.size && stat3.size == 20).assertTrue();
            let stat4 = _Common.fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
            (0, _Common.expect)(stat2.size != stat4.size && stat4.size == 50).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
            (0, _Common.expect)(_Common.fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
            let dirent2 = _Common.fileIO.listFileSync(dpath.destDir, {
              recursion: true
            });
            (0, _Common.expect)(dirent2.length == 8).assertTrue();
            _Common.fileIO.rmdirSync(dpath.baseDir);
            (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
            (0, _Common.expect)(err.data.length == 2).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_010', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_010');
      try {
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_THROW_ERR);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_011', 0, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_011');
      try {
        _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_THROW_ERR, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath.baseDir);
            console.log('fileIO_test_moveDir_async_011 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900032 && err.message == 'Directory not empty').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_012', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveDir_async_012');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ddpath2 = dpath + '/dir2_006';
      let ffpath3 = ddpath2 + '/new.txt';
      let dddpath3 = ddpath2 + '/dir_006';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath3);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertFalse();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_013', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveDir_async_013');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ddpath2 = dpath + '/dir2_006';
      let ffpath3 = ddpath2 + '/new.txt';
      let dddpath3 = ddpath2 + '/dir_006';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      _Common.fileIO.mkdirSync(dddpath3);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_013 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertFalse();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_014', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveDir_async_014');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ddpath2 = dpath + '/dir2_007';
      let ffpath3 = ddpath2 + '/new.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertFalse();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_015', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveDir_async_015');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ddpath2 = dpath + '/dir2_007';
      let ffpath3 = ddpath2 + '/new.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      _Common.fileIO.mkdirSync(ddpath2);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath3, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE, err => {
          if (err) {
            console.log('fileIO_test_moveDir_async_015 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertFalse();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_016', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_016');
      try {
        const INVALIDE_MODE = -1;
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE);
        (0, _Common.expect)(false).assertTrue();
      } catch (err) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_016 has failed for ' + err.message + ', code: ' + err.code);
        (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_017', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_017');
      try {
        const INVALIDE_MODE = 4;
        _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_018', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_018');
      try {
        await _Common.fileIO.moveDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_019', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_019');
      try {
        _Common.fileIO.moveDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01', err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_019 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_020', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_020');
      try {
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_THROW_ERR);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_020 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_021', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_021');
      try {
        _Common.fileIO.moveDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_THROW_ERR, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath.baseDir);
            console.log('fileIO_test_moveDir_async_021 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_021 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_022', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_023');
      try {
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.srcDir + '/srcDir_first', DIRMODE_FILE_THROW_ERR);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_022 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_023', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_023');
      try {
        _Common.fileIO.moveDir(dpath.srcDir, dpath.srcDir + '/srcDir_first', DIRMODE_FILE_THROW_ERR, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath.baseDir);
            console.log('fileIO_test_moveDir_async_023 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_023 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_024', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_024');
      try {
        await _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, undefined);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath.baseDir);
        console.log('fileIO_test_moveDir_async_024 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveDir_async_025', 3, async function (done) {
      let dpath = await readyFiles('fileIO_test_moveDir_async_025');
      try {
        _Common.fileIO.moveDir(dpath.srcDir, dpath.destDir, undefined, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath.baseDir);
            console.log('fileIO_test_moveDir_async_025 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900032 && err.message == 'Directory not empty').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_025 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/moveFile.test.js":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/moveFile.test.js ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOMoveFile;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOMoveFile() {
  (0, _Common.describe)('fileIO_fs_moveFile', function () {
    (0, _Common.it)('fileIO_test_moveFile_sync_000', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_000');
      let fpath = dpath + '/file_000.txt';
      let ddpath = dpath + '/dir_000';
      let ffpath = ddpath + '/file_000.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.moveFileSync(fpath, ffpath);
        let stat = _Common.fileIO.statSync(ffpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_test_moveFile_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_sync_001', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_001');
      let fpath = dpath + '/file_001.txt';
      let ddpath = dpath + '/dir_001';
      let ffpath = ddpath + '/file_001.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, ffpath);
        _Common.fileIO.moveFileSync(fpath, ffpath, 1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_sync_002', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_002');
      let fpath = dpath + '/file_002.txt';
      let ddpath = dpath + '/dir_002';
      let ffpath = ddpath + '/file_002.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      try {
        _Common.fileIO.moveFileSync(fpath, ffpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_sync_004', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_004');
      let ddpath = dpath + '/dir_003';
      _Common.fileIO.mkdirSync(dpath);
      try {
        _Common.fileIO.moveFileSync(dpath, ddpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.moveFileSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_moveFile_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_sync_006', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_006');
      let fpath = dpath + '/file_004.txt';
      let ddpath = dpath + '/dir_004';
      let ffpath = ddpath + '/file_004.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, '')).assertTrue();
      try {
        _Common.fileIO.moveFileSync(fpath, ffpath, 0);
        let stat = _Common.fileIO.statSync(ffpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_test_moveFile_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_sync_007', 3, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_sync_007');
      let fpath = dpath + '/file_015.txt';
      let ddpath = dpath + '/dir_015';
      let ffpath = ddpath + '/file_015.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.moveFileSync(fpath, ffpath, undefined);
        let stat = _Common.fileIO.statSync(ffpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_test_moveFile_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_000', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_000');
      let fpath = dpath + '/file_005.txt';
      let ddpath = dpath + '/dir_005';
      let ffpath = ddpath + '/file_005.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.moveFile(fpath, ffpath);
        let stat = _Common.fileIO.statSync(ffpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveFile_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_001', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_001');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ffpath = ddpath + '/file_006.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.moveFile(fpath, ffpath, err => {
          if (err) {
            console.log('fileIO_test_moveFile_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat = _Common.fileIO.statSync(ffpath);
          (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveFile_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_002', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_002');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ffpath = ddpath + '/file_007.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, ffpath);
        await _Common.fileIO.moveFile(fpath, ffpath, 1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900015 && e.message == 'File exists').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_003', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_003');
      let fpath = dpath + '/file_008.txt';
      let ddpath = dpath + '/dir_008';
      let ffpath = ddpath + '/file_008.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.copyFileSync(fpath, ffpath);
        _Common.fileIO.moveFile(fpath, ffpath, 1, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath);
            console.log('fileIO_test_moveFile_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900015 && err.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveFile_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_004', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_004');
      let fpath = dpath + '/file_009.txt';
      let ddpath = dpath + '/dir_009';
      let ffpath = ddpath + '/file_009.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      try {
        await _Common.fileIO.moveFile(fpath, ffpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_005', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_005');
      let fpath = dpath + '/file_010.txt';
      let ddpath = dpath + '/dir_010';
      let ffpath = ddpath + '/file_010.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      try {
        _Common.fileIO.moveFile(fpath, ffpath, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath);
            console.log('fileIO_test_moveFile_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_moveFile_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_006', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_006');
      let ddpath = dpath + '/dir_011';
      _Common.fileIO.mkdirSync(dpath);
      try {
        await _Common.fileIO.moveFile(dpath, ddpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_007', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_007');
      let ddpath = dpath + '/dir_012';
      _Common.fileIO.mkdirSync(dpath);
      try {
        _Common.fileIO.moveFile(dpath, ddpath, err => {
          if (err) {
            console.log('fileIO_test_moveFile_async_007 error package: ' + JSON.stringify(err));
          }
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_moveFile_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.moveFile(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_moveFile_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_009', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_009');
      let fpath = dpath + '/file_013.txt';
      let ddpath = dpath + '/dir_013';
      let ffpath = ddpath + '/file_013.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, '')).assertTrue();
      try {
        await _Common.fileIO.moveFile(fpath, ffpath, 0);
        let stat = _Common.fileIO.statSync(ffpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveFile_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_010', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_010');
      let fpath = dpath + '/file_014.txt';
      let ddpath = dpath + '/dir_014';
      let ffpath = ddpath + '/file_014.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, '')).assertTrue();
      try {
        _Common.fileIO.moveFile(fpath, ffpath, 0, err => {
          if (err) {
            console.log('fileIO_test_moveFile_async_010 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat = _Common.fileIO.statSync(ffpath);
          (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveFile_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_011', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_011');
      let fpath = dpath + '/file_016.txt';
      let ddpath = dpath + '/dir_016';
      let ffpath = ddpath + '/file_016.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, '')).assertTrue();
      try {
        await _Common.fileIO.moveFile(fpath, ffpath, undefined);
        let stat = _Common.fileIO.statSync(ffpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_moveFile_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_moveFile_async_012', 3, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_moveFile_async_012');
      let fpath = dpath + '/file_017.txt';
      let ddpath = dpath + '/dir_017';
      let ffpath = ddpath + '/file_017.txt';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, '')).assertTrue();
      try {
        _Common.fileIO.moveFile(fpath, ffpath, undefined, err => {
          if (err) {
            console.log('fileIO_test_moveFile_async_012 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let stat = _Common.fileIO.statSync(ffpath);
          (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_moveFile_async_012 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/open.test.js":
/*!***************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/open.test.js ***!
  \***************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOOpen;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOOpen() {
  (0, _Common.describe)('fileIO_fs_open', function () {
    (0, _Common.it)('fileIO_test_open_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readlen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readlen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length).assertTrue();
        let length = 20;
        let bytesWritten = _Common.fileIO.writeSync(file.fd, new ArrayBuffer(length), {
          offset: 0
        });
        (0, _Common.expect)(bytesWritten == length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_003', 0, function () {
      try {
        _Common.fileIO.openSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_open_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_004');
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.TRUNC | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readLen == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.APPEND | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let length = 100;
        let bytesWritten = _Common.fileIO.writeSync(file.fd, new ArrayBuffer(length));
        (0, _Common.expect)(bytesWritten == length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == length + _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_007', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.NONBLOCK | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_008', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_008');
      _Common.fileIO.mkdirSync(dpath);
      try {
        let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_009', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, '')).assertTrue();
      try {
        _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.DIR);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_open_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900018 && e.message == 'Not a directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_010', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_011', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_011');
      let ffpath = fpath + 'aaaa';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath, ffpath);
        _Common.fileIO.openSync(ffpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(ffpath);
        console.log('fileIO_test_open_sync_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900033 && e.message == 'Too many symbolic links encountered').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_012', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.SYNC | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_open_sync_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_013', 0, async function () {
      try {
        _Common.fileIO.openSync(-1, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_open_sync_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_014', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_012');
      _Common.fileIO.mkdirSync(dpath);
      try {
        _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_open_sync_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_sync_015', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_sync_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file;
      try {
        file = _Common.fileIO.openSync(fpath, undefined);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readlen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_open_sync_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096)).then(readLen => {
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.READ_ONLY, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.read(file.fd, new ArrayBuffer(4096)).then(readLen => {
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_open_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let length = 20;
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, new ArrayBuffer(length)).then(bytesWritten => {
          (0, _Common.expect)(bytesWritten == length).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let length = 20;
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.WRITE_ONLY, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_003 error package' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.write(file.fd, new ArrayBuffer(length)).then(bytesWritten => {
            (0, _Common.expect)(bytesWritten == length).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
          });
        });
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_004');
      try {
        await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_open_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_005');
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.READ_WRITE, err => {
          if (err) {
            console.log('fileIO_test_open_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_open_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_006');
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.READ_WRITE).then(() => {
          (0, _Common.expect)(false).assertTrue();
        }).catch(err => {
          _Common.fileIO.unlinkSync(fpath);
          console.log('fileIO_test_open_async_006 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_007', 0, async function (done) {
      try {
        await _Common.fileIO.open(-1, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_open_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_008', 0, async function (done) {
      try {
        _Common.fileIO.open(-1, _Common.fileIO.OpenMode.READ_WRITE, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_009');
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_010');
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.CREATE | _Common.fileIO.OpenMode.WRITE_ONLY, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_010 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.TRUNC | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096)).then(readLen => {
          (0, _Common.expect)(readLen == 0).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.TRUNC | _Common.fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_012 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.read(file.fd, new ArrayBuffer(4096)).then(readLen => {
            (0, _Common.expect)(readLen == 0).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
          });
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let length = 100;
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.APPEND | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.writeSync(file.fd, new ArrayBuffer(length));
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 0
        }).then(readLen => {
          (0, _Common.expect)(readLen == length + _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let length = 100;
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.APPEND | _Common.fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_014 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.writeSync(file.fd, new ArrayBuffer(length));
          _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
            offset: 0
          }).then(readLen => {
            (0, _Common.expect)(readLen == length + _Common.FILE_CONTENT.length).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
          });
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.NONBLOCK | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.NONBLOCK | _Common.fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_016 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_017', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_open_async_017');
      _Common.fileIO.mkdirSync(dpath);
      try {
        let file = await _Common.fileIO.open(dpath, _Common.fileIO.OpenMode.DIR);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_018', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_open_async_018');
      _Common.fileIO.mkdirSync(dpath);
      try {
        _Common.fileIO.open(dpath, _Common.fileIO.OpenMode.DIR, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_018 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_019', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_019');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, '')).assertTrue();
      try {
        await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.DIR);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_open_async_019 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900018 && e.message == 'Not a directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_020', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_020');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, '')).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.DIR, err => {
          if (err) {
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_test_open_async_020 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_open_async_020 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_021', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_021');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, '')).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.DIR).then(() => {
          (0, _Common.expect)(false).assertTrue();
        }).catch(err => {
          _Common.fileIO.unlinkSync(fpath);
          console.log('fileIO_test_open_async_021 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900018 && err.message == 'Not a directory').assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_021 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_022', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_022');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_022 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_023', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_023');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_023 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_023 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_024', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_024');
      let ffpath = fpath + 'aaaa';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath, ffpath);
        await _Common.fileIO.open(ffpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(ffpath);
        console.log('fileIO_test_open_async_024 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900033 && e.message == 'Too many symbolic links encountered').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_025', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_025');
      let ffpath = fpath + 'link';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath, ffpath);
        _Common.fileIO.open(ffpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE, err => {
          if (err) {
            console.log('fileIO_test_open_async_025 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900033 && err.message == 'Too many symbolic links encountered').assertTrue();
          }
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(ffpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_025 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_026', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_026');
      let ffpath = fpath + 'link';
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath, ffpath);
        _Common.fileIO.open(ffpath, _Common.fileIO.OpenMode.NOFOLLOW | _Common.fileIO.OpenMode.READ_WRITE).then(() => {
          (0, _Common.expect)(false).assertTrue();
        }).catch(err => {
          console.log('fileIO_test_open_async_026 error: {message: ' + err.message + ', code: ' + err.code + '}');
          (0, _Common.expect)(err.code == 13900033 && err.message == 'Too many symbolic links encountered').assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(ffpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_026 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_027', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_027');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = await _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.SYNC | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_open_async_027 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_028', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_028');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.open(fpath, _Common.fileIO.OpenMode.SYNC | _Common.fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_028 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_open_async_028 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_029', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_open_async_029');
      _Common.fileIO.mkdirSync(dpath);
      try {
        await _Common.fileIO.open(dpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_open_async_029 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_030', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_open_async_030');
      _Common.fileIO.mkdirSync(dpath);
      try {
        _Common.fileIO.open(dpath, _Common.fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath);
            console.log('fileIO_test_open_async_030 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900019 && err.message == 'Is a directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_open_async_030 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_031', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_031');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file;
      try {
        file = await _Common.fileIO.open(fpath, undefined);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_open_async_031 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_open_async_032', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_open_async_032');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.open(fpath, undefined, (err, file) => {
          if (err) {
            console.log('fileIO_test_open_async_032 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.write(file.fd, new ArrayBuffer(4096), (err, bytesWritten) => {
            if (err) {
              _Common.fileIO.closeSync(file);
              _Common.fileIO.unlinkSync(fpath);
              console.log('fileIO_test_open_async_032 error: {message: ' + err.message + ', code: ' + err.code + '}');
              (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
              done();
            } else {
              (0, _Common.expect)(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log('fileIO_test_open_async_032 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/read.test.js":
/*!***************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/read.test.js ***!
  \***************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIORead;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIORead() {
  (0, _Common.describe)('fileIO_fs_read', function () {
    (0, _Common.it)('fileIO_test_read_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen1 = _Common.fileIO.readSync(file.fd, new ArrayBuffer(16));
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = _Common.fileIO.readSync(file.fd, new ArrayBuffer(8));
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: 1
        });
        (0, _Common.expect)(readLen == 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      const invalidLength = -1;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: _Common.FILE_CONTENT.length + 1
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: 4097
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 1
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      const invalidOffset = -1;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_007', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: _Common.FILE_CONTENT.length + 1
        });
        (0, _Common.expect)(readLen == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: _Common.FILE_CONTENT.length - 1
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_009', 0, async function () {
      try {
        _Common.fileIO.readSync(-1, new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_read_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_010', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_010');
      let CONTENT = "<?xml 你好， 世界 hello world>";
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let buf = new ArrayBuffer(4096);
        _Common.fileIO.readSync(file.fd, buf);
        let textDecoder = new _Common.util.TextDecoder("utf-8", {
          ignoreBOM: true
        });
        let resultPut = textDecoder.decode(new Uint8Array(buf), {
          stream: true
        });
        (0, _Common.expect)(resultPut == CONTENT).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_011', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen1 = _Common.fileIO.readSync(file.fd, new ArrayBuffer(16), undefined);
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = _Common.fileIO.readSync(file.fd, new ArrayBuffer(8), undefined);
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_sync_012', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_sync_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen1 = _Common.fileIO.readSync(file.fd, new ArrayBuffer(16), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = _Common.fileIO.readSync(file.fd, new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_sync_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen1 = await _Common.fileIO.read(file.fd, new ArrayBuffer(16));
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = await _Common.fileIO.read(file.fd, new ArrayBuffer(8));
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(16), (err, readlen1) => {
          if (err) {
            console.log('fileIO_test_read_async_001 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readlen1 == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.read(file.fd, new ArrayBuffer(8), (err, readLen2) => {
            if (err) {
              console.log('fileIO_test_read_async_001 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(readLen2 == 0).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_read_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await _Common.fileIO.read(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file;
      try {
        file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), err => {
          if (err) {
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_test_read_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_read_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readlen = await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 1
        });
        (0, _Common.expect)(readlen == _Common.FILE_CONTENT.length - 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 1
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_read_async_005 err package' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_read_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          length: 3
        });
        (0, _Common.expect)(readLen == 3).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          length: 3
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_read_async_007 err package' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == 3).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_read_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: _Common.FILE_CONTENT.length + 1
        });
        (0, _Common.expect)(readLen == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: _Common.FILE_CONTENT.length + 1
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_read_async_009 err package' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == 0).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_read_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: _Common.FILE_CONTENT.length
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: _Common.FILE_CONTENT.length
        }, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_read_async_011 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length - 1).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_read_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_012', 0, async function (done) {
      try {
        await _Common.fileIO.read(-1, new ArrayBuffer(4096));
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_read_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_013', 0, async function (done) {
      try {
        _Common.fileIO.read(-1, new ArrayBuffer(4096), err => {
          if (err) {
            (0, _Common.expect)(false).assertTrue();
          }
        });
      } catch (e) {
        console.log('fileIO_test_read_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      const invalidOffset = -1;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: invalidOffset
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      const invalidLength = 4097;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          length: invalidLength
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {});
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_017', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_017');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {}, (err, readLen) => {
          if (err) {
            console.log('fileIO_test_read_async_017 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_read_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_018', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_018');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      const invalidLength = -1;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_read_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_019', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_019');
      let CONTENT = "<?xml 你好， 世界 hello world>";
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let buf = new ArrayBuffer(4096);
        await _Common.fileIO.read(file.fd, buf);
        let textDecoder = new _Common.util.TextDecoder("utf-8", {
          ignoreBOM: true
        });
        let resultPut = textDecoder.decodeWithStream(new Uint8Array(buf), {
          stream: true
        });
        (0, _Common.expect)(resultPut == CONTENT).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_019 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_020', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_020');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen1 = await _Common.fileIO.read(file.fd, new ArrayBuffer(16), undefined);
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = await _Common.fileIO.read(file.fd, new ArrayBuffer(8), undefined);
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_020 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_021', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_021');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(16), undefined, (err, readlen1) => {
          if (err) {
            console.log('fileIO_test_read_async_021 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readlen1 == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.read(file.fd, new ArrayBuffer(8), undefined, (err, readLen2) => {
            if (err) {
              console.log('fileIO_test_read_async_021 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(readLen2 == 0).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_read_async_021 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_022', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_022');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen1 = await _Common.fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen2 = await _Common.fileIO.read(file.fd, new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        });
        (0, _Common.expect)(readLen2 == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_read_async_022 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_read_async_023', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_read_async_023');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.read(file.fd, new ArrayBuffer(16), {
          offset: undefined,
          length: undefined
        }, (err, readLen1) => {
          if (err) {
            console.log('fileIO_test_read_async_011 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(readLen1 == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.read(file.fd, new ArrayBuffer(8), {
            offset: undefined,
            length: undefined
          }, (err, readLen2) => {
            if (err) {
              console.log('fileIO_test_read_async_001 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(readLen2 == 0).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_read_async_023 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/readtext.test.js":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/readtext.test.js ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOReadtext;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOReadtext() {
  (0, _Common.describe)('fileIO_fs_readtext', function () {
    (0, _Common.it)('fileIO_test_readtext_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = _Common.fileIO.readTextSync(fpath);
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_readtext_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = _Common.fileIO.readTextSync(fpath, {
          offset: 1
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT.substring(1, _Common.FILE_CONTENT.length + 1)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_readtext_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = _Common.fileIO.readTextSync(fpath, {
          offset: 2,
          length: 4
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT.substring(2, 6)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_readtext_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = _Common.fileIO.readTextSync(fpath, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT.substring(1, _Common.FILE_CONTENT.length + 1)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_readtext_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_004', 0, async function () {
      try {
        _Common.fileIO.readTextSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_readtext_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_005');
      try {
        _Common.fileIO.readTextSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_readtext_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        const invalidOffset = -1;
        _Common.fileIO.readTextSync(fpath, {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_readtext_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_007', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        const invalidOffset = 9999;
        _Common.fileIO.readTextSync(fpath, {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_readtext_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        const invalidLength = -1;
        _Common.fileIO.readTextSync(fpath, {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_readtext_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_009', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = _Common.fileIO.readTextSync(fpath, undefined);
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_readtext_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_sync_010', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_sync_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = _Common.fileIO.readTextSync(fpath, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_readtext_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath);
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath, {
          offset: 1
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT.substr(1, _Common.FILE_CONTENT.length - 1)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, {
          offset: 1
        }, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_003 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT.substr(1, _Common.FILE_CONTENT.length - 1)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath, {
          offset: 1,
          length: 2
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT.substr(1, 2)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, {
          offset: 1,
          length: 2
        }, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_005 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT.substr(1, 2)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT.slice(1, _Common.FILE_CONTENT.length + 1)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        }).then(str => {
          (0, _Common.expect)(str == _Common.FILE_CONTENT.slice(1, _Common.FILE_CONTENT.length + 1)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_test_readtext_async_007 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, {
          offset: 1,
          length: _Common.FILE_CONTENT.length,
          encoding: 'utf-8'
        }, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_008 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT.slice(1, _Common.FILE_CONTENT.length + 1)).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath, {});
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, {}, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_010 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_011');
      try {
        await _Common.fileIO.readText(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_readtext_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_012');
      try {
        _Common.fileIO.readText(fpath, err => {
          if (err) {
            console.log('fileIO_test_readtext_async_012 error: {message:' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        const invalidOffset = -1;
        await _Common.fileIO.readText(fpath, {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_readtext_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        const invalidOffset = 9999;
        await _Common.fileIO.readText(fpath, {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_readtext_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        const invalidLength = -1;
        await _Common.fileIO.readText(fpath, {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_readtext_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_016', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath, undefined);
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_017', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_017');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, undefined, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_017 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_018', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_018');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let str = await _Common.fileIO.readText(fpath, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_readtext_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_readtext_async_019', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_readtext_async_019');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.readText(fpath, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        }, (err, str) => {
          if (err) {
            console.log('fileIO_test_readtext_async_019 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(str == _Common.FILE_CONTENT).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_readtext_async_019 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/rename.test.js":
/*!*****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/rename.test.js ***!
  \*****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIORename;
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIORename() {
  (0, _Common.describe)('fileIO_fs_rename', function () {
    (0, _Common.it)('fileIO_test_rename_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let newf = fpath + 'test';
        _Common.fileIO.renameSync(fpath, newf);
        (0, _Common.expect)(_Common.fileIO.accessSync(newf)).assertTrue();
        _Common.fileIO.unlinkSync(newf);
      } catch (e) {
        console.log('fileIO_test_rename_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_001');
      try {
        _Common.fileIO.renameSync(fpath, fpath + 'test');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rename_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.renameSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.renameSync(fpath, null);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.renameSync(fpath, undefined);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_005', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_005');
      let fpath = dpath + '/file_000';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(dpath + '/dir_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let newf = dpath + '/dir_000/newFileName';
        _Common.fileIO.renameSync(fpath, newf);
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_test_rename_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_006');
      let fpathTarget = fpath + (0, _Common.randomString)(250);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.renameSync(fpath, fpathTarget);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900030 && e.message == 'File name too long').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_007', 0, async function () {
      try {
        _Common.fileIO.renameSync('/data', '/data_new');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rename_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900012 && e.message == 'Permission denied').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_sync_008', 0, async function () {
      let dstDir = await _ohosAbility.default.getContext().getOrCreateDistributedDir();
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.renameSync(fpath, dstDir + '/data_new');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900016 && e.message == 'Cross-device link').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let newf = fpath + '123';
      try {
        await _Common.fileIO.rename(fpath, newf);
        (0, _Common.expect)(_Common.fileIO.accessSync(newf)).assertTrue();
        _Common.fileIO.unlinkSync(newf);
        done();
      } catch (e) {
        console.log('fileIO_test_rename_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let newf = fpath + 'aaa';
      try {
        _Common.fileIO.rename(fpath, newf, err => {
          if (err) {
            console.log('fileIO_test_rename_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(newf)).assertTrue();
          _Common.fileIO.unlinkSync(newf);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_rename_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_002');
      try {
        await _Common.fileIO.rename(fpath, fpath + 'bbb');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rename_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_003');
      try {
        _Common.fileIO.rename(fpath, fpath + 'bbb', err => {
          if (err) {
            console.log('fileIO_test_rename_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_rename_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.rename(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.rename(fpath, null);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.rename(fpath, undefined);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_007', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_007');
      let fpath = dpath + '/file_001';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(dpath + '/dir_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let newf = dpath + '/dir_001/newFileName';
        await _Common.fileIO.rename(fpath, newf);
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_test_rename_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_008', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_008');
      let fpath = dpath + '/file_002';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(dpath + '/dir_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let newf = dpath + '/dir_002/newFileName';
        _Common.fileIO.rename(fpath, newf, err => {
          if (err) {
            console.log('fileIO_test_rename_async_008 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          _Common.fileIO.rmdirSync(dpath);
        });
        done();
      } catch (e) {
        console.log('fileIO_test_rename_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_009');
      let fpathTarget = fpath + (0, _Common.randomString)(250);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.rename(fpath, fpathTarget);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900030 && e.message == 'File name too long').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_010');
      let fpathTarget = fpath + (0, _Common.randomString)(250);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.rename(fpath, fpathTarget, err => {
          if (err) {
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_test_rename_async_010 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900030 && err.message == 'File name too long').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_rename_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_011', 0, async function (done) {
      try {
        await _Common.fileIO.rename('/data', '/data_new');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rename_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900012 && e.message == 'Permission denied').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_012', 0, async function (done) {
      let dstDir = await _ohosAbility.default.getContext().getOrCreateDistributedDir();
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.rename(fpath, dstDir + '/data_new');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_rename_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900016 && e.message == 'Cross-device link').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rename_async_013', 0, async function (done) {
      let dstDir = await _ohosAbility.default.getContext().getOrCreateDistributedDir();
      let fpath = await (0, _Common.nextFileName)('fileIO_test_rename_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.rename(fpath, dstDir + '/data_new', err => {
          if (err) {
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_test_symlink_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900016 && err.message == 'Cross-device link').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_rename_async_013 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/rmdir.test.js":
/*!****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/rmdir.test.js ***!
  \****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIORmdir;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIORmdir() {
  (0, _Common.describe)('fileIO_fs_rmdir', function () {
    (0, _Common.it)('fileIO_test_rmdir_sync_000', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_sync_000')) + 'd';
      let fpath = dpath + '/rmdir_sync_000';
      let ffpath = dpath + '/rmdir_sync_000_1';
      let ddpath = dpath + '/rmdir_sync_000_1d';
      let fffpath = ddpath + '/rmdir_sync_000';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(fffpath)).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        (0, _Common.expect)(!_Common.fileIO.accessSync(dpath)).assertTrue();
        (0, _Common.expect)(!_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(!_Common.fileIO.accessSync(fffpath)).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_sync_001', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_sync_001')) + 'd';
      try {
        _Common.fileIO.rmdirSync(dpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_sync_002', 0, async function () {
      try {
        _Common.fileIO.rmdirSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_sync_003', 0, function () {
      try {
        _Common.fileIO.rmdirSync(12);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_sync_004', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('../cache/fileIO_test_rmdir_sync_003')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        _Common.fileIO.rmdirSync(dpath);
        (0, _Common.expect)(!_Common.fileIO.accessSync(dpath)).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_000', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_async_000')) + 'd';
      let fpath = dpath + '/rmdir_async_000';
      let ffpath = dpath + '/rmdir_async_000_1';
      let ddpath = dpath + '/rmdir_async_000_1d';
      let fffpath = ddpath + '/rmdir_async_000_2';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(fffpath)).assertTrue();
        await _Common.fileIO.rmdir(dpath);
        (0, _Common.expect)(!_Common.fileIO.accessSync(dpath)).assertTrue();
        (0, _Common.expect)(!_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(!_Common.fileIO.accessSync(fffpath)).assertTrue();
        done();
      } catch (e) {
        console.log('fileIO_test_rmdir_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_001', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_async_001')) + 'd';
      let fpath = dpath + '/rmdir_async_001';
      let ffpath = dpath + '/rmdir_async_001_1';
      let ddpath = dpath + '/rmdir_async_001_1d';
      let fffpath = ddpath + '/rmdir_async_001_2';
      _Common.fileIO.mkdirSync(dpath);
      _Common.fileIO.mkdirSync(ddpath);
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _Common.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(ddpath)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.accessSync(fffpath)).assertTrue();
        _Common.fileIO.rmdir(dpath, err => {
          if (err) {
            console.log('fileIO_test_rmdir_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(!_Common.fileIO.accessSync(dpath)).assertTrue();
          (0, _Common.expect)(!_Common.fileIO.accessSync(ddpath)).assertTrue();
          (0, _Common.expect)(!_Common.fileIO.accessSync(fffpath)).assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_rmdir_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_002', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_async_002')) + 'd';
      try {
        await _Common.fileIO.rmdir(dpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_003', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_async_003')) + 'd';
      try {
        _Common.fileIO.rmdir(dpath, err => {
          if (err) {
            console.log('fileIO_test_rmdir_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_rmdir_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_004', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_test_rmdir_async_004')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        _Common.fileIO.rmdir(dpath, '', err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_rmdir_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_005', 0, async function (done) {
      try {
        await _Common.fileIO.rmdir();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_rmdir_async_006', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('../cache/fileIO_test_rmdir_async_006')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        await _Common.fileIO.rmdir(dpath);
        (0, _Common.expect)(!_Common.fileIO.accessSync(dpath)).assertTrue();
      } catch (e) {
        console.log('fileIO_test_rmdir_async_006 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/stat.test.js":
/*!***************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/stat.test.js ***!
  \***************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOStat;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOStat() {
  (0, _Common.describe)('fileIO_fs_stat', function () {
    (0, _Common.it)('fileIO_stat_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat !== null).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2 !== null).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_001');
      try {
        _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_stat_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_002', 0, async function () {
      try {
        _Common.fileIO.statSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_stat_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_ino_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_ino_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isBigInt)(stat.ino)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isBigInt)(stat2.ino)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_ino_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_mode_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_mode_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mode)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.mode)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_mode_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_uid_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_uid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.uid)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.uid)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_uid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_gid_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_gid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.gid)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.gid)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_gid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_size_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_size_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.size)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_size_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_atime_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_atime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.atime)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.atime)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_atime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_mtime_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_mtime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mtime)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.mtime)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_ctime_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_ctime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.ctime)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.ctime)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_block_device_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_block_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isBlockDevice() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isBlockDevice() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_block_device_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_block_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.statSync(fpath).isBlockDevice(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_block_device_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_block_device_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath);
      try {
        _Common.fileIO.statSync(file.fd).isBlockDevice(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_block_device_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_character_device_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_character_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isCharacterDevice() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isCharacterDevice() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_character_device_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_character_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.statSync(fpath).isCharacterDevice(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_character_device_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_character_device_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath);
      try {
        _Common.fileIO.statSync(file.fd).isCharacterDevice(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_character_device_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_directory_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_directory_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isDirectory() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isDirectory() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_directory_001', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_directory_001');
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = _Common.fileIO.statSync(dpath);
        (0, _Common.expect)(stat.isDirectory() === true).assertTrue();
        let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isDirectory() === true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_directory_002', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_stat_sync_is_directory_002')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.statSync(dpath).isDirectory(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_stat_sync_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_directory_003', 0, async function () {
      let dpath = (await (0, _Common.nextFileName)('fileIO_stat_sync_is_directory_003')) + 'd';
      _Common.fileIO.mkdirSync(dpath);
      let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
      try {
        _Common.fileIO.statSync(file.fd).isDirectory(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_stat_sync_is_directory_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_fifo_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_fifo_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isFIFO() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isFIFO() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_fifo_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_fifo_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.statSync(fpath).isFile(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_fifo_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_fifo_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath);
      try {
        _Common.fileIO.statSync(file.fd).isFile(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_fifo_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_file_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_file_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isFile() === true).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isFile() === true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_file_001', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_file_001');
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = _Common.fileIO.statSync(dpath);
        (0, _Common.expect)(stat.isFile() === false).assertTrue();
        let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isFile() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_file_002', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_file_002');
      try {
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.statSync(dpath).isFile(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_stat_sync_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_file_003', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_file_003');
      _Common.fileIO.mkdirSync(dpath);
      let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
      try {
        _Common.fileIO.statSync(file.fd).isFile(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_stat_sync_is_file_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_socket_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_socket_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isSocket() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isSocket() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_socket_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_socket_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.statSync(fpath).isSocket(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_socket_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_socket_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath);
      try {
        _Common.fileIO.statSync(file.fd).isSocket(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_socket_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_symbolic_link_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_symbolic_link_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.isSymbolicLink() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)(stat2.isSymbolicLink() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_stat_sync_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_symbolic_link_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_symbolic_link_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.statSync(fpath).isSymbolicLink(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_sync_is_symbolic_link_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_sync_is_symbolic_link_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath);
      try {
        _Common.fileIO.statSync(file.fd).isSymbolicLink(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_stat_sync_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath).then(stat => {
          (0, _Common.expect)(stat !== null).assertTrue();
        }).catch(err => {
          console.log('fileIO_stat_async_000 error package1: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd).then(stat2 => {
          (0, _Common.expect)(stat2 !== null).assertTrue();
          _Common.fileIO.closeSync(file);
        }).catch(err => {
          console.log('fileIO_stat_async_000 error package2: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat !== null).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2 !== null).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_002 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat !== null).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_002 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2 !== null).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_003');
      try {
        await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_stat_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_stat_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_004');
      try {
        _Common.fileIO.stat(fpath, err => {
          if (err) {
            console.log('fileIO_stat_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_stat_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_005', 0, async function (done) {
      try {
        await _Common.fileIO.stat(-1);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_stat_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_stat_async_006', 0, async function (done) {
      try {
        _Common.fileIO.stat(-1, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_stat_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_stat_async_ino_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_ino_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isBigInt)(stat.ino)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isBigInt)(stat2.ino)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_ino_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_ino_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_ino_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_ino_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isBigInt)(stat.ino)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_ino_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isBigInt)(stat2.ino)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_ino_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_mode_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_mode_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mode)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.mode)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_mode_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_mode_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_mode_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_mode_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.mode)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_mode_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.mode)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_mode_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_uid_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_uid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.uid)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.uid)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_uid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_uid_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_uid_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_uid_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.uid)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_uid_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.uid)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_uid_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_gid_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_gid_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.gid)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.gid)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_gid_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_gid_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_gid_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_gid_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.gid)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_gid_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.gid)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_gid_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_size_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_size_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.size)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_size_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_size_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_size_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_size_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_size_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.size)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_size_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_atime_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_atime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.atime)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.atime)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_atime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_atime_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_atime_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_atime_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.atime)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_atime_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.atime)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_atime_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_mtime_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_mtime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.mtime)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.mtime)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_mtime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_mtime_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_mtime_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_mtime_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.mtime)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_mtime_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.mtime)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_mtime_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_ctime_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_ctime_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.ctime)).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat2.ctime)).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_ctime_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_ctime_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_ctime_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_ctime_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat.ctime)).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_ctime_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)((0, _Common.isIntNum)(stat2.ctime)).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_ctime_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_block_device_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_block_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isBlockDevice() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isBlockDevice() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_block_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_block_device_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_block_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_block_device_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isBlockDevice() === false).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_block_device_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isBlockDevice() === false).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_block_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_character_device_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_character_device_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isCharacterDevice() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isCharacterDevice() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_character_device_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_character_device_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_character_device_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_character_device_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isCharacterDevice() === false).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_character_device_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isCharacterDevice() === false).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_character_device_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_directory_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_directory_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isDirectory() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isDirectory() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_directory_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_directory_001', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_stat_async_is_directory_001')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = await _Common.fileIO.stat(dpath);
        (0, _Common.expect)(stat.isDirectory() === true).assertTrue();
        let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isDirectory() === true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_directory_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_directory_002', 0, async function (done) {
      let dpath = (await (0, _Common.nextFileName)('fileIO_stat_async_is_directory_002')) + 'd';
      try {
        _Common.fileIO.mkdirSync(dpath);
        _Common.fileIO.stat(dpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_directory_002 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isDirectory() === true).assertTrue();
        });
        let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_directory_002 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isDirectory() === true).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_directory_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_fifo_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_fifo_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isFIFO() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isFIFO() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_fifo_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_fifo_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_fifo_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_fifo_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isFIFO() === false).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_fifo_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isFIFO() === false).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_fifo_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_file_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_file_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isFile() === true).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isFile() === true).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_file_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_file_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_file_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_file_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isFile() === true).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_file_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isFile() === true).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_file_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_file_002', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_file_002');
      try {
        _Common.fileIO.mkdirSync(dpath);
        let stat = await _Common.fileIO.stat(dpath);
        (0, _Common.expect)(stat.isFile() === false).assertTrue();
        let file = _Common.fileIO.openSync(dpath, _Common.fileIO.OpenMode.DIR);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isFile() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_file_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_socket_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_socket_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isSocket() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isSocket() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_socket_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_socket_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_socket_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_socket_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isSocket() === false).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_socket_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isSocket() === false).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_socket_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_symbolic_link_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_symbolic_link_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = await _Common.fileIO.stat(fpath);
        (0, _Common.expect)(stat.isSymbolicLink() === false).assertTrue();
        let file = _Common.fileIO.openSync(fpath);
        let stat2 = await _Common.fileIO.stat(file.fd);
        (0, _Common.expect)(stat2.isSymbolicLink() === false).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_stat_async_is_symbolic_link_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_stat_async_is_symbolic_link_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_stat_async_is_symbolic_link_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.stat(fpath, (err, stat) => {
          if (err) {
            console.log('fileIO_stat_async_is_symbolic_link_001 error package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat.isSymbolicLink() === false).assertTrue();
        });
        let file = _Common.fileIO.openSync(fpath);
        _Common.fileIO.stat(file.fd, (err, stat2) => {
          if (err) {
            console.log('fileIO_stat_async_is_symbolic_link_001 error package2: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(stat2.isSymbolicLink() === false).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_stat_async_is_symbolic_link_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_append_file_sync_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_append_file_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.APPEND | _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        stat = _Common.fileIO.statSync(fpath);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_append_file_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_append_file_sync_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_append_file_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.APPEND | _Common.fileIO.OpenMode.READ_WRITE);
        let stat = _Common.fileIO.statSync(file.fd);
        (0, _Common.expect)((0, _Common.isIntNum)(stat.size)).assertTrue();
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        (0, _Common.expect)(_Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT) == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        let file2 = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        stat = _Common.fileIO.statSync(file2.fd);
        (0, _Common.expect)(stat.size == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file2);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_append_file_sync_001 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/symlink.test.js":
/*!******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/symlink.test.js ***!
  \******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOSymlink;
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOSymlink() {
  (0, _Common.describe)('fileIO_fs_symlink', function () {
    (0, _Common.it)('fileIO_test_symlink_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath, fpath + 'link0');
        (0, _Common.expect)(_Common.fileIO.accessSync(fpath + 'link0')).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpath + 'link0');
      } catch (e) {
        console.log('fileIO_test_symlink_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_symlink_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_sync_002', 0, async function () {
      let dstDir = await _ohosAbility.default.getContext().getOrCreateDistributedDir();
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlinkSync(fpath, dstDir + '/link_000');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_symlink_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900001 && e.message == 'Operation not permitted').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlink(fpath, fpath + 'link1').then(() => {
          (0, _Common.expect)(_Common.fileIO.accessSync(fpath + 'link1')).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpath + 'link1');
        }).catch(err => {
          console.log('fileIO_test_symlink_async_000 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
        done();
      } catch (e) {
        console.log('fileIO_test_symlink_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.symlink(fpath, fpath + 'link2');
        (0, _Common.expect)(_Common.fileIO.accessSync(fpath + 'link2')).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        _Common.fileIO.unlinkSync(fpath + 'link2');
        done();
      } catch (e) {
        console.log('fileIO_test_symlink_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlink(fpath, fpath + 'link3', err => {
          if (err) {
            console.log('fileIO_test_symlink_async_002 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(_Common.fileIO.accessSync(fpath + 'link3')).assertTrue();
          _Common.fileIO.unlinkSync(fpath);
          _Common.fileIO.unlinkSync(fpath + 'link3');
          done();
        });
      } catch (e) {
        console.log('fileIO_test_symlink_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.symlink(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_symlink_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_async_004', 0, async function (done) {
      let dstDir = await _ohosAbility.default.getContext().getOrCreateDistributedDir();
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.symlink(fpath, dstDir + '/link_001');
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_symlink_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900001 && e.message == 'Operation not permitted').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_symlink_async_005', 0, async function (done) {
      let dstDir = await _ohosAbility.default.getContext().getOrCreateDistributedDir();
      let fpath = await (0, _Common.nextFileName)('fileIO_test_symlink_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.symlink(fpath, dstDir + '/link_002', err => {
          if (err) {
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_test_symlink_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900001 && err.message == 'Operation not permitted').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_symlink_async_005 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/truncate.test.js":
/*!*******************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/truncate.test.js ***!
  \*******************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOTruncate;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOTruncate() {
  (0, _Common.describe)('fileIO_fs_truncate', function () {
    (0, _Common.it)('fileIO_truncate_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let truncateLen = 5;
      try {
        await _Common.fileIO.truncate(fpath, truncateLen);
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readLen == truncateLen).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_truncate_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      let truncateLen = 5;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.truncate(file.fd, truncateLen, err => {
          if (err) {
            console.log('fileIO_truncate_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == truncateLen).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_truncate_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, 'truncate')).assertTrue();
      let truncateLen = 2;
      try {
        _Common.fileIO.truncate(fpath, truncateLen).then(() => {
          let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == truncateLen).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_truncate_async_002 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_truncate_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, 'truncate')).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      let truncateLen = 2;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.truncate(file.fd, truncateLen).then(() => {
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == truncateLen).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        }).catch(err => {
          console.log('fileIO_truncate_async_003 error package: ' + JSON.stringify(err));
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_truncate_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_004');
      let truncateLen = 2;
      try {
        _Common.fileIO.truncate(fpath, truncateLen, err => {
          if (err) {
            console.log('fileIO_truncate_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_truncate_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_005');
      let truncateLen = 2;
      try {
        await _Common.fileIO.truncate(fpath, truncateLen);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_truncate_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.truncate(file.fd, err => {
          if (err) {
            console.log('fileIO_truncate_async_006 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == 0).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_truncate_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.truncate(fpath, err => {
          if (err) {
            console.log('fileIO_truncate_async_007 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
          (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == 0).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_truncate_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_008', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.truncate(fpath, undefined);
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readLen == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_truncate_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_truncate_async_009', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_truncate_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, 'truncate')).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.truncate(file.fd, undefined, err => {
          if (err) {
            console.log('fileIO_truncate_async_009 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
          (0, _Common.expect)(readLen == 0).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_truncate_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_truncate_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_truncate_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.truncateSync(fpath);
        (0, _Common.expect)(_Common.fileIO.statSync(fpath).size == 0).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_truncate_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_truncate_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_truncate_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      let truncateLen = 5;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.truncateSync(file.fd, truncateLen);
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readLen == truncateLen).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_truncate_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_truncate_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_truncate_sync_002');
      try {
        _Common.fileIO.truncateSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_truncate_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_truncate_sync_003', 0, async function () {
      let truncateLen = 2;
      try {
        _Common.fileIO.truncateSync(-1, truncateLen);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_truncate_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_truncate_sync_004', 0, function () {
      try {
        _Common.fileIO.truncateSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_truncate_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_truncate_sync_005', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_truncate_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.truncateSync(file.fd, undefined);
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(readLen == 0).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_truncate_sync_005 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/unlink.test.js":
/*!*****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/unlink.test.js ***!
  \*****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOUnlink;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOUnlink() {
  (0, _Common.describe)('fileIO_fs_unlink', function () {
    (0, _Common.it)('fileIO_test_unlink_sync_000', 0, function () {
      try {
        _Common.fileIO.unlinkSync();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unlink_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIOTest');
      try {
        _Common.fileIO.unlinkSync(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unlink_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_unlink_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(fpath)).assertTrue();
        _Common.fileIO.unlinkSync(fpath);
        (0, _Common.expect)(!_Common.fileIO.accessSync(fpath)).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unlink_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_sync_003', 0, async function () {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_unlink_sync_003');
      _Common.fileIO.mkdirSync(dpath);
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        _Common.fileIO.unlinkSync(dpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_unlink_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_unlink_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(fpath)).assertTrue();
        await _Common.fileIO.unlink(fpath);
        (0, _Common.expect)(!_Common.fileIO.accessSync(fpath)).assertTrue();
        done();
      } catch (e) {
        console.log('fileIO_test_unlink_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_unlink_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(fpath)).assertTrue();
        _Common.fileIO.unlink(fpath, err => {
          if (err) {
            console.log('fileIO_test_unlink_async_001 error package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(!_Common.fileIO.accessSync(fpath)).assertTrue();
          done();
        });
      } catch (e) {
        console.log('fileIO_test_unlink_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIOTest');
      try {
        _Common.fileIO.unlink(fpath, err => {
          if (err) {
            console.log('fileIO_test_unlink_async_002 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_unlink_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIOTest');
      try {
        await _Common.fileIO.unlink(fpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unlink_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_004', 0, async function (done) {
      try {
        await _Common.fileIO.unlink();
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unlink_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_005', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_unlink_async_005');
      _Common.fileIO.mkdirSync(dpath);
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        await _Common.fileIO.unlink(dpath);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.rmdirSync(dpath);
        console.log('fileIO_test_unlink_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900019 && e.message == 'Is a directory').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_unlink_async_006', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('fileIO_test_unlink_async_006');
      _Common.fileIO.mkdirSync(dpath);
      try {
        (0, _Common.expect)(_Common.fileIO.accessSync(dpath)).assertTrue();
        _Common.fileIO.unlink(dpath, err => {
          if (err) {
            _Common.fileIO.rmdirSync(dpath);
            console.log('fileIO_test_unlink_async_006 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900019 && err.message == 'Is a directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_unlink_async_006 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/write.test.js":
/*!****************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/members/write.test.js ***!
  \****************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileIOWrite;
var _Common = __webpack_require__(/*! ../Common */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/Common.js");
function fileIOWrite() {
  (0, _Common.describe)('fileIO_fs_write', function () {
    (0, _Common.it)('fileIO_test_write_sync_000', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten1 = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = _Common.fileIO.writeSync(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length));
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_001', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_002', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          offset: 1
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_003', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          length: 1
        });
        (0, _Common.expect)(bytesWritten == 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_004', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          offset: 1,
          length: 1
        });
        (0, _Common.expect)(bytesWritten == 1).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_005', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          offset: 1,
          length: 5,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == 5).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_006', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      const invalidLength = 9999;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_007', 0, function () {
      try {
        _Common.fileIO.writeSync(-1, _Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_write_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_008', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = _Common.fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(bytesWritten == 4096).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_009', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      const invalidLength = 4097;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.writeSync(file.fd, new ArrayBuffer(4096), {
          length: invalidLength
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_sync_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_010', 0, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      const invalidOffset = -1;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          offset: invalidOffset
        });
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_sync_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_011', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten1 = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, undefined);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = _Common.fileIO.writeSync(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), undefined);
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_sync_012', 3, async function () {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_sync_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten1 = _Common.fileIO.writeSync(file.fd, _Common.FILE_CONTENT, {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = _Common.fileIO.writeSync(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), {
          offset: undefined,
          length: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_sync_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_000', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_000');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten1 = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await _Common.fileIO.write(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length));
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_000 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_001', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_001');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, (err, bytesWritten1) => {
          if (err) {
            console.log('fileIO_test_write_async_001 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.write(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), (err, bytesWritten2) => {
            if (err) {
              console.log('fileIO_test_write_async_001 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
            let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
              offset: 0
            });
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_write_async_001 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_002', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_002');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_async_002 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_003', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_003');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_ONLY);
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, err => {
          if (err) {
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            console.log('fileIO_test_write_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
            (0, _Common.expect)(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log('fileIO_test_write_async_003 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_004', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_004');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: 3
        });
        (0, _Common.expect)(bytesWritten == 3).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_004 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_005', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_005');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: 3
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_write_async_005 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 3).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_write_async_005 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_006', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_006');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          offset: 5
        });
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_006 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_007', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_007');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          offset: 5
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_write_async_007 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_write_async_007 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_008', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_008');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: 3,
          offset: 5
        });
        (0, _Common.expect)(bytesWritten == 3).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_008 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_009', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_009');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: 3,
          offset: 5
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_write_async_009 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 3).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_write_async_009 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_010', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_010');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: 4,
          offset: 5,
          encoding: 'utf-8'
        });
        (0, _Common.expect)(bytesWritten == 4).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_010 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_011', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_011');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: 5,
          offset: 5,
          encoding: 'utf-8'
        }, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_write_async_011 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 5).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_write_async_011 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_012', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_012');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = await _Common.fileIO.write(file.fd, new ArrayBuffer(4096));
        (0, _Common.expect)(bytesWritten == 4096).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_012 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_013', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_013');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, new ArrayBuffer(4096), (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_write_async_013 err package: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 4096).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_write_async_013 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_014', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_014');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {});
        (0, _Common.expect)(bytesWritten == _Common.FILE_CONTENT.length).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_014 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_015', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_015');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, new ArrayBuffer(4096), {}, (err, bytesWritten) => {
          if (err) {
            console.log('fileIO_test_write_async_015 err package ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten == 4096).assertTrue();
          _Common.fileIO.closeSync(file);
          _Common.fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log('fileIO_test_write_async_015 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_016', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_016');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        await _Common.fileIO.write(-1, _Common.FILE_CONTENT);
        (0, _Common.expect)(false).assertTrue();
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_async_016 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_017', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_017');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        _Common.fileIO.write(-1, _Common.FILE_CONTENT, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_async_017 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_018', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_018');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      const invalidLength = 9999;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: invalidLength
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_async_018 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_019', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_019');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      const invalidLength = 4097;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, new ArrayBuffer(4096), {
          length: invalidLength
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_async_019 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_020', 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_020');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.WRITE_ONLY);
      const invalidOffset = -1;
      try {
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          offset: invalidOffset
        }, err => {
          (0, _Common.expect)(false).assertTrue();
        });
      } catch (e) {
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        console.log('fileIO_test_write_async_020 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_021', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_021');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten1 = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, undefined);
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await _Common.fileIO.write(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), undefined);
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_021 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_022', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_022');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, undefined, (err, bytesWritten1) => {
          if (err) {
            console.log('fileIO_test_write_async_022 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.write(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), undefined, (err, bytesWritten2) => {
            if (err) {
              console.log('fileIO_test_write_async_022 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
            let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
              offset: 0
            });
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_write_async_022 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_023', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_023');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        let bytesWritten1 = await _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: undefined,
          offset: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
        let bytesWritten2 = await _Common.fileIO.write(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), {
          length: undefined,
          offset: undefined,
          encoding: undefined
        });
        (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
        let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
        _Common.fileIO.closeSync(file);
        _Common.fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('fileIO_test_write_async_023 has failed for ' + e.message + ', code: ' + e.code);
        (0, _Common.expect)(false).assertTrue();
      }
    });
    (0, _Common.it)('fileIO_test_write_async_024', 3, async function (done) {
      let fpath = await (0, _Common.nextFileName)('fileIO_test_write_async_024');
      (0, _Common.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      try {
        let file = _Common.fileIO.openSync(fpath, _Common.fileIO.OpenMode.READ_WRITE);
        (0, _Common.expect)((0, _Common.isIntNum)(file.fd)).assertTrue();
        _Common.fileIO.write(file.fd, _Common.FILE_CONTENT, {
          length: undefined,
          offset: undefined,
          encoding: undefined
        }, (err, bytesWritten1) => {
          if (err) {
            console.log('fileIO_test_write_async_011 err package1: ' + JSON.stringify(err));
            (0, _Common.expect)(false).assertTrue();
          }
          (0, _Common.expect)(bytesWritten1 == _Common.FILE_CONTENT.length).assertTrue();
          _Common.fileIO.write(file.fd, new ArrayBuffer(_Common.FILE_CONTENT.length), {
            length: undefined,
            offset: undefined,
            encoding: undefined
          }, (err, bytesWritten2) => {
            if (err) {
              console.log('fileIO_test_write_async_005 err package2: ' + JSON.stringify(err));
              (0, _Common.expect)(false).assertTrue();
            }
            (0, _Common.expect)(bytesWritten2 == _Common.FILE_CONTENT.length).assertTrue();
            let readLen = _Common.fileIO.readSync(file.fd, new ArrayBuffer(4096), {
              offset: 0
            });
            (0, _Common.expect)(readLen == _Common.FILE_CONTENT.length * 2).assertTrue();
            _Common.fileIO.closeSync(file);
            _Common.fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log('fileIO_test_write_async_024 has failed for ' + e.message + ', code: ' + e.code);
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

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagefileiov9jstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/TestAbility/app.js":
/*!******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\3_new_plat\storage\storagefileiov9jstest\entry\src\ohosTest\js\TestAbility\app.js!../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/TestAbility/app.js ***!
  \******************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = function(module, exports, $app_require$){"use strict";

var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _ohos = _interopRequireDefault(requireModule("@ohos.hilog"));
var _ohosAppAbility = _interopRequireDefault(requireModule("@ohos.app.ability.abilityDelegatorRegistry"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
var _List = _interopRequireDefault(__webpack_require__(/*! ../test/List.test */ "../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/test/List.test.js"));
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
(exports.default || module.exports).manifest = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-plugin.js!../../../../build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json */ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json");

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

/***/ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json":
/*!**********************************************************************************************************************************************************************************!*\
  !*** ./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json ***!
  \**********************************************************************************************************************************************************************************/
/***/ ((module) => {

"use strict";
module.exports = JSON.parse('{"appID":"ohos.acts.storage.fileiov9","versionName":"1.0.0","versionCode":1000000,"minPlatformVersion":10,"appName":".TestAbility","deviceType":["default","tablet"],"window":{"autoDesignWidth":false,"designWidth":720},"pages":["pages/index/index"]}');

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"] ? globalThis["__common_module_cache___f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"][moduleId]: null;
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
/******/ 		              if (globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"]) {
/******/ 		                const length = globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"].length;
/******/ 		                switch (length) {
/******/ 		                  case 1:
/******/ 		                    return globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"][0][1][moduleId];
/******/ 		                  case 2:
/******/ 		                    return globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"][0][1][moduleId] ||
/******/ 		                    globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"][1][1][moduleId];
/******/ 		                }
/******/ 		              }
/******/ 		              return undefined;
/******/ 		            }
/******/ 		if (globalThis["__common_module_cache___f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"][moduleId] = module;
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
/******/ 		var chunkLoadingGlobal = globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"] = globalThis["webpackChunk_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["vendors"], () => (__webpack_require__("../../../../../../../../../3_new_plat/storage/storagefileiov9jstest/entry/src/ohosTest/js/TestAbility/app.js?entry")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	_f59c2baa85a6c8ce9e2403805f3b7cb9572045bb698da027bbc1f6df810a7231 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=app.js.map