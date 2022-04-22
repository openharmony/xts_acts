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
import * as Data from '../../../../../../../utils/data.json';
import worker from '@ohos.worker';
import * as params from '../../../../../../../utils/param.js';

let parentPort = worker.parentPort;
let error = 'pass';

let exportKeyFrist;
let exportKeySecond;
let handle = {};
let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let HuksAgreeWorker = {
  HuksKeySTORAGE: {
    tag: params.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: params.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyISKEYALIAS: { tag: params.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeyDIGESTNONE: {
    tag: params.HksTag.HKS_TAG_DIGEST,
    value: params.HksKeyDigest.HKS_DIGEST_NONE,
  },

  HuksKeyPADDINGNONE: {
    tag: params.HksTag.HKS_TAG_PADDING,
    value: params.HksKeyPadding.HKS_PADDING_NONE,
  },

  HuksKeyBLOCKMODEECB: {
    tag: params.HksTag.HKS_TAG_BLOCK_MODE,
    value: params.HksCipherMode.HKS_MODE_ECB,
  },

  HuksKeyALGORITHMAES: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_AES,
  },

  HuksKeySIZE256: {
    tag: params.HksTag.HKS_TAG_KEY_SIZE,
    value: params.HksKeySize.HKS_DH_KEY_SIZE_256,
  },

  HuksKeyAlgDH: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_DH,
  },

  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value:
      params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeDH: {
    tag: params.HksTag.HKS_TAG_PURPOSE,
    value: params.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
  },
  HuksKeyDHSize2048: {
    tag: params.HksTag.HKS_TAG_KEY_SIZE,
    value: params.HksKeySize.HKS_DH_KEY_SIZE_2048,
  },
};

let HuksOptions63kb = {
  properties: new Array(
    HuksAgreeWorker.HuksKeyAlgDH,
    HuksAgreeWorker.HuksKeyPurposeDH,
    HuksAgreeWorker.HuksKeyDHSize2048
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
async function publicAgreeGenFunc(srcKeyAlies, HuksOptions) {
  await huks
    .generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicAgreeExport1Func(srcKeyAlies, HuksOptions, exportKey) {
  await huks
    .exportKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      if (data.errorCode !== 0) {
        error = 'fail';
      }
      if (exportKey == 1) {
        exportKeyFrist = data.outData;
      } else {
        exportKeySecond = data.outData;
      }
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicAgreeInitFunc(srcKeyAlies, HuksOptions) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
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

async function publicAgreeUpdateFunc(HuksOptions, exportKey) {
  let tempInData = HuksOptions.inData;
  if (exportKey == 1) {
    HuksOptions.inData = exportKeySecond;
  } else {
    HuksOptions.inData = exportKeyFrist;
  }
  await huks
    .update(handle, HuksOptions)
    .then((data) => {
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test update err information: ' + JSON.stringify(err));
      error = 'fail';
    });
  HuksOptions.inData = tempInData;
}

async function publicAgreeFinishAbortFunc(
  huksOptionsFinish,
  thirdInderfaceName
) {
  if (thirdInderfaceName == 'finish') {
    await huks
      .finish(handle, huksOptionsFinish)
      .then((data) => {
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

async function publicAgreeDeleteFunc(srcKeyAlies, HuksOptions) {
  await huks
    .deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicAgreeFunc(
  srcKeyAliesFirst,
  srcKeyAliesSecond,
  HuksOptions,
  huksOptionsFinish,
  thirdInderfaceName
) {
  try {
    await publicAgreeGenFunc(srcKeyAliesFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliesSecond, HuksOptions);
    await publicAgreeExport1Func(srcKeyAliesFirst, HuksOptions, 1);
    await publicAgreeExport1Func(srcKeyAliesSecond, HuksOptions, 2);

    await publicAgreeInitFunc(srcKeyAliesFirst, HuksOptions);
    await publicAgreeUpdateFunc(HuksOptions, 1);
    await publicAgreeFinishAbortFunc(huksOptionsFinish, thirdInderfaceName);

    let tempHuksOptionsFinish = huksOptionsFinish;
    let huksOptionsFinishSecond = tempHuksOptionsFinish;
    huksOptionsFinishSecond.properties.splice(6, 1, {
      tag: params.HksTag.HKS_TAG_KEY_ALIAS,
      value: stringToUint8Array(srcKeyAliesSecond + 'final'),
    });

    await publicAgreeInitFunc(srcKeyAliesSecond, HuksOptions);
    await publicAgreeUpdateFunc(HuksOptions, 2);
    await publicAgreeFinishAbortFunc(
      huksOptionsFinishSecond,
      thirdInderfaceName
    );

    await publicAgreeDeleteFunc(srcKeyAliesFirst, HuksOptions);
    await publicAgreeDeleteFunc(srcKeyAliesSecond + 'final', HuksOptions);
    await publicAgreeDeleteFunc(srcKeyAliesSecond, HuksOptions);
  } catch (e) {
    error = 'fail';
  }
}

parentPort.onmessage = async function (e) {
  error = 'pass';
  console.log('test onMessage before e ' + JSON.stringify(e));
  let srcKeyAliesFirst = e.data + '_01';
  let srcKeyAliesSecond = e.data + '_02';
  let huksOptionsFinish = {
    properties: new Array(
      HuksAgreeWorker.HuksKeySTORAGE,
      HuksAgreeWorker.HuksKeyISKEYALIAS,
      HuksAgreeWorker.HuksKeyALGORITHMAES,
      HuksAgreeWorker.HuksKeySIZE256,
      HuksAgreeWorker.HuksKeyPurposeENCRYPTDECRYPT,
      HuksAgreeWorker.HuksKeyDIGESTNONE,
      {
        tag: params.HksTag.HKS_TAG_KEY_ALIAS,
        value: stringToUint8Array(srcKeyAliesFirst),
      },
      HuksAgreeWorker.HuksKeyPADDINGNONE,
      HuksAgreeWorker.HuksKeyBLOCKMODEECB
    ),
    inData: srcData63Kb,
  };
  await publicAgreeFunc(
    srcKeyAliesFirst,
    srcKeyAliesSecond,
    HuksOptions63kb,
    huksOptionsFinish,
    'finish'
  );
  parentPort.postMessage(error);
};
