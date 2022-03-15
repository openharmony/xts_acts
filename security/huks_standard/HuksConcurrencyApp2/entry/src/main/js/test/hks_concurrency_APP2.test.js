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
import { describe, it, expect } from 'deccjsunit/index'

import {
  makeGenerateKeyOption,
  makeImportOption,
  makeEncryptAndDecryptOption,
  makeSignAndVerifyOption,
  makeAgreeOptions,
  makeMacOption,
  makeRandomArr,
  emptyOption,
  loop,
  timer
} from '../../../../../../hks_xts_common.test'

describe('HKS_CONCURRENCY_APP2_TEST', function () {
  var appName = 'app2';
  var defaultAlias = 'defaultAlias';
  var defaultAliasA = 'defaultAliasA';
  var defaultAliasB = 'defaultAliasB';
  var emptyOptionForApp2 = emptyOption;
  var plainText = makeRandomArr(64);
  var signPlainText = makeRandomArr(16);
  var ciphertext = [];
  var publicKey = [];
  var agreeKeyAOption = {};
  var agreeKeyBOption = {};

  var aes128KeyOptForApp2 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_AES,
    huks.HksKeySize.HKS_AES_KEY_SIZE_128,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_CBC
  );

  var rsa512KeyOptForApp2 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_RSA,
    huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_ECB,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var ecc224OptForApp2 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    null,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var agreeKeyOptionForApp2 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
    null,
    null,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var macKeyOptionForApp2 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_HMAC,
    160,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
    null,
    null,
    huks.HksKeyDigest.HKS_DIGEST_SHA1
  );

  var encryptAes128OptForApp2 = makeEncryptAndDecryptOption(
    huks.HksKeyAlg.HKS_ALG_AES,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_CBC,
    null,
    null,
    plainText
  );

  var signOptionForApp2 = makeSignAndVerifyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    signPlainText
  );

  var verifyOptionForApp2 = makeSignAndVerifyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    signPlainText
  );

  var macOptionForApp2 = makeMacOption(plainText);

  async function generateAesKeyForApp2() {
    var genKeyRet = await huks.generateKey(defaultAlias, aes128KeyOptForApp2);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp2);
    expect(isKeyExistRet).assertEqual(true);
  };

  async function generateRsaKeyForApp2() {
    var genKeyRet = await huks.generateKey(defaultAliasA, rsa512KeyOptForApp2);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyExistRet = await huks.isKeyExist(defaultAliasA, emptyOptionForApp2);
    expect(isKeyExistRet).assertEqual(true);
  };

  async function deleteAesKeyForApp2() {
    var delKeyRet = await huks.deleteKey(defaultAlias, emptyOptionForApp2);
    expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp2);
    expect(isKeyExistRet).assertEqual(false);
  };

  async function deleteKeyABForApp2() {
    var delKeyARet = await huks.deleteKey(defaultAliasA, emptyOptionForApp2);
    expect(delKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyAExistRet = await huks.isKeyExist(defaultAliasA, emptyOptionForApp2);
    expect(isKeyAExistRet).assertEqual(false);
    var delKeyBRet = await huks.deleteKey(defaultAliasB, emptyOptionForApp2);
    expect(delKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyBExistRet = await huks.isKeyExist(defaultAliasB, emptyOptionForApp2);
    expect(isKeyBExistRet).assertEqual(false);
  };

  function isKeyExistAfterDelKeyForApp2(index, done) {
    huks.isKeyExist(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(false);
      if (index < loop) {
        index++;
        generateKeyCallbackForApp2(index, done);
      } else {
        done();
      }
    });
  };

  function deleteKeyCallbackForApp2(index, done) {
    huks.deleteKey(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyExistAfterDelKeyForApp2(index, done);
    });
  };

  function isKeyExistAfterGenKeyForApp2(index, done) {
    huks.isKeyExist(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(true);
      deleteKeyCallbackForApp2(index, done);
    });
  };

  function generateKeyCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00100 callback index ' + index);
    huks.generateKey(defaultAlias, aes128KeyOptForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyExistAfterGenKeyForApp2(index, done);
    });
  };

  function genAndDelKeyCallbackForApp2(done) {
    var index = 0
    generateKeyCallbackForApp2(index, done);
  };

  function isKeyNotExistForApp2(alias, done) {
    huks.isKeyExist(alias, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(false);
      done();
    })
  };

  function deleteKeyForApp2(alias, done) {
    huks.deleteKey(alias, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyNotExistForApp2(alias, done);
    })
  };

  function aesDecryptCallbackForApp2(index, done) {
    var decryptOpt = makeEncryptAndDecryptOption(
      huks.HksKeyAlg.HKS_ALG_AES,
      huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
      huks.HksKeyPadding.HKS_PADDING_NONE,
      huks.HksCipherMode.HKS_MODE_CBC,
      null,
      null,
      ciphertext
    );
    huks.decrypt(defaultAlias, decryptOpt, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(plainText)).assertEqual(JSON.stringify(data.outData));
      if (index < loop) {
        index++;
        aesEncryptCallbackForApp2(index, done);
      } else {
        deleteKeyForApp2(defaultAlias, done);
      }
    });
  };

  function aesEncryptCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00400 callback index ' + index);
    huks.encrypt(defaultAlias, encryptAes128OptForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      ciphertext = data.outData
      aesDecryptCallbackForApp2(index, done);
    })
  };

  function aesEncryptAndDecryptCallbackForApp2(done) {
    var index = 0;
    aesEncryptCallbackForApp2(index, done);
  };

  function isAliasBExistForApp2(done) {
    huks.isKeyExist(defaultAliasB, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(false);
      done();
    });
  };

  function isAliasAExistForApp2(done) {
    huks.isKeyExist(defaultAliasA, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(false);
      isAliasBExistForApp2(done);
    });
  };

  function deleteAliasBForAPP1(done) {
    huks.deleteKey(defaultAliasB, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isAliasAExistForApp2(done);
    });
  };

  function deleteAliasAForApp2(done) {
    huks.deleteKey(defaultAliasA, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteAliasBForAPP1(done);
    });
  };

  function rsaImportCallbackForApp2(index, done) {
    var importRsa512KeyOpt = makeImportOption(
      huks.HksKeyAlg.HKS_ALG_RSA,
      huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
      huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
      huks.HksKeyPadding.HKS_PADDING_NONE,
      huks.HksCipherMode.HKS_MODE_ECB,
      huks.HksKeyDigest.HKS_DIGEST_NONE,
      publicKey
    );
    huks.importKey(defaultAliasB, importRsa512KeyOpt, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        rsaExportCallbackForApp2(index, done);
      } else {
        deleteAliasAForApp2(done);
      }
    });
  };

  function rsaExportCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00600 callback index ' + index);
    huks.exportKey(defaultAliasA, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      publicKey = data.outData;
      rsaImportCallbackForApp2(index, done);
    });
  };

  function rsaExportAndImportCallbackForApp2(done) {
    var index = 0;
    rsaExportCallbackForApp2(index, done);
  };

  function getKeyPropertiesCallbackForApp2(index, done) {
    huks.getKeyProperties(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        getKeyPropertiesCallbackForApp2(index, done);
      } else {
        deleteKeyForApp2(defaultAlias, done);
      }
    });
  };

  function isKeyNotExistCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00800 callback not exist key index ' + index);
    huks.isKeyExist(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(false);
      if (index < loop) {
        index++;
        isKeyNotExistCallbackForApp2(index, done);
      } else {
        done();
      }
    });
  };

  function deleteExistKeyCallbackForApp2(done) {
    huks.deleteKey(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyNotExistCallbackForApp2(0, done);
    });
  };

  function isKeyExistCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00800 callback exist key index ' + index);
    huks.isKeyExist(defaultAlias, emptyOptionForApp2, function (err, data) {
      expect(data).assertEqual(true);
      if (index < loop) {
        index++;
        isKeyExistCallbackForApp2(index, done);
      } else {
        deleteExistKeyCallbackForApp2(done);
      }
    });
  };

  async function generateSignKeyForApp2() {
    var generateKeyRet = await huks.generateKey(defaultAliasA, ecc224OptForApp2);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyRet = await huks.exportKey(defaultAliasA, emptyOptionForApp2);
    var importOptions = makeImportOption(
      huks.HksKeyAlg.HKS_ALG_ECC,
      huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
      huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
      huks.HksKeyPadding.HKS_PADDING_NONE,
      null,
      huks.HksKeyDigest.HKS_DIGEST_NONE,
      exportKeyRet.outData
    );
    var importKeyRet = await huks.importKey(defaultAliasB, importOptions);
    expect(importKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
  };

  function verifyWithCallbackForApp2(index, done) {
    huks.verify(defaultAliasB, verifyOptionForApp2, ciphertext, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        signWithCallbackForApp2(index, done);
      } else {
        deleteAliasAForApp2(done);
      }
    });
  }

  function signWithCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_01100 callback index ' + index);
    huks.sign(defaultAliasA, signOptionForApp2, function (err, data) {
      ciphertext = data.outData;
      verifyWithCallbackForApp2(index, done);
    });
  }

  function signAndVerifyCallbackForApp2(done) {
    signWithCallbackForApp2(0, done);
  };

  function agreeKeyBWithCallbackForApp2(key, index, done) {
    huks.agreeKey(defaultAliasB, agreeKeyBOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(data.outData)).assertEqual(JSON.stringify(key));
      if (index < loop) {
        index++;
        agreeKeyAWithCallbackForApp2(index, done);
      } else {
        deleteAliasAForApp2(done);
      }
    });
  };

  function agreeKeyAWithCallbackForApp2(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_01200 promise callback index ' + index);
    huks.agreeKey(defaultAliasA, agreeKeyAOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var key = data.outData;
      console.log('agreeKeyARet.outData' + key);

      agreeKeyBWithCallbackForApp2(key, index, done);
    });
  };

  function agreeWithCallbackForApp2(done) {
    agreeKeyAWithCallbackForApp2(0, done);
  };

  function macWithCallbackForApp2(index, done) {
    huks.mac(defaultAlias, macOptionForApp2, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        macWithCallbackForApp2(index, done);
      } else {
        deleteKeyForApp2(defaultAlias, done);
      }
    });
  };

  /**
   * @tc.number   HUKS_Concurrency_Test_00100
   * @tc.name     Concurrency_Test_GenKey_AES
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00100', 0, async function (done) {
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00100 promise index ' + index);
      var genKeyRet = await huks.generateKey(defaultAlias, aes128KeyOptForApp2);
      expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp2);
      expect(isKeyExistRet).assertEqual(true);
      var delKeyRet = await huks.deleteKey(defaultAlias, emptyOptionForApp2);
      expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp2);
      expect(isKeyExistRet).assertEqual(false);
    }
    genAndDelKeyCallbackForApp2(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00200
   * @tc.name     Concurrency_Test_GetSdkVersion
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00200', 0, async function (done) {
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00200 promise index ' + index);
      var sdkVersion = await huks.getSdkVersion(emptyOptionForApp2);
      console.log('sdk version ' + JSON.stringify(sdkVersion));
      var result = false;
      if (sdkVersion.length > 0) {
        result = true;
      }
      expect(result).assertEqual(true);
    }
    done();
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00300
   * @tc.name     Concurrency_Test_Encrypt_Decrypt_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00300', 0, async function (done) {
    await generateAesKeyForApp2();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00300 promise index ' + index);
      var encryptRet = await huks.encrypt(defaultAlias, encryptAes128OptForApp2);
      expect(encryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var decryptOpt = makeEncryptAndDecryptOption(
        huks.HksKeyAlg.HKS_ALG_AES,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_CBC,
        null,
        null,
        encryptRet.outData
      );
      var decryptRet = await huks.decrypt(defaultAlias, decryptOpt);
      expect(decryptRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(plainText)).assertEqual(JSON.stringify(decryptRet.outData));
    }
    await deleteAesKeyForApp2();
    done();
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00400
   * @tc.name     Concurrency_Test_Encrypt_Decrypt_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00400', 0, async function (done) {
    await generateAesKeyForApp2();
    aesEncryptAndDecryptCallbackForApp2(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00500
   * @tc.name     Concurrency_Test_Import_Export_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00500', 0, async function (done) {
    await generateRsaKeyForApp2();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00500 promise index ' + index);
      var exportPublicKeyRet = await huks.exportKey(defaultAliasA, emptyOptionForApp2);
      expect(exportPublicKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var importRsa512KeyOpt = makeImportOption(
        huks.HksKeyAlg.HKS_ALG_RSA,
        huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
        huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
        huks.HksKeyPadding.HKS_PADDING_NONE,
        huks.HksCipherMode.HKS_MODE_ECB,
        huks.HksKeyDigest.HKS_DIGEST_NONE,
        exportPublicKeyRet.outData
      );
      var importRsa512KeyRet = await huks.importKey(defaultAliasB, importRsa512KeyOpt);
      expect(importRsa512KeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    await deleteKeyABForApp2();
    done();
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00600
   * @tc.name     Concurrency_Test_Import_Export_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00600', 0, async function (done) {
    await generateRsaKeyForApp2();
    rsaExportAndImportCallbackForApp2(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00700
   * @tc.name     Concurrency_Test_GetKeyProperties
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00700', 0, async function (done) {
    await generateAesKeyForApp2();
    for (let index = 0; index < loop; index++) {
      var getKeyPropertiesRet = await huks.getKeyProperties(defaultAlias, emptyOptionForApp2);
      expect(getKeyPropertiesRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    getKeyPropertiesCallbackForApp2(0, done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00800
   * @tc.name     Concurrency_Test_IsKeyExist_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00800', 0, async function (done) {
    await generateAesKeyForApp2();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00800 exist key index ' + index);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp2);
      expect(isKeyExistRet).assertEqual(true);
    }
    await deleteAesKeyForApp2();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00800 not exist key  index ' + index);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp2);
      expect(isKeyExistRet).assertEqual(false);
    }
    done();
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00900
   * @tc.name     Concurrency_Test_IsKeyExist_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00900', 0, async function (done) {
    await generateAesKeyForApp2();
    isKeyExistCallbackForApp2(0, done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01000
   * @tc.name     Concurrency_Test_Sign_Verify_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01000', 0, async function (done) {
    await generateSignKeyForApp2();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_01000 promise index ' + index);
      var signRet = await huks.sign(defaultAliasA, signOptionForApp2);
      var verifyRet = await huks.verify(defaultAliasB, verifyOptionForApp2, signRet.outData);
      expect(verifyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    await deleteKeyABForApp2();
    done();
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01100
   * @tc.name     Concurrency_Test_Sign_Verify_Callback
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01100', 0, async function (done) {
    await generateSignKeyForApp2();
    signAndVerifyCallbackForApp2(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01200
   * @tc.name     Concurrency_Test_agree
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01200', 0, async function (done) {
    var generateKeyARet = await huks.generateKey(defaultAliasA, agreeKeyOptionForApp2);
    expect(generateKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var generateKeyBRet = await huks.generateKey(defaultAliasB, agreeKeyOptionForApp2);
    expect(generateKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyARet = await huks.exportKey(defaultAliasA, emptyOptionForApp2);
    expect(exportKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyBRet = await huks.exportKey(defaultAliasB, emptyOptionForApp2);
    expect(exportKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    agreeKeyBOption = makeAgreeOptions(exportKeyARet.outData);
    agreeKeyAOption = makeAgreeOptions(exportKeyBRet.outData);
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_01200 promise index ' + index);
      var agreeKeyARet = await huks.agreeKey(defaultAliasA, agreeKeyAOption);
      expect(agreeKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var agreeKeyBRet = await huks.agreeKey(defaultAliasB, agreeKeyBOption);
      expect(agreeKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(agreeKeyARet.outData)).assertEqual(JSON.stringify(agreeKeyBRet.outData));
    }
    agreeWithCallbackForApp2(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01300
   * @tc.name     Concurrency_Test_mac
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01300', 0, async function (done) {
    var generateKeyRet = await huks.generateKey(defaultAlias, macKeyOptionForApp2);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var macOptionForApp2 = makeMacOption(plainText);
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_01300 promise index ' + index);
      var macRet = await huks.mac(defaultAlias, macOptionForApp2);
      expect(macRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    macWithCallbackForApp2(0, done);
    setTimeout(function () {
    }, timer);
  });
});