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

import huks from '@ohos.security.huks'
import {describe, it, expect} from 'deccjsunit/index'

import {
  emptyOption,
  makeMacOption,
  makeAgreeOptions,
  makeEncryptAndDecryptOption,
  makeGenerateKeyOption,
  makeImportOption,
  makeRandomArr,
  makeSignAndVerifyOption
} from '../../../../../../hks_xts_common.test'

describe('HKS_JSAPI_STRESS_TEST', function () {

  var executionHour = 0.61;
  var executionTime = 3600 * 1000 * executionHour;
  var plainText = makeRandomArr(64);
  var signText = makeRandomArr(16);
  var alias = 'alias';
  var aliasA = 'aliasA';
  var aliasB = 'aliasB';
  var publicKey = [];
  var signedText = [];
  var publicKeyA = [];
  var publicKeyB = [];

  var aesKeyOption = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_AES,
    huks.HksKeySize.HKS_AES_KEY_SIZE_128,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_CBC,
    null
  );
  var rsaKeyOption = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_RSA,
    huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_ECB,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var eccKeyOption = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    null,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var ecdhKeyOption = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
    null,
    null,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var macKeyOption = makeGenerateKeyOption(
      huks.HksKeyAlg.HKS_ALG_HMAC,
      160,
      huks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
      null,
      null,
      huks.HksKeyDigest.HKS_DIGEST_SHA1
    );

  var aesEncryptOption = makeEncryptAndDecryptOption(
    huks.HksKeyAlg.HKS_ALG_AES,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_CBC,
    null,
    null,
    plainText
  );

  var rsaEncryptOption = makeEncryptAndDecryptOption(
    huks.HksKeyAlg.HKS_ALG_RSA,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_ECB,
    huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    plainText
  );

  var signOption = makeSignAndVerifyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    signText
  );

  var verifyOption = makeSignAndVerifyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    signText
  );

  var currentCase = '';

  function importKey(endTime, index, done){
    var option = {};
    if (currentCase == '00400') {
      option = makeImportOption(
        huks.HksKeyAlg.HKS_ALG_RSA,
        huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_ECB,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        publicKey
      );
    } else {
      option = makeImportOption(
        huks.HksKeyAlg.HKS_ALG_ECC,
        huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        null,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        publicKey
      );
    }
    huks.importKey(aliasB, option,function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (currentCase == '00400') {
        encryptCallback(endTime, index, done);
      } else {
        signCallback(endTime, index, done);
      }
    });
  };


  function verifyCallback(endTime, index, done){
    huks.verify(aliasB, verifyOption, signedText, function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteKeyCallback(endTime, index, done);
    });
  };

  function signCallback(endTime, index, done){
    huks.sign(aliasA, signOption, function (err,data){
      signedText = data.outData;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      verifyCallback(endTime, index, done);
    });
  };

  function agreeKeyBCallback(endTime, index, done){
    var agreeKeyAOption = makeAgreeOptions(publicKeyA);
    huks.agreeKey(aliasB, agreeKeyAOption, function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteKeyCallback(endTime, index, done);
    });
  };

  function agreeKeyACallback(endTime, index, done){
    var agreeKeyAOption = makeAgreeOptions(publicKeyB);
    huks.agreeKey(aliasA, agreeKeyAOption, function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      agreeKeyBCallback(endTime, index, done);
    });
  };

  function exportKeyBCallback(endTime, index, done){
    huks.exportKey(aliasB, emptyOption,function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
        publicKeyB = data.outData;
        agreeKeyACallback(endTime, index, done);
    });
  };

  function exportKeyCallback(endTime, index, done){
    huks.exportKey(aliasA, emptyOption,function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (currentCase == '00800') {
        publicKeyA = data.outData;
        exportKeyBCallback(endTime, index, done);
      } else {
        publicKey = data.outData;
        importKey(endTime, index, done);
      }
    });
  };

  function macCallback(endTime, index, done){
    var macOption = makeMacOption(plainText);
    huks.mac(alias, macOption, function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteKeyCallback(endTime, index, done);
    });
  };

  function generateKeyBCallback(endTime, index, done){
    var option = ecdhKeyOption;
    huks.generateKey(aliasB, option, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      exportKeyCallback(endTime, index, done);
    });
  };

  function generateKeyCallback(endTime, index, done) {
    var currentTime = (new Date()).valueOf();
    var tmpAlias = aliasA;
    if (currentTime <= endTime) {
      var option = {};
      if (currentCase == '00200') {
        option = aesKeyOption;
        tmpAlias = alias;
      } else if (currentCase == '00400') {
        option = rsaKeyOption;
      } else if (currentCase == '00600') {
        option = eccKeyOption;
      } else if (currentCase == '00800') {
        option = ecdhKeyOption;
      } else {
        tmpAlias = alias;
        option = macKeyOption;
      }
      huks.generateKey(tmpAlias, option, function (err, data) {
        expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
        if (currentCase == '00200') {
          encryptCallback(endTime, index, done);
        } else if (currentCase == '00800') {
          generateKeyBCallback(endTime, index, done);
        } else if (currentCase == '01000') {
          macCallback(endTime, index, done);
        } else {
          exportKeyCallback(endTime, index, done);
        }
      });
    } else {
      done();
    }
  };

  function isKeyExistCallback(endTime, index, done){
    var tmpAlias = '';
    if (currentCase == '00200' || currentCase == '01000') {
      tmpAlias = alias;
    } else {
      tmpAlias = aliasA;
    }
    huks.isKeyExist(tmpAlias,emptyOption,function(err,data){
      expect(data).assertEqual(false);
      if (currentCase == '00200' || currentCase == '01000') {
        index++;
        var currentTime = (new Date()).valueOf();
        var sumTime = endTime - currentTime;
        console.info('HKS_STRESS_TEST_' + currentCase +' Time left ' + sumTime / 1000 + ' s,' + ' index: ' + index);
        generateKeyCallback(endTime, index, done);
      } else {
        deleteKeyBCallback(endTime, index, done);
      }
    });
  };

  function isKeyBExistCallback(endTime, index, done){
    huks.isKeyExist(aliasB,emptyOption,function(err,data){
      expect(data).assertEqual(false);
      index++;
      var currentTime = (new Date()).valueOf();
      var sumTime = endTime - currentTime;
      console.info('HKS_STRESS_TEST_' + currentCase +' Time left ' + sumTime / 1000 + ' s,' + ' index: ' + index);
      generateKeyCallback(endTime, index, done);
    });
  };

  function deleteKeyBCallback(endTime, index, done){
    huks.deleteKey(aliasB,emptyOption,function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyBExistCallback(endTime, index, done);
    });
  };

  function deleteKeyCallback(endTime, index, done){
    var tmpAlias = '';
    if (currentCase == '00200' || currentCase == '01000') {
      tmpAlias = alias;
    } else {
      tmpAlias = aliasA;
    }
    huks.deleteKey(tmpAlias,emptyOption,function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyExistCallback(endTime, index, done);
    });
  };

  function decryptCallback(text, endTime, index, done){
    var tmpAlias = '';
    var option = {};
    if (currentCase == '00200') {
      tmpAlias = alias;
      option = makeEncryptAndDecryptOption(
        huks.HksKeyAlg.HKS_ALG_AES,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_CBC,
        null,
        null,
        text
      );
    } else {
      tmpAlias = aliasA;
      option = makeEncryptAndDecryptOption(
        huks.HksKeyAlg.HKS_ALG_RSA,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_ECB,
        huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        text
      );
    }
    huks.decrypt(tmpAlias, option, function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(plainText)).assertEqual(JSON.stringify(data.outData));
      deleteKeyCallback(endTime, index, done);
    });
  };

  function encryptCallback(endTime, index, done){
    var tmpAlias = '';
    var option = {};
    if (currentCase == '00200') {
      tmpAlias = alias;
      option = aesEncryptOption;
    } else {
      tmpAlias = aliasB;
      option = rsaEncryptOption;
    }
    huks.encrypt(tmpAlias, option, function(err,data){
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      decryptCallback(data.outData, endTime, index, done);
    });
  };


  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00100
   * @tc.name     HKS_STRESS_TEST_AES_ENCRYPT_DECRYPT_PROMISE
   * @tc.desc     stress test for aes encrypt and decrypt with promise
   */
  it('HKS_JSAPI_STRESS_TEST_00100', 0, async function (done) {
    var startTime = (new Date()).valueOf();
    var endTime = startTime + executionTime;
    var currentTime = startTime;
    var index = 0;
    while (currentTime <= endTime) {
      currentTime = (new Date()).valueOf();
      var genKeyRet = await huks.generateKey(alias, aesKeyOption);
      expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var encryptRet = await huks.encrypt(alias, aesEncryptOption);
      expect(encryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var decryptOption = makeEncryptAndDecryptOption(
        huks.HksKeyAlg.HKS_ALG_AES,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_CBC,
        null,
        null,
        encryptRet.outData
      );
      var decryptRet = await huks.decrypt(alias, decryptOption);
      expect(decryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(plainText)).assertEqual(JSON.stringify(decryptRet.outData));
      var delKeyRet = await huks.deleteKey(alias, emptyOption);
      expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyExistRet = await huks.isKeyExist(alias, emptyOption);
      expect(isKeyExistRet).assertEqual(false);
      console.info('HKS_STRESS_TEST_00100 Time left ' + (endTime - currentTime) / 1000 + ' s,' + ' index: ' + index);
      index++;
    }
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00200
   * @tc.name     HKS_STRESS_TEST_AES_ENCRYPT_DECRYPT_CALLBACK
   * @tc.desc     stress test for aes encrypt and decrypt with callback
   */
  it('HKS_JSAPI_STRESS_TEST_00200', 0, async function (done) {
    currentCase = '00200';
    var startTime = (new Date()).valueOf();
    var endTime = startTime + executionTime;
    var index = 0;
    generateKeyCallback(endTime, index, done);
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00300
   * @tc.name     HKS_STRESS_TEST_RSA_ENCRYPT_DECRYPT_PROMISE
   * @tc.desc     stress test for rsa encrypt and decrypt with promise
   */
  it('HKS_JSAPI_STRESS_TEST_00300', 0, async function (done) {
    var currentTime = (new Date()).valueOf();
    var endTime = currentTime + executionTime;
    var index = 0;
    while (currentTime <= endTime) {
      currentTime = (new Date()).valueOf();
      var genKeyRet = await huks.generateKey(aliasA, rsaKeyOption);
      expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var exportKeyRet = await huks.exportKey(aliasA, emptyOption);
      expect(exportKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      publicKey = exportKeyRet.outData;
      var importRsaKeyOpt = makeImportOption(
        huks.HksKeyAlg.HKS_ALG_RSA,
        huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_ECB,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        publicKey
      );
      var importRet = await huks.importKey(aliasB, importRsaKeyOpt);
      expect(importRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var encryptRet = await huks.encrypt(aliasB, rsaEncryptOption);
      expect(encryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var decryptOption = makeEncryptAndDecryptOption(
        huks.HksKeyAlg.HKS_ALG_RSA,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_ECB,
        huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        encryptRet.outData
      );
      var decryptRet = await huks.decrypt(aliasA, decryptOption);
      expect(decryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(plainText)).assertEqual(JSON.stringify(decryptRet.outData));
      var delKeyARet = await huks.deleteKey(aliasA, emptyOption);
      var delKeyBRet = await huks.deleteKey(aliasB, emptyOption);
      expect(delKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(delKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyAExistRet = await huks.isKeyExist(aliasA, emptyOption);
      expect(isKeyAExistRet).assertEqual(false);
      var isKeyBExistRet = await huks.isKeyExist(aliasB, emptyOption);
      expect(isKeyBExistRet).assertEqual(false);
      console.info('HKS_STRESS_TEST_00300 Time left ' + (endTime - currentTime) / 1000 + ' s,' + ' index: ' + index);
      index++;
    }
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00400
   * @tc.name     HKS_STRESS_TEST_RSA_ENCRYPT_DECRYPT_PROMISE
   * @tc.desc     stress test for rsa encrypt and decrypt with promise
   */
  it('HKS_JSAPI_STRESS_TEST_00400', 0, async function (done) {
    currentCase = '00400';
    var startTime = (new Date()).valueOf();
    var endTime = startTime + executionTime;
    var index = 0;
    generateKeyCallback(endTime, index, done);
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00500
   * @tc.name     HKS_STRESS_TEST_ECC_SIGN_VERIFY_PROMISE
   * @tc.desc     stress test for ecc sign and verify with promise
   */
  it('HKS_JSAPI_STRESS_TEST_00500', 0, async function (done) {
    var currentTime = (new Date()).valueOf();
    var endTime = currentTime + executionTime;
    var index = 0;
    while (currentTime <= endTime) {
      currentTime = (new Date()).valueOf();
      var generateKeyRet = await huks.generateKey(aliasA, eccKeyOption);
      expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var signRet = await huks.sign(aliasA, signOption);
      expect(signRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      signedText = signRet.outData;
      var exportKeyRet = await huks.exportKey(aliasA, emptyOption);
      expect(exportKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      publicKey = exportKeyRet.outData;
      var importOptions = makeImportOption(
        huks.HksKeyAlg.HKS_ALG_ECC,
        huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        null,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        publicKey
      );
      var importKeyRet = await huks.importKey(aliasB, importOptions);
      expect(importKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var verifyRet = await huks.verify(aliasB, verifyOption, signedText);
      expect(verifyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var deleteKeyAliasA = await huks.deleteKey(aliasA, emptyOption);
      var deleteKeyAliasB = await huks.deleteKey(aliasB, emptyOption);
      expect(deleteKeyAliasA.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(deleteKeyAliasB.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyAExist = await huks.isKeyExist(aliasA, emptyOption);
      expect(isKeyAExist).assertEqual(false);
      var isKeyBExist = await huks.isKeyExist(aliasB, emptyOption);
      expect(isKeyBExist).assertEqual(false);
      console.info('HKS_STRESS_TEST_00500 Time left ' + (endTime - currentTime) / 1000 + ' s,' + ' index: ' + index);
      index++;
    }
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00600
   * @tc.name     HKS_STRESS_TEST_ECC_SIGN_VERIFY_CALLBACK
   * @tc.desc     stress test for ecc sign and verify with callback
   */
  it('HKS_JSAPI_STRESS_TEST_00600', 0, async function (done) {
    currentCase = '00600';
    var startTime = (new Date()).valueOf();
    var endTime = startTime + executionTime;
    var index = 0;
    generateKeyCallback(endTime, index, done);
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00700
   * @tc.name     HKS_STRESS_TEST_AGREE_VERIFY_PROMISE
   * @tc.desc     stress test for agree with promise
   */
  it('HKS_JSAPI_STRESS_TEST_00700', 0, async function (done) {
    var currentTime = (new Date()).valueOf();
    var endTime = currentTime + executionTime;
    var index = 0;
    while (currentTime <= endTime) {
      currentTime = (new Date()).valueOf();
      var generateKeyARet = await huks.generateKey(aliasA, ecdhKeyOption);
      expect(generateKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var generateKeyBRet = await huks.generateKey(aliasB, ecdhKeyOption);
      expect(generateKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var exportKeyARet = await huks.exportKey(aliasA, emptyOption);
      var exportKeyBRet = await huks.exportKey(aliasB, emptyOption);
      publicKeyA = exportKeyARet.outData;
      publicKeyB = exportKeyBRet.outData;
      var agreeKeyAOption = makeAgreeOptions(publicKeyB);
      var agreeKeyARet = await huks.agreeKey(aliasA, agreeKeyAOption);
      expect(agreeKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var agreeKeyBOption = makeAgreeOptions(publicKeyA);
      var agreeKeyBRet = await huks.agreeKey(aliasB, agreeKeyBOption);
      expect(agreeKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(agreeKeyARet.outData)).assertEqual(JSON.stringify(agreeKeyBRet.outData));
      var deleteKeyARet = await huks.deleteKey(aliasA, emptyOption);
      expect(deleteKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var deleteKeyBRet = await huks.deleteKey(aliasB, emptyOption);
      expect(deleteKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyAExist = await huks.isKeyExist(aliasA, emptyOption);
      expect(isKeyAExist).assertEqual(false);
      var isKeyBExist = await huks.isKeyExist(aliasB, emptyOption);
      expect(isKeyBExist).assertEqual(false);
      console.info('HKS_STRESS_TEST_00700 Time left ' + (endTime - currentTime) / 1000 + ' s,' + ' index: ' + index);
      index++;
    }
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00800
   * @tc.name     HKS_STRESS_TEST_AGREE_VERIFY_CALLBACK
   * @tc.desc     stress test for agree with callback
   */
  it('HKS_JSAPI_STRESS_TEST_00800', 0, async function (done) {
    currentCase = '00800';
    var startTime = (new Date()).valueOf();
    var endTime = startTime + executionTime;
    var index = 0;
    generateKeyCallback(endTime, index, done);
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_00900
   * @tc.name     HKS_STRESS_TEST_MAC_PROMISE
   * @tc.desc     stress test for mac with promise
   */
  it('HKS_JSAPI_STRESS_TEST_00900', 0, async function (done) {
    var currentTime = (new Date()).valueOf();
    var endTime = currentTime + executionTime;
    var index = 0;
    while (currentTime <= endTime) {
      currentTime = (new Date()).valueOf();
      var generateKeyRet = await huks.generateKey(alias, macKeyOption);
      expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var macOption = makeMacOption(plainText);
      var macRet = await huks.mac(alias, macOption);
      expect(macRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var deleteKeyRet = await huks.deleteKey(alias, emptyOption);
      expect(deleteKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyExist = await huks.isKeyExist(alias, emptyOption);
      expect(isKeyExist).assertEqual(false);
      var sumTime = endTime - currentTime;
      console.info('HKS_JSAPI_STRESS_TEST_00900 Time left ' + sumTime / 1000 + ' s,' + ' index: ' + index);
      index++;
    }
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_STRESS_TEST_01000
   * @tc.name     HKS_STRESS_TEST_MAC_CALLBACK
   * @tc.desc     stress test for mac with callback
   */
  it('HKS_JSAPI_STRESS_TEST_01000', 0, async function (done) {
    currentCase = '01000';
    var startTime = (new Date()).valueOf();
    var endTime = startTime + executionTime;
    var index = 0;
    generateKeyCallback(endTime, index, done);
  });
});