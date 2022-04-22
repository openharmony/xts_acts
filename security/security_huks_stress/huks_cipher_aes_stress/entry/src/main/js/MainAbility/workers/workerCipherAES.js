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

import huks from '@ohos.security.huks';
import worker from '@ohos.worker';

var parentPort = worker.parentPort;
import * as params from '../../../../../../../utils/param.js';

let IV = '0000000000000000';

let error = 'pass';

let HuksCipherWorker = {
  HuksKeyAlgAES: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurpose: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value:
      params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeENCRYPT: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value: params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT,
  },
  HuksKeyPurposeDECRYPT: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value: params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyAESSize128: {
    tag: params.HksTag.HKS_TAG_KEY_SIZE,
    value: params.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyAESPADDINGNONE: {
    tag: params.HksTag.HKS_TAG_PADDING,
    value: params.HksKeyPadding.HKS_PADDING_NONE,
  },

  HuksKeyAESBLOCKMODE: {
    tag: params.HksTag.HKS_TAG_BLOCK_MODE,
    value: params.HksCipherMode.HKS_MODE_CBC,
  },

  HuksKeyAESDIGESTNONE: {
    tag: params.HksTag.HKS_TAG_DIGEST,
    value: params.HksKeyDigest.HKS_DIGEST_NONE,
  },
};
let defaultData = '0';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);

function stringToUint8Array(str) {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  var tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

function uint8ArrayToString(fileData) {
  var dataString = '';
  for (var i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

let updateResult = new Array();
let encryptedData;
var handle = {};

let genHuksOptions = {
  properties: new Array(
    HuksCipherWorker.HuksKeyAlgAES,
    HuksCipherWorker.HuksKeyPurpose
  ),
  inData: new Uint8Array(defaultData),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await huks
    .generateKey(srcKeyAlies, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle = {
        handle1: data.handle1,
        handle2: data.handle2,
      };
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  let dateSize = 64;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = new Uint8Array(new Array());
    await publicFinishAbortFunc(
      HuksOptions,
      thirdInderfaceName,
      isEncrypt,
      0,
      huksOptionsInData.length
    );
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
      );
      await update(handle, HuksOptions);
    }
    HuksOptions.inData = huksOptionsInData;
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(
          dateSize * count,
          uint8ArrayToString(inDataArray).length
        )
      );
    } else {
      HuksOptions.inData = new Uint8Array(new Array());
    }
    await publicFinishAbortFunc(
      HuksOptions,
      thirdInderfaceName,
      isEncrypt,
      remainder,
      huksOptionsInData.length
    );
  }
}

async function update(handle, HuksOptions) {
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      if (updateResult.length !== 0) {
        updateResult = updateResult.concat(Array.from(data.outData));
      } else {
        updateResult = Array.from(data.outData);
      }
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      error = 'fail';
    });
}

async function publicFinishAbortFunc(
  HuksOptions,
  thirdInderfaceName,
  isEncrypt,
  remainder
) {
  if (thirdInderfaceName == 'finish') {
    HuksOptions.outData = new Uint8Array(new Array(encryptedData.length * 2));
    await finish(HuksOptions, isEncrypt);
  } else if (thirdInderfaceName == 'abort') {
    HuksOptions.outData = new Uint8Array(new Array(encryptedData.length * 2));
    await abort(HuksOptions);
  }
}

async function finish(HuksOptions, isEncrypt) {
  await huks
    .finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      let finishData;
      if (encryptedData.length > 64) {
        finishData = uint8ArrayToString(
          updateResult.concat(Array.from(data.outData))
        );
        updateResult = updateResult.concat(Array.from(data.outData));
      } else {
        finishData = uint8ArrayToString(updateResult);
      }
      if (isEncrypt) {
        if (finishData === uint8ArrayToString(encryptedData)) {
          error = 'fail';
        } else {
          console.log(`test finish Encrypt success ${finishData}`);
          if (data.errorCode !== 0) {
            error = 'fail';
          }
        }
      }
      if (!isEncrypt) {
        if (finishData === uint8ArrayToString(encryptedData)) {
          if (data.errorCode !== 0) {
            error = 'fail';
          }
        } else {
          error = 'fail';
        }
      }
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function abort(HuksOptions) {
  await huks
    .abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONECBC)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicCipherFunc(
  srcKeyAlies,
  genHuksOptionsNONECBC,
  HuksOptions,
  thirdInderfaceName,
  isEncrypt
) {
  try {
    updateResult = new Array();
    if (isEncrypt) {
      await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC);
      encryptedData = HuksOptions.inData;
    }
    await publicInitFunc(srcKeyAlies, HuksOptions);
    await publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
      await publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC);
    }
  } catch (e) {
    error = 'fail';
  }
}

parentPort.onmessage = async function (e) {
  error = 'pass';
  console.log('test onMessage before e ' + JSON.stringify(e));
  let srcKeyAlies = e.data + '_01';
  genHuksOptions.properties.splice(2, 1, HuksCipherWorker.HuksKeyAESSize128);
  genHuksOptions.properties.splice(3, 1, HuksCipherWorker.HuksKeyAESBLOCKMODE);
  genHuksOptions.properties.splice(
    4,
    1,
    HuksCipherWorker.HuksKeyAESPADDINGNONE
  );
  let HuksOptions = {
    properties: new Array(
      HuksCipherWorker.HuksKeyAlgAES,
      HuksCipherWorker.HuksKeyPurposeENCRYPT,
      HuksCipherWorker.HuksKeyAESSize128,
      HuksCipherWorker.HuksKeyAESPADDINGNONE,
      HuksCipherWorker.HuksKeyAESBLOCKMODE,
      HuksCipherWorker.HuksKeyAESDIGESTNONE,
      { tag: params.HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
    ),
    inData: srcData63Kb,
    outData: stringToUint8Array('0'),
  };
  await publicCipherFunc(
    srcKeyAlies,
    genHuksOptions,
    HuksOptions,
    'finish',
    true
  );
  HuksOptions = {
    properties: new Array(
      HuksCipherWorker.HuksKeyAlgAES,
      HuksCipherWorker.HuksKeyPurposeDECRYPT,
      HuksCipherWorker.HuksKeyAESSize128,
      HuksCipherWorker.HuksKeyAESPADDINGNONE,
      HuksCipherWorker.HuksKeyAESBLOCKMODE,
      HuksCipherWorker.HuksKeyAESDIGESTNONE,
      { tag: params.HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
    ),
    inData: new Uint8Array(updateResult),
    outData: stringToUint8Array('0'),
  };
  await publicCipherFunc(
    srcKeyAlies,
    genHuksOptions,
    HuksOptions,
    'finish',
    false
  );
  parentPort.postMessage(error);
};
