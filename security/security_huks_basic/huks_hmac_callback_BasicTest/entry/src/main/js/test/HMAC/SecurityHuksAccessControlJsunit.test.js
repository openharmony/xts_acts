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

import { describe, it, expect } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import Data from '../../../../../../../utils/data.json';
import { HuksHmac } from '../../../../../../../utils/param/hmac/publicHmacParam.js';
import { stringToArray } from '../../../../../../../utils/param/publicFunc.js';

var handle;
let srcData63Kb = Data.Date63KB;
let srcData65Kb = Data.Date65KB;

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test generateKey err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test generateKey err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function init(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.init(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test init err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          handle = data.handle;
          resolve(data);
        }
      } catch (e) {
        console.log('test init err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function update(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.update(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test update err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test update err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function finish(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test finish err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test finish err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function abort(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.abort(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test abort err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test abort err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test deleteKey err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test deleteKey err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

async function publicHmacUpdate(HuksOptions) {
  let dateSize = 64 * 1024;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = stringToArray(HuksOptions.inData);

  if (HuksOptions.inData.length <= dateSize) {
    HuksOptions.inData = new Uint8Array(inDataArray);
    await update(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data: ${data}`);
      })
      .catch((err) => {
        console.log('test update err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
    HuksOptions.inData = huksOptionsInData;
  } else {
    let count = Math.floor(inDataArray.length / dateSize);
    let remainder = inDataArray.length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(stringToArray(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
      await update(handle, HuksOptions)
        .then((data) => {
          console.log(`test update data: ${data}`);
        })
        .catch((err) => {
          console.log('test update err information: ' + JSON.stringify(err));
          expect(null).assertFail();
        });
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(stringToArray(huksOptionsInData).slice(dateSize * count, inDataArray.length));
      console.log(`test update HuksOptions.inData ${HuksOptions.inData}`);
      await update(handle, HuksOptions)
        .then((data) => {
          console.log(`test update data: ${data}`);
        })
        .catch((err) => {
          console.log('test update err information: ' + JSON.stringify(err));
          expect(null).assertFail();
        });
    }
  }
}

async function publicHmacGenFunc(srcKeyAlies, HuksOptions, thirdInderfaceName) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log('test generateKey data = ' + JSON.stringify(data));
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });

  HuksOptions.properties.splice(1, 1);
  await init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  await publicHmacUpdate(HuksOptions);

  if (thirdInderfaceName == 'finish') {
    HuksOptions.inData = new Uint8Array(stringToArray('0'));
    await finish(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data: ${data}`);
      })
      .catch((err) => {
        console.log('test update err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else {
    await abort(handle, HuksOptions)
      .then((data) => {
        console.log(`test abort data: ${data}`);
      })
      .catch((err) => {
        console.log('test abort err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  }
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${data}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

describe('SecurityHuksAccessControlJsunit', function () {
    it('HUKS_Basic_Capability_AccessControl_9000', 0, async function (done) {
        expect(0).assertEqual(huks.HuksErrorCode.HUKS_SUCCESS);
        expect(-1).assertEqual(huks.HuksErrorCode.HUKS_FAILURE);
        expect(-2).assertEqual(huks.HuksErrorCode.HUKS_ERROR_BAD_STATE);
        expect(-3).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_ARGUMENT);
        expect(-4).assertEqual(huks.HuksErrorCode.HUKS_ERROR_NOT_SUPPORTED);
        expect(-5).assertEqual(huks.HuksErrorCode.HUKS_ERROR_NO_PERMISSION);
        expect(-6).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INSUFFICIENT_DATA);
        expect(-7).assertEqual(huks.HuksErrorCode.HUKS_ERROR_BUFFER_TOO_SMALL);
        expect(-8).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INSUFFICIENT_MEMORY);
        expect(-9).assertEqual(huks.HuksErrorCode.HUKS_ERROR_COMMUNICATION_FAILURE);
        expect(-10).assertEqual(huks.HuksErrorCode.HUKS_ERROR_STORAGE_FAILURE);
        expect(-11).assertEqual(huks.HuksErrorCode.HUKS_ERROR_HARDWARE_FAILURE);
        expect(-12).assertEqual(huks.HuksErrorCode.HUKS_ERROR_ALREADY_EXISTS);
        expect(-13).assertEqual(huks.HuksErrorCode.HUKS_ERROR_NOT_EXIST);
        expect(-14).assertEqual(huks.HuksErrorCode.HUKS_ERROR_NULL_POINTER);
        expect(-15).assertEqual(huks.HuksErrorCode.HUKS_ERROR_FILE_SIZE_FAIL);
        expect(-16).assertEqual(huks.HuksErrorCode.HUKS_ERROR_READ_FILE_FAIL);
        expect(-17).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_PUBLIC_KEY);
        expect(-18).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_PRIVATE_KEY);
        expect(-19).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_KEY_INFO);
        expect(-20).assertEqual(huks.HuksErrorCode.HUKS_ERROR_HASH_NOT_EQUAL);
        expect(-21).assertEqual(huks.HuksErrorCode.HUKS_ERROR_MALLOC_FAIL);
        expect(-22).assertEqual(huks.HuksErrorCode.HUKS_ERROR_WRITE_FILE_FAIL);
        expect(-23).assertEqual(huks.HuksErrorCode.HUKS_ERROR_REMOVE_FILE_FAIL);
        expect(-24).assertEqual(huks.HuksErrorCode.HUKS_ERROR_OPEN_FILE_FAIL);
        expect(-25).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CLOSE_FILE_FAIL);
        expect(-26).assertEqual(huks.HuksErrorCode.HUKS_ERROR_MAKE_DIR_FAIL);
        expect(-27).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_KEY_FILE);
        expect(-28).assertEqual(huks.HuksErrorCode.HUKS_ERROR_IPC_MSG_FAIL);
        expect(-29).assertEqual(huks.HuksErrorCode.HUKS_ERROR_REQUEST_OVERFLOWS);
        expect(-30).assertEqual(huks.HuksErrorCode.HUKS_ERROR_PARAM_NOT_EXIST);
        expect(-31).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CRYPTO_ENGINE_ERROR);
        expect(-32).assertEqual(huks.HuksErrorCode.HUKS_ERROR_COMMUNICATION_TIMEOUT);
        expect(-33).assertEqual(huks.HuksErrorCode.HUKS_ERROR_IPC_INIT_FAIL);
        expect(-34).assertEqual(huks.HuksErrorCode.HUKS_ERROR_IPC_DLOPEN_FAIL);
        expect(-35).assertEqual(huks.HuksErrorCode.HUKS_ERROR_EFUSE_READ_FAIL);
        expect(-36).assertEqual(huks.HuksErrorCode.HUKS_ERROR_NEW_ROOT_KEY_MATERIAL_EXIST);
        expect(-37).assertEqual(huks.HuksErrorCode.HUKS_ERROR_UPDATE_ROOT_KEY_MATERIAL_FAIL);
        expect(-38).assertEqual(huks.HuksErrorCode.HUKS_ERROR_VERIFICATION_FAILED);
        expect(-100).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_ALG_FAIL);
        expect(-101).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_KEY_SIZE_FAIL);
        expect(-102).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_PADDING_FAIL);
        expect(-103).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_PURPOSE_FAIL);
        expect(-104).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_DIGEST_FAIL);
        expect(-105).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_MODE_FAIL);
        expect(-106).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_NONCE_FAIL);
        expect(-107).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_AAD_FAIL);
        expect(-108).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_IV_FAIL);
        expect(-109).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_AE_TAG_FAIL);
        expect(-110).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_SALT_FAIL);
        expect(-111).assertEqual(huks.HuksErrorCode.HUKS_ERROR_CHECK_GET_ITERATION_FAIL);
        expect(-112).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_ALGORITHM);
        expect(-113).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_KEY_SIZE);
        expect(-114).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_PADDING);
        expect(-115).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_PURPOSE);
        expect(-116).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_MODE);
        expect(-117).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_DIGEST);
        expect(-118).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_SIGNATURE_SIZE);
        expect(-119).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_IV);
        expect(-120).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_AAD);
        expect(-121).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_NONCE);
        expect(-122).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_AE_TAG);
        expect(-123).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_SALT);
        expect(-124).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_ITERATION);
        expect(-125).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_OPERATION);
        expect(-999).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INTERNAL_ERROR);
        expect(-1000).assertEqual(huks.HuksErrorCode.HUKS_ERROR_UNKNOWN_ERROR);
        expect(0).assertEqual(huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DEFAULT);
        expect(1).assertEqual(huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DERIVE);
        expect(2).assertEqual(huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_AGREE);
        expect(1).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_IMPORT_KEY);
        expect(2).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_GENERATE_KEY);
        expect(3).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_AGREE_KEY);
        expect(4).assertEqual(huks.HuksKeyFlag.HUKS_KEY_FLAG_DERIVE_KEY);
        expect(0).assertEqual(huks.HuksKeyStorageType.HUKS_STORAGE_TEMP);
        expect(1).assertEqual(huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT);
        expect(0).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_INVALID);
        expect(268435456).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_INT);
        expect(536870912).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_UINT);
        expect(805306368).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_ULONG);
        expect(1073741824).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BOOL);
        expect(1342177280).assertEqual(huks.HuksTagType.HUKS_TAG_TYPE_BYTES);
        expect(0).assertEqual(huks.HuksTag.HUKS_TAG_INVALID);
        expect(536870913).assertEqual(huks.HuksTag.HUKS_TAG_ALGORITHM);
        expect(536870914).assertEqual(huks.HuksTag.HUKS_TAG_PURPOSE);
        expect(536870915).assertEqual(huks.HuksTag.HUKS_TAG_KEY_SIZE);
        expect(536870916).assertEqual(huks.HuksTag.HUKS_TAG_DIGEST);
        expect(536870917).assertEqual(huks.HuksTag.HUKS_TAG_PADDING);
        expect(536870918).assertEqual(huks.HuksTag.HUKS_TAG_BLOCK_MODE);
        expect(536870919).assertEqual(huks.HuksTag.HUKS_TAG_KEY_TYPE);
        expect(1342177288).assertEqual(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA);
        expect(1342177289).assertEqual(huks.HuksTag.HUKS_TAG_NONCE);
        expect(1342177290).assertEqual(huks.HuksTag.HUKS_TAG_IV);
        expect(1342177291).assertEqual(huks.HuksTag.HUKS_TAG_INFO);
        expect(1342177292).assertEqual(huks.HuksTag.HUKS_TAG_SALT);
        expect(1342177293).assertEqual(huks.HuksTag.HUKS_TAG_PWD);
        expect(536870926).assertEqual(huks.HuksTag.HUKS_TAG_ITERATION);
        expect(536870927).assertEqual(huks.HuksTag.HUKS_TAG_KEY_GENERATE_TYPE);
        expect(1342177296).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_MAIN_KEY);
        expect(1342177297).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_FACTOR);
        expect(536870930).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_ALG);
        expect(536870931).assertEqual(huks.HuksTag.HUKS_TAG_AGREE_ALG);
        expect(1073741844).assertEqual(huks.HuksTag.HUKS_TAG_AGREE_PUBLIC_KEY_IS_KEY_ALIAS);
        expect(1342177301).assertEqual(huks.HuksTag.HUKS_TAG_AGREE_PRIVATE_KEY_ALIAS);
        expect(1342177302).assertEqual(huks.HuksTag.HUKS_TAG_AGREE_PUBLIC_KEY);
        expect(1342177303).assertEqual(huks.HuksTag.HUKS_TAG_KEY_ALIAS);
        expect(536870936).assertEqual(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE);
        expect(805306569).assertEqual(huks.HuksTag.HUKS_TAG_ACTIVE_DATETIME);
        expect(805306570).assertEqual(huks.HuksTag.HUKS_TAG_ORIGINATION_EXPIRE_DATETIME);
        expect(805306571).assertEqual(huks.HuksTag.HUKS_TAG_USAGE_EXPIRE_DATETIME);
        expect(805306572).assertEqual(huks.HuksTag.HUKS_TAG_CREATION_DATETIME);
        expect(1073742125).assertEqual(huks.HuksTag.HUKS_TAG_ALL_USERS);
        expect(536871214).assertEqual(huks.HuksTag.HUKS_TAG_USER_ID);
        expect(1073742127).assertEqual(huks.HuksTag.HUKS_TAG_NO_AUTH_REQUIRED);
        expect(536871216).assertEqual(huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE);
        expect(536871217).assertEqual(huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT);
        expect(1342177586).assertEqual(huks.HuksTag.HUKS_TAG_AUTH_TOKEN);
        expect(1342177781).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE);
        expect(1342177782).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_APPLICATION_ID);
        expect(1342177783).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_BRAND);
        expect(1342177784).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_DEVICE);
        expect(1342177785).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_PRODUCT);
        expect(1342177786).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SERIAL);
        expect(1342177787).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_IMEI);
        expect(1342177788).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MEID);
        expect(1342177789).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MANUFACTURER);
        expect(1342177790).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_MODEL);
        expect(1342177791).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS);
        expect(1342177792).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SOCID);
        expect(1342177793).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_UDID);
        expect(1342177794).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO);
        expect(1342177795).assertEqual(huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO);
        expect(1073742825).assertEqual(huks.HuksTag.HUKS_TAG_IS_KEY_ALIAS);
        expect(536871914).assertEqual(huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG);
        expect(1073742827).assertEqual(huks.HuksTag.HUKS_TAG_IS_ALLOWED_WRAP);
        expect(536871916).assertEqual(huks.HuksTag.HUKS_TAG_KEY_WRAP_TYPE);
        expect(1342178285).assertEqual(huks.HuksTag.HUKS_TAG_KEY_AUTH_ID);
        expect(536871918).assertEqual(huks.HuksTag.HUKS_TAG_KEY_ROLE);
        expect(536871919).assertEqual(huks.HuksTag.HUKS_TAG_KEY_FLAG);
        expect(536871920).assertEqual(huks.HuksTag.HUKS_TAG_IS_ASYNCHRONIZED);
        expect(1073742833).assertEqual(huks.HuksTag.HUKS_TAG_SECURE_KEY_ALIAS);
        expect(1342178290).assertEqual(huks.HuksTag.HUKS_TAG_SECURE_KEY_UUID);
        expect(536871923).assertEqual(huks.HuksTag.HUKS_TAG_KEY_DOMAIN);
        expect(1342187281).assertEqual(huks.HuksTag.HUKS_TAG_PROCESS_NAME);
        expect(1342187282).assertEqual(huks.HuksTag.HUKS_TAG_PACKAGE_NAME);
        expect(536880915).assertEqual(huks.HuksTag.HUKS_TAG_ACCESS_TIME);
        expect(536880916).assertEqual(huks.HuksTag.HUKS_TAG_USES_TIME);
        expect(805316373).assertEqual(huks.HuksTag.HUKS_TAG_CRYPTO_CTX);
        expect(1342187286).assertEqual(huks.HuksTag.HUKS_TAG_KEY);
        expect(536880919).assertEqual(huks.HuksTag.HUKS_TAG_KEY_VERSION);
        expect(536880920).assertEqual(huks.HuksTag.HUKS_TAG_PAYLOAD_LEN);
        expect(1342187289).assertEqual(huks.HuksTag.HUKS_TAG_AE_TAG);
        expect(805316378).assertEqual(huks.HuksTag.HUKS_TAG_IS_KEY_HANDLE);
        expect(536881013).assertEqual(huks.HuksTag.HUKS_TAG_OS_VERSION);
        expect(536881014).assertEqual(huks.HuksTag.HUKS_TAG_OS_PATCHLEVEL);
        expect(1342197281).assertEqual(huks.HuksTag.HUKS_TAG_SYMMETRIC_KEY_DATA);
        expect(1342197282).assertEqual(huks.HuksTag.HUKS_TAG_ASYMMETRIC_PUBLIC_KEY_DATA);
        expect(1342197283).assertEqual(huks.HuksTag.HUKS_TAG_ASYMMETRIC_PRIVATE_KEY_DATA);
        done();
    });
});








