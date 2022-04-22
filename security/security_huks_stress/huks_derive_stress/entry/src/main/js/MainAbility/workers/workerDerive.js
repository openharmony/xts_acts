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
import * as Data from '../../../../../../../utils/data.json';
import * as params from '../../../../../../../utils/param.js';

let parentPort = worker.parentPort;

let error = 'pass';

let handle = {};
let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let HuksDeriveWorker = {
  HuksKeyAlgHKDF: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_HKDF,
  },
  HuksKeyAlgAES: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeyPurposeHKDF: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value: params.HksKeyPurpose.HKS_KEY_PURPOSE_DERIVE,
  },
  HuksTagHKDFDigestSHA256: {
    tag: params.HksTag.HKS_TAG_DIGEST,
    value: params.HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksKeyHKDFSize128: {
    tag: params.HksTag.HKS_TAG_KEY_SIZE,
    value: params.HksKeySize.HKS_AES_KEY_SIZE_128,
  },
  HuksKeyDERIVEKEYSIZE: {
    tag: params.HksTag.HKS_TAG_DERIVE_KEY_SIZE,
    value: params.HksKeySize.DERIVE_KEY_SIZE_32,
  },
  HuksKeyISKEYALIAS: { tag: params.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeySTORAGE: {
    tag: params.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: params.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyALGORITHMAES: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeySIZE256: {
    tag: params.HksTag.HKS_TAG_KEY_SIZE,
    value: params.HksKeySize.HKS_AES_KEY_SIZE_256,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value:
      params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPADDINGNONE: {
    tag: params.HksTag.HKS_TAG_PADDING,
    value: params.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyDIGESTNONE: {
    tag: params.HksTag.HKS_TAG_DIGEST,
    value: params.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyBLOCKMODEECB: {
    tag: params.HksTag.HKS_TAG_BLOCK_MODE,
    value: params.HksCipherMode.HKS_MODE_ECB,
  },
};

let HuksOptions63kb = {
  properties: new Array(
    HuksDeriveWorker.HuksKeyAlgAES,
    HuksDeriveWorker.HuksKeyPurposeHKDF,
    HuksDeriveWorker.HuksTagHKDFDigestSHA256,
    HuksDeriveWorker.HuksKeyHKDFSize128
  ),
  inData: srcData63Kb,
};

function stringToUint8Array(str) {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  var tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

async function publicDeriveGenFunc(srcKeyAlies, HuksOptions) {
  await huks
    .generateKey(srcKeyAlies, HuksOptions)
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

async function publicDeriveInitFunc(srcKeyAlies, HuksOptions) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data ${JSON.stringify(data)}`);
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

async function publicDeriveUpdateFunc(HuksOptions) {
  await huks
    .update(handle, HuksOptions)
    .then((data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test update err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicDeriveFinishAbortFunc(
  huksOptionsFinish,
  thirdInderfaceName
) {
  if (thirdInderfaceName == 'finish') {
    await huks
      .finish(handle, huksOptionsFinish)
      .then((data) => {
        console.log(`test finish data ${JSON.stringify(data)}`);
        if (data.errorCode !== 0) {
          error = 'fail';
        }
      })
      .catch((err) => {
        console.log('test finish err information: ' + JSON.stringify(err));
        error = 'fail';
      });
  } else {
    let huksOptionsAbort = new Array({
      tag: params.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: params.HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    await huks
      .abort(handle, huksOptionsAbort)
      .then((data) => {
        console.log(`test abort data ${JSON.stringify(data)}`);
        if (data.errorCode !== 0) {
          error = 'fail';
        }
      })
      .catch((err) => {
        console.log('test abort err information: ' + JSON.stringify(err));
        error = 'fail';
      });
  }
}

async function publicDeriveDeleteFunc(srcKeyAlies, HuksOptions) {
  await huks
    .deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data ${JSON.stringify(data)}`);
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicDeriveFunc(
  srcKeyAlies,
  HuksOptions,
  huksOptionsFinish,
  thirdInderfaceName
) {
  try {
    await publicDeriveGenFunc(srcKeyAlies, HuksOptions);
    HuksOptions.properties.splice(0, 1, HuksDeriveWorker.HuksKeyAlgHKDF);
    HuksOptions.properties.splice(3, 1, HuksDeriveWorker.HuksKeyDERIVEKEYSIZE);

    await publicDeriveInitFunc(srcKeyAlies, HuksOptions);
    await publicDeriveUpdateFunc(HuksOptions);
    await publicDeriveFinishAbortFunc(huksOptionsFinish, thirdInderfaceName);

    HuksOptions.properties.splice(0, 1, HuksDeriveWorker.HuksKeyAlgAES);
    HuksOptions.properties.splice(3, 1, HuksDeriveWorker.HuksKeyHKDFSize128);
    await publicDeriveDeleteFunc(srcKeyAlies, HuksOptions);
  } catch (e) {
    error = 'fail';
  }
}

parentPort.onmessage = async function (e) {
  error = 'pass';
  console.log('test onMessage before e ' + JSON.stringify(e));
  let srcKeyAliesFirst = e.data + '_01';
  let huksOptionsFinish = {
    properties: new Array(
      HuksDeriveWorker.HuksKeySTORAGE,
      HuksDeriveWorker.HuksKeyISKEYALIAS,
      HuksDeriveWorker.HuksKeyALGORITHMAES,
      HuksDeriveWorker.HuksKeySIZE256,
      HuksDeriveWorker.HuksKeyPurposeENCRYPTDECRYPT,
      HuksDeriveWorker.HuksKeyDIGESTNONE,
      {
        tag: params.HksTag.HKS_TAG_KEY_ALIAS,
        value: stringToUint8Array(srcKeyAliesFirst),
      },
      HuksDeriveWorker.HuksKeyPADDINGNONE,
      HuksDeriveWorker.HuksKeyBLOCKMODEECB
    ),
    inData: srcData63Kb,
  };
  await publicDeriveFunc(
    srcKeyAliesFirst,
    HuksOptions63kb,
    huksOptionsFinish,
    'finish'
  );
  parentPort.postMessage(error);
};
