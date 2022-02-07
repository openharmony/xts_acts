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

import hks from '@ohos.security.huks'
import {describe, it, expect} from 'deccjsunit/index'
import {
  alias,
  aliasEmpty,
  aliasTooLong,
  aliasCritical,
  aliasNotExist,
  emptyOption,
  invalidValue,
  generateAesCBCKeyOption,
  generateAesGCMKeyOption,
  generateRSAKeyOption,
  generateECCKeyOption,
  generateMACKeyOption,
  plainTextSize8,
  plainTextSize16,
  plainTextSize64,
  makeAgreeOption,
  makeEncryptAndDecryptOption,
  makeMacOption,
  makeSignVerifyAndImportOption
} from './hks_abnormal_common.test.js'

describe('Hks_XtsTest_Abnormal_Callback', function () {

  async function generateAesKey(mode) {
    var option = {};
    if (mode == 'CBC') {
      option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    } else {
      option = JSON.parse(JSON.stringify(generateAesGCMKeyOption));
    }
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  function deleteKeyCallback(alias, done) {
    hks.deleteKey(alias, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
      done();
    });
  };

  async function generateRsaKey() {
    var option = generateRSAKeyOption;
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  async function generateEccKey() {
    var option = generateECCKeyOption;
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  async function generateMacKey() {
    var option = generateMACKeyOption;
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00100', 0, async function (done) {
    hks.generateKey(aliasEmpty, generateAesCBCKeyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00200', 0, async function (done) {
    hks.generateKey(aliasCritical, generateAesCBCKeyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
      deleteKeyCallback(aliasCritical, done);
    })
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00300', 0, async function (done) {
    hks.generateKey(aliasTooLong, generateAesCBCKeyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00400', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(0, 1);
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00500', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(1, 1);
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00600', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(2, 1);
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00700', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(3, 1);
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PADDING_FAIL);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00800', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(4, 1);
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_MODE_FAIL);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_00900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_00900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_00900', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[0].value = invalidValue;
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01000', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[1].value = invalidValue;
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_KEY_SIZE);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01100', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[2].value = invalidValue;
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PURPOSE);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01200', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[3].value = invalidValue;
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PADDING);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01300', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[4].value = invalidValue;
    hks.generateKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_MODE);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01400', 0, async function (done) {
    hks.deleteKey(aliasNotExist, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01500', 0, async function (done) {
    hks.deleteKey(aliasEmpty, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01600', 0, async function (done) {
    hks.deleteKey(aliasTooLong, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01700', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.encrypt(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01800', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.encrypt(aliasNotExist, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_01900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_01900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_01900', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.encrypt(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02000', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.encrypt(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02100', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(0, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02200', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(1, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02300', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(2, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_MODE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02400', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(3, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PADDING_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02500', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(4, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_IV_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02600', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(4, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_NONCE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02700', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(5, 1);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_AAD_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02800', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[0].value = invalidValue;
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_02900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_02900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_02900', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[1].value = invalidValue;
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03000', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[2].value = invalidValue;
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_MODE);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03100', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[3].value = invalidValue;
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PADDING);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03200', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.inData = new Uint8Array(0);
    hks.encrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03300', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.decrypt(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03400', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.decrypt(aliasNotExist, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03500', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.decrypt(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03600', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    hks.decrypt(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03700', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(0, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03800', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(1, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_03900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_03900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_03900', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(2, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_MODE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04000', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(3, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PADDING_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04100', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(4, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_IV_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04200', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(4, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_NONCE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04300', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(5, 1);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_AAD_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04400', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[0].value = invalidValue;
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04500', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[1].value = invalidValue;
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04600', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[2].value = invalidValue;
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_MODE);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04700', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[3].value = invalidValue;
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PADDING);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04800', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.inData = new Uint8Array(0);
    hks.decrypt(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_04900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_04900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_04900', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.importKey(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05000', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.importKey(aliasCritical, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05100', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.importKey(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05200', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(0, 1);
    hks.importKey(aliasNotExist, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05300', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(1, 1);
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05400', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(2, 1);
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05500', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(3, 1);
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05600', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    hks.importKey(aliasNotExist, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05700', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[1].value = invalidValue;
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05800', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[2].value = invalidValue;
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_05900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_05900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_05900', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[3].value = invalidValue;
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });
  
  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06000', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.inData = new Uint8Array(0);
    hks.importKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done()
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06100', 0, async function (done) {
    hks.exportKey(aliasNotExist, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06200', 0, async function (done) {
    hks.exportKey(aliasTooLong, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06300', 0, async function (done) {
    hks.exportKey(aliasEmpty, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06400', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.sign(aliasNotExist, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06500', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.sign(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06600', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.sign(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });


  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06700', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06800', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[1].value = invalidValue;
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_06900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_06900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_06900', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[2].value = invalidValue;
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07000', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[3].value = invalidValue;
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07100', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.inData = new Uint8Array(0);
    hks.sign(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07200', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(0, 1);
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07300', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(1, 1);
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07400', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties.splice(2, 1);
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07500', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties.splice(3, 1);
    hks.sign(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07600', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.verify(aliasNotExist, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07700', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.verify(aliasTooLong, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07800', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    hks.verify(aliasEmpty, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_07900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_07900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_07900', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    hks.verify(alias, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08000', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[1].value = invalidValue;
    hks.verify(alias, option, plainTextSize8, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08100', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[2].value = invalidValue;
    hks.verify(alias, option, plainTextSize8, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08200', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[3].value = invalidValue;
    hks.verify(alias, option, plainTextSize8, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08300', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize16);
    option.inData = new Uint8Array(0);
    hks.verify(alias, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08400', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(0, 1);
    hks.verify(alias, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08500', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(1, 1);
    hks.verify(aliasNotExist, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08600', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties.splice(2, 1);
    hks.verify(alias, option, plainTextSize8, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08700', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(3, 1);
    hks.verify(alias, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08800', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    hks.verify(alias, option, plainTextSize64, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_08900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_08900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_08900', 0, async function (done) {
    var option = makeAgreeOption();
    hks.agreeKey(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      done();
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09000', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties[0].value = invalidValue;
    hks.agreeKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09100', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties[1].value = invalidValue;
    hks.agreeKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09200', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.inData = new Uint8Array(0);
    hks.agreeKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09300
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09300
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09300', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties.splice(0, 1);
    hks.agreeKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09400
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09400
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09400', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties[1].value = invalidValue;
    hks.agreeKey(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09500
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09500
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09500', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    hks.mac(aliasNotExist, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09600
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09600
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09600', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    hks.mac(aliasTooLong, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09700
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09700
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09700', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    hks.mac(aliasEmpty, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09800
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09800
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09800', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties[0].value = invalidValue;
    hks.mac(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PURPOSE);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_09900
   * @tc.name     HUKS_ABNORMAL_CALLBACK_09900
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_09900', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties[1].value = invalidValue;
    hks.mac(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_DIGEST);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_10000
   * @tc.name     HUKS_ABNORMAL_CALLBACK_10000
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_10000', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.inData = new Uint8Array(0);
    hks.mac(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_10100
   * @tc.name     HUKS_ABNORMAL_CALLBACK_10100
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_10100', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties.splice(0, 1);
    hks.mac(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
      deleteKeyCallback(alias, done);
    });
  });

  /**
   * @tc.number   HUKS_ABNORMAL_CALLBACK_10200
   * @tc.name     HUKS_ABNORMAL_CALLBACK_10200
   * @tc.desc     Abnormal with callback.
   */
  it('HUKS_ABNORMAL_CALLBACK_10200', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties.splice(1, 1);
    hks.mac(alias, option, function (err, data) {
      expect(data.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_DIGEST_FAIL);
      deleteKeyCallback(alias, done);
    });
  });
});