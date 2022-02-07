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

describe('HKS_JSAPI_TIMING', function () {

  var loop = 1000;

  var emptyOption = makeEmptyOptions();

  var sumGenerateKeyTiming = 0;
  var sumDeleteKeyTiming = 0;
  var sumGetKeyPropertiesTiming = 0;
  var sumExportTiming = 0;
  var sumImportTiming = 0;
  var sumEncryptTiming = 0;
  var sumDecryptTiming = 0;
  var cipherTextArr = new Array();
  var sumIsKeyExistTiming = 0;
  var sumSignTiming = 0;
  var sumVerifyTiming = 0;
  var defaultAliasA = 'defaultAliasA';
  var defaultAliasB = 'defaultAliasB';
  var signedText = [];
  var publicKey = [];
  var sumAgreeTiming = 0;
  var sumDeriveKeyTiming = 0;
  var sumMacTiming = 0;
  var geAesKeyProperties = makeAesKeyOption();

  function makeEmptyOptions() {
    var emptyOptions = {
      properties: []
    };
    return emptyOptions;
  };

  function makeGenerateRSAKeyOptions() {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_RSA
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_RSA_KEY_SIZE_512
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_PKCS1_V1_5
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_MD5
    };
    var options = {
      properties: properties
    };
    return options;
  };

  function makeAesKeyOption(){
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_AES
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_AES_KEY_SIZE_128
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_NONE
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_BLOCK_MODE,
      value: huks.HksCipherMode.HKS_MODE_CBC
    };
    return properties;
  }

  function makeRsaKeyOption(){
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_RSA
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_RSA_KEY_SIZE_512
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_NONE
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_BLOCK_MODE,
      value: huks.HksCipherMode.HKS_MODE_ECB
    };
    properties[5] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_NONE
    };
    properties[6] = {
      tag: huks.HksTag.HKS_TAG_KEY_GENERATE_TYPE,
      value: huks.HksKeyGenerateType.HKS_KEY_GENERATE_TYPE_DEFAULT
    };
    return properties;
  }

  function makeEccKeyOption(){
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_ECC
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_ECC_KEY_SIZE_224
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_NONE
    };
    return properties;
  };

  function makeDriveKeyOption(){
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_AES
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_AES_KEY_SIZE_128
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_NONE
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_BLOCK_MODE,
      value: huks.HksCipherMode.HKS_MODE_CBC
    };
    properties[5] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_SHA256
    };
    return properties;
  };

  function makeMacKeyOption(){
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_HMAC
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_SHA1
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_KEY_TYPE,
      value: huks.HksKeyType.HKS_KEY_TYPE_HMAC
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: 160
    };
    return properties;
  };

  function makeGenerateKeyOption(alg) {
    if (alg == huks.HksKeyAlg.HKS_ALG_AES) {
      var option = {
        properties: geAesKeyProperties
      };
      return option;
    } else if (alg == huks.HksKeyAlg.HKS_ALG_RSA){
      var option = {
        properties: makeRsaKeyOption()
      };
      return option;
    } else if (alg == huks.HksKeyAlg.HKS_ALG_ECC){
      var option = {
        properties: makeEccKeyOption()
      };
      return option;
    } else if (alg == huks.HksKeyAlg.HKS_ALG_HMAC){
      var option = {
        properties: makeMacKeyOption()
      };
      return option;
    } else if (alg == 'DERIVE_AES_KEY'){
      var option = {
        properties: makeDriveKeyOption()
      };
      return option;
    } else {
      return -1;
    }
  };

  function makeRandomArr(size) {
    var arr = new Uint8Array(size);
    for (var i = 0; i < size; i++) {
      arr[i] = Math.floor(Math.random() * 10);
    }
    return arr;
  };

  function makeEncryptOption(plainText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_AES
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_BLOCK_MODE,
      value: huks.HksCipherMode.HKS_MODE_CBC
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_NONE
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_IV,
      value: new Uint8Array(16)
    };
    var options = {
      properties: properties,
      inData: plainText
    };
    return options;
  };

  function makeDecryptOption(cipherText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_AES,
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_BLOCK_MODE,
      value: huks.HksCipherMode.HKS_MODE_CBC
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_NONE
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_IV,
      value: new Uint8Array(16)
    };
    var options = {
      properties: properties,
      inData: cipherText
    };
    return options;
  };

  function deleteKeyByAlias(alias, done) {
    huks.deleteKey(alias, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      done();
    });
  };

  function makeImportOption(importText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_RSA
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_RSA_KEY_SIZE_512
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_NONE
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_BLOCK_MODE,
      value: huks.HksCipherMode.HKS_MODE_ECB
    };
    properties[5] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_NONE
    };
    properties[6] = {
      tag: huks.HksTag.HKS_TAG_KEY_GENERATE_TYPE,
      value: huks.HksKeyGenerateType.HKS_KEY_GENERATE_TYPE_DEFAULT
    };
    var options = {
      properties: properties,
      inData: importText
    };
    return options;
  };

  function getKeyPropertiesCallback(index, done) {
    var timestampStart = (new Date()).valueOf();
    huks.getKeyProperties('alias', emptyOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumGetKeyPropertiesTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      console.info('getKeyProperties callback index ' + index);
      if (index == loop) {
        var averageTimeGetProperties = sumGetKeyPropertiesTiming / loop;
        console.info('jsApi timing get key properties callback, average time: ' + averageTimeGetProperties);
        deleteKeyByAlias('alias', done);
      } else {
        getKeyPropertiesCallback(index, done);
      }
    });
  };

  function deleteExportAndImportKey(done) {
    huks.deleteKey('alias_', emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteKeyByAlias('alias', done);
    });
  };

  function encryptCallback(index, encryptOption, done) {
    console.info('encrypt callback index ' + index);
    var timestampStart = (new Date()).valueOf();
    huks.encrypt('alias', encryptOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('encrypt callback time consuming ' + consuming);
      sumEncryptTiming += consuming;
      cipherTextArr.push(data.outData);
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeEncrypt = sumEncryptTiming / loop;
        console.info('jsApi timing encrypt callback, average time: ' + averageTimeEncrypt);
        decryptCallback(0, done);
      } else {
        encryptCallback(index, encryptOption, done);
      }
    });
  };

  function decryptCallback(index, done) {
    console.info('decrypt callback index ' + index);
    var decryptOption = makeDecryptOption(cipherTextArr[index]);
    var timestampStart = (new Date()).valueOf();
    huks.decrypt('alias', decryptOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('decrypt callback time consuming ' + consuming);
      sumDecryptTiming += consuming;
      index++;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index == loop) {
        var averageTimeDecrypt = sumDecryptTiming / loop;
        console.info('jsApi timing decrypt callback, average time: ' + averageTimeDecrypt);
        deleteKeyByAlias('alias', done);
      } else {
        decryptCallback(index, done);
      }
    });
  };

  function exportCallback(index, done) {
    console.info('export key callback index ' + index);
    var timestampStart = (new Date()).valueOf();
    huks.exportKey('alias', emptyOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('exportKey callback time consuming ' + consuming);
      sumExportTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      console.info('exportKey callback outData ' + JSON.stringify(data));
      publicKey = data.outData;
      index++;
      importCallback(index, done);
    });
  };

  function importCallback(index, done) {
    console.info('import key callback index ' + index);
    var timestampStart = (new Date()).valueOf();
    var importOption = makeImportOption(publicKey);
    console.info('import callback option ' + JSON.stringify(importOption));
    huks.importKey('alias_', importOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('importKey callback time consuming ' + consuming);
      sumImportTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeExportKey = sumExportTiming / loop;
        console.info('jsApi timing export key callback, average time: ' + averageTimeExportKey);
        var averageTimeImportKey = sumImportTiming / loop;
        console.info('jsApi timing import key callback, average time: ' + averageTimeImportKey);
        deleteExportAndImportKey(done);
      } else {
        exportCallback(index, done);
      }
    });
  };

  function isKeyExistCallback(index, done) {
    console.info('isKeyExist promise index ' + index);
    var timestampStart = (new Date()).valueOf();
    huks.isKeyExist('alias', emptyOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumIsKeyExistTiming += consuming;
      expect(data).assertEqual(true);
      index++;
      if (index == loop) {
        var averageTimeIsKeyExist = sumIsKeyExistTiming / loop;
        console.info('jsApi timing isKeyExist callback, average time: ' + averageTimeIsKeyExist);
        deleteKeyByAlias('alias', done);
      } else {
        isKeyExistCallback(index, done)
      }
    });
  };

  function makeSignOptions(plainText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_RSA
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_RSA_KEY_SIZE_512
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_PKCS1_V1_5
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_MD5
    };
    var options = {
      properties: properties,
      inData: plainText
    };
    return options;
  };

  function makeImportOptions(importText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_RSA
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_RSA_KEY_SIZE_512
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_PKCS1_V1_5
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_MD5
    };
    var options = {
      properties: properties,
      inData: importText
    };
    return options;
  };

  function makeVerifyOptions(cipherText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_RSA
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_RSA_KEY_SIZE_512
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_PADDING,
      value: huks.HksKeyPadding.HKS_PADDING_PKCS1_V1_5
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_MD5
    };
    var options = {
      properties: properties,
      inData: cipherText
    };
    return options;
  };

  function deleteAliasA(done) {
    huks.deleteKey(defaultAliasA, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteAliasB(done);
    });
  };

  function deleteAliasB(done) {
    huks.deleteKey(defaultAliasB, emptyOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      done();
    });
  };

  function verifyCallback(index, plainText, done) {
    var timestampStart = (new Date()).valueOf();
    var verifyOptions = makeVerifyOptions(plainText);
    huks.verify(defaultAliasB, verifyOptions, signedText, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumVerifyTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeSign = sumSignTiming / loop;
        console.info('jsApi timing sign callback, average time: ' + averageTimeSign);
        var averageTimeVerify = sumVerifyTiming / loop;
        console.info('jsApi timing verify callback, average time: ' + averageTimeVerify);
        deleteAliasA(done);
      } else {
        signCallback(index, done);
      }
    });
  };

  function signCallback(index, done) {
    console.info('sign and verify callback index ' + index);
    var plainText = makeRandomArr(16);
    var signOptions = makeSignOptions(plainText);
    var timestampStart = (new Date()).valueOf();
    huks.sign(defaultAliasA, signOptions, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumSignTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      signedText = data.outData;
      verifyCallback(index, plainText, done);
    });
  };

  function makeAgreeOptions(publicKey) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_ECDH
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: huks.HksKeySize.HKS_ECC_KEY_SIZE_224
    };
    var options = {
      properties: properties,
      inData: publicKey
    };
    return options;
  };

  function agreeCallback(index, option, done) {
    console.info('agree callback index ' + index);
    var timestampStart = (new Date()).valueOf();
    huks.agreeKey(defaultAliasA, option, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumAgreeTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeAgree = sumAgreeTiming / loop;
        console.info('jsApi timing agree callback, average time: ' + averageTimeAgree);
        done();
      } else {
        agreeCallback(index, option, done);
      }
    });
  };

  function makeHKDFDeriveOption() {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_HKDF
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_SHA256
    };
    var options = {
      properties: properties
    };
    return options;
  };

  function deriveKeyCallback(index, option, done) {
    console.info('agree callback index ' + index);
    var timestampStart = (new Date()).valueOf();
    huks.deriveKey('alias', option, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumDeriveKeyTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeDeriveKey = sumDeriveKeyTiming / loop;
        console.info('jsApi timing deriveKey callback, average time: ' + averageTimeDeriveKey);
        deleteKeyByAlias('alias', done);
      } else {
        deriveKeyCallback(index, option, done);
      }
    });
  };


  function makeMacOption(plainText) {
    var properties = new Array();
    properties[0] = {
      tag: huks.HksTag.HKS_TAG_ALGORITHM,
      value: huks.HksKeyAlg.HKS_ALG_HMAC
    };
    properties[1] = {
      tag: huks.HksTag.HKS_TAG_PURPOSE,
      value: huks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC
    };
    properties[2] = {
      tag: huks.HksTag.HKS_TAG_DIGEST,
      value: huks.HksKeyDigest.HKS_DIGEST_SHA1
    };
    properties[3] = {
      tag: huks.HksTag.HKS_TAG_KEY_TYPE,
      value: huks.HksKeyType.HKS_KEY_TYPE_HMAC
    };
    properties[4] = {
      tag: huks.HksTag.HKS_TAG_KEY_SIZE,
      value: 160
    };
    properties[5] = {
      tag: huks.HksTag.HKS_TAG_IV,
      value: new Uint8Array(16)
    };
    var options = {
      properties: properties,
      inData: plainText
    };
    return options;
  };

  function deleteKeyCallback(index, option, done) {
    var timestampStart = (new Date()).valueOf();
    huks.deleteKey('alias', emptyOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumDeleteKeyTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeGenKey = sumGenerateKeyTiming / loop;
        console.info('jsApi timing generateKey callback, average time: ' + averageTimeGenKey);
        var averageTimeDelKey = sumDeleteKeyTiming / loop;
        console.info('jsApi timing deleteKey callback, average time: ' + averageTimeDelKey);
        done();
      } else {
        generateKeyCallback(index, option, done)
      }
    });
  };

  function generateKeyCallback(index, option, done) {
    var timestampStart = (new Date()).valueOf();
    huks.generateKey('alias', option, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumGenerateKeyTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteKeyCallback(index, option, done);
    });
  };

  /**
   * @tc.number   HKS_JSAPI_TIMING_00100
   * @tc.name     HKS_JSAPI_TIMING_GenerateAndDeleteKey_Promise
   * @tc.desc     jsApi timing test for generate key and delete key by promise
   */
  it('HKS_JSAPI_TIMING_00100', 0, async function (done) {
    var sumGenerateKeyTiming = 0;
    var sumDeleteKeyTiming = 0;
    var option = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    for (let index = 1; index <= loop; index++) {
      console.info('generate and delete key promise index ' + index);
      var timestampStart = (new Date()).valueOf();
      var result = await huks.generateKey('alias', option);
      var timestampEnd = (new Date()).valueOf();
      expect(result.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var consuming = timestampEnd - timestampStart;
      sumGenerateKeyTiming += consuming;
      timestampStart = (new Date()).valueOf();
      result = await huks.deleteKey('alias', emptyOption);
      timestampEnd = (new Date()).valueOf();
      expect(result.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      consuming = timestampEnd - timestampStart;
      sumDeleteKeyTiming += consuming;
    }
    var averageTimeGenKey = sumGenerateKeyTiming / loop;
    console.info('jsApi timing generateKey promise, average time: ' + averageTimeGenKey);
    var averageTimeDelKey = sumDeleteKeyTiming / loop;
    console.info('jsApi timing deleteKey promise, average time: ' + averageTimeDelKey);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00200
   * @tc.name     HKS_JSAPI_TIMING_GenerateAndDeleteKey_Callback
   * @tc.desc     jsApi timing test for generate key and delete key by callback
   */
  it('HKS_JSAPI_TIMING_00200', 0, async function (done) {
    sumGenerateKeyTiming = 0;
    sumDeleteKeyTiming = 0;
    var option = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    generateKeyCallback(0, option, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00300
   * @tc.name     HKS_JSAPI_TIMING_EncryptAndDecrypt_Promise
   * @tc.desc     jsApi timing test for encrypt and decrypt by promise
   */
  it('HKS_JSAPI_TIMING_00300', 0, async function (done) {
    var sumEncryptTiming = 0;
    var sumDecryptTiming = 0;
    var genKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', genKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var plainText = makeRandomArr(64);
    var encryptOption = makeEncryptOption(plainText);
    for (let index = 1; index <= loop; index++) {
      console.info('encrypt and decrypt promise index ' + index);
      var timestampStart = (new Date()).valueOf();
      var encryptRet = await huks.encrypt('alias', encryptOption);
      expect(encryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      console.info('encrypt and decrypt promise encryptRet ' + JSON.stringify(encryptRet));
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('encrypt promise time consuming ' + consuming);
      sumEncryptTiming += consuming;

      var decryptOption = makeDecryptOption(encryptRet.outData);
      timestampStart = (new Date()).valueOf();
      var decryptRet = await huks.decrypt('alias', decryptOption);
      timestampEnd = (new Date()).valueOf();
      consuming = timestampEnd - timestampStart;
      console.info('decrypt pormise time consuming ' + consuming);
      sumDecryptTiming += consuming;
      expect(decryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(plainText)).assertEqual(JSON.stringify(decryptRet.outData));
    }
    var delRet = await huks.deleteKey('alias', emptyOption);
    expect(delRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var averageTimeEncrypt = sumEncryptTiming / loop;
    var averageTimeDecrypt = sumDecryptTiming / loop;
    console.info('jsApi timing encrypt promise, average time: ' + averageTimeEncrypt);
    console.info('jsApi timing decrypt promise, average time: ' + averageTimeDecrypt);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00400
   * @tc.name     HKS_JSAPI_TIMING_EncryptAndDecrypt_Callback
   * @tc.desc     jsApi timing test for encrypt and decrypt by callback
   */
  it('HKS_JSAPI_TIMING_00400', 0, async function (done) {
    var genKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', genKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var plainText = makeRandomArr(64);
    var encryptOption = makeEncryptOption(plainText);
    encryptCallback(0, encryptOption, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00500
   * @tc.name     HKS_JSAPI_TIMING_GetSdkVersion
   * @tc.desc     jsApi timing test for getSdkVersion
   */
  it('HKS_JSAPI_TIMING_00500', 0, async function (done) {
    var sunGetSdkVersionTiming = 0;
    var genKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', genKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);

    var timestampStart = (new Date()).valueOf();
    var sdkVersion = await huks.getSdkVersion(emptyOption);
    var timestampEnd = (new Date()).valueOf();
    var consuming = timestampEnd - timestampStart;
    console.info('getSdkVersion time consuming ' + consuming);
    sunGetSdkVersionTiming += consuming;
    var result = false;
    if (sdkVersion.length > 0) {
      result = true;
    }
    expect(result).assertEqual(true);
    var averageTimeGetSdkVersion = sunGetSdkVersionTiming / loop;
    console.info('jsApi timing getSdkVersion, average time: ' + averageTimeGetSdkVersion);
    var delRet = await huks.deleteKey('alias', emptyOption);
    expect(delRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00600
   * @tc.name     HKS_JSAPI_TIMING_ImportAndExport_Promise
   * @tc.desc     jsApi timing test for import and export by promise
   */
  it('HKS_JSAPI_TIMING_00600', 0, async function (done) {
    sumExportTiming = 0;
    sumImportTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_RSA);
    for (let index = 1; index <= loop; index++) {
      console.info('generate key,export key,import key promise index ' + index);
      var genKeyRet = await huks.generateKey('alias', generateKeyOption);
      expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);

      var timestampStart = (new Date()).valueOf();
      var exportRet = await huks.exportKey('alias', emptyOption);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('export promise time consuming ' + consuming);
      sumExportTiming += consuming;
      expect(exportRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);

      var importOption = makeImportOption(exportRet.outData);
      timestampStart = (new Date()).valueOf();
      var importRet = await huks.importKey('alias_', importOption);
      timestampEnd = (new Date()).valueOf();
      consuming = timestampEnd - timestampStart;
      console.info('import promise time consuming ' + consuming);
      sumImportTiming += consuming;
      expect(importRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);

      var delKeyRet = await huks.deleteKey('alias', emptyOption);
      expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      delKeyRet = await huks.deleteKey('alias_', emptyOption);
      expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    var averageTimeExportKey = sumExportTiming / loop;
    console.info('jsApi timing export key promise, average time: ' + averageTimeExportKey);
    var averageTimeImportKey = sumImportTiming / loop;
    console.info('jsApi timing import key promise, average time: ' + averageTimeImportKey);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00700
   * @tc.name     HKS_JSAPI_TIMING_ImportAndExport_Callback
   * @tc.desc     jsApi timing test for import and export by callback
   */
  it('HKS_JSAPI_TIMING_00700', 0, async function (done) {
    sumExportTiming = 0;
    sumImportTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_RSA);
    var genKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    exportCallback(0, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00800
   * @tc.name     HKS_JSAPI_TIMING_GetKeyProperties_Promise
   * @tc.desc     jsApi timing test for getKeyProperties promise
   */
  it('HKS_JSAPI_TIMING_00800', 0, async function (done) {
    sumGetKeyPropertiesTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    for (let index = 1; index <= loop; index++) {
      console.info('get key properties promise index ' + index);
      var timestampStart = (new Date()).valueOf();
      var getKeyPropertiesRet = await huks.getKeyProperties('alias', emptyOption);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('getKeyProperties promise time consuming ' + consuming);
      sumGetKeyPropertiesTiming += consuming;
      expect(getKeyPropertiesRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    var averageTimeGetProperties = sumGetKeyPropertiesTiming / loop;
    console.info('jsApi timing get key properties promise, average time: ' + averageTimeGetProperties);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_00900
   * @tc.name     HKS_JSAPI_TIMING_GetKeyProperties_Callback
   * @tc.desc     jsApi timing test for getKeyProperties callback
   */
  it('HKS_JSAPI_TIMING_00900', 0, async function (done) {
    sumGetKeyPropertiesTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    getKeyPropertiesCallback(0, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01000
   * @tc.name     HKS_JSAPI_TIMING_IsKeyExist_Promise
   * @tc.desc     jsApi timing test for isKeyExist promise
   */
  it('HKS_JSAPI_TIMING_01000', 0, async function (done) {
    sumIsKeyExistTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    for (let index = 1; index <= loop; index++) {
      console.info('isKeyExist promise index ' + index);
      var timestampStart = (new Date()).valueOf();
      var isKeyExistRet = await huks.isKeyExist('alias', emptyOption);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      console.info('isKeyExist promise time consuming ' + consuming);
      sumIsKeyExistTiming += consuming;
      expect(isKeyExistRet).assertEqual(true);
    }
    var delKeyRet = await huks.deleteKey('alias', emptyOption);
    expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var averageTimeIsKeyExist = sumIsKeyExistTiming / loop;
    console.info('jsApi timing isKeyExist promise, average time: ' + averageTimeIsKeyExist);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01100
   * @tc.name     HKS_JSAPI_TIMING_IsKeyExist_Callback
   * @tc.desc     jsApi timing test for isKeyExist callback
   */
  it('HKS_JSAPI_TIMING_01100', 0, async function (done) {
    sumIsKeyExistTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_AES);
    var genKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    isKeyExistCallback(0, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01200
   * @tc.name     HKS_JSAPI_TIMING_SignAndVerify_Promise
   * @tc.desc     jsApi timing test for sign and verify promise
   */
  it('HKS_JSAPI_TIMING_01200', 0, async function (done) {
    sumSignTiming = 0;
    sumVerifyTiming = 0;
    var generateKeyOption = makeGenerateRSAKeyOptions();
    var generateKeyRet = await huks.generateKey(defaultAliasA, generateKeyOption);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyRet = await huks.exportKey(defaultAliasA, emptyOption);
    expect(exportKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    publicKey = exportKeyRet.outData;
    var importOptions = makeImportOptions(publicKey);
    var importKeyRet = await huks.importKey(defaultAliasB, importOptions);
    expect(importKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    for (let index = 1; index <= loop; index++) {
      console.info('sign and verify promise index ' + index);
      var plainText = makeRandomArr(16);
      var signOptions = makeSignOptions(plainText);
      var timestampStart = (new Date()).valueOf();
      var signRet = await huks.sign(defaultAliasA, signOptions);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumSignTiming += consuming;
      expect(signRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      signedText = signRet.outData;
      var verifyOptions = makeVerifyOptions(plainText);
      timestampStart = (new Date()).valueOf();
      var verifyRet = await huks.verify(defaultAliasB, verifyOptions, signedText);
      timestampEnd = (new Date()).valueOf();
      consuming = timestampEnd - timestampStart;
      sumVerifyTiming += consuming;
      expect(verifyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    var deleteKeyAliasA = await huks.deleteKey(defaultAliasA, emptyOption);
    var deleteKeyAliasB = await huks.deleteKey(defaultAliasB, emptyOption);
    expect(deleteKeyAliasA.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    expect(deleteKeyAliasB.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var averageTimeSign = sumSignTiming / loop;
    console.info('jsApi timing sign promise, average time: ' + averageTimeSign);
    var averageTimeVerify = sumVerifyTiming / loop;
    console.info('jsApi timing verify promise, average time: ' + averageTimeVerify);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01300
   * @tc.name     HKS_JSAPI_TIMING_SignAndVerify_Callback
   * @tc.desc     jsApi timing test for sign and verify callback
   */
  it('HKS_JSAPI_TIMING_01300', 0, async function (done) {
    sumSignTiming = 0;
    sumVerifyTiming = 0;
    var generateKeyOption = makeGenerateRSAKeyOptions();
    var generateKeyRet = await huks.generateKey(defaultAliasA, generateKeyOption);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyRet = await huks.exportKey(defaultAliasA, emptyOption);
    expect(exportKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    publicKey = exportKeyRet.outData;
    var importOptions = makeImportOptions(publicKey);
    var importKeyRet = await huks.importKey(defaultAliasB, importOptions);
    expect(importKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    signCallback(0, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01400
   * @tc.name     HKS_JSAPI_TIMING_AgreeKey_Promise
   * @tc.desc     jsApi timing test for agree promise
   */
  it('HKS_JSAPI_TIMING_01400', 0, async function (done) {
    sumAgreeTiming = 0;
    var generateKeyAOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_ECC);
    var generateKeyARet = await huks.generateKey(defaultAliasA, generateKeyAOption);
    expect(generateKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var generateKeyBOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_ECC);
    var generateKeyBRet = await huks.generateKey(defaultAliasB, generateKeyBOption);
    expect(generateKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyBRet = await huks.exportKey(defaultAliasB, emptyOption);
    publicKey = exportKeyBRet.outData;
    var agreeKeyAOption = makeAgreeOptions(publicKey);
    for (let index = 1; index <= loop; index++) {
      console.info('agree promise index ' + index);
      var timestampStart = (new Date()).valueOf();
      var agreeKeyARet = await huks.agreeKey(defaultAliasA, agreeKeyAOption);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumAgreeTiming += consuming;
      expect(agreeKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    var averageTimeAgree = sumAgreeTiming / loop;
    console.info('jsApi timing agree promise, average time: ' + averageTimeAgree);
    var deleteKeyARet = await huks.deleteKey(defaultAliasA, emptyOption);
    expect(deleteKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var deleteKeyBRet = await huks.deleteKey(defaultAliasB, emptyOption);
    expect(deleteKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    done();
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01500
   * @tc.name     HKS_JSAPI_TIMING_AgreeKey_Callback
   * @tc.desc     jsApi timing test for agree callback
   */
  it('HKS_JSAPI_TIMING_01500', 0, async function (done) {
    sumAgreeTiming = 0;
    var generateKeyAOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_ECC);
    var generateKeyARet = await huks.generateKey(defaultAliasA, generateKeyAOption);
    expect(generateKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var generateKeyBOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_ECC);
    var generateKeyBRet = await huks.generateKey(defaultAliasB, generateKeyBOption);
    expect(generateKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyBRet = await huks.exportKey(defaultAliasB, emptyOption);
    publicKey = exportKeyBRet.outData;
    var agreeKeyAOption = makeAgreeOptions(publicKey);
    agreeCallback(0, agreeKeyAOption, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01600
   * @tc.name     HKS_JSAPI_TIMING_DeriveKey_Promise
   * @tc.desc     jsApi timing test for deriveKey promise
   */
  it('HKS_JSAPI_TIMING_01600', 0, async function (done) {
    sumDeriveKeyTiming = 0;
    var generateKeyOption = makeGenerateKeyOption('DERIVE_AES_KEY');
    var generateKeyResult = await huks.generateKey('alias', generateKeyOption);
    expect(generateKeyResult.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var deriveKeyOption = makeHKDFDeriveOption();
    for (let index = 1; index <= loop; index++) {
      console.info('agree promise index ' + index);
      var timestampStart = (new Date()).valueOf();
      var deriveKeyResult = await huks.deriveKey('alias', deriveKeyOption);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumDeriveKeyTiming += consuming;
      expect(deriveKeyResult.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    var averageTimeDeriveKey = sumDeriveKeyTiming / loop;
    console.info('jsApi timing deriveKey promise, average time: ' + averageTimeDeriveKey);
    deleteKeyByAlias('alias', done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01700
   * @tc.name     HKS_JSAPI_TIMING_DeriveKey_Callback
   * @tc.desc     jsApi timing test for deriveKey promise
   */
  it('HKS_JSAPI_TIMING_01700', 0, async function (done) {
    sumDeriveKeyTiming = 0;
    var generateKeyOption = makeGenerateKeyOption('DERIVE_AES_KEY');
    var generateKeyResult = await huks.generateKey('alias', generateKeyOption);
    expect(generateKeyResult.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var deriveKeyOption = makeHKDFDeriveOption();
    deriveKeyCallback(0, deriveKeyOption, done);
  });

  /**
   * @tc.number   HKS_JSAPI_TIMING_01800
   * @tc.name     HKS_JSAPI_TIMING_Mac_Promise
   * @tc.desc     jsApi timing test for mac promise
   */
  it('HKS_JSAPI_TIMING_01800', 0, async function (done) {
    sumMacTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_HMAC);
    var generateKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    for (let index = 1; index <= loop; index++) {
      console.info('mac promise index ' + index);
      var plainText = makeRandomArr(64);
      var macOption = makeMacOption(plainText);
      var timestampStart = (new Date()).valueOf();
      var macRet = await huks.mac('alias', macOption);
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumMacTiming += consuming;
      expect(macRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    var averageTimeMac = sumMacTiming / loop;
    console.info('jsApi timing mac promise, average time: ' + averageTimeMac);
    deleteKeyByAlias('alias', done);
  });

  function macCallback(index, done) {
    var plainText = makeRandomArr(64);
    var macOption = makeMacOption(plainText);
    var timestampStart = (new Date()).valueOf();
    huks.mac('alias', macOption, function (err, data) {
      var timestampEnd = (new Date()).valueOf();
      var consuming = timestampEnd - timestampStart;
      sumMacTiming += consuming;
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      index++;
      if (index == loop) {
        var averageTimeMac = sumMacTiming / loop;
        console.info('jsApi timing mac callback, average time: ' + averageTimeMac);
        deleteKeyByAlias('alias', done);
      } else {
        macCallback(index, done);
      }
    });
  };

  /**
   * @tc.number   HKS_JSAPI_TIMING_01900
   * @tc.name     HKS_JSAPI_TIMING_Mac_Callback
   * @tc.desc     jsApi timing test for mac callback
   */
  it('HKS_JSAPI_TIMING_01900', 0, async function (done) {
    sumMacTiming = 0;
    var generateKeyOption = makeGenerateKeyOption(huks.HksKeyAlg.HKS_ALG_HMAC);
    var generateKeyRet = await huks.generateKey('alias', generateKeyOption);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    macCallback(0, done);
  });
});