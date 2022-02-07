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

describe('HKS_CONCURRENCY_APP1_TEST', function () {
  var appName = 'app1';
  var defaultAlias = 'defaultAlias';
  var defaultAliasA = 'defaultAliasA';
  var defaultAliasB = 'defaultAliasB';
  var emptyOptionForApp1 = emptyOption;
  var plainText = makeRandomArr(64);
  var signPlainText = makeRandomArr(16);
  var ciphertext = [];
  var publicKey = [];
  var agreeKeyAOption = {};
  var agreeKeyBOption = {};

  var aes128KeyOptForApp1 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_AES,
    huks.HksKeySize.HKS_AES_KEY_SIZE_128,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_CBC
  );

  var rsa512KeyOptForApp1 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_RSA,
    huks.HksKeySize.HKS_RSA_KEY_SIZE_512,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | huks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_ECB,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var ecc224OptForApp1 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    null,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var agreeKeyOptionForApp1 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
    null,
    null,
    huks.HksKeyDigest.HKS_DIGEST_NONE
  );

  var macKeyOptionForApp1 = makeGenerateKeyOption(
    huks.HksKeyAlg.HKS_ALG_HMAC,
    160,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
    null,
    null,
    huks.HksKeyDigest.HKS_DIGEST_SHA1
  );

  var encryptAes128OptForApp1 = makeEncryptAndDecryptOption(
    huks.HksKeyAlg.HKS_ALG_AES,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksCipherMode.HKS_MODE_CBC,
    null,
    null,
    plainText
  );

  var signOptionForApp1 = makeSignAndVerifyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    signPlainText
  );

  var verifyOptionForApp1 = makeSignAndVerifyOption(
    huks.HksKeyAlg.HKS_ALG_ECC,
    huks.HksKeySize.HKS_ECC_KEY_SIZE_224,
    huks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
    huks.HksKeyPadding.HKS_PADDING_NONE,
    huks.HksKeyDigest.HKS_DIGEST_NONE,
    signPlainText
  );

  var macOptionForApp1 = makeMacOption(plainText);

  async function generateAesKeyForApp1() {
    var genKeyRet = await huks.generateKey(defaultAlias, aes128KeyOptForApp1);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp1);
    expect(isKeyExistRet).assertEqual(true);
  };

  async function generateRsaKeyForApp1() {
    var genKeyRet = await huks.generateKey(defaultAliasA, rsa512KeyOptForApp1);
    expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyExistRet = await huks.isKeyExist(defaultAliasA, emptyOptionForApp1);
    expect(isKeyExistRet).assertEqual(true);
  };

  async function deleteAesKeyForApp1() {
    var delKeyRet = await huks.deleteKey(defaultAlias, emptyOptionForApp1);
    expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp1);
    expect(isKeyExistRet).assertEqual(false);
  };

  async function deleteKeyABForApp1() {
    var delKeyARet = await huks.deleteKey(defaultAliasA, emptyOptionForApp1);
    expect(delKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyAExistRet = await huks.isKeyExist(defaultAliasA, emptyOptionForApp1);
    expect(isKeyAExistRet).assertEqual(false);
    var delKeyBRet = await huks.deleteKey(defaultAliasB, emptyOptionForApp1);
    expect(delKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var isKeyBExistRet = await huks.isKeyExist(defaultAliasB, emptyOptionForApp1);
    expect(isKeyBExistRet).assertEqual(false);
  };

  function isKeyExistAfterDelKeyForApp1(index, done) {
    huks.isKeyExist(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(false);
      if (index < loop) {
        index++;
        generateKeyCallbackForApp1(index, done);
      } else {
        done();
      }
    });
  };

  function deleteKeyCallbackForApp1(index, done) {
    huks.deleteKey(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyExistAfterDelKeyForApp1(index, done);
    });
  };

  function isKeyExistAfterGenKeyForApp1(index, done) {
    huks.isKeyExist(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(true);
      deleteKeyCallbackForApp1(index, done);
    });
  };

  function generateKeyCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00100 callback index ' + index);
    huks.generateKey(defaultAlias, aes128KeyOptForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyExistAfterGenKeyForApp1(index, done);
    });
  };

  function genAndDelKeyCallbackForApp1(done) {
    var index = 0
    generateKeyCallbackForApp1(index, done);
  };

  function isKeyNotExistForApp1(alias, done) {
    huks.isKeyExist(alias, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(false);
      done();
    })
  };

  function deleteKeyForApp1(alias, done) {
    huks.deleteKey(alias, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyNotExistForApp1(alias, done);
    })
  };

  function aesDecryptCallbackForApp1(index, done) {
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
        aesEncryptCallbackForApp1(index, done);
      } else {
        deleteKeyForApp1(defaultAlias, done);
      }
    });
  };

  function aesEncryptCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00400 callback index ' + index);
    huks.encrypt(defaultAlias, encryptAes128OptForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      ciphertext = data.outData
      aesDecryptCallbackForApp1(index, done);
    })
  };

  function aesEncryptAndDecryptCallbackForApp1(done) {
    var index = 0;
    aesEncryptCallbackForApp1(index, done);
  };

  function isAliasBExistForApp1(done) {
    huks.isKeyExist(defaultAliasB, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(false);
      done();
    });
  };

  function isAliasAExistForApp1(done) {
    huks.isKeyExist(defaultAliasA, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(false);
      isAliasBExistForApp1(done);
    });
  };

  function deleteAliasBForAPP1(done) {
    huks.deleteKey(defaultAliasB, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isAliasAExistForApp1(done);
    });
  };

  function deleteAliasAForApp1(done) {
    huks.deleteKey(defaultAliasA, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      deleteAliasBForAPP1(done);
    });
  };

  function rsaImportCallbackForApp1(index, done) {
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
        rsaExportCallbackForApp1(index, done);
      } else {
        deleteAliasAForApp1(done);
      }
    });
  };

  function rsaExportCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00600 callback index ' + index);
    huks.exportKey(defaultAliasA, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      publicKey = data.outData;
      rsaImportCallbackForApp1(index, done);
    });
  };

  function rsaExportAndImportCallbackForApp1(done) {
    var index = 0;
    rsaExportCallbackForApp1(index, done);
  };

  function getKeyPropertiesCallbackForApp1(index, done) {
    huks.getKeyProperties(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        getKeyPropertiesCallbackForApp1(index, done);
      } else {
        deleteKeyForApp1(defaultAlias, done);
      }
    });
  };

  function isKeyNotExistCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00800 callback not exist key index ' + index);
    huks.isKeyExist(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(false);
      if (index < loop) {
        index++;
        isKeyNotExistCallbackForApp1(index, done);
      } else {
        done();
      }
    });
  };

  function deleteExistKeyCallbackForApp1(done) {
    huks.deleteKey(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      isKeyNotExistCallbackForApp1(0, done);
    });
  };

  function isKeyExistCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_00800 callback exist key index ' + index);
    huks.isKeyExist(defaultAlias, emptyOptionForApp1, function (err, data) {
      expect(data).assertEqual(true);
      if (index < loop) {
        index++;
        isKeyExistCallbackForApp1(index, done);
      } else {
        deleteExistKeyCallbackForApp1(done);
      }
    });
  };

  async function generateSignKeyForApp1() {
    var generateKeyRet = await huks.generateKey(defaultAliasA, ecc224OptForApp1);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyRet = await huks.exportKey(defaultAliasA, emptyOptionForApp1);
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

  function verifyWithCallbackForApp1(index, done) {
    huks.verify(defaultAliasB, verifyOptionForApp1, ciphertext, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        signWithCallbackForApp1(index, done);
      } else {
        deleteAliasAForApp1(done);
      }
    });
  }

  function signWithCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_01100 callback index ' + index);
    huks.sign(defaultAliasA, signOptionForApp1, function (err, data) {
      ciphertext = data.outData;
      verifyWithCallbackForApp1(index, done);
    });
  }

  function signAndVerifyCallbackForApp1(done) {
    signWithCallbackForApp1(0, done);
  };

  function agreeKeyBWithCallbackForApp1(key, index, done) {
    huks.agreeKey(defaultAliasB, agreeKeyBOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      expect(JSON.stringify(data.outData)).assertEqual(JSON.stringify(key));
      if (index < loop) {
        index++;
        agreeKeyAWithCallbackForApp1(index, done);
      } else {
        deleteAliasAForApp1(done);
      }
    });
  };

  function agreeKeyAWithCallbackForApp1(index, done) {
    console.log(appName + ' HUKS_Concurrency_Test_01200 promise callback index ' + index);
    huks.agreeKey(defaultAliasA, agreeKeyAOption, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var key = data.outData;
      console.log('agreeKeyARet.outData' + key);

      agreeKeyBWithCallbackForApp1(key, index, done);
    });
  };

  function agreeWithCallbackForApp1(done) {
    agreeKeyAWithCallbackForApp1(0, done);
  };

  function macWithCallbackForApp1(index, done) {
    huks.mac(defaultAlias, macOptionForApp1, function (err, data) {
      expect(data.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      if (index < loop) {
        index++;
        macWithCallbackForApp1(index, done);
      } else {
        deleteKeyForApp1(defaultAlias, done);
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
      var genKeyRet = await huks.generateKey(defaultAlias, aes128KeyOptForApp1);
      expect(genKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp1);
      expect(isKeyExistRet).assertEqual(true);
      var delKeyRet = await huks.deleteKey(defaultAlias, emptyOptionForApp1);
      expect(delKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp1);
      expect(isKeyExistRet).assertEqual(false);
    }
    genAndDelKeyCallbackForApp1(done);
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
      var sdkVersion = await huks.getSdkVersion(emptyOptionForApp1);
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
    await generateAesKeyForApp1();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00300 promise index ' + index);
      var encryptRet = await huks.encrypt(defaultAlias, encryptAes128OptForApp1);
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
    await deleteAesKeyForApp1();
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
    await generateAesKeyForApp1();
    aesEncryptAndDecryptCallbackForApp1(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00500
   * @tc.name     Concurrency_Test_Import_Export_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00500', 0, async function (done) {
    await generateRsaKeyForApp1();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00500 promise index ' + index);
      var exportPublicKeyRet = await huks.exportKey(defaultAliasA, emptyOptionForApp1);
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
    await deleteKeyABForApp1();
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
    await generateRsaKeyForApp1();
    rsaExportAndImportCallbackForApp1(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00700
   * @tc.name     Concurrency_Test_GetKeyProperties
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00700', 0, async function (done) {
    await generateAesKeyForApp1();
    for (let index = 0; index < loop; index++) {
      var getKeyPropertiesRet = await huks.getKeyProperties(defaultAlias, emptyOptionForApp1);
      expect(getKeyPropertiesRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    getKeyPropertiesCallbackForApp1(0, done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_00800
   * @tc.name     Concurrency_Test_IsKeyExist_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_00800', 0, async function (done) {
    await generateAesKeyForApp1();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00800 exist key index ' + index);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp1);
      expect(isKeyExistRet).assertEqual(true);
    }
    await deleteAesKeyForApp1();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_00800 not exist key  index ' + index);
      var isKeyExistRet = await huks.isKeyExist(defaultAlias, emptyOptionForApp1);
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
    await generateAesKeyForApp1();
    isKeyExistCallbackForApp1(0, done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01000
   * @tc.name     Concurrency_Test_Sign_Verify_Promise
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01000', 0, async function (done) {
    await generateSignKeyForApp1();
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_01000 promise index ' + index);
      var signRet = await huks.sign(defaultAliasA, signOptionForApp1);
      var verifyRet = await huks.verify(defaultAliasB, verifyOptionForApp1, signRet.outData);
      expect(verifyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    await deleteKeyABForApp1();
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
    await generateSignKeyForApp1();
    signAndVerifyCallbackForApp1(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01200
   * @tc.name     Concurrency_Test_agree
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01200', 0, async function (done) {
    var generateKeyARet = await huks.generateKey(defaultAliasA, agreeKeyOptionForApp1);
    expect(generateKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var generateKeyBRet = await huks.generateKey(defaultAliasB, agreeKeyOptionForApp1);
    expect(generateKeyBRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyARet = await huks.exportKey(defaultAliasA, emptyOptionForApp1);
    expect(exportKeyARet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var exportKeyBRet = await huks.exportKey(defaultAliasB, emptyOptionForApp1);
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
    agreeWithCallbackForApp1(done);
    setTimeout(function () {
    }, timer);
  });

  /**
   * @tc.number   HUKS_Concurrency_Test_01300
   * @tc.name     Concurrency_Test_mac
   * @tc.desc     Test for APP Concurrency.
   */
  it('HUKS_Concurrency_Test_01300', 0, async function (done) {
    var generateKeyRet = await huks.generateKey(defaultAlias, macKeyOptionForApp1);
    expect(generateKeyRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    var macOptionForApp1 = makeMacOption(plainText);
    for (let index = 0; index < loop; index++) {
      console.log(appName + ' HUKS_Concurrency_Test_01300 promise index ' + index);
      var macRet = await huks.mac(defaultAlias, macOptionForApp1);
      expect(macRet.errorCode).assertEqual(huks.HksErrorCode.HKS_SUCCESS);
    }
    macWithCallbackForApp1(0, done);
    setTimeout(function () {
    }, timer);
  });
});