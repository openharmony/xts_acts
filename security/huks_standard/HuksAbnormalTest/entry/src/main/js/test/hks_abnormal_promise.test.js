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

describe('Hks_XtsTest_Abnormal_Promise', function () {

  async function generateAesKey(mode){
    var option = {};
    if (mode == 'CBC') {
      option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    } else {
      option = JSON.parse(JSON.stringify(generateAesGCMKeyOption));
    }
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  async function deleteKeyPromise(alias, done){
    var ret = await hks.deleteKey(alias, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
    done();
  };

  async function generateRsaKey(){
    var option = generateRSAKeyOption;
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  async function generateEccKey(){
    var option = generateECCKeyOption;
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };

  async function generateMacKey(){
    var option = generateMACKeyOption;
    var ret = await hks.generateKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
  };


  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00100
   * @tc.name     HUKS_ABNORMAL_PROMISE_00100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00100', 0, async function (done) {
    var genKeyRet = await hks.generateKey(aliasEmpty, generateAesCBCKeyOption);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00200
   * @tc.name     HUKS_ABNORMAL_PROMISE_00200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00200', 0, async function (done) {
    var genKeyRet = await hks.generateKey(aliasCritical, generateAesCBCKeyOption);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
    var deleteKeyRet = await hks.deleteKey(aliasCritical, emptyOption);
    expect(deleteKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_SUCCESS);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00300
   * @tc.name     HUKS_ABNORMAL_PROMISE_00300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00300', 0, async function (done) {
    var genKeyRet = await hks.generateKey(aliasTooLong, generateAesCBCKeyOption);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00400
   * @tc.name     HUKS_ABNORMAL_PROMISE_00400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00400', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(0, 1);
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00500
   * @tc.name     HUKS_ABNORMAL_PROMISE_00500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00500', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(1, 1);
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00600
   * @tc.name     HUKS_ABNORMAL_PROMISE_00600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00600', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(2, 1);
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00700
   * @tc.name     HUKS_ABNORMAL_PROMISE_00700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00700', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(3, 1);
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PADDING_FAIL);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00800
   * @tc.name     HUKS_ABNORMAL_PROMISE_00800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00800', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties.splice(4, 1);
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_MODE_FAIL);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_00900
   * @tc.name     HUKS_ABNORMAL_PROMISE_00900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_00900', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[0].value = invalidValue;
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01000
   * @tc.name     HUKS_ABNORMAL_PROMISE_01000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01000', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[1].value = invalidValue;
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_KEY_SIZE);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01100
   * @tc.name     HUKS_ABNORMAL_PROMISE_01100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01100', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[2].value = invalidValue;
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PURPOSE);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01200
   * @tc.name     HUKS_ABNORMAL_PROMISE_01200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01200', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[3].value = invalidValue;
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PADDING);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01300
   * @tc.name     HUKS_ABNORMAL_PROMISE_01300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01300', 0, async function (done) {
    var option = JSON.parse(JSON.stringify(generateAesCBCKeyOption));
    option.properties[4].value = invalidValue;
    var genKeyRet = await hks.generateKey(alias, option);
    expect(genKeyRet.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_MODE);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01400
   * @tc.name     HUKS_ABNORMAL_PROMISE_01400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01400', 0, async function (done) {
    var ret = await hks.deleteKey(aliasNotExist, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01500
   * @tc.name     HUKS_ABNORMAL_PROMISE_01500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01500', 0, async function (done) {
    var ret = await hks.deleteKey(aliasEmpty, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01600
   * @tc.name     HUKS_ABNORMAL_PROMISE_01600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01600', 0, async function (done) {
    var ret = await hks.deleteKey(aliasTooLong, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01700
   * @tc.name     HUKS_ABNORMAL_PROMISE_01700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01700', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.encrypt(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01800
   * @tc.name     HUKS_ABNORMAL_PROMISE_01800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01800', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.encrypt(aliasNotExist, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_01900
   * @tc.name     HUKS_ABNORMAL_PROMISE_01900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_01900', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.encrypt(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02000
   * @tc.name     HUKS_ABNORMAL_PROMISE_02000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02000', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.encrypt(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02100
   * @tc.name     HUKS_ABNORMAL_PROMISE_02100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02100', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(0, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02200
   * @tc.name     HUKS_ABNORMAL_PROMISE_02200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02200', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(1, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02300
   * @tc.name     HUKS_ABNORMAL_PROMISE_02300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02300', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(2, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_MODE_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02400
   * @tc.name     HUKS_ABNORMAL_PROMISE_02400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02400', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(3, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PADDING_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02500
   * @tc.name     HUKS_ABNORMAL_PROMISE_02500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02500', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(4, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_IV_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02600
   * @tc.name     HUKS_ABNORMAL_PROMISE_02600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02600', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(4, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_NONCE_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02700
   * @tc.name     HUKS_ABNORMAL_PROMISE_02700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02700', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(5, 1);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_AAD_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02800
   * @tc.name     HUKS_ABNORMAL_PROMISE_02800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02800', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[0].value = invalidValue;
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_02900
   * @tc.name     HUKS_ABNORMAL_PROMISE_02900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_02900', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[1].value = invalidValue;
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03000
   * @tc.name     HUKS_ABNORMAL_PROMISE_03000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03000', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[2].value = invalidValue;
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_MODE);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03100
   * @tc.name     HUKS_ABNORMAL_PROMISE_03100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03100', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[3].value = invalidValue;
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PADDING);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03200
   * @tc.name     HUKS_ABNORMAL_PROMISE_03200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03200', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.inData = new Uint8Array(0);
    var ret = await hks.encrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03300
   * @tc.name     HUKS_ABNORMAL_PROMISE_03300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03300', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.decrypt(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03400
   * @tc.name     HUKS_ABNORMAL_PROMISE_03400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03400', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.decrypt(aliasNotExist, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03500
   * @tc.name     HUKS_ABNORMAL_PROMISE_03500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03500', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.decrypt(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03600
   * @tc.name     HUKS_ABNORMAL_PROMISE_03600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03600', 0, async function (done) {
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    var ret = await hks.decrypt(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03700
   * @tc.name     HUKS_ABNORMAL_PROMISE_03700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03700', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(0, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03800
   * @tc.name     HUKS_ABNORMAL_PROMISE_03800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03800', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(1, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_03900
   * @tc.name     HUKS_ABNORMAL_PROMISE_03900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_03900', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(2, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_MODE_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04000
   * @tc.name     HUKS_ABNORMAL_PROMISE_04000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04000', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(3, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PADDING_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04100
   * @tc.name     HUKS_ABNORMAL_PROMISE_04100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04100', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties.splice(4, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_IV_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04200
   * @tc.name     HUKS_ABNORMAL_PROMISE_04200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04200', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(4, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_NONCE_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04300
   * @tc.name     HUKS_ABNORMAL_PROMISE_04300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04300', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.properties.splice(5, 1);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_AAD_FAIL);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04400
   * @tc.name     HUKS_ABNORMAL_PROMISE_04400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04400', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[0].value = invalidValue;
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04500
   * @tc.name     HUKS_ABNORMAL_PROMISE_04500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04500', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[1].value = invalidValue;
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04600
   * @tc.name     HUKS_ABNORMAL_PROMISE_04600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04600', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[2].value = invalidValue;
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_MODE);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04700
   * @tc.name     HUKS_ABNORMAL_PROMISE_04700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04700', 0, async function (done) {
    await generateAesKey('CBC');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_CBC);
    option.properties[3].value = invalidValue;
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PADDING);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04800
   * @tc.name     HUKS_ABNORMAL_PROMISE_04800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04800', 0, async function (done) {
    await generateAesKey('GCM');
    var option = makeEncryptAndDecryptOption(hks.HksCipherMode.HKS_MODE_GCM);
    option.inData = new Uint8Array(0);
    var ret = await hks.decrypt(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    await deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_04900
   * @tc.name     HUKS_ABNORMAL_PROMISE_04900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_04900', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.importKey(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05000
   * @tc.name     HUKS_ABNORMAL_PROMISE_05000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05000', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.importKey(aliasCritical, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05100
   * @tc.name     HUKS_ABNORMAL_PROMISE_05100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05100', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.importKey(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05200
   * @tc.name     HUKS_ABNORMAL_PROMISE_05200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05200', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(0, 1);
    var ret = await hks.importKey(aliasNotExist, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05300
   * @tc.name     HUKS_ABNORMAL_PROMISE_05300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05300', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(1, 1);
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05400
   * @tc.name     HUKS_ABNORMAL_PROMISE_05400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05400', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(2, 1);
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05500
   * @tc.name     HUKS_ABNORMAL_PROMISE_05500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05500', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(3, 1);
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05600
   * @tc.name     HUKS_ABNORMAL_PROMISE_05600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05600', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    var ret = await hks.importKey(aliasNotExist, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05700
   * @tc.name     HUKS_ABNORMAL_PROMISE_05700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05700', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[1].value = invalidValue;
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05800
   * @tc.name     HUKS_ABNORMAL_PROMISE_05800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05800', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[2].value = invalidValue;
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_05900
   * @tc.name     HUKS_ABNORMAL_PROMISE_05900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_05900', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[3].value = invalidValue;
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });
  
  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06000
   * @tc.name     HUKS_ABNORMAL_PROMISE_06000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06000', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.inData = new Uint8Array(0);
    var ret = await hks.importKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done()
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06100
   * @tc.name     HUKS_ABNORMAL_PROMISE_06100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06100', 0, async function (done) {
    var ret = await hks.exportKey(aliasNotExist, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06200
   * @tc.name     HUKS_ABNORMAL_PROMISE_06200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06200', 0, async function (done) {
    var ret = await hks.exportKey(aliasTooLong, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06300
   * @tc.name     HUKS_ABNORMAL_PROMISE_06300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06300', 0, async function (done) {
    var ret = await hks.exportKey(aliasEmpty, emptyOption);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06400
   * @tc.name     HUKS_ABNORMAL_PROMISE_06400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06400', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.sign(aliasNotExist, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06500
   * @tc.name     HUKS_ABNORMAL_PROMISE_06500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06500', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.sign(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06600
   * @tc.name     HUKS_ABNORMAL_PROMISE_06600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06600', 0, async function (done) {
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.sign(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06700
   * @tc.name     HUKS_ABNORMAL_PROMISE_06700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06700', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06800
   * @tc.name     HUKS_ABNORMAL_PROMISE_06800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06800', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[1].value = invalidValue;
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_06900
   * @tc.name     HUKS_ABNORMAL_PROMISE_06900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_06900', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[2].value = invalidValue;
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07000
   * @tc.name     HUKS_ABNORMAL_PROMISE_07000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07000', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[3].value = invalidValue;
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07100
   * @tc.name     HUKS_ABNORMAL_PROMISE_07100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07100', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.inData = new Uint8Array(0);
    var ret = await hks.sign(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07200
   * @tc.name     HUKS_ABNORMAL_PROMISE_07200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07200', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(0, 1);
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07300
   * @tc.name     HUKS_ABNORMAL_PROMISE_07300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07300', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(1, 1);
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07400
   * @tc.name     HUKS_ABNORMAL_PROMISE_07400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07400', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties.splice(2, 1);
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07500
   * @tc.name     HUKS_ABNORMAL_PROMISE_07500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07500', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties.splice(3, 1);
    var ret = await hks.sign(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07600
   * @tc.name     HUKS_ABNORMAL_PROMISE_07600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07600', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.verify(aliasNotExist, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07700
   * @tc.name     HUKS_ABNORMAL_PROMISE_07700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07700', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.verify(aliasTooLong, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07800
   * @tc.name     HUKS_ABNORMAL_PROMISE_07800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07800', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    var ret = await hks.verify(aliasEmpty, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_07900
   * @tc.name     HUKS_ABNORMAL_PROMISE_07900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_07900', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    var ret = await hks.verify(alias, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08000
   * @tc.name     HUKS_ABNORMAL_PROMISE_08000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08000', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[1].value = invalidValue;
    var ret = await hks.verify(alias, option, plainTextSize8);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08100
   * @tc.name     HUKS_ABNORMAL_PROMISE_08100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08100', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[2].value = invalidValue;
    var ret = await hks.verify(alias, option, plainTextSize8);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08200
   * @tc.name     HUKS_ABNORMAL_PROMISE_08200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08200', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties[3].value = invalidValue;
    var ret = await hks.verify(alias, option, plainTextSize8);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08300
   * @tc.name     HUKS_ABNORMAL_PROMISE_08300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08300', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize16);
    option.inData = new Uint8Array(0);
    var ret = await hks.verify(alias, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08400
   * @tc.name     HUKS_ABNORMAL_PROMISE_08400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08400', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(0, 1);
    var ret = await hks.verify(alias, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08500
   * @tc.name     HUKS_ABNORMAL_PROMISE_08500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08500', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(1, 1);
    var ret = await hks.verify(aliasNotExist, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08600
   * @tc.name     HUKS_ABNORMAL_PROMISE_08600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08600', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize8);
    option.properties.splice(2, 1);
    var ret = await hks.verify(alias, option, plainTextSize8);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08700
   * @tc.name     HUKS_ABNORMAL_PROMISE_08700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08700', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties.splice(3, 1);
    var ret = await hks.verify(alias, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08800
   * @tc.name     HUKS_ABNORMAL_PROMISE_08800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08800', 0, async function (done) {
    await generateRsaKey();
    var option = makeSignVerifyAndImportOption(plainTextSize64);
    option.properties[0].value = invalidValue;
    var ret = await hks.verify(alias, option, plainTextSize64);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_08900
   * @tc.name     HUKS_ABNORMAL_PROMISE_08900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_08900', 0, async function (done) {
    var option = makeAgreeOption();
    var ret = await hks.agreeKey(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    done();
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09000
   * @tc.name     HUKS_ABNORMAL_PROMISE_09000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09000', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties[0].value = invalidValue;
    var ret = await hks.agreeKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ALGORITHM);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09100
   * @tc.name     HUKS_ABNORMAL_PROMISE_09100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09100', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties[1].value = invalidValue;
    var ret = await hks.agreeKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09200
   * @tc.name     HUKS_ABNORMAL_PROMISE_09200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09200', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.inData = new Uint8Array(0);
    var ret = await hks.agreeKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09300
   * @tc.name     HUKS_ABNORMAL_PROMISE_09300
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09300', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties.splice(0, 1);
    var ret = await hks.agreeKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_ALG_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09400
   * @tc.name     HUKS_ABNORMAL_PROMISE_09400
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09400', 0, async function (done) {
    await generateEccKey();
    var option = makeAgreeOption();
    option.properties[1].value = invalidValue;
    var ret = await hks.agreeKey(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09500
   * @tc.name     HUKS_ABNORMAL_PROMISE_09500
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09500', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    var ret = await hks.mac(aliasNotExist, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_NOT_EXIST);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09600
   * @tc.name     HUKS_ABNORMAL_PROMISE_09600
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09600', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    var ret = await hks.mac(aliasTooLong, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09700
   * @tc.name     HUKS_ABNORMAL_PROMISE_09700
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09700', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    var ret = await hks.mac(aliasEmpty, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09800
   * @tc.name     HUKS_ABNORMAL_PROMISE_09800
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09800', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties[0].value = invalidValue;
    var ret = await hks.mac(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_PURPOSE);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_09900
   * @tc.name     HUKS_ABNORMAL_PROMISE_09900
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_09900', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties[1].value = invalidValue;
    var ret = await hks.mac(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_DIGEST);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_10000
   * @tc.name     HUKS_ABNORMAL_PROMISE_10000
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_10000', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.inData = new Uint8Array(0);
    var ret = await hks.mac(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_INVALID_ARGUMENT);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_10100
   * @tc.name     HUKS_ABNORMAL_PROMISE_10100
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_10100', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties.splice(0, 1);
    var ret = await hks.mac(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_PURPOSE_FAIL);
    deleteKeyPromise(alias, done);
  });

  /**
   * @tc.number   HUKS_ABNORMAL_PROMISE_10200
   * @tc.name     HUKS_ABNORMAL_PROMISE_10200
   * @tc.desc     Abnormal with promise.
   */
  it('HUKS_ABNORMAL_PROMISE_10200', 0, async function (done) {
    await generateMacKey();
    var option = makeMacOption();
    option.properties.splice(1, 1);
    var ret = await hks.mac(alias, option);
    expect(ret.errorCode).assertEqual(hks.HksErrorCode.HKS_ERROR_CHECK_GET_DIGEST_FAIL);
    deleteKeyPromise(alias, done);
  });
});