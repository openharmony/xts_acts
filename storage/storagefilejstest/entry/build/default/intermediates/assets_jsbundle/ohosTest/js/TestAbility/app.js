var _872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46;
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestAbility/app.js?entry":
/*!**********************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestAbility/app.js?entry ***!
  \**********************************************************************************************************************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

var $app_script$ = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/node_modules/babel-loader?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/resource-reference-script.js!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-loader.js?path=D:\3_new_plat\storage\storagefilejstest\entry\src\ohosTest\js\TestAbility\app.js!./app.js */ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagefilejstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestAbility/app.js")

      $app_define$('@app-application/app', [], function($app_require$, $app_exports$, $app_module$) {
      
      $app_script$($app_module$, $app_exports$, $app_require$)
      if ($app_exports$.__esModule && $app_exports$.default) {
        $app_module$.exports = $app_exports$.default
      }
      
      })
      $app_bootstrap$('@app-application/app',undefined,undefined)

/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/Common.js":
/*!************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/Common.js ***!
  \************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.FILE_CONTENT = void 0;
exports.cacheFileName = cacheFileName;
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
exports.fileName = fileName;
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
exports.prepareEmptyFile = prepareEmptyFile;
exports.prepareFile = prepareFile;
exports.randomString = randomString;
exports.sleep = sleep;
var _ohos = _interopRequireDefault(requireModule("@ohos.fileio"));
var _ohosAbility = _interopRequireDefault(requireModule("@ohos.ability.featureAbility"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagefilejstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
const FILE_CONTENT = 'hello world';
exports.FILE_CONTENT = FILE_CONTENT;
function prepareFile(fpath, content) {
  try {
    let fd = _ohos.default.openSync(fpath, 0o102, 0o666);
    _ohos.default.ftruncateSync(fd);
    _ohos.default.writeSync(fd, content);
    _ohos.default.fsyncSync(fd);
    _ohos.default.closeSync(fd);
    return true;
  } catch (e) {
    console.log('Failed to prepareFile for ' + e);
    return false;
  }
}
function prepareEmptyFile(fpath) {
  try {
    let fd = _ohos.default.openSync(fpath, 0o102, 0o777);
    _ohos.default.closeSync(fd);
    return true;
  } catch (e) {
    console.log('Failed to prepareFile for ' + e);
    return false;
  }
}
async function nextFileName(testName) {
  var context = _ohosAbility.default.getContext();
  let data = await context.getCacheDir();
  let BASE_PATH = data + '/';
  return BASE_PATH + testName;
}
async function fileName(testName) {
  var context = _ohosAbility.default.getContext();
  let data = await context.getFilesDir();
  let BASE_PATH = data + '/';
  return BASE_PATH + testName;
}
async function cacheFileName(testName) {
  var context = _ohosAbility.default.getContext();
  let data = await context.getFilesDir();
  let BASE_PATH = data + '/cache/';
  return BASE_PATH + testName;
}
function sleep(n) {
  var start = new Date().getTime();
  while (true) {
    if (new Date().getTime() - start > n) {
      break;
    }
  }
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/File.test.js":
/*!***************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/File.test.js ***!
  \***************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = fileTest;
var _ohos = _interopRequireDefault(requireModule("@ohos.fileio"));
var _system = _interopRequireDefault(requireModule("@system.file"));
var _ohos2 = _interopRequireDefault(requireModule("@ohos.document"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagefilejstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
var _Common = __webpack_require__(/*! ./Common */ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/Common.js");
function fileTest() {
  (0, _hypium.describe)('fileTest', function () {
    (0, _hypium.it)('File_Delete_001', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_Delete_001');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, 'hello')).assertTrue();
      _system.default.delete({
        uri: 'internal://cache/../files/File_Delete_001',
        success: function () {
          console.info('File_Delete_001 call delete success');
          done();
        },
        fail: function (data, code) {
          console.info('File_Delete_001 call delete fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Delete_002', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_Delete_002',
        success: function () {
          console.info('File_Delete_002 call mkdir success.');
          _system.default.delete({
            uri: 'internal://cache/File_Delete_002',
            success: function () {
              console.info('File_Delete_002 call delete success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_Delete_002 call delete fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Delete_002 call mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Delete_003', 0, async function (done) {
      _system.default.delete({
        uri: 'internal://ohos/workspace/text.txt',
        success: function () {
          console.info('File_Delete_003 call delete success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Delete_003 call delete fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Delete_004', 0, async function (done) {
      let dpath = await (0, _Common.fileName)('File_Delete_004');
      let fpath = dpath + '/File_Delete_004';
      _ohos.default.mkdirSync(dpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.delete({
        uri: 'internal://app/File_Delete_004',
        success: function () {
          console.info('File_Delete_004 call delete success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Delete_004 call delete fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Delete_005', 0, async function (done) {
      _system.default.delete({
        uri: 'internal://app/File_Delete_005',
        success: function () {
          console.info('File_Delete_005 call delete success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Delete_005 call delete fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Delete_006', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(32);
      let dpath = await (0, _Common.fileName)(firstPath);
      let uri = 'internal://cache/' + firstPath;
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < 16; i++) {
        console.info('frequency' + i);
        let sonPath = (0, _Common.randomString)(251);
        uri = uri + '/f' + sonPath;
      }
      _system.default.delete({
        uri: uri,
        success: function () {
          console.info('File_Delete_006 call delete success');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Delete_006 call delete fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Delete_007', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_Delete_007',
        text: 'test',
        success: function () {
          console.info('File_Delete_007 call writeText success');
          _system.default.delete({
            uri: 'internal://cache/File_Delete_007',
            success: function () {
              console.info('File_Delete_007 call delete success');
              done();
            },
            fail: function (data, code) {
              console.info('File_Delete_007 call delete fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Delete_007 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Delete_008', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/../cache/File_Delete_008',
        text: 'Text that just for test.',
        success: function () {
          console.info('File_Delete_008 call writeText success');
          _system.default.delete({
            uri: 'internal://cache/../cache/File_Delete_008',
            success: function () {
              console.info('File_Delete_008 call delete success');
              done();
            },
            fail: function (data, code) {
              console.info('File_Delete_008 call delete fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            },
            complete: function () {
              console.info('delete completed');
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Delete_008 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_001', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_001',
        text: 'sawyerwang.',
        success: function () {
          console.info('File_writeText_001 call writeText success');
          _system.default.readText({
            uri: 'internal://cache/File_writeText_001',
            success: function (data) {
              console.info('File_writeText_001 call read success. Content: ');
              _system.default.delete({
                uri: 'internal://cache/File_writeText_001',
                success: function () {
                  console.info('File_writeText_001 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeText_001 call delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_001 call read fail , code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_001 call writeText fail , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_002', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_002',
        text: 'Text1.',
        success: function () {
          console.info('File_writeText_002 call writeText success.');
          _system.default.writeText({
            uri: 'internal://cache/File_writeText_002',
            text: 'Text2.',
            append: true,
            success: function () {
              console.info('File_writeText_002 call writeText success.');
              _system.default.readText({
                uri: 'internal://cache/File_writeText_002',
                success: function (data) {
                  console.info('File_writeText_002 call read success. Content: ');
                  _system.default.delete({
                    uri: 'internal://cache/File_writeText_002',
                    success: function () {
                      console.info('File_writeText_002 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeText_002 call delete fail, code: ' + code + ', data: ' + data);
                      (0, _hypium.expect)(null).assertFail();
                    }
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeText_002 call read fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_002 call writeText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_002 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_003', 0, async function (done) {
      let txt = 'hello 你好 ????? こんにちは ?????.';
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_003',
        text: txt,
        success: function () {
          console.info('File_writeText_003 call writeText success.');
          _system.default.readText({
            uri: 'internal://cache/File_writeText_003',
            success: function (data) {
              console.info('File_writeText_003 call read success. Content: ');
              _system.default.delete({
                uri: 'internal://cache/File_writeText_003',
                success: function () {
                  console.info('File_writeText_003 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeText_003 call delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_003 call read fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_003 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_004', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_004',
        text: 'hello',
        encoding: 'UTF-8',
        success: function () {
          console.info('File_writeText_004 call writeText success.');
          _system.default.readText({
            uri: 'internal://cache/File_writeText_004',
            encoding: 'UTF-8',
            success: function (data) {
              console.info('File_writeText_004 call readText success. Content: ');
              _system.default.delete({
                uri: 'internal://cache/File_writeText_004',
                success: function () {
                  console.info('File_writeText_004 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeText_004 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_004 call readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_004 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_005', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_005',
        text: 'hello,world',
        success: function () {
          console.info('File_writeText_005 call writeText success.');
          _system.default.writeText({
            uri: 'internal://cache/File_writeText_005',
            text: 'hello',
            append: true,
            success: function () {
              console.info('File_writeText_005 call writeText success.');
              _system.default.readText({
                uri: 'internal://cache/File_writeText_005',
                success: function (data) {
                  console.info('File_writeText_005 call read success ');
                  _system.default.delete({
                    uri: 'internal://cache/File_writeText_005',
                    success: function () {
                      console.info('File_writeText_005 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeText_005 call delete fail, code: ' + code + ', data: ' + data);
                      (0, _hypium.expect)(null).assertFail();
                    }
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeText_005 call readText fail , code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_005 call writeText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_005 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_006', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_006',
        text: 'hello',
        success: function () {
          console.info('File_writeText_006 call writeText success.');
          _system.default.readText({
            uri: 'internal://cache/File_writeText_006',
            success: function (data) {
              console.info('File_writeText_006 call read success ');
              _system.default.delete({
                uri: 'internal://cache/File_writeText_006',
                success: function () {
                  console.info('File_writeText_006 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeText_006 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_006 call readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_006 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_007', 0, async function (done) {
      _system.default.writeText({
        uri: '/data/accounts/account_0/appdata',
        text: 'hello',
        success: function () {
          console.info('File_writeText_007 call writeText success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_writeText_007, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_writeText_008', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('File_writeText_008d');
      _ohos.default.mkdirSync(dpath);
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_008d/',
        text: 'hello',
        success: function () {
          console.info('File_writeText_008 call writeText success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_writeText_008 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_writeText_009', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://app/File_writeText_009d/File_writeText_009',
        text: 'test',
        success: function () {
          console.info('File_writeText_009 call writeText success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_writeText_009 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_writeText_010', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_writeText_010',
        text: 'test',
        success: function () {
          console.info('File_writeText_010 mkdir success');
          _system.default.delete({
            uri: 'internal://cache/File_writeText_010',
            success: function () {
              console.info('File_writeText_010 delete success');
              done();
            },
            fail: function (data, code) {
              console.info('File_writeText_010 delete fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_010 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_011', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/../cache/File_writeText_011',
        text: 'sawyerwang',
        success: function () {
          console.info('File_writeText_011 writeText success ');
          _system.default.readText({
            uri: 'internal://cache/../cache/File_writeText_011',
            success: function (data) {
              console.info('File_writeText_011 readText success ');
              _system.default.delete({
                uri: 'internal://cache/../cache/File_writeText_011',
                success: function () {
                  console.info('File_writeText_011 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeText_011 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeText_011 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeText_011 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeText_013', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://app/notdir/File_writeText_013',
        text: 'sawyerwang',
        success: function () {
          console.info('File_writeText_013 mkdir success');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          (0, _hypium.expect)(code == 300).assertTrue();
          console.info('File_writeText_013 , code: ' + code + ', data: ' + data);
          done();
        },
        complete: function () {
          console.info('writeText completed');
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_001', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_001',
        buffer: buf,
        append: true,
        success: function () {
          console.info('File_writeArrayBuffer_001 call writeArrayBuffer success.');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_001',
            success: function (data) {
              console.info('File_writeArrayBuffer_001 call readArrayBuffer success.');
              _system.default.delete({
                uri: 'internal://cache/File_writeArrayBuffer_001',
                success: function () {
                  console.info('File_writeArrayBuffer_001 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_001 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_001 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_001 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_002', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_002',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_002 call writeArrayBuffer success.');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_002',
            success: function (data) {
              console.info('File_writeArrayBuffer_002 call readArrayBuffer success.');
              _system.default.delete({
                uri: 'internal://cache/File_writeArrayBuffer_002',
                success: function () {
                  console.info('File_writeArrayBuffer_002 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_002 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_002 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_002 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_003', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33, 48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_003',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_003 call writeText success.');
          _system.default.writeArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_003',
            buffer: buf,
            append: true,
            success: function () {
              console.info('File_writeArrayBuffer_003 call writeArrayBuffer success.');
              _system.default.readArrayBuffer({
                uri: 'internal://cache/File_writeArrayBuffer_003',
                success: function (data) {
                  console.info('File_writeArrayBuffer_003 readArrayBuffer success:');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_003 readArrayBuffer fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_003 writeArrayBuffer append fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_003 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_004', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_004',
        buffer: buf,
        append: false,
        success: function () {
          console.info('File_writeArrayBuffer_004 success call writeText success.');
          _system.default.writeArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_004',
            buffer: buf,
            append: false,
            success: function () {
              console.info('File_writeArrayBuffer_004 call writeArrayBuffer success.');
              _system.default.readArrayBuffer({
                uri: 'internal://cache/File_writeArrayBuffer_004',
                success: function (data) {
                  console.info('File_writeArrayBuffer_004: readArrayBuffer success ');
                  _system.default.delete({
                    uri: 'internal://cache/File_writeArrayBuffer_004',
                    success: function () {
                      console.info('File_writeArrayBuffer_004 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeArrayBuffer_004 delete fail, code: ' + code + ', data: ' + data);
                      (0, _hypium.expect)(null).assertFail();
                    }
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_004 readArrayBuffer fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_004 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_004 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_005', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33, 44, 55, 66, 77]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_005',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_005 call writeText success.');
          _system.default.writeArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_005',
            buffer: buf,
            position: 10,
            success: function () {
              console.info('File_writeArrayBuffer_005 call writeArrayBuffer success.');
              _system.default.readArrayBuffer({
                uri: 'internal://cache/File_writeArrayBuffer_005',
                success: function (data) {
                  console.info('File_writeArrayBuffer_005 read success:');
                  _system.default.delete({
                    uri: 'internal://cache/File_writeArrayBuffer_005',
                    success: function () {
                      console.info('File_writeArrayBuffer_005 call delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_writeArrayBuffer_005 delete fail, code: ' + code + ', data: ' + data);
                      (0, _hypium.expect)(null).assertFail();
                    }
                  });
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_005 read fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_005 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_005 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_006', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_006',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_006 call writeText success.');
          _system.default.writeArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_006',
            buffer: buf,
            success: function () {
              console.info('File_writeArrayBuffer_006 call writeArrayBuffer success.');
              _system.default.readArrayBuffer({
                uri: 'internal://cache/File_writeArrayBuffer_006',
                success: function () {
                  console.info('File_writeArrayBuffer_006 call readArrayBuffer pass');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_006 readArrayBuffer fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_006 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_006 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_007', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: '',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_007 call writeArrayBuffer success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_007 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_008', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.mkdir({
        uri: 'internal://app/File_writeArrayBuffer_008',
        success: function () {
          console.info('call mkdir success.');
          done();
        },
        fail: function (data, code) {
          console.error('call fail callback fail, code: ' + code + ', data: ' + data);
        }
      });
      _system.default.writeArrayBuffer({
        uri: 'internal://app/notdir/File_writeArrayBuffer_008',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_008 call writeArrayBuffer success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_008 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_009', 0, async function (done) {
      let buf = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_writeArrayBuffer_009',
        buffer: buf,
        success: function () {
          console.info('File_writeArrayBuffer_009 call writeArrayBuffer success');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/File_writeArrayBuffer_009',
            success: function (data) {
              console.info('File_writeArrayBuffer_009 call readArrayBuffer pass');
              _system.default.delete({
                uri: 'internal://cache/File_writeArrayBuffer_009',
                success: function () {
                  console.info('File_writeArrayBuffer_009 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_writeArrayBuffer_009 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_009 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_009 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_010', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/../cache/File_writeArrayBuffer_010',
        buffer: buf,
        append: true,
        success: function () {
          console.info('File_writeArrayBuffer_010 call writeArrayBuffer success.');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/../cache/File_writeArrayBuffer_010',
            success: function (data) {
              console.info('File_writeArrayBuffer_010 call readArrayBuffer pass');
              done();
            },
            fail: function (data, code) {
              console.info('File_writeArrayBuffer_010 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_010 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_writeArrayBuffer_012', 0, async function (done) {
      let buf = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://app/notdir/File_writeArrayBuffer_012',
        buffer: buf,
        append: true,
        success: function () {
          console.info('File_writeArrayBuffer_012  => pass');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_writeArrayBuffer_012 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        },
        complete: function () {
          console.info('writeArrayBuffer completed');
        }
      });
    });
    (0, _hypium.it)('File_readText_001', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_readText_001',
        text: 'Text that just for test.',
        success: function () {
          console.info('File_readText_001 call writeText success.');
          _system.default.readText({
            uri: 'internal://cache/File_readText_001',
            success: function (data) {
              console.info('File_readText_001 call readText success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_readText_001 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_readText_001 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_readText_002', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_readText_002',
        text: 'Text that just for test.',
        encoding: 'utf-8',
        success: function () {
          console.info('File_readText_002 call writeText success.');
          _system.default.readText({
            uri: 'internal://cache/File_readText_002',
            encoding: 'utf-8',
            success: function (data) {
              console.info('File_readText_002 call readText success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_readText_002 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_readText_002 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_readText_003', 0, async function (done) {
      _system.default.readText({
        uri: '',
        success: function (data) {
          console.info(data.text);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_readText_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_readText_004', 0, async function (done) {
      _system.default.readText({
        uri: 'internal://cache/',
        success: function (data) {
          console.info(data.text);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_readText_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_readText_005', 0, async function (done) {
      _system.default.readText({
        uri: 'internal://cache/workspace/text.txt',
        success: function (data) {
          console.info(data.text);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_readText_005 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_readText_006', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_readText_006',
        text: 'test',
        success: function () {
          console.info('File_readText_006 call success');
          _system.default.readText({
            uri: 'internal://cache/File_readText_006',
            success: function (data) {
              console.info('File_readText_006 call success');
              _system.default.delete({
                uri: 'internal://cache/File_readText_006',
                success: function () {
                  console.info('File_readText_006 call success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_readText_006 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_readText_006 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_readText_006 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_readText_007', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/../files/../files/File_readText_007',
        text: 'Text that just for test.',
        success: function () {
          console.info('File_readText_007 call writeText success.');
          _system.default.readText({
            uri: 'internal://cache/../files/../files/File_readText_007',
            success: function (data) {
              console.info('File_readText_007 call readText success. data.text:');
              _system.default.delete({
                uri: 'internal://cache/../files/../files/File_readText_007',
                success: function () {
                  console.info('File_readText_007 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_readText_007 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_readText_007 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_readText_007 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)("File_readText_008", 0, async function (done) {
      let fpath = await (0, _Common.nextFileName)("File_readText_008");
      let text = "0123456789abcdefg";
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, text)).assertTrue();
      (0, _Common.sleep)(10);
      try {
        _system.default.readText({
          uri: "internal://cache/File_readText_008",
          success: function (data) {
            console.info("call readText success: " + data.text);
            (0, _hypium.expect)(text == data.text).assertTrue();
            _ohos.default.unlinkSync(fpath);
            done();
          },
          fail: function (data, code) {
            console.error("call fail callback fail, code: " + code + ", data: " + data);
            (0, _hypium.expect)(null).assertFail();
          },
          complete: function () {
            console.info('readText completed');
          }
        });
      } catch (e) {
        console.info("File_readText_008 has failed for " + e);
        (0, _hypium.expect)(null).assertFail();
      }
    });
    (0, _hypium.it)('File_read_array_buffer_001', 0, async function (done) {
      var buffer = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_read_array_buffer_001',
        buffer: buffer,
        success: function () {
          console.info('File_read_array_buffer_001 call writeArrayBuffer success.');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/File_read_array_buffer_001',
            position: 0,
            length: 10,
            success: function (data) {
              console.info('File_read_array_buffer_001 call readArrayBuffer pass');
              _system.default.delete({
                uri: 'internal://cache/File_read_array_buffer_001',
                success: function () {
                  console.info('File_read_array_buffer_001 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_read_array_buffer_001 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_read_array_buffer_001 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_001 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_002', 0, async function (done) {
      var buffer = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_read_array_buffer_002',
        buffer: buffer,
        success: function () {
          console.info('File_read_array_buffer_002 call writeArrayBuffer success.');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/File_read_array_buffer_002',
            success: function (data) {
              console.info('File_read_array_buffer_002 call readArrayBuffer pass');
              done();
            },
            fail: function (data, code) {
              console.info('File_read_array_buffer_002 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_002 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_003', 0, async function (done) {
      _system.default.readArrayBuffer({
        uri: '',
        success: function (data) {
          console.info('File_read_array_buffer_003 call readArrayBuffer success: ');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_004', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_read_array_buffer_004');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.readArrayBuffer({
        uri: fpath,
        position: 100,
        success: function (data) {
          console.info('File_read_array_buffer_004 call readArrayBuffer success: ');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_005', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_read_array_buffer_005');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.readArrayBuffer({
        uri: fpath,
        length: -1,
        success: function (data) {
          console.info('File_read_array_buffer_005 call readArrayBuffer success: ');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_005 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_006', 0, async function (done) {
      _system.default.readArrayBuffer({
        uri: 'internal://app',
        success: function (data) {
          console.info('File_read_array_buffer_006 call readArrayBuffer success: ');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_006 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_007', 0, async function (done) {
      _system.default.readArrayBuffer({
        uri: 'internal://cache/File_read_array_buffer_007',
        success: function (data) {
          console.info('File_read_array_buffer_007 call readArrayBuffer success: ');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_007 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_008', 0, async function (done) {
      let buf = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/File_read_array_buffer_008',
        buffer: buf,
        success: function () {
          console.info('File_read_array_buffer_008 call writeArrayBuffer success');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/File_read_array_buffer_008',
            success: function (data) {
              console.info('File_read_array_buffer_008 call readArrayBuffer success ');
              _system.default.delete({
                uri: 'internal://cache/File_read_array_buffer_008',
                success: function () {
                  console.info('File_read_array_buffer_008 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_read_array_buffer_008 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_read_array_buffer_008 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_008 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_read_array_buffer_009', 0, async function (done) {
      var buffer = new Uint8Array([48, 49, 50, 51, 65, 66, 67, 68, 32, 33]);
      _system.default.writeArrayBuffer({
        uri: 'internal://cache/../cache/File_read_array_buffer_009',
        buffer: buffer,
        success: function () {
          console.info('File_read_array_buffer_009 call writeArrayBuffer success.');
          _system.default.readArrayBuffer({
            uri: 'internal://cache/../cache/File_read_array_buffer_009',
            position: 0,
            length: 10,
            success: function (data) {
              console.info('File_read_array_buffer_009 call readArrayBuffer success. data.buffer:');
              _system.default.delete({
                uri: 'internal://cache/../cache/File_read_array_buffer_009',
                success: function () {
                  console.info('File_read_array_buffer_009 call delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_read_array_buffer_009 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_read_array_buffer_009 readArrayBuffer fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            },
            complete: function () {
              console.info('readArrayBuffer completed');
            }
          });
        },
        fail: function (data, code) {
          console.info('File_read_array_buffer_009 writeArrayBuffer fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_access_001', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_access_001',
        text: 'Text that just for test.',
        success: function () {
          console.info('File_access_001 call writeText success.');
          _system.default.access({
            uri: 'internal://cache/File_access_001',
            success: function () {
              console.info('File_access_001 call access success.');
              _system.default.delete({
                uri: 'internal://cache/File_access_001',
                success: function () {
                  console.info('File_access_001 call delete success.');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_access_001 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_access_001 access fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_access_001 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_access_002', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_access_002',
        success: function () {
          console.info('File_access_002 call mkdir success.');
          _system.default.access({
            uri: 'internal://cache/File_access_002',
            success: function () {
              console.info('File_access_002 call access success.');
              _system.default.rmdir({
                uri: 'internal://cache/File_access_002',
                success: function () {
                  console.info('File_access_002 call rmdir success.');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_access_002 rmdir fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_access_002 access fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_access_002 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_access_003', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_access_003');
      _system.default.access({
        uri: fpath,
        success: function () {
          console.info('File_access_003 call access success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_access_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_access_004', 0, async function (done) {
      _system.default.access({
        uri: 'internal://app/File_access_004.txt',
        success: function () {
          console.info('File_access_004 call access success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_access_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_access_005', 0, async function (done) {
      _system.default.access({
        uri: 'internal://app/File_access_005',
        success: function () {
          console.info('File_access_005 call access success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_access_005 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_access_006', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(32);
      let dpath = await (0, _Common.fileName)(firstPath);
      let uri = 'internal://cache/' + firstPath;
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < 16; i++) {
        console.info('time' + i);
        let sonPath = (0, _Common.randomString)(251);
        uri = uri + '/f' + sonPath;
      }
      _system.default.access({
        uri: uri,
        success: function () {
          console.info('File_access_006 => pass');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_access_006 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          _ohos.default.rmdirSync(dpath);
          done();
        }
      });
    });
    (0, _hypium.it)('File_access_007', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_access_007',
        text: 'hello',
        success: function () {
          console.info('File_access_007 writeText success ');
          _system.default.access({
            uri: 'internal://cache/File_access_007',
            success: function () {
              console.info('File_access_007 access success');
              _system.default.delete({
                uri: 'internal://cache/File_access_007',
                success: function () {
                  console.info('File_access_007 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_access_007 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_access_007 access fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_access_007 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_access_008', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/../cache/File_access_008',
        text: 'Text that just for test.',
        success: function () {
          console.info('File_access_008 writeText success.');
          _system.default.access({
            uri: 'internal://cache/../cache/File_access_008',
            success: function () {
              console.info('File_access_008 call access success.');
              _system.default.delete({
                uri: 'internal://cache/../cache/File_access_008',
                success: function () {
                  console.info('File_access_008 call delete success.');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_access_008 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_access_008 access fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            },
            complete: function () {
              console.info('access completed');
            }
          });
        },
        fail: function (data, code) {
          console.info('File_access_008 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_001', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_mkdir_001',
        success: function () {
          console.info('File_mkdir_001 call mkdir success.');
          _system.default.rmdir({
            uri: 'internal://cache/File_mkdir_001',
            success: function () {
              console.info('File_mkdir_001 call rmdir success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_mkdir_001 rmdir fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_mkdir_001 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_002', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://app/test/File_mkdir_002',
        success: function () {
          console.info('File_mkdir_002 call mkdir success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_mkdir_002 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_003', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/test/File_mkdir_003d',
        recursive: true,
        success: function () {
          console.info('File_mkdir_003 call mkdir success.');
          done();
        },
        fail: function (data, code) {
          console.info('File_mkdir_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_004', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://files/test/File_mkdir_002d',
        success: function () {
          console.info('File_mkdir_004 call mkdir success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_mkdir_004, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_005', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/！@/<>',
        success: function () {
          console.info('File_mkdir_005 mkdir success');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_mkdir_005 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_006', 0, async function (done) {
      let fileName = (0, _Common.randomString)(257);
      _system.default.mkdir({
        uri: 'internal://cache/' + fileName,
        success: function () {
          console.info('File_mkdir_006 mkdir success');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_mkdir_006 =>fail ,code：' + code + ',data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_007', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_mkdir_007d',
        success: function () {
          console.info('File_mkdir_007 mkdir success');
          _system.default.rmdir({
            uri: 'internal://cache/File_mkdir_007d',
            success: function () {
              console.info('File_mkdir_007 delete success');
              done();
            },
            fail: function (data, code) {
              console.info('File_mkdir_007 delete fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_mkdir_007 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_008', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/../files/File_mkdir_008',
        success: function () {
          console.info('File_mkdir_008 call mkdir success.');
          _system.default.rmdir({
            uri: 'internal://cache/../files/File_mkdir_008',
            success: function () {
              console.info('File_mkdir_008 call rmdir success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_mkdir_008 rmdir fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_mkdir_008 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_mkdir_010', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://app/notdir/File_mkdir_010',
        success: function () {
          console.info('File_mkdir_010 call mkdir success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_mkdir_010 call mkdir callback fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        },
        complete: function () {
          console.info('mkdir completed');
        }
      });
    });
    (0, _hypium.it)('File_rmdir_001', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_rmdir_001',
        success: function () {
          console.info('File_rmdir_001 call mkdir success.');
          _system.default.rmdir({
            uri: 'internal://cache/File_rmdir_001',
            success: function () {
              console.info('File_rmdir_001 call rmdir success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_rmdir_001 rmdir fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_rmdir_001 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_002', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://app/test/File_rmdir_002',
        recursive: true,
        success: function () {
          console.info('File_rmdir_002 mkdir success.');
          _system.default.rmdir({
            uri: 'internal://app/test',
            recursive: false,
            success: function () {
              console.info('File_rmdir_002 call rmdir success.');
              (0, _hypium.expect)(null).assertFail();
            },
            fail: function (data, code) {
              console.info('File_rmdir_002 fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(code == 301 || code == 300).assertTrue();
              done();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_rmdir_002 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_003', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/test/File_rmdir_003/File_rmdir_003_1/File_rmdir_003_2',
        recursive: true,
        success: function () {
          console.info('File_rmdir_003 mkdir success.');
          _system.default.mkdir({
            uri: 'internal://cache/test/File_rmdir_003_1/File_rmdir_003_1/File_rmdir_003_2',
            recursive: true,
            success: function () {
              console.info('File_rmdir_003 mkdir success.');
              _system.default.mkdir({
                uri: 'internal://cache/test/File_rmdir_003_2/File_rmdir_003_1/File_rmdir_003_2',
                recursive: true,
                success: function () {
                  console.info('File_rmdir_003 mkdir success.');
                  _system.default.rmdir({
                    uri: 'internal://cache/test',
                    recursive: true,
                    success: function () {
                      console.info('File_rmdir_003 call rmdir success.');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_rmdir_003 , code: ' + code + ', data: ' + data);
                      (0, _hypium.expect)(null).assertFail();
                    }
                  });
                },
                fail: function (data, code) {
                  console.info('File_rmdir_003 fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_rmdir_003 fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_rmdir_003 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_004', 0, async function (done) {
      _system.default.rmdir({
        uri: '/data/accounts/account_0/appdata/ohos.acts.distributeddatamgr.distributedfile/cache/',
        success: function () {
          console.info('File_rmdir_004 call rmdir success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_rmdir_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_005', 0, async function (done) {
      _system.default.rmdir({
        uri: 'internal://app/123',
        success: function () {
          console.info('File_rmdir_005 call rmdir success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_rmdir_005 rmdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_006', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(255);
      let uri = 'internal://cache/' + firstPath;
      _system.default.mkdir({
        uri: uri,
        success: function () {
          console.info('File_rmdir_006 mkdir success');
          _system.default.rmdir({
            uri: uri,
            success: function () {
              console.info('File_rmdir_006 rmdir success');
              done();
            },
            fail: function (data, code) {
              console.info('File_rmdir_006 rmdir fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_rmdir_006 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_007', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_rmdir_007d',
        success: function () {
          console.info('File_rmdir_007 mkdir success');
          _system.default.rmdir({
            uri: 'internal://cache/File_rmdir_007d',
            success: function () {
              console.info('File_rmdir_007 rmdir success');
              done();
            },
            fail: function (data, code) {
              console.info('File_rmdir_007 rmdir fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_rmdir_007 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_008', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/../files/File_rmdir_008',
        success: function () {
          console.info('File_rmdir_008 call mkdir success.');
          _system.default.rmdir({
            uri: 'internal://cache/../files/File_rmdir_008',
            success: function () {
              console.info('File_rmdir_008 call rmdir success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_rmdir_008 rmdir fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_rmdir_008 mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_rmdir_010', 0, async function (done) {
      _system.default.rmdir({
        uri: 'internal://app/../../com.ohos.systemui',
        success: function () {
          console.info('File_rmdir_010 call rmdir success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_rmdir_010 call rmdir callback fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        },
        complete: function () {
          console.info('rmdir completed');
        }
      });
    });
    (0, _hypium.it)('File_Move_001', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_Move_001',
        text: 'Text that just for test.',
        success: function () {
          console.info('File_Move_001 call writeText success.');
          _system.default.move({
            srcUri: 'internal://cache/File_Move_001',
            dstUri: 'internal://cache/File_Move_001_1',
            success: function (data) {
              console.info('File_Move_001 call writeText success. data:' + data);
              done();
            },
            fail: function (data, code) {
              console.info('File_Move_001 move fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.error('File_Move_001 call writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Move_002', 0, async function (done) {
      let typeArray = new Array('.txt', '.ppt', '.flac', '.mp4', '.so', '.zip');
      let dpath = await (0, _Common.fileName)('cache');
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < typeArray.length; i++) {
        let srcFpath = (await (0, _Common.fileName)('File_Move_002')) + typeArray[i];
        let dstFpath = (await (0, _Common.cacheFileName)('File_Move_002')) + typeArray[i];
        (0, _hypium.expect)((0, _Common.prepareEmptyFile)(srcFpath)).assertTrue();
        _system.default.move({
          srcUri: 'internal://cache/../files/File_Move_002' + typeArray[i],
          dstUri: 'internal://cache/../files/cache/File_Move_002' + typeArray[i],
          success: function (uri) {
            console.info('File_Move_002 call move success. uri: ' + uri);
            done();
          },
          fail: function (data, code) {
            console.info('File_Move_002 , code: ' + code + ', data: ' + data);
            (0, _hypium.expect)(null).assertFail();
          }
        });
      }
    });
    (0, _hypium.it)('File_Move_003', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_003');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      let dstFpath = await (0, _Common.cacheFileName)('File_Move_003');
      let srcUri = 'internal://cache/../files/File_Move_003';
      let dstUri = 'internal://app/cache/File_Move_003';
      _system.default.move({
        srcUri: srcUri,
        dstUri: dstUri,
        success: function () {
          console.info('File_Move_003 call move success.');
          done();
        },
        fail: function (data, code) {
          console.info('File_Move_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Move_004', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_004');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.move({
        srcUri: 'internal://app/File_Move_004',
        dstUri: null,
        success: function () {
          console.info('File_Move_004 call move success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Move_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Move_005', 0, async function (done) {
      let srcDpath = await (0, _Common.fileName)('File_Move_005d');
      _ohos.default.mkdirSync(srcDpath);
      _system.default.move({
        srcUri: 'internal://cache/../files/File_Move_005d',
        dstUri: 'internal://app/cache/File_Move_005d',
        success: function () {
          console.info('File_Move_005 call move success.');
          done();
        },
        fail: function (data, code) {
          console.info('File_Move_005 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Move_006', 0, async function (done) {
      let dstUri = await (0, _Common.fileName)('File_Move_006');
      (0, _hypium.expect)((0, _Common.prepareFile)(dstUri, _Common.FILE_CONTENT)).assertTrue();
      _system.default.move({
        srcUri: 'internal://app/File_Move',
        dstUri: 'internal://app/File_Move_006',
        success: function () {
          console.info('File_Move_006 call move success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Move_006 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Move_007', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(32);
      let dpath = await (0, _Common.fileName)(firstPath);
      let uri = 'internal://app/' + firstPath;
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < 16; i++) {
        console.info('time' + i);
        let sonPath = (0, _Common.randomString)(251);
        uri = uri + '/f' + sonPath;
      }
      _system.default.move({
        srcUri: uri,
        dstUri: 'internal://cache/File_Move_007',
        success: function () {
          console.info('File_Move_007 => move success');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Move_007 => move fail');
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
      _ohos.default.rmdirSync(dpath);
    });
    (0, _hypium.it)('File_Move_008', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_Move_008',
        text: 'sss',
        success: function () {
          console.info('File_Move_008 writeText success ');
          _system.default.move({
            srcUri: 'internal://cache/File_Move_008',
            dstUri: 'internal://app/File_Move_008',
            success: function (uri) {
              console.info('File_Move_008 move pass, uri:' + uri);
              _system.default.delete({
                uri: 'internal://app/File_Move_008',
                success: function () {
                  console.info('File_Move_008 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_Move_008 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_Move_008 move fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Move_008 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Move_009', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_009');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.move({
        srcUri: 'internal://app/File_Move_009',
        dstUri: 'internal://app/File_Move_009',
        success: function (data) {
          console.info('File_Move_009 => pass');
          done();
        },
        fail: function (data, code) {
          console.info('File_Move_009 call move fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Move_010', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_010');
      let dstFpath = await (0, _Common.cacheFileName)('File_Move_010');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'aaa')).assertTrue();
      (0, _hypium.expect)((0, _Common.prepareFile)(dstFpath, 'bbb')).assertTrue();
      _system.default.move({
        srcUri: 'internal://app/File_Move_010',
        dstUri: 'internal://app/cache/File_Move_010',
        success: function (data) {
          console.info('File_Move_010 => pass');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Move_010 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Move_011', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_011');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.move({
        srcUri: 'internal://cache/../files/File_Move_011',
        dstUri: 'internal://cache/File_Move_011',
        success: function (uri) {
          console.info('File_Move_011 => pass, uri' + uri);
          done();
        },
        fail: function (data, code) {
          console.info('File_Move_011 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Move_012', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_012');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.move({
        srcUri: 'internal://app/../files/File_Move_012',
        dstUri: 'internal://app/notdir/File_Move_012',
        success: function (uri) {
          console.info('File_Move_012 => pass, uri' + uri);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Move_012 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Move_014', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Move_014');
      let dstFpath = await (0, _Common.cacheFileName)('File_Move_014');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'test')).assertTrue();
      let dstUri = 'internal://cache/File_Move_014';
      _system.default.move({
        srcUri: 'internal://cache/../files/File_Move_014',
        dstUri: dstUri,
        success: function (uri) {
          console.info('File_Move_014 move pass');
          done();
        },
        fail: function (data, code) {
          console.info('File_Move_014 => fail , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        },
        complete: function () {
          console.info('move completed');
        }
      });
    });
    (0, _hypium.it)('File_Copy_001', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_001');
      let dstFpath = await (0, _Common.cacheFileName)('File_Copy_001');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'test.')).assertTrue();
      _system.default.copy({
        srcUri: 'internal://cache/../files/File_Copy_001',
        dstUri: 'internal://cache/../files/cache/File_Copy_001',
        success: function () {
          console.info('File_Copy_001 call copy success.');
          _system.default.readText({
            uri: 'internal://cache/../files/cache/File_Copy_001',
            success: function (data) {
              console.info('File_Copy_001 read success:');
              _ohos.default.unlinkSync(srcFpath);
              _ohos.default.unlinkSync(dstFpath);
              done();
            },
            fail: function (data, code) {
              console.info('File_Copy_001 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Copy_001 copy fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Copy_002', 0, async function (done) {
      let typeArray = new Array('.txt', '.ppt', '.flac', '.mp4', '.so', '.zip');
      for (let i = 0; i < typeArray.length; i++) {
        let srcFpath = (await (0, _Common.fileName)('File_Copy_002')) + typeArray[i];
        let dstFpath = (await (0, _Common.cacheFileName)('File_Copy_002')) + typeArray[i];
        (0, _hypium.expect)((0, _Common.prepareEmptyFile)(srcFpath)).assertTrue();
        _system.default.copy({
          srcUri: 'internal://cache/../files/File_Copy_002' + typeArray[i],
          dstUri: 'internal://cache/../files/cache/File_Copy_002' + typeArray[i],
          success: function () {
            console.info('File_Copy_002 call copy success.');
            _system.default.delete('internal://cache/../files/File_Copy_002' + typeArray[i]);
            _system.default.delete('internal://cache/../files/cache/File_Copy_002' + typeArray[i]);
            done();
          },
          fail: function (data, code) {
            console.info('File_Copy_002 , code: ' + code + ', data: ' + data);
            (0, _hypium.expect)(null).assertFail();
          }
        });
      }
    });
    (0, _hypium.it)('File_Copy_003', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_003');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      let dstFpath = await (0, _Common.cacheFileName)('File_Copy_003');
      _system.default.copy({
        srcUri: 'internal://cache/../files/File_Copy_003',
        dstUri: 'internal://cache/../files/cache/File_Copy_003',
        success: function () {
          console.info('File_Copy_003 call copy success.');
          _system.default.readText({
            uri: 'internal://cache/../files/cache/File_Copy_003',
            success: function (data) {
              console.info('File_Copy_003 readText success, data.text:');
              _ohos.default.unlinkSync(srcFpath);
              _ohos.default.unlinkSync(dstFpath);
              done();
            },
            fail: function (data, code) {
              console.info('File_Copy_003 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Copy_003 copy fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Copy_004', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_004');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.copy({
        srcUri: 'internal://app/File_Copy_004',
        dstUri: null,
        success: function () {
          console.info('File_Copy_004 call copy success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Copy_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          _ohos.default.unlinkSync(srcFpath);
          done();
        }
      });
    });
    (0, _hypium.it)('File_Copy_005', 0, async function (done) {
      _system.default.mkdir({
        uri: 'internal://cache/File_Copy_005d',
        success: function () {
          console.info('File_Copy_005 call mkdir success.');
          _system.default.copy({
            srcUri: 'internal://cache/File_Copy_005d',
            dstUri: 'internal://cache/File_Copy_005d_1',
            success: function () {
              console.info('File_Copy_005 call copy success.');
              done();
            },
            fail: function (data, code) {
              console.info('File_Copy_005 , code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.error('File_Copy_005 call mkdir fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Copy_006', 0, async function (done) {
      _system.default.copy({
        srcUri: 'internal://app/fakepath',
        dstUri: 'internal://app/fakepath1',
        success: function () {
          console.info('File_Copy_006 call copy success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Copy_006 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Copy_007', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(32);
      let dpath = await (0, _Common.fileName)(firstPath);
      let uri = 'internal://cache/' + firstPath;
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < 16; i++) {
        console.info('time' + i);
        let sonPath = (0, _Common.randomString)(251);
        uri = uri + '/f' + sonPath;
      }
      _system.default.copy({
        srcUri: uri,
        dstUri: uri,
        success: function () {
          console.info('File_Copy_007 => copy success');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Copy_007 => fail, code: ' + code + ', data: ' + data);
          _ohos.default.rmdirSync(dpath);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Copy_008', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_Copy_008',
        text: 'test',
        success: function () {
          console.info('File_Copy_008 mkdir success');
          _system.default.copy({
            srcUri: 'internal://cache/File_Copy_008',
            dstUri: 'internal://cache/../files/File_Copy_008',
            success: function () {
              console.info('File_Copy_008 copy success');
              _system.default.delete({
                uri: 'internal://cache/../files/File_Copy_008',
                success: function () {
                  console.info('File_Copy_008 delete success ');
                  _system.default.delete({
                    uri: 'internal://cache/File_Copy_008',
                    success: function () {
                      console.info('File_Copy_008 delete success');
                      done();
                    },
                    fail: function (data, code) {
                      console.info('File_Copy_008 cache delete fail, code: ' + code + ', data: ' + data);
                      (0, _hypium.expect)(null).assertFail();
                    }
                  });
                },
                fail: function (data, code) {
                  console.info('File_Copy_008 files delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_Copy_008 copy fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Copy_008 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Copy_009', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_009');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.copy({
        srcUri: 'internal://app/File_Copy_009',
        dstUri: 'internal://app/File_Copy_009',
        success: function (data) {
          console.info('File_Copy_009 => pass');
          _ohos.default.unlinkSync(srcFpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Copy_009 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Copy_010', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_010');
      let dstFpath = await (0, _Common.cacheFileName)('File_Copy_010');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'aaa')).assertTrue();
      (0, _hypium.expect)((0, _Common.prepareFile)(dstFpath, 'bbb')).assertTrue();
      _system.default.copy({
        srcUri: 'internal://app/File_Copy_010',
        dstUri: 'internal://app/cache/File_Copy_010',
        success: function (data) {
          console.info('File_Copy_010 => pass');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Copy_010 , code: ' + code + ', data: ' + data);
          console.info("code::" + code);
          (0, _hypium.expect)(code == 300).assertTrue();
          _ohos.default.unlinkSync(srcFpath);
          _ohos.default.unlinkSync(dstFpath);
          done();
        }
      });
    });
    (0, _hypium.it)('File_Copy_011', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_011');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'test.')).assertTrue();
      _system.default.copy({
        srcUri: 'internal://cache/../files/File_Copy_011',
        dstUri: 'internal://cache/File_Copy_011',
        success: function () {
          console.info('File_Copy_011 copy pass');
          _system.default.readText({
            uri: 'internal://cache/File_Copy_011',
            success: function (data) {
              console.info('File_Copy_011 read success:');
              done();
            },
            fail: function (data, code) {
              console.info('File_Copy_011 readText fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Copy_011 copy fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Copy_012', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_012');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'test')).assertTrue();
      _system.default.copy({
        srcUri: 'internal://app/../files/File_Copy_012',
        dstUri: 'internal://app/notdir/File_Move_012',
        success: function () {
          console.info('File_Copy_012 copy pass');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Copy_012 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          _ohos.default.unlinkSync(srcFpath);
          done();
        }
      });
    });
    (0, _hypium.it)('File_Copy_014', 0, async function (done) {
      let srcFpath = await (0, _Common.fileName)('File_Copy_014');
      let dstFpath = await (0, _Common.cacheFileName)('File_Copy_014');
      (0, _hypium.expect)((0, _Common.prepareFile)(srcFpath, 'test')).assertTrue();
      let dstUri = 'internal://cache/File_Copy_014';
      _system.default.copy({
        srcUri: 'internal://cache/../files/File_Copy_014',
        dstUri: dstUri,
        success: function (uri) {
          console.info('File_Copy_014 copy pass');
          done();
        },
        fail: function (data, code) {
          console.info('File_Copy_014 => fail , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        },
        complete: function () {
          console.info('copy completed');
        }
      });
    });
    (0, _hypium.it)('File_List_001', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_001')) + 'd';
      let fpath = dpath + '/File_List_001';
      let ddpath = dpath + '/File_List_001_1d';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_001d',
        success: function (data) {
          console.info('File_List_001 call list success.' + JSON.stringify(data.fileList));
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_List_001 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_002', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_002')) + 'd';
      let fpath = dpath + '/File_List_002';
      let ddpath = dpath + '/File_List_002_1d';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_002d',
        success: function (data) {
          console.info('File_List_002 call list success.' + JSON.stringify(data.fileList));
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_List_002 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_003', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_003')) + 'd';
      let fpath = dpath + '/File_List_003';
      let ddpath = dpath + '/File_List_003_1d';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_003d',
        success: function (data) {
          console.info('File_List_003 call list success.' + JSON.stringify(data.fileList));
          done();
        },
        fail: function (data, code) {
          console.info('File_List_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
      _system.default.writeText({
        uri: 'internal://cache/../files/File_List_003d/File_List_003',
        text: '1',
        success: function (data) {
          console.info('File_List_003 call write success.');
          done();
        },
        fail: function (data, code) {
          console.info('File_List_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
      _system.default.list({
        uri: 'internal://cache/../files/File_List_003d',
        success: function (data) {
          console.info('File_List_003 call list success.' + JSON.stringify(data.fileList));
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_List_003 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_004', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_004')) + 'd';
      let fpath = dpath + '/File_List_004';
      let ddpath = dpath + '/File_List_004_1d';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_004d',
        success: function (data) {
          console.info('File_List_004 call list success.');
          done();
        },
        fail: function (data, code) {
          console.info('File_List_004 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_005', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_005')) + 'd';
      let fpath = dpath + '/File_List_005';
      let ddpath = dpath + '/File_List_005_1d';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_005d',
        success: function (data) {
          console.info('File_List_005 call list success.');
          done();
        },
        fail: function (data, code) {
          console.info('File_List_005 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_006', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_006')) + 'd';
      _system.default.list({
        uri: dpath,
        success: function (data) {
          console.info('File_List_006 call list success.' + data.fileList);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_List_006 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_List_007', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_List_007');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_007',
        success: function (data) {
          console.info('File_List_007 pass, data.fileList:' + JSON.stringify(data.fileList));
          _ohos.default.unlinkSync(fpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_List_007 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_008', 0, async function (done) {
      _system.default.list({
        uri: 'internal://app/fakepath',
        success: function (data) {
          console.info('File_List_008 call list success.' + JSON.stringify(data.fileList));
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_List_008 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_List_009', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(32);
      let dpath = await (0, _Common.fileName)(firstPath);
      let uri = 'internal://app/' + firstPath;
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < 16; i++) {
        console.info('time' + i);
        let sonPath = (0, _Common.randomString)(251);
        uri = uri + '/f' + sonPath;
      }
      _system.default.list({
        uri: uri,
        success: function (data) {
          console.info('File_List_009 => pass' + data);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_List_009 , code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          _ohos.default.rmdirSync(dpath);
          done();
        }
      });
    });
    (0, _hypium.it)('File_List_010', 0, async function (done) {
      let dpath = await (0, _Common.nextFileName)('File_List_010d');
      let fpath = dpath + '/File_List_010';
      let ffpath = dpath + '/File_List_010_1';
      let ddpath = dpath + '/File_List_010_1d';
      let fffpath = ddpath + '/File_List_010_2';
      try {
        _ohos.default.mkdirSync(dpath);
        _ohos.default.mkdirSync(ddpath);
        (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
        (0, _hypium.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
        (0, _hypium.expect)((0, _Common.prepareFile)(fffpath, _Common.FILE_CONTENT)).assertTrue();
      } catch (e) {
        console.info('File_List_010 has failed for ' + e);
        (0, _hypium.expect)(null).assertFail();
      }
      _system.default.list({
        uri: 'internal://cache/File_List_010d',
        success: function (data) {
          console.info('File_List_010 => pass' + JSON.stringify(data.fileList));
          _ohos.default.unlinkSync(fpath);
          _ohos.default.unlinkSync(ffpath);
          _ohos.default.unlinkSync(fffpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_List_010 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_011', 0, async function (done) {
      let dpath = (await (0, _Common.fileName)('File_List_011')) + 'd';
      let fpath = dpath + '/File_List_011';
      let ddpath = dpath + '/File_List_011_1d';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.list({
        uri: 'internal://cache/../files/File_List_011d',
        success: function (data) {
          console.info('File_List_011 call list success.' + JSON.stringify(data.fileList));
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_List_011 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_List_012', 0, async function (done) {
      _system.default.list({
        uri: 'internal://cache/../files/../../',
        success: function (data) {
          console.info('File_List_012 call list success.' + JSON.stringify(data.fileList));
          done();
        },
        fail: function (data, code) {
          console.info('File_List_012 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        },
        complete: function () {
          console.info('list completed');
        }
      });
    });
    (0, _hypium.it)('File_Get_001', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_Get_001');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/File_Get_001',
        recursive: true,
        success: function (data) {
          console.info('File_Get_001 pass,data.uri：');
          _ohos.default.unlinkSync(fpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_001 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_002', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_Get_002');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/File_Get_002',
        recursive: false,
        success: function (data) {
          console.info('File_Get_002 => file list：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          _ohos.default.unlinkSync(fpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_002 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_003', 0, async function (done) {
      let fpath = await (0, _Common.fileName)('File_Get_003');
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/File_Get_003',
        success: function (data) {
          console.info('File_Get_003 => file list：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          console.info('File_Get_003 => pass');
          _ohos.default.unlinkSync(fpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_003 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_004', 0, async function (done) {
      let dpath = await (0, _Common.fileName)('File_Get_004d');
      let ddpath = dpath + '/File_Get_004dd';
      let fpath = dpath + '/File_Get_004f';
      let ffpath = ddpath + '/File_Get_004ff';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _hypium.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/File_Get_004d',
        recursive: true,
        success: function (data) {
          console.info('File_Get_004 => file list：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          console.info('File_Get_004 => pass');
          _ohos.default.unlinkSync(ffpath);
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_004 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_005', 0, async function (done) {
      let dpath = await (0, _Common.fileName)('File_Get_005d');
      let ddpath = dpath + '/File_Get_005dd';
      let fpath = dpath + '/File_Get_005f';
      let ffpath = ddpath + '/File_Get_005ff';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _hypium.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/File_Get_005d',
        recursive: false,
        success: function (data) {
          console.info('File_Get_005 => file list ：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          console.info('File_Get_005 => pass');
          _ohos.default.unlinkSync(ffpath);
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_005 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_006', 0, async function (done) {
      let dpath = await (0, _Common.fileName)('File_Get_006d');
      let ddpath = dpath + '/File_Get_006dd';
      let fpath = dpath + '/File_Get_006f';
      let ffpath = ddpath + '/File_Get_006ff';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _hypium.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/File_Get_006d',
        success: function (data) {
          console.info('File_Get_006 file list：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          console.info('File_Get_006 => pass');
          _ohos.default.unlinkSync(ffpath);
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_006 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_007', 0, async function (done) {
      _system.default.get({
        recursive: true,
        success: function (data) {
          console.info('File_Get_007 call Copy success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Get_007 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Get_008', 0, async function (done) {
      _system.default.get({
        success: function (data) {
          console.info(data);
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Get_008 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Get_009', 0, async function (done) {
      _system.default.get({
        uri: 'internal://app/File_Get_009',
        success: function (data) {
          console.info('File_Get_009 call Copy success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Get_009 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 301).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Get_010', 0, async function (done) {
      _system.default.get({
        uri: -1,
        success: function (data) {
          console.info('File_Get_010 call Copy success.');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Get_010 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 202).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Get_011', 0, async function (done) {
      _system.default.writeText({
        uri: 'internal://cache/File_Get_011',
        text: 'test',
        success: function () {
          console.info('File_Get_011 writeText success');
          _system.default.get({
            uri: 'internal://cache/File_Get_011',
            recursive: true,
            success: function (data) {
              console.info('file list');
              console.info('uri:');
              console.info('length:' + data.length);
              console.info('lastModifiedTime:' + data.lastModifiedTime);
              console.info('type:' + data.type);
              console.info('subFiles:' + data.subFiles);
              _system.default.delete({
                uri: 'internal://cache/File_Get_011',
                success: function () {
                  console.info('File_Get_011 delete success');
                  done();
                },
                fail: function (data, code) {
                  console.info('File_Get_011 delete fail, code: ' + code + ', data: ' + data);
                  (0, _hypium.expect)(null).assertFail();
                }
              });
            },
            fail: function (data, code) {
              console.info('File_Get_011 get fail, code: ' + code + ', data: ' + data);
              (0, _hypium.expect)(null).assertFail();
            }
          });
        },
        fail: function (data, code) {
          console.info('File_Get_011 writeText fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_012', 0, async function (done) {
      let firstPath = (0, _Common.randomString)(32);
      let dpath = await (0, _Common.fileName)(firstPath);
      let uri = 'internal://cache/' + firstPath;
      _ohos.default.mkdirSync(dpath);
      for (let i = 0; i < 16; i++) {
        console.info('time' + i);
        let sonPath = (0, _Common.randomString)(251);
        uri = uri + '/f' + sonPath;
      }
      _system.default.get({
        uri: uri,
        recursive: true,
        success: function (data) {
          console.info('file list');
          console.info('uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles);
          console.info('File_Get_012 => pass');
          (0, _hypium.expect)(null).assertFail();
        },
        fail: function (data, code) {
          console.info('File_Get_012 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(code == 300).assertTrue();
          done();
        }
      });
    });
    (0, _hypium.it)('File_Get_013', 0, async function (done) {
      let dpath = await (0, _Common.fileName)('File_Get_013d');
      let ddpath = dpath + '/File_Get_013dd';
      let fpath = dpath + '/File_Get_013f';
      let ffpath = ddpath + '/File_Get_013ff';
      _ohos.default.mkdirSync(dpath);
      _ohos.default.mkdirSync(ddpath);
      (0, _hypium.expect)((0, _Common.prepareFile)(fpath, _Common.FILE_CONTENT)).assertTrue();
      (0, _hypium.expect)((0, _Common.prepareFile)(ffpath, _Common.FILE_CONTENT)).assertTrue();
      _system.default.get({
        uri: 'internal://cache/../files/../files/File_Get_013d',
        recursive: true,
        success: function (data) {
          console.info('File_Get_013 => file list：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          console.info('File_Get_013 => pass');
          _ohos.default.unlinkSync(ffpath);
          _ohos.default.unlinkSync(fpath);
          _ohos.default.rmdirSync(ddpath);
          _ohos.default.rmdirSync(dpath);
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_013 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        }
      });
    });
    (0, _hypium.it)('File_Get_014', 0, async function (done) {
      _system.default.get({
        uri: 'internal://cache/../files/../../',
        success: function (data) {
          console.info('File_Get_014 => file list ：');
          console.info('{uri:');
          console.info('length:' + data.length);
          console.info('lastModifiedTime:' + data.lastModifiedTime);
          console.info('type:' + data.type);
          console.info('subFiles:' + data.subFiles + '}');
          console.info('File_Get_014 => pass');
          done();
        },
        fail: function (data, code) {
          console.info('File_Get_014 fail, code: ' + code + ', data: ' + data);
          (0, _hypium.expect)(null).assertFail();
        },
        complete: function () {
          console.info('get completed');
        }
      });
    });
    (0, _hypium.it)('File_Document_Choose_001', 0, async function (done) {
      try {
        let types = [];
        let code = await _ohos2.default.choose(types);
        let str = 'Error';
        console.info("getFileUri===>" + code);
        (0, _hypium.expect)(str).assertTrue();
        done();
      } catch (e) {
        console.info('File_Document_Choose_001 has failed for ' + e.message);
        (0, _hypium.expect)(e.message == "error").assertTrue();
        done();
      }
    });
    (0, _hypium.it)('File_Document_Choose_002', 0, async function (done) {
      try {
        let uri = "";
        let code = await _ohos2.default.choose(function (err, uri) {});
        console.info("getFileUri===>" + code);
        (0, _hypium.expect)(uri).assertTrue();
        done();
      } catch (e) {
        console.info('File_Document_Choose_002 has failed for ' + e.message);
        (0, _hypium.expect)(e.message == "error").assertTrue();
        done();
      }
    });
    (0, _hypium.it)('File_Document_Choose_003', 0, async function (done) {
      try {
        let types = [];
        let uri = "";
        let code = await _ohos2.default.choose(types, function (err, uri) {});
        console.info("getFileUri===>" + code);
        (0, _hypium.expect)().assertTrue();
        done();
      } catch (e) {
        console.info('File_Document_Choose_003 has failed for ' + e.message);
        (0, _hypium.expect)(e.message == "error").assertTrue();
        done();
      }
    });
    (0, _hypium.it)('File_Document_Show_001', 0, async function (done) {
      try {
        let type = "";
        let uri = "";
        let code = await _ohos2.default.show(uri, type);
        console.info("getFileUri===>" + code);
        (0, _hypium.expect)().assertTrue();
        done();
      } catch (e) {
        console.info('File_Document_Show_001 has failed for ' + e.message);
        (0, _hypium.expect)(e.message == "error").assertTrue();
        done();
      }
    });
    (0, _hypium.it)('File_Document_Show_002', 0, async function (done) {
      try {
        let type = "";
        let uri = "";
        let code = await _ohos2.default.show(uri, type, function (err) {});
        console.info("getFileUri===>" + code);
        (0, _hypium.expect)().assertTrue();
        done();
      } catch (e) {
        console.info('File_Document_Show_002 has failed for ' + e.message);
        (0, _hypium.expect)(e.message == "error").assertTrue();
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

/***/ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/List.test.js":
/*!***************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/List.test.js ***!
  \***************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = testsuite;
var _FileTest = _interopRequireDefault(__webpack_require__(/*! ./File.test.js */ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/File.test.js"));
function testsuite() {
  (0, _FileTest.default)();
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

/***/ "./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\\quxianfei_work\\tools\\Huawei\\OpenHarmony\\Sdk\\10\\js\\build-tools\\ace-loader\\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\\3_new_plat\\storage\\storagefilejstest\\entry\\src\\ohosTest\\js\\TestAbility\\app.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestAbility/app.js":
/*!**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./lib/script.js!./node_modules/babel-loader/lib/index.js?extends=D:\quxianfei_work\tools\Huawei\OpenHarmony\Sdk\10\js\build-tools\ace-loader\babel.config.js&targets=node 8!./lib/resource-reference-script.js!./lib/manifest-loader.js?path=D:\3_new_plat\storage\storagefilejstest\entry\src\ohosTest\js\TestAbility\app.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestAbility/app.js ***!
  \**********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = function(module, exports, $app_require$){"use strict";

var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _ohos = _interopRequireDefault(requireModule("@ohos.hilog"));
var _ohosAppAbility = _interopRequireDefault(requireModule("@ohos.app.ability.abilityDelegatorRegistry"));
var _hypium = __webpack_require__(/*! @ohos/hypium */ "../../../../../../../../../3_new_plat/storage/storagefilejstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js");
var _List = _interopRequireDefault(__webpack_require__(/*! ../test/List.test */ "../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/test/List.test.js"));
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
(exports.default || module.exports).manifest = __webpack_require__(/*! !!../../../../../../../../quxianfei_work/tools/Huawei/OpenHarmony/Sdk/10/js/build-tools/ace-loader/lib/manifest-plugin.js!../../../../build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json */ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json");

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

/***/ "./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json":
/*!******************************************************************************************************************************************************************************!*\
  !*** ./lib/manifest-plugin.js!../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/build/default/intermediates/manifest/ohosTest/TestAbility/manifest.json ***!
  \******************************************************************************************************************************************************************************/
/***/ ((module) => {

"use strict";
module.exports = JSON.parse('{"appID":"ohos.acts.storage.file","versionName":"1.0.0","versionCode":1000000,"minPlatformVersion":10,"appName":".TestAbility","deviceType":["tablet","default"],"window":{"autoDesignWidth":false,"designWidth":720},"pages":["pages/index/index"]}');

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		var commonCachedModule = globalThis["__common_module_cache___872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"] ? globalThis["__common_module_cache___872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"][moduleId]: null;
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
/******/ 		              if (globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"]) {
/******/ 		                const length = globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"].length;
/******/ 		                switch (length) {
/******/ 		                  case 1:
/******/ 		                    return globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"][0][1][moduleId];
/******/ 		                  case 2:
/******/ 		                    return globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"][0][1][moduleId] ||
/******/ 		                    globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"][1][1][moduleId];
/******/ 		                }
/******/ 		              }
/******/ 		              return undefined;
/******/ 		            }
/******/ 		if (globalThis["__common_module_cache___872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"] && String(moduleId).indexOf("?name=") < 0 && isCommonModue(moduleId)) {
/******/ 		  globalThis["__common_module_cache___872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"][moduleId] = module;
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
/******/ 		var chunkLoadingGlobal = globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"] = globalThis["webpackChunk_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46"] || [];
/******/ 		chunkLoadingGlobal.forEach(webpackJsonpCallback.bind(null, 0));
/******/ 		chunkLoadingGlobal.push = webpackJsonpCallback.bind(null, chunkLoadingGlobal.push.bind(chunkLoadingGlobal));
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module depends on other loaded chunks and execution need to be delayed
/******/ 	var __webpack_exports__ = __webpack_require__.O(undefined, ["vendors"], () => (__webpack_require__("../../../../../../../../../3_new_plat/storage/storagefilejstest/entry/src/ohosTest/js/TestAbility/app.js?entry")))
/******/ 	__webpack_exports__ = __webpack_require__.O(__webpack_exports__);
/******/ 	_872da1165959a0e91595b625b5c59dceb0d11e8303ef3e7bb7a8721895b7eb46 = __webpack_exports__;
/******/ 	
/******/ })()
;
//# sourceMappingURL=app.js.map