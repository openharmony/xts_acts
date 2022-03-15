/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import worker from '@ohos.worker';
import hks from '@ohos.security.huks';
import {
  aliasA,
  aliasB,
  failStr,
  loop,
  successStr,
  emptyOption,
  makeEncryptAndDecryptOption,
  makeGenerateKeyOption,
  makeImportOption,
  makeMacOption,
  makeRandomArr,
  makeSignAndVerifyOption,
  makeAgreeOption
} from '../../test/hks_common.test.js';

var parentPort = worker.parentPort;
var plainText = makeRandomArr(64);
var signPlainText = makeRandomArr(16);

var generateKeyOption = makeGenerateKeyOption(
  hks.HksKeyAlg.HKS_ALG_AES,
  hks.HksKeySize.HKS_AES_KEY_SIZE_128,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksCipherMode.HKS_MODE_CBC,
  null
);

var encryptAesOpt = makeEncryptAndDecryptOption(
  hks.HksKeyAlg.HKS_ALG_AES,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksCipherMode.HKS_MODE_CBC,
  null,
  null,
  plainText
);

var signOption = makeSignAndVerifyOption(
  hks.HksKeyAlg.HKS_ALG_ECC,
  hks.HksKeySize.HKS_ECC_KEY_SIZE_224,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksKeyDigest.HKS_DIGEST_NONE,
  signPlainText
);

var verifyOption = makeSignAndVerifyOption(
  hks.HksKeyAlg.HKS_ALG_ECC,
  hks.HksKeySize.HKS_ECC_KEY_SIZE_224,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksKeyDigest.HKS_DIGEST_NONE,
  signPlainText
);

var macOption = makeMacOption(plainText);

var actionMap = new Map([
  ['Hks_Concurrency_Test_00100', function() {
    hksConcurrencyTest001();
  }],
  ['Hks_Concurrency_Test_00200', function() {
    hksConcurrencyTest002(0);
  }],
  ['Hks_Concurrency_Test_00300', function() {
    hksConcurrencyTest003();
  }],
  ['Hks_Concurrency_Test_00400', function() {
    hksConcurrencyTest004(0);
  }],
  ['Hks_Concurrency_Test_00500', function() {
    hksConcurrencyTest005();
  }],
  ['Hks_Concurrency_Test_00600', function() {
    hksConcurrencyTest006(0);
  }],
  ['Hks_Concurrency_Test_00700', function() {
    hksConcurrencyTest007();
  }],
  ['Hks_Concurrency_Test_00800', function() {
    hksConcurrencyTest008();
  }],
  ['Hks_Concurrency_Test_00900', function() {
    hksConcurrencyTest009();
  }],
  ['Hks_Concurrency_Test_01000', function() {
    hksConcurrencyTest010();
  }],
  ['Hks_Concurrency_Test_01100', function() {
    hksConcurrencyTest011(0);
  }],
  ['Hks_Concurrency_Test_01200', function() {
    hksConcurrencyTest012();
  }],
  ['Hks_Concurrency_Test_01300', function() {
    hksConcurrencyTest013(0);
  }],
  ['Hks_Concurrency_Test_01400', function() {
    hksConcurrencyTest014();
  }],
  ['Hks_Concurrency_Test_01500', function() {
    hksConcurrencyTest015(0);
  }],
  ['Hks_Concurrency_Test_01600', function() {
    hksConcurrencyTest016();
  }],
  ['Hks_Concurrency_Test_01700', function() {
    hksConcurrencyTest017(0);
  }],
  ['Hks_Concurrency_Test_01800', function() {
    hksConcurrencyTest018();
  }],
  ['Hks_Concurrency_Test_01900', function() {
    hksConcurrencyTest019(0);
  }],
  ['Hks_Concurrency_Test_02000', function() {
    hksConcurrencyTest020();
  }],
  ['Hks_Concurrency_Test_02100', function() {
    hksConcurrencyTest021(0);
  }]
]);

parentPort.onmessage = function(data) {
  var caseId = data.data.value;
  var testFunction = actionMap.get(caseId);
  if (testFunction != null) {
    testFunction();
  } else {
    console.log ('hksConcurrencyTest default check:' + caseId);
    parentPort.postMessage (failStr);
  }
};

async function hksConcurrencyTest001() {
  for (let index = 0;index < loop; index ++) {
    console.log('hksConcurrencyTest001 running index: ' + index);
    var result = await hks.generateKey('alias001', generateKeyOption);
    if (result.errorCode != hks.HksErrorCode.HKS_SUCCESS) {
      console.log('hksConcurrencyTest001 fail detail ' + JSON.stringify(result));
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest002(index) {
  console.log('hksConcurrencyTest002 running index: ' + index);
  hks.generateKey('alias002', generateKeyOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest002(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      console.log('hksConcurrencyTest002 fail detail ' + JSON.stringify(data));
    }
  });
};

async function hksConcurrencyTest003() {
  for (let index = 0;index < loop; index ++) {
    console.log('hksConcurrencyTest003 running index: ' + index);
    var result = await hks.deleteKey('alias003', emptyOption);
    if (result.errorCode != hks.HksErrorCode.HKS_SUCCESS && result.errorCode != hks.HksErrorCode.HKS_ERROR_NOT_EXIST) {
      console.log('hksConcurrencyTest003 fail detail ' + JSON.stringify(result));
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest004(index) {
  console.log('hksConcurrencyTest004 running index: ' + index);
  hks.deleteKey('alias004', emptyOption, function(err, data) {
    if (data.errorCode != hks.HksErrorCode.HKS_SUCCESS && data.errorCode != hks.HksErrorCode.HKS_ERROR_NOT_EXIST) {
      console.log('hksConcurrencyTest004 fail detail ' + JSON.stringify(data));
    } else {
      if (index < loop) {
        index ++;
        hksConcurrencyTest004(index);
      } else {
        parentPort.postMessage(successStr);
      }
    }
  });
};

async function hksConcurrencyTest005() {
  for (let index = 0;index < loop; index ++) {
    console.log('hksConcurrencyTest005 running index: ' + index);
    var encryptResult = await hks.encrypt('alias005', encryptAesOpt);
    var decryptOption = makeEncryptAndDecryptOption(
      hks.HksKeyAlg.HKS_ALG_AES,
      hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
      hks.HksKeyPadding.HKS_PADDING_NONE,
      hks.HksCipherMode.HKS_MODE_CBC,
      null,
      null,
      encryptResult.outData
    );
    var decryptResult = await hks.decrypt('alias005', decryptOption);
    if (encryptResult.errorCode != hks.HksErrorCode.HKS_SUCCESS ||
    decryptResult.errorCode != hks.HksErrorCode.HKS_SUCCESS ||
    JSON.stringify(plainText) != JSON.stringify(decryptResult.outData)) {
      console.log('hksConcurrencyTest005 fail encrypt detail ' + JSON.stringify(encryptResult));
      console.log('hksConcurrencyTest005 fail decrypt detail ' + JSON.stringify(encryptResult));
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest006(index) {
  console.log('hksConcurrencyTest006 running index: ' + index);
  hks.encrypt('alias006', encryptAesOpt, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      var decryptOption = makeEncryptAndDecryptOption(
        hks.HksKeyAlg.HKS_ALG_AES,
        hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
        hks.HksKeyPadding.HKS_PADDING_NONE,
        hks.HksCipherMode.HKS_MODE_CBC,
        null,
        null,
        data.outData
      );
      decryptCallback(index, decryptOption);
    } else {
      console.log('hksConcurrencyTest006 fail detail ' + JSON.stringify(data));
    }
  });
};

function decryptCallback(index, decryptOption) {
  hks.decrypt('alias006', decryptOption, function(err, data) {
    if (data.errorCode != hks.HksErrorCode.HKS_SUCCESS || JSON.stringify(data.outData) != JSON.stringify(plainText)) {
      parentPort.postMessage(failStr);
    } else {
      if (index < loop) {
        index ++;
        hksConcurrencyTest006();
      } else {
        parentPort.postMessage(successStr);
      }
    }
  });
};

async function hksConcurrencyTest007() {
  var sdkVersion = '';
  for (let index = 0;index < loop; index ++) {
    console.log('hksConcurrencyTest007 running index: ' + index);
    sdkVersion = await hks.getSdkVersion(emptyOption);
    if (sdkVersion.length == 0) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

async function hksConcurrencyTest008() {
  var exportKeyResult = await hks.exportKey(aliasA, emptyOption);
  var importKeyOption = makeImportOption(
    hks.HksKeyAlg.HKS_ALG_RSA,
    hks.HksKeySize.HKS_RSA_KEY_SIZE_512,
    hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    hks.HksKeyPadding.HKS_PADDING_NONE,
    hks.HksCipherMode.HKS_MODE_ECB,
    hks.HksKeyDigest.HKS_DIGEST_NONE,
    exportKeyResult.outData
  );
  for (let index = 0;index < loop; index ++) {
    var importKeyResult = await hks.importKey('alias008', importKeyOption);
    if (importKeyResult.errorCode != hks.HksErrorCode.HKS_SUCCESS) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function importKeyCallback(index, importKeyOption) {
  hks.importKey('alias009', importKeyOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      if (index < loop) {
        index ++;
        importKeyCallback(index, importKeyOption);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest009() {
  var exportKeyResult = await hks.exportKey(aliasA, emptyOption);
  var importKeyOption = makeImportOption(
    hks.HksKeyAlg.HKS_ALG_RSA,
    hks.HksKeySize.HKS_RSA_KEY_SIZE_512,
    hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    hks.HksKeyPadding.HKS_PADDING_NONE,
    hks.HksCipherMode.HKS_MODE_ECB,
    hks.HksKeyDigest.HKS_DIGEST_NONE,
    exportKeyResult.outData
  );
  importKeyCallback(0, importKeyOption);
};

async function hksConcurrencyTest010() {
  for (let index = 0;index < loop; index ++) {
    var exportKeyResult = await hks.exportKey('alias010', emptyOption);
    if (exportKeyResult.errorCode != hks.HksErrorCode.HKS_SUCCESS) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest011(index) {
  hks.exportKey('alias011', emptyOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest011(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest012() {
  for (let index = 0;index < loop; index ++) {
    var getKeyPropertiesResult = await hks.getKeyProperties('alias012', emptyOption);
    if (getKeyPropertiesResult.errorCode != hks.HksErrorCode.HKS_SUCCESS) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest013(index) {
  hks.getKeyProperties('alias013', emptyOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest013(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest014() {
  for (let index = 0;index < loop; index ++) {
    var isKeyExist = await hks.isKeyExist('alias014', emptyOption);
    if (!isKeyExist) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest015(index) {
  hks.isKeyExist('alias015', emptyOption, function(err, data) {
    if (data) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest015(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest016() {
  for (let index = 0;index < loop; index ++) {
    var signRet = await hks.sign('alias016', signOption);
    var verifyRet = await hks.verify('alias016', verifyOption, signRet.outData);
    if (signRet.errorCode != hks.HksErrorCode.HKS_SUCCESS || verifyRet.errorCode != hks.HksErrorCode.HKS_SUCCESS) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function verifyCallback(index, signedData) {
  hks.verify('alias017', verifyOption, signedData, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest017(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
}

function hksConcurrencyTest017(index) {
  hks.sign('alias017', signOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      verifyCallback(index, data.outData);
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest018() {
  var exportKeyAResult = await hks.exportKey(aliasA, emptyOption);
  var exportKeyBResult = await hks.exportKey(aliasB, emptyOption);
  var agreeKeyBOption = makeAgreeOption(exportKeyAResult.outData);
  var agreeKeyAOption = makeAgreeOption(exportKeyBResult.outData);
  for (let index = 0; index < loop; index ++) {
    var agreeKeyAResult = await hks.agreeKey(aliasA, agreeKeyAOption);
    var agreeKeyBResult = await hks.agreeKey(aliasB, agreeKeyBOption);
    if (agreeKeyAResult.errorCode != hks.HksErrorCode.HKS_SUCCESS ||
    agreeKeyBResult.errorCode != hks.HksErrorCode.HKS_SUCCESS ||
    JSON.stringify(agreeKeyAResult.outData) != JSON.stringify(agreeKeyBResult.outData)) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function agreeKeyCallback(index, option, key) {
  hks.agreeKey(aliasB, option, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS
    && JSON.stringify(key.outData) == JSON.stringify(data.outData)) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest019(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest019(index) {
  var exportKeyAResult = await hks.exportKey(aliasA, emptyOption);
  var exportKeyBResult = await hks.exportKey(aliasB, emptyOption);
  var agreeKeyBOption = makeAgreeOption(exportKeyAResult.outData);
  var agreeKeyAOption = makeAgreeOption(exportKeyBResult.outData);
  hks.agreeKey(aliasA, agreeKeyAOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      agreeKeyCallback(index, agreeKeyBOption, data);
    } else {
      parentPort.postMessage(failStr);
    }
  });
};

async function hksConcurrencyTest020() {
  for (let index = 0; index < loop; index ++) {
    var macResult = await hks.mac('alias020', macOption);
    if (macResult.errorCode != hks.HksErrorCode.HKS_SUCCESS) {
      parentPort.postMessage(failStr);
    }
  }
  parentPort.postMessage(successStr);
};

function hksConcurrencyTest021(index) {
  hks.mac('alias021', macOption, function(err, data) {
    if (data.errorCode == hks.HksErrorCode.HKS_SUCCESS) {
      if (index < loop) {
        index ++;
        hksConcurrencyTest021(index);
      } else {
        parentPort.postMessage(successStr);
      }
    } else {
      parentPort.postMessage(failStr);
    }
  });
};