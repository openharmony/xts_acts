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
import {describe, it, expect} from 'deccjsunit/index'
import {
  aliasA,
  aliasB,
  emptyOption,
  successStr,
  failStr,
  makeGenerateKeyOption
} from './hks_common.test.js';

var generateAes128KeyOpt = makeGenerateKeyOption (
  hks.HksKeyAlg.HKS_ALG_AES,
  hks.HksKeySize.HKS_AES_KEY_SIZE_128,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksCipherMode.HKS_MODE_CBC
);

var generateRsa512KeyOpt = makeGenerateKeyOption (
  hks.HksKeyAlg.HKS_ALG_RSA,
  hks.HksKeySize.HKS_RSA_KEY_SIZE_512,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  hks.HksCipherMode.HKS_MODE_ECB,
  hks.HksKeyDigest.HKS_DIGEST_NONE
);

var generateEcc224Opt = makeGenerateKeyOption (
  hks.HksKeyAlg.HKS_ALG_ECC,
  hks.HksKeySize.HKS_ECC_KEY_SIZE_224,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | hks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  hks.HksKeyPadding.HKS_PADDING_NONE,
  null,
  hks.HksKeyDigest.HKS_DIGEST_NONE
);

var generateAgreeKeyOption = makeGenerateKeyOption (
  hks.HksKeyAlg.HKS_ALG_ECC,
  hks.HksKeySize.HKS_ECC_KEY_SIZE_224,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
  null,
  null,
  hks.HksKeyDigest.HKS_DIGEST_NONE
);

var generateMacKeyOption = makeGenerateKeyOption (
  hks.HksKeyAlg.HKS_ALG_HMAC,
  160,
  hks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  null,
  null,
  hks.HksKeyDigest.HKS_DIGEST_SHA1
);

describe ('HKS_XTS_CONCURRENCY', function () {
  var worker1 = new worker.Worker( "workers/worker.js");
  var worker2 = new worker.Worker( "workers/worker.js");
  var workerStatus1 = false;
  var workerStatus2 = false;

  function doConcurrencyTest (caseId, done) {
    workerStatus1 = false;
    workerStatus2 = false;
    worker1.onmessage = function (data) {
      workerStatus1 = true;
      console.log (caseId + ' worker1.onMessage ' + JSON.stringify (data));
      expect (data.data).assertEqual (successStr);
      doClear (caseId, done);
    };
    worker2.onmessage = function (data) {
      workerStatus2 = true;
      console.log (caseId + ' worker2.onMessage ' + JSON.stringify (data));
      expect (data.data).assertEqual (successStr);
      doClear (caseId, done);
    };
    var obj = { type: 'normal', value: caseId };
    worker1.postMessage (obj);
    worker2.postMessage (obj);
  };

var clearActionMap = new Map([
  ['Hks_Concurrency_Test_00100', async function() {
    await hks.deleteKey ('alias001', emptyOption);
  }],
  ['Hks_Concurrency_Test_00200', async function() {
    await hks.deleteKey ('alias002', emptyOption);
  }],
  ['Hks_Concurrency_Test_00300', async function() {
    await hks.deleteKey ('alias003', emptyOption);
  }],
  ['Hks_Concurrency_Test_00400', async function() {
    await hks.deleteKey ('alias004', emptyOption);
  }],
  ['Hks_Concurrency_Test_00500', async function() {
    await hks.deleteKey ('alias005', emptyOption);
  }],
  ['Hks_Concurrency_Test_00600', async function() {
    await hks.deleteKey ('alias006', emptyOption);
  }],
  ['Hks_Concurrency_Test_00800', async function() {
    await hks.deleteKey (aliasA, emptyOption);
    await hks.deleteKey ('alias008', emptyOption);
  }],
  ['Hks_Concurrency_Test_00900', async function() {
    await hks.deleteKey (aliasA, emptyOption);
    await hks.deleteKey ('alias009', emptyOption);
  }],
  ['Hks_Concurrency_Test_01000', async function() {
    await hks.deleteKey ('alias010', emptyOption);
  }],
  ['Hks_Concurrency_Test_01100', async function() {
    await hks.deleteKey ('alias011', emptyOption);
  }],
  ['Hks_Concurrency_Test_01200', async function() {
    await hks.deleteKey ('alias012', emptyOption);
  }],
  ['Hks_Concurrency_Test_01300', async function() {
    await hks.deleteKey ('alias013', emptyOption);
  }],
  ['Hks_Concurrency_Test_01400', async function() {
    await hks.deleteKey ('alias014', emptyOption);
  }],
  ['Hks_Concurrency_Test_01500', async function() {
    await hks.deleteKey ('alias015', emptyOption);
  }],
  ['Hks_Concurrency_Test_01600', async function() {
    await hks.deleteKey ('alias016', emptyOption);
  }],
  ['Hks_Concurrency_Test_01700', async function() {
    await hks.deleteKey ('alias017', emptyOption);
  }],
  ['Hks_Concurrency_Test_01800', async function() {
    await hks.deleteKey (aliasA, emptyOption);
    await hks.deleteKey (aliasB, emptyOption);
  }],
  ['Hks_Concurrency_Test_01900', async function() {
    await hks.deleteKey (aliasA, emptyOption);
    await hks.deleteKey (aliasB, emptyOption);
  }],
  ['Hks_Concurrency_Test_02000', async function() {
    await hks.deleteKey ('alias020', emptyOption);
  }],
  ['Hks_Concurrency_Test_02100', async function() {
    await hks.deleteKey ('alias021', emptyOption);
  }]
]);


  async function doClear (caseId, done) {
    if (workerStatus1 && workerStatus2) {
      var testFunction = clearActionMap.get(caseId);
      if (testFunction != null) {
        testFunction();
      } else {
        console.log ('hksConcurrencyTest default check:' + caseId);
      }
      done();
    }
  }

  /**
   * @tc.number   HUKS_Concurrency_Test_00100
   * @tc.name     Concurrency_Test_GenerateKey_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00100', 0, async function (done) {
    doConcurrencyTest ('Hks_Concurrency_Test_00100', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00200
   * @tc.name     Concurrency_Test_GenerateKey_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00200', 0, async function (done) {
    doConcurrencyTest ('Hks_Concurrency_Test_00200', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00300
   * @tc.name     Concurrency_Test_DeleteKey_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00300', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias003', generateAes128KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_00300', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00400
   * @tc.name     Concurrency_Test_DeleteKey_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00400', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias004', generateAes128KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_00400', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00500
   * @tc.name     Concurrency_Test_Encrypt_Decrypt_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00500', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias005', generateAes128KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_00500', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00600
   * @tc.name     Concurrency_Test_Encrypt_Decrypt_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00600', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias006', generateAes128KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_00600', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00700
   * @tc.name     Concurrency_Test_GetSdkVersion
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00700', 0, async function (done) {
    doConcurrencyTest ('Hks_Concurrency_Test_00700', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00800
   * @tc.name     Concurrency_Test_ImportKey_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00800', 0, async function (done) {
    var generateKeyResult = await hks.generateKey (aliasA, generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_00800', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00900
   * @tc.name     Concurrency_Test_ImportKey_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_00900', 0, async function (done) {
    var generateKeyResult = await hks.generateKey (aliasA, generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_00900', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01000
   * @tc.name     Concurrency_Test_ExportKey_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01000', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias010', generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01000', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01100
   * @tc.name     Concurrency_Test_ExportKey_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01100', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias011', generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01100', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01200
   * @tc.name     Concurrency_Test_GetKeyProperties_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01200', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias012', generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01200', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01300
   * @tc.name     Concurrency_Test_GetKeyProperties_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01300', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias013', generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01300', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01400
   * @tc.name     Concurrency_Test_IsKeyExist_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01400', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias014', generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01400', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01500
   * @tc.name     Concurrency_Test_IsKeyExist_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01500', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias015', generateRsa512KeyOpt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01500', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01600
   * @tc.name     Concurrency_Test_Sign_Verify_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01600', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias016', generateEcc224Opt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01600', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01700
   * @tc.name     Concurrency_Test_Sign_Verify_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01700', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias017', generateEcc224Opt);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01700', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01800
   * @tc.name     Concurrency_Test_Agree_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01800', 0, async function (done) {
    var generateKeyResult = await hks.generateKey (aliasA, generateAgreeKeyOption);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    generateKeyResult = await hks.generateKey (aliasB, generateAgreeKeyOption);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01800', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01900
   * @tc.name     Concurrency_Test_Agree_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_01900', 0, async function (done) {
    var generateKeyResult = await hks.generateKey (aliasA, generateAgreeKeyOption);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    generateKeyResult = await hks.generateKey (aliasB, generateAgreeKeyOption);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_01900', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_02000
   * @tc.name     Concurrency_Test_Mac_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_02000', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias020', generateMacKeyOption);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_02000', done);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_02100
   * @tc.name     Concurrency_Test_Mac_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it ('Hks_Concurrency_Test_02100', 0, async function (done) {
    var generateKeyResult = await hks.generateKey ('alias021', generateMacKeyOption);
    expect (generateKeyResult.errorCode).assertEqual (hks.HksErrorCode.HKS_SUCCESS);
    doConcurrencyTest ('Hks_Concurrency_Test_02100', done);
  });
});