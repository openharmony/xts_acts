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

export var alias = 'alias';
export var aliasA = 'aliasA';
export var aliasB = 'aliasB';
export var targetAlias = 'targetAlias';

export var useLib = 'openssl'; /** openssl or mbedtls */

export var successStr = 'SUCCESS';
export var failStr = 'FAIL';

export var loop = 200;
export var timer = 1000;

export var emptyOption = makeEmptyOption();
export var inDataOption = makeInDataOption();

export function makeGenerateKeyOption(alg, size, purpose, padding, mode, digest) {
  var properties = new Array();
  properties[0] = makeAlgTagProperty(alg);
  properties[1] = makeSizeProperty(size);
  properties[2] = makePurposeProperty(purpose);
  if (purpose == (hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT)) {
    properties[3] = makePaddingProperty(padding);
    properties[4] = makeModeProperty(mode);
    if (alg == hks.HksKeyAlg.HKS_ALG_RSA) {
      properties[5] = makeDigestProperty(digest);
      properties[6] = makeKeyGenerateType();
    }
  } else if (purpose == (hks.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN | hks.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY)) {
    properties[3] = makePaddingProperty(padding);
    properties[4] = makeDigestProperty(digest);
  } else if (purpose == hks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC) {
    properties[3] = makeDigestProperty(digest);
    properties[4] = makeKeyType();
  } else {
    properties[3] = makeDigestProperty(digest);
  }
  var option = {
    properties: properties
  };
  return option;
};

export function makeEncryptAndDecryptOption(alg, purpose, padding, mode, size, digest, text) {
  var properties = new Array();
  properties[0] = makeAlgTagProperty(alg);
  properties[1] = makePurposeProperty(purpose);
  properties[2] = makePaddingProperty(padding);
  properties[3] = makeModeProperty(mode);
  if (alg == hks.HksKeyAlg.HKS_ALG_AES) {
    properties[4] = makeIV();
    if (mode == hks.HksCipherMode.HKS_MODE_GCM) {
      properties[5] = makeAAD();
      properties[6] = makeNonce();
    }
  } else {
    properties[4] = makeIsKeyAlias();
    properties[5] = makeSizeProperty(size);
    properties[6] = makeDigestProperty(digest);
  } 
  var option = {
    properties: properties,
    inData: text
  };
  return option;
};

export function makeSignAndVerifyOption(alg, size, purpose, padding, digest, text) {
  var properties = new Array();
  properties[0] = makeAlgTagProperty(alg);
  properties[1] = makeSizeProperty(size);
  properties[2] = makePurposeProperty(purpose);
  properties[3] = makePaddingProperty(padding);
  properties[4] = makeDigestProperty(digest);
  var option = {
    properties: properties,
    inData: text
  };
  return option;
};

export function makeRandomArr(size) {
  var arr = new Uint8Array(size);
  for (var i = 0; i < size; i++) {
    arr[i] = Math.floor(Math.random() * 10);
  }
  return arr;
};

export function makePlainTextSize(size,padding,digest){
  var plainTextSize = 0;
  if (padding == hks.HksKeyPadding.HKS_PADDING_OAEP) {
    if (digest == hks.HksKeyDigest.HKS_DIGEST_SHA224 && size == hks.HksKeySize.HKS_RSA_KEY_SIZE_512) {
      plainTextSize = 4;
    } else {
      plainTextSize = 16;
    }
  } else if (padding == hks.HksKeyPadding.HKS_PADDING_PKCS1_V1_5) {
    plainTextSize = 8;
  } else {
    switch (size) {
      case hks.HksKeySize.HKS_RSA_KEY_SIZE_512:
        plainTextSize = 64;
        break;
      case hks.HksKeySize.HKS_RSA_KEY_SIZE_768:
        plainTextSize = 96;
        break;
      case hks.HksKeySize.HKS_RSA_KEY_SIZE_1024:
        plainTextSize = 128;
        break;
      case hks.HksKeySize.HKS_RSA_KEY_SIZE_2048:
        plainTextSize = 256;
        break;
      case hks.HksKeySize.HKS_RSA_KEY_SIZE_3072:
        plainTextSize = 384;
        break;
      case hks.HksKeySize.HKS_RSA_KEY_SIZE_4096:
        plainTextSize = 512;
        break;
      default:
        plainTextSize = 512;
    }
  }
  return plainTextSize;
};

export function makeImportOption(alg, size, purpose, padding, mode, digest, publicKey) {
  var properties = new Array();
  properties[0] = makeAlgTagProperty(alg);
  properties[1] = makeSizeProperty(size);
  properties[2] = makePurposeProperty(purpose);
  properties[3] = makePaddingProperty(padding);
  if (alg == hks.HksKeyAlg.HKS_ALG_RSA || alg == hks.HksKeyAlg.HKS_ALG_DSA || alg == hks.HksKeyAlg.HKS_ALG_ECC) {
    if (purpose == (hks.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT | hks.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT)) {
      properties[4] = makeModeProperty(mode);
      properties[5] = makeDigestProperty(digest);
      properties[6] = makeKeyGenerateType();
    } else {
      properties[4] = makeDigestProperty(digest);
    }
  }
  var options = {
    properties: properties,
    inData: publicKey
  };
  return options;
};


function makeAlgTagProperty(alg) {
  var property = {
    tag: hks.HksTag.HKS_TAG_ALGORITHM,
    value: alg
  }
  return property;
};

function makeSizeProperty(size) {
  var property = {
    tag: hks.HksTag.HKS_TAG_KEY_SIZE,
    value: size
  };
  return property;
};

function makePurposeProperty(purpose) {
  var property = {
    tag: hks.HksTag.HKS_TAG_PURPOSE,
    value: purpose
  };
  return property;
};

function makePaddingProperty(padding) {
  var property = {
    tag: hks.HksTag.HKS_TAG_PADDING,
    value: padding
  };
  return property;
};

function makeModeProperty(mode) {
  var property = {
    tag: hks.HksTag.HKS_TAG_BLOCK_MODE,
    value: mode
  };
  return property;
};

function makeDigestProperty(digest) {
  var property = {
    tag: hks.HksTag.HKS_TAG_DIGEST,
    value: digest
  };
  return property;
};

function makeKeyGenerateType() {
  var property = {
    tag: hks.HksTag.HKS_TAG_KEY_GENERATE_TYPE,
    value: hks.HksKeyGenerateType.HKS_KEY_GENERATE_TYPE_DEFAULT
  };
  return property;
};

function makeKeyType() {
  var property = {
    tag: hks.HksTag.HKS_TAG_KEY_TYPE,
    value: hks.HksKeyType.HKS_KEY_TYPE_HMAC
  };
  return property;
};

function makeIV() {
  var property = {
    tag: hks.HksTag.HKS_TAG_IV,
    value: new Uint8Array(16)
  };
  return property;
};

function makeAAD() {
  var property = {
    tag: hks.HksTag.HKS_TAG_ASSOCIATED_DATA,
    value: new Uint8Array(16)
  };
  return property;
};

function makeNonce() {
  var property = {
    tag: hks.HksTag.HKS_TAG_NONCE,
    value: new Uint8Array(16)
  };
  return property;
};

function makeIsKeyAlias() {
  var property = {
    tag: hks.HksTag.HKS_TAG_IS_KEY_ALIAS,
    value: true
  };
  return property;
};

function makeEmptyOption() {
  var emptyOption = {
    properties: []
  };
  return emptyOption;
};

function makeInDataOption() {
  var option = {
    properties: [],
    inData: new Uint8Array(16)
  };
  return option;
};

export function makeMacOption(plaintText) {
  var properties = new Array();
  properties[0] = {
    tag: hks.HksTag.HKS_TAG_ALGORITHM,
    value: hks.HksKeyAlg.HKS_ALG_HMAC
  };
  properties[1] = {
    tag: hks.HksTag.HKS_TAG_PURPOSE,
    value: hks.HksKeyPurpose.HKS_KEY_PURPOSE_MAC
  };
  properties[2] = {
    tag: hks.HksTag.HKS_TAG_DIGEST,
    value: hks.HksKeyDigest.HKS_DIGEST_SHA1
  };
  var options = {
    properties: properties,
    inData: plaintText
  };
  return options;
};

export function makeAgreeOptions(publicKey) {
  var properties = new Array();
  properties[0] = {
    tag: hks.HksTag.HKS_TAG_ALGORITHM,
    value: hks.HksKeyAlg.HKS_ALG_ECDH
  };
  properties[1] = {
    tag: hks.HksTag.HKS_TAG_KEY_SIZE,
    value: hks.HksKeySize.HKS_ECC_KEY_SIZE_224
  };
  var options = {
    properties: properties,
    inData: publicKey
  };
  return options;
};