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
import * as params from '../../../../../../../utils/param.js';

var parentPort = worker.parentPort;

var error = 'pass';

let gInData64 =
  'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let HuksCipherWorker = {
  HuksKeyAlgRSA: {
    tag: params.HksTag.HKS_TAG_ALGORITHM,
    value: params.HksKeyAlg.HKS_ALG_RSA,
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
  HuksKeyRSASize512: {
    tag: params.HksTag.HKS_TAG_KEY_SIZE,
    value: params.HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksKeyRSAPADDINGNONE: {
    tag: params.HksTag.HKS_TAG_PADDING,
    value: params.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyRSABLOCKMODEECB: {
    tag: params.HksTag.HKS_TAG_BLOCK_MODE,
    value: params.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyRSADIGESTSHA256: {
    tag: params.HksTag.HKS_TAG_DIGEST,
    value: params.HksKeyDigest.HKS_DIGEST_SHA256,
  },
};
let defaultData = '0';

let gInData64Array = stringToUint8Array(gInData64);

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

let encryptedData;
let inputInData;
var handle = {};
let updateResult = new Array();
let exportKey;

let genHuksOptions = {
  properties: new Array(
    HuksCipherWorker.HuksKeyAlgRSA,
    HuksCipherWorker.HuksKeyPurpose,
    HuksCipherWorker.HuksKeyRSASize512
  ),
  inData: new Uint8Array(defaultData),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .generateKey(srcKeyAlies, genHuksOptionsNONC)
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

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .exportKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test ExportKey data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      error = 'fail';
    });
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.inData = exportKey;
  await huks
    .importKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test ImportKey data: ${JSON.stringify(data)}`);
      if (data.errorCode !== 0) {
        error = 'fail';
      }
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
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

async function publicUpdateFunc(HuksOptions) {
  let dateSize = 64;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = stringToUint8Array('0');
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
      );
      await update(handle, HuksOptions);
      HuksOptions.inData = huksOptionsInData;
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(
          dateSize * count,
          uint8ArrayToString(inDataArray).length
        )
      );
      await update(handle, HuksOptions);
    }
  }
}

async function update(handle, HuksOptions) {
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
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
  isEncrypt
) {
  if (thirdInderfaceName == 'finish') {
    HuksOptions.outData = new Uint8Array(new Array(1024));
    HuksOptions.inData = new Uint8Array(new Array());
    await finish(HuksOptions, isEncrypt);
  } else if (thirdInderfaceName == 'abort') {
    await abort(HuksOptions);
  }
}

async function finish(HuksOptions, isEncrypt) {
  await huks
    .finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      if (isEncrypt) {
        updateResult = Array.from(data.outData);
        if (
          uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)
        ) {
          error = 'fail';
        } else {
          if (data.errorCode !== 0) {
            error = 'fail';
          }
        }
      }
      if (!isEncrypt) {
        if (
          uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)
        ) {
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

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONC)
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
  newSrcKeyAlies,
  genHuksOptionsNONC,
  HuksOptions,
  thirdInderfaceName,
  isEncrypt
) {
  inputInData = HuksOptions.inData;
  try {
    updateResult = new Array();
    let KeyAlias = srcKeyAlies;
    if (isEncrypt) {
      await publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC);
      encryptedData = HuksOptions.inData;
      await publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC);
      await publicImportKeyFunc(newSrcKeyAlies, HuksOptions);
      KeyAlias = newSrcKeyAlies;
    }
    HuksOptions.inData = inputInData;
    await publicInitFunc(KeyAlias, HuksOptions);
    await publicUpdateFunc(HuksOptions);
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
    if (!isEncrypt || (isEncrypt && thirdInderfaceName == 'abort')) {
      await publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC);
      await publicDeleteKeyFunc(newSrcKeyAlies, genHuksOptionsNONC);
    }
  } catch (e) {
    error = 'fail';
  }
}

parentPort.onmessage = async function (e) {
  error = 'pass';
  console.log('test onMessage before e ' + JSON.stringify(e));
  let srcKeyAlies = e.data + '_01';
  const newSrcKeyAlies = e.data + 'new_01';
  genHuksOptions.properties.splice(
    3,
    1,
    HuksCipherWorker.HuksKeyRSABLOCKMODEECB
  );
  genHuksOptions.properties.splice(
    4,
    1,
    HuksCipherWorker.HuksKeyRSAPADDINGNONE
  );
  genHuksOptions.properties.splice(
    5,
    1,
    HuksCipherWorker.HuksKeyRSADIGESTSHA256
  );

  let HuksOptions = {
    properties: new Array(
      HuksCipherWorker.HuksKeyAlgRSA,
      HuksCipherWorker.HuksKeyPurposeENCRYPT,
      HuksCipherWorker.HuksKeyRSASize512,
      HuksCipherWorker.HuksKeyRSAPADDINGNONE,
      HuksCipherWorker.HuksKeyRSABLOCKMODEECB,
      HuksCipherWorker.HuksKeyRSADIGESTSHA256
    ),
    inData: gInData64Array,
    outData: stringToUint8Array('0'),
  };
  await publicCipherFunc(
    srcKeyAlies,
    newSrcKeyAlies,
    genHuksOptions,
    HuksOptions,
    'finish',
    true
  );
  HuksOptions = {
    properties: new Array(
      HuksCipherWorker.HuksKeyAlgRSA,
      HuksCipherWorker.HuksKeyPurposeDECRYPT,
      HuksCipherWorker.HuksKeyRSASize512,
      HuksCipherWorker.HuksKeyRSAPADDINGNONE,
      HuksCipherWorker.HuksKeyRSABLOCKMODEECB,
      HuksCipherWorker.HuksKeyRSADIGESTSHA256
    ),
    inData: new Uint8Array(updateResult),
    outData: stringToUint8Array('0'),
  };
  await publicCipherFunc(
    srcKeyAlies,
    newSrcKeyAlies,
    genHuksOptions,
    HuksOptions,
    'finish',
    false
  );
  parentPort.postMessage(error);
};
