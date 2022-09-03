/*software
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import huks from "@ohos.security.huks";
import systemTime from "@ohos.systemTime";
import { describe, it, expect } from "@ohos/hypium";

let hks_default_auth_token_key = "huks_default_user_auth_token_key";
const authTokenSize = 116;
let authToken = new Uint8Array(authTokenSize);
let authTokenData = new Uint8Array(authTokenSize - 32);
let aes256Key = new Uint8Array([
  0x00, 0x00, 0x00, 0x00, 0x9c, 0xf6, 0x7a, 0x8d, 0xce, 0xc2, 0x7f, 0xa7, 0xd9,
  0xfd, 0xf1, 0xad, 0xac, 0xf0, 0xb3, 0x8c, 0xe8, 0x16, 0xa2, 0x65, 0xcc, 0x18,
  0x55, 0x60, 0xcd, 0x2f, 0xf5, 0xe5,
]);

let securityLevel = stringToUint8Array("sec_level");
let challenge = stringToUint8Array("challenge_data");
let versionInfo = stringToUint8Array("version_info");
let keyAliasString = "key attest";

function stringToArray(str) {
  let arr = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

function stringToUint8Array(str) {
  let arr = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  let tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

function makeEmptyOption() {
  let emptyOption = {
    properties: [],
  };
  return emptyOption;
}

function uintXToBytes(value, Xbit, buffer, index) {
  let bytes = Xbit / 8;

  for (let i = 1; i <= bytes; i++) {
    buffer[index++] = (value >> ((i - 1) * 8)) & 0xff;
  }
}

function copyBytes(bytesBuffer, byteLen, buffer, index) {
  for (let i = 0; i < byteLen; i++) {
    buffer[index++] = bytesBuffer[i];
  }
}

function copyByteTo(bytesBuffer, pos, start, end) {
  for (let i = start; i <= end; i++) {
    pos[i] = bytesBuffer[i];
  }
}

function makeAESKeyOptions() {
  let properties = new Array();
  properties[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  properties[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  properties[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT,
  };
  properties[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  properties[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  properties[5] = {
    tag: huks.HuksTag.HUKS_TAG_IV,
    value: new Uint8Array(16),
  };
  let options = {
    properties: properties,
  };
  return options;
}

function makeAESKeyOptionsWithAuthToken(authToken) {
  let properties = new Array();
  properties[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  properties[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  properties[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT,
  };
  properties[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  properties[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  properties[5] = {
    tag: huks.HuksTag.HUKS_TAG_AUTH_TOKEN,
    value: authToken,
  };
  let options = {
    properties: properties,
  };
  return options;
}

async function generateAuthToken(
  importAliasHmac,
  importHmacOption,
  challenge,
  secureUid,
  authType,
  enrollId,
  time
) {
  uintXToBytes(0, 32, authTokenData, 0); // version
  uintXToBytes(secureUid, 32, authTokenData, 36);
  uintXToBytes(0, 32, authTokenData, 40);
  uintXToBytes(enrollId, 32, authTokenData, 44);
  uintXToBytes(0, 32, authTokenData, 48);
  uintXToBytes(0, 64, authTokenData, 52);
  uintXToBytes(time, 32, authTokenData, 60);
  uintXToBytes(0, 32, authTokenData, 64);
  uintXToBytes(0, 32, authTokenData, 68);
  uintXToBytes(authType, 32, authTokenData, 72);
  uintXToBytes(0, 32, authTokenData, 76);
  uintXToBytes(0, 32, authTokenData, 80);
  // 导入Hmac key
  await huks
    .importKey(importAliasHmac, importHmacOption)
    .then(async (data) => {
      console.error(`generateAuthToken importKey data ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.error(
        `generateAuthToken importKey err: " + ${JSON.stringify(err)}`
      );
    });

  // 使用三段式对Authtoken进行HMAC
  let handle;
  // HksInit初始化key
  let initHmacOption = makeHmacKeyOption(false, null);
  await huks
    .init(importAliasHmac, initHmacOption)
    .then(async (data) => {
      handle = data.handle;
    })
    .catch((err) => {
      console.error(
        `generateAuthToken test init err: " + ${JSON.stringify(err)}`
      );
    });
  copyBytes(challenge, 32, authTokenData, 4);

  // finish完成签名
  let finishHmacOption = makeHmacKeyOption(true, authTokenData);
  await huks
    .finish(handle, finishHmacOption)
    .then((data) => {
      console.error(
        `generateAuthToken test finish data ${JSON.stringify(data)}`
      );
      copyBytes(data.outData, 32, authToken, 84); // copy sign to authToken
      copyBytes(authTokenData, 84, authToken, 0); // copy authToken data to authToken
    })
    .catch((err) => {
      console.error("generateAuthToken test finish err information: " + err);
    });
}

function makeHmacKeyOption(isImportKey, inKey) {
  let properties = new Array();
  properties[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_HMAC,
  };
  properties[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  properties[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC,
  };
  properties[3] = {
    tag: huks.HuksTag.HUKS_TAG_DIGEST,
    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256,
  };

  if (isImportKey) {
    let optionsWithIndata = {
      properties: properties,
      inData: inKey,
    };
    return optionsWithIndata;
  } else {
    let optionsWithoutIndata = {
      properties: properties,
    };
    return optionsWithoutIndata;
  }
}

async function generateAndInit(mode, alies, aes256) {
  console.error(`${alies} sudato!`);
  if (mode == "generate") {
    await huks
      .generateKey(alies, aes256)
      .then(async (data) => {
        console.error(`generateKey success ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.error(`generateKey err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
      });
  }
  if (mode == "import") {
    await huks
      .importKey(alies, aes256)
      .then(async (data) => {
        console.error(`generateKey success ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.error(`generateKey err: " + ${JSON.stringify(err)}`);
        expect(null).assertFail();
      });
  }

  await huks
    .getKeyProperties(alies, makeEmptyOption())
    .then(async (data) => {
      console.error(`test finish data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });

  let initAesOption = makeAESKeyOptions();
  // HksInit初始化key
  let data = await huks
    .init(alies, initAesOption)
    .then(async (data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(
          data
        )}`
      );
      return data;
    })
    .catch((err) => {
      console.error(`test init err: " + ${JSON.stringify(err)}`);
      return err;
    });
  console.error(`${alies} doing!`);
  return data;
}

async function multiIdentify(
  importAliasHmac,
  importHmacOption,
  alies,
  aes256,
  authMode
) {
  await huks
    .generateKey(alies, aes256)
    .then(async (data) => {
      console.error(`generateKey success ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error(`generateKey err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  let challengeAll = new Uint8Array(32);
  let handle1, challenge1;
  let handle2, challenge2;
  let handle3, challenge3;
  let handle4, challenge4;
  let initAesOption = makeAESKeyOptions();

  await huks
    .init(alies, initAesOption)
    .then(async (data) => {
      handle1 = data.handle;
      challenge1 = data.token;
      copyByteTo(challenge1, challengeAll, 0, 7);
      console.error(
        `HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(
          data
        )}`
      );
    })
    .catch((err) => {
      console.error(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  await huks
    .init(alies, initAesOption)
    .then(async (data) => {
      handle2 = data.handle;
      challenge2 = data.token;
      copyByteTo(challenge2, challengeAll, 8, 16);
      console.error(
        `HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(
          data
        )}`
      );
    })
    .catch((err) => {
      console.error(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  await huks
    .init(alies, initAesOption)
    .then(async (data) => {
      handle3 = data.handle;
      challenge3 = data.token;
      copyByteTo(challenge3, challengeAll, 17, 24);
      console.error(
        `HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(
          data
        )}`
      );
    })
    .catch((err) => {
      console.error(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  await huks
    .init(alies, initAesOption)
    .then(async (data) => {
      handle4 = data.handle;
      challenge4 = data.token;
      copyByteTo(challenge4, challengeAll, 25, 32);
      console.error(
        `HuksTest_AlgCompletion_AccessControl test init success ${JSON.stringify(
          data
        )}`
      );
    })
    .catch((err) => {
      console.error(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  if (authMode == "pin") {
    await generateAuthToken(
      importAliasHmac,
      importHmacOption,
      challengeAll,
      1,
      1,
      1,
      0
    );
  }
  if (authMode == "face") {
    await generateAuthToken(
      importAliasHmac,
      importHmacOption,
      challengeAll,
      1,
      2,
      3,
      0
    );
  }
  if (authMode == "finger") {
    await generateAuthToken(
      importAliasHmac,
      importHmacOption,
      challengeAll,
      1,
      4,
      2,
      0
    );
  }

  let finishOption = makeAESKeyOptionsWithAuthToken(authToken);
  await huks
    .finish(handle1, finishOption)
    .then((data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(
          data
        )}`
      );
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test finish err information: " + err);
      expect(null).assertFail();
    });
  await huks
    .finish(handle2, finishOption)
    .then((data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(
          data
        )}`
      );
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test finish err information: " + err);
      expect(null).assertFail();
    });
  await huks
    .finish(handle3, finishOption)
    .then((data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(
          data
        )}`
      );
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test finish err information: " + err);
      expect(null).assertFail();
    });
  await huks
    .finish(handle4, finishOption)
    .then((data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(
          data
        )}`
      );
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test finish err information: " + err);
      expect(null).assertFail();
    });
  let deleteKeyOption = makeEmptyOption();

  await huks
    .deleteKey(alies, deleteKeyOption)
    .then(async (data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl deleteKey success ${JSON.stringify(
          data
        )}`
      );
    })
    .catch((err) => {
      console.error(`deleteKey err: " + ${JSON.stringify(err)}`);
    });
}

async function finishStep(handle, alies, errCode) {
  let finishOption = makeAESKeyOptionsWithAuthToken(authToken);
  await huks
    .finish(handle, finishOption)
    .then((data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl test finish data ${JSON.stringify(
          data
        )}`
      );
      expect(data.errorCode == errCode).assertTrue();
    })
    .catch((err) => {
      console.error("test finish err information: " + err);
      expect(err.code == errCode).assertTrue();
    });

  let deleteKeyOption = makeEmptyOption();

  await huks
    .deleteKey(alies, deleteKeyOption)
    .then(async (data) => {
      console.error(
        `HuksTest_AlgCompletion_AccessControl deleteKey success ${JSON.stringify(
          data
        )}`
      );
    })
    .catch((err) => {
      console.error(`deleteKey err: " + ${JSON.stringify(err)}`);
    });
  console.error(`${alies} end!`);
}

function usePinNormal(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFaceNormal(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFingerNormal(inData) {
  var propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  var aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function usePinAndFaceNormal(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value:
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN |
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function usePinAndFingerNormal(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value:
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN |
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFaceAndFingerNormal(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value:
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE |
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function usePinFaceFingerNormal(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value:
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN |
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE |
      huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NORMAL,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function usePinMulti(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFaceMulti(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFingerMulti(inData) {
  var propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_CUSTOM,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_POS,
    value: 0,
  };
  var aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function usePinTime(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_PIN,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_CLEAR_PASSWORD,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
    value: 10,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFaceTime(inData) {
  let propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FACE,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
    value: 10,
  };
  let aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

function useFingerTime(inData) {
  var propertiesWithPin = new Array();
  propertiesWithPin[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_AES,
  };
  propertiesWithPin[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_AES_KEY_SIZE_256,
  };
  propertiesWithPin[2] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value:
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT |
      huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT,
  };
  propertiesWithPin[3] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_NONE,
  };
  propertiesWithPin[4] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_CBC,
  };
  propertiesWithPin[5] = {
    tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
    value: huks.HuksUserAuthType.HUKS_USER_AUTH_TYPE_FINGERPRINT,
  };
  propertiesWithPin[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
    value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
  };
  propertiesWithPin[7] = {
    tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
    value: huks.HuksChallengeType.HUKS_CHALLENGE_TYPE_NONE,
  };
  propertiesWithPin[8] = {
    tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
    value: 10,
  };
  var aes256 = {
    properties: propertiesWithPin,
    inData: inData,
  };
  return aes256;
}

async function generateKeyAttest(alias) {
  let properties = new Array();
  properties[0] = {
    tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
    value: huks.HuksKeyAlg.HUKS_ALG_RSA,
  };
  properties[1] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_STORAGE_FLAG,
    value: huks.HuksKeyStorageType.HUKS_STORAGE_PERSISTENT,
  };
  properties[2] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
    value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_2048,
  };
  properties[3] = {
    tag: huks.HuksTag.HUKS_TAG_PURPOSE,
    value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY,
  };
  properties[4] = {
    tag: huks.HuksTag.HUKS_TAG_DIGEST,
    value: huks.HuksKeyDigest.HUKS_DIGEST_SHA256,
  };
  properties[5] = {
    tag: huks.HuksTag.HUKS_TAG_PADDING,
    value: huks.HuksKeyPadding.HUKS_PADDING_PSS,
  };
  properties[6] = {
    tag: huks.HuksTag.HUKS_TAG_KEY_GENERATE_TYPE,
    value: huks.HuksKeyGenerateType.HUKS_KEY_GENERATE_TYPE_DEFAULT,
  };
  properties[7] = {
    tag: huks.HuksTag.HUKS_TAG_BLOCK_MODE,
    value: huks.HuksCipherMode.HUKS_MODE_ECB,
  };
  let options = {
    properties: properties,
  };
  await huks.generateKey(alias, options);
}

export default function SecurityHuksFaceFingerNormalJsunit() {
  describe("SecurityHuksFaceFingerNormalJsunit", function () {
    /**
     * @tc.number HUKS_Cipher_AuthToken_1300
     * @tc.name HUKS_Cipher_AuthToken_1300.
     * @tc.desc verify once and multi authorize with PIN.
     */
    it("HUKS_Cipher_AuthToken_1300", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_1300";
      let aliasHMAC = "HUKS_Cipher_AuthToken_1300_HMAC";
      let inData = new Uint8Array(new Array());
      let importHmacOption = makeHmacKeyOption(
        true,
        stringToUint8Array(hks_default_auth_token_key)
      );
      multiIdentify(
        aliasHMAC,
        importHmacOption,
        alias,
        usePinMulti(inData),
        "pin"
      );
      done();
    });

    /**
     * @tc.number HUKS_Cipher_AuthToken_1400
     * @tc.name HUKS_Cipher_AuthToken_1400.
     * @tc.desc verify once and multi authorize with finger.
     */
    it("HUKS_Cipher_AuthToken_1400", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_1400";
      let aliasHMAC = "HUKS_Cipher_AuthToken_1400_HMAC";
      let inData = new Uint8Array(new Array());
      let importHmacOption = makeHmacKeyOption(
        true,
        stringToUint8Array(hks_default_auth_token_key)
      );
      multiIdentify(
        aliasHMAC,
        importHmacOption,
        alias,
        useFingerMulti(inData),
        "finger"
      );
      done();
    });

    /**
     * @tc.number HUKS_Cipher_AuthToken_1500
     * @tc.name HUKS_Cipher_AuthToken_1500.
     * @tc.desc verify once and multi authorize with face.
     */
    it("HUKS_Cipher_AuthToken_1500", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_1500";
      let aliasHMAC = "HUKS_Cipher_AuthToken_1500_HMAC";
      let inData = new Uint8Array(new Array());
      let importHmacOption = makeHmacKeyOption(
        true,
        stringToUint8Array(hks_default_auth_token_key)
      );
      multiIdentify(
        aliasHMAC,
        importHmacOption,
        alias,
        useFaceMulti(inData),
        "face"
      );
      done();
    });

    /**
     * @tc.number HUKS_Cipher_AuthToken_2900
     * @tc.name HUKS_Cipher_AuthToken_2900.
     * @tc.desc HUKS_TAG_USER_AUTH_TYPE invalid and generate.
     */
    it("HUKS_Cipher_AuthToken_2900", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_2900";
      let inData = new Uint8Array(new Array());
      let option = usePinNormal(inData);
      let err = {
        tag: huks.HuksTag.HUKS_TAG_USER_AUTH_TYPE,
        value: -1,
      };
      option.properties.splice(5, 1, err);
      await huks
        .generateKey(alias, option)
        .then(async (data) => {
          console.error(`generateKey success ${JSON.stringify(data)}`);
          expect(data.errorCode == -3).assertTrue();
        })
        .catch((err) => {
          console.error(`generateKey err: " + ${JSON.stringify(err)}`);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number HUKS_Cipher_AuthToken_3100
     * @tc.name HUKS_Cipher_AuthToken_3100.
     * @tc.desc HUKS_TAG_CHALLENGE_TYPE invalid and generate.
     */
    it("HUKS_Cipher_AuthToken_3100", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_3100";
      let inData = new Uint8Array(new Array());
      let option = usePinNormal(inData);
      let err = {
        tag: huks.HuksTag.HUKS_TAG_CHALLENGE_TYPE,
        value: -1,
      };
      option.properties.splice(7, 1, err);
      await huks
        .generateKey(alias, option)
        .then(async (data) => {
          console.error(`generateKey success ${JSON.stringify(data)}`);
          expect(data.errorCode == -3).assertTrue();
        })
        .catch((err) => {
          console.error(`generateKey err: " + ${JSON.stringify(err)}`);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number HUKS_Cipher_AuthToken_3300
     * @tc.name HUKS_Cipher_AuthToken_3300.
     * @tc.desc HUKS_TAG_AUTH_TIMEOUT invalid and generate.
     */
    it("HUKS_Cipher_AuthToken_3300", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_3300";
      let inData = new Uint8Array(new Array());
      let option = usePinTime(inData);
      let err = {
        tag: huks.HuksTag.HUKS_TAG_AUTH_TIMEOUT,
        value: -1,
      };
      option.properties.splice(8, 1, err);
      await huks
        .generateKey(alias, option)
        .then(async (data) => {
          console.error(`generateKey success ${JSON.stringify(data)}`);
          expect(data.errorCode == -3).assertTrue();
        })
        .catch((err) => {
          console.error(`generateKey err: " + ${JSON.stringify(err)}`);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number HUKS_Cipher_AuthToken_5500
     * @tc.name HUKS_Cipher_AuthToken_5500.
     * @tc.desc use pin access type is HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL.
     */
    it("HUKS_Cipher_AuthToken_5500", 0, async function (done) {
      let alias = "HUKS_Cipher_AuthToken_5500";
      let inData = new Uint8Array(new Array());
      let option = usePinNormal(inData);
      let err = {
        tag: huks.HuksTag.HUKS_TAG_KEY_AUTH_ACCESS_TYPE,
        value: huks.HuksAuthAccessType.HUKS_AUTH_ACCESS_INVALID_NEW_BIO_ENROLL,
      };
      option.properties.splice(6, 1, err);
      await huks
        .generateKey(alias, option)
        .then(async (data) => {
          console.error(`generateKey success ${JSON.stringify(data)}`);
          expect(data.errorCode == -3).assertTrue();
        })
        .catch((err) => {
          console.error(`generateKey err: " + ${JSON.stringify(err)}`);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number HUKS_Cipher_Attestation_0300
     * @tc.name HUKS_Cipher_Attestation_0300.
     * @tc.desc attest key support.
     */
    it("HUKS_Cipher_Attestation_0300", 0, async function (done) {
      let aliasString = keyAliasString;
      let aliasUint8 = stringToUint8Array(aliasString);
      let properties = new Array();
      properties[0] = {
        tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_SEC_LEVEL_INFO,
        value: securityLevel,
      };
      properties[1] = {
        tag: huks.HuksTag.HUKS_TAG_ATTESTATION_CHALLENGE,
        value: challenge,
      };
      properties[2] = {
        tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_VERSION_INFO,
        value: versionInfo,
      };
      properties[3] = {
        tag: huks.HuksTag.HUKS_TAG_ATTESTATION_ID_ALIAS,
        value: aliasUint8,
      };
      let options = {
        properties: properties,
      };
      await generateKeyAttest(aliasString);
      await huks
        .attestKey(aliasString, options)
        .then((data) => {
          console.error(`attest key data: ${JSON.stringify(data)}`);
          expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
          console.error(`attest key data: ${JSON.stringify(err)}`);
          expect(null).assertFail();
        });
      done();
    });
  });
}
