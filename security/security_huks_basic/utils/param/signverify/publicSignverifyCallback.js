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
import { expect } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import { HksKeyAlg } from '../publicParam.js';
import { HuksSignVerifyDSA } from './publicSignverifyParam.js';
import { stringToUint8Array, uint8ArrayToString } from '../publicFunc.js';
let finishOutData;
let exportKey;
let handle;

async function publicGenerateKeyFunc(keyAlias, HuksOptions) {
  await generateKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test generateKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicImportKey(keyAlias, HuksOptions) {
  let _InData = HuksOptions.inData;
  HuksOptions.inData = finishOutData;
  console.log(`test ImportKey HuksOptions: ${JSON.stringify(HuksOptions)}`);
  await importKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test ImportKey data: ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
  HuksOptions.inData = _InData;
}

function importKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.importKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test importKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test importKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicExportKey(keyAlias, HuksOptions) {
  await exportkey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      finishOutData = data.outData;
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function exportkey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.exportKey(srcKeyAlies, HuksOptions, function (err, data) {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      if (err.code !== 0) {
        console.log('test exportKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicInitFunc(keyAlias, HuksOptions) {
  await init(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle = data.handle;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function init(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.init(srcKeyAlies, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test init err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicUpdateFunc(HuksOptions, isBigData) {
  let dateSize = 0;
  if (isBigData) {
    dateSize = 64 * 1024;
  } else {
    dateSize = 64;
  }
  let tempHuksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (uint8ArrayToString(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = tempHuksOptionsInData;
  } else {
    let count = Math.floor(uint8ArrayToString(inDataArray).length / dateSize);
    let remainder = uint8ArrayToString(inDataArray).length % dateSize;
    console.log(
      `test before update length: ${uint8ArrayToString(inDataArray).length}`
    );
    console.log(`test before update count: ${count}`);
    console.log(`test before update remainder: ${remainder}`);
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = stringToUint8Array(
        uint8ArrayToString(tempHuksOptionsInData).slice(
          dateSize * i,
          dateSize * (i + 1)
        )
      );
      await update(handle, HuksOptions);
      HuksOptions.inData = tempHuksOptionsInData;
    }
    if (remainder !== 0) {
      HuksOptions.inData = stringToUint8Array(
        uint8ArrayToString(tempHuksOptionsInData).slice(
          dateSize * count,
          uint8ArrayToString(inDataArray).length
        )
      );
      await update(handle, HuksOptions);
      HuksOptions.inData = tempHuksOptionsInData;
    }
  }
}

async function update(handle, HuksOptions) {
  console.log(`test update data ${JSON.stringify(HuksOptions)}`);
  await updateCallback(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      expect(null).assertFail();
    });
}

function updateCallback(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.update(handle, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test update err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicFinishFunc(HuksOptions) {
  await finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function finish(handle, HuksOptionsFinish) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, HuksOptionsFinish, function (err, data) {
      if (err.code !== 0) {
        console.log('test generateKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicAbortFucn(HuksOptions) {
  await abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function abort(handle, HuksOptionsAbort) {
  return new Promise((resolve, reject) => {
    huks.abort(handle, HuksOptionsAbort, function (err, data) {
      if (err.code !== 0) {
        console.log('test abort err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicDeleteKeyFunc(KeyAlias, HuksOptions) {
  await deleteKey(KeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
      if (err.code !== 0) {
        console.log('test deleteKey err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function publicSignVerifyFunc(
  srcKeyAlies,
  newSrcKeyAlies,
  HuksOptions,
  thirdInderfaceName,
  isSING,
  isBigData
) {
  try {
    let keyAlias = srcKeyAlies;
    if (isSING) {
      HuksOptions.properties.splice(
        1,
        1,
        HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY
      );
      if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
        HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
      }
      await publicGenerateKeyFunc(keyAlias, HuksOptions);
      HuksOptions.properties.splice(
        1,
        1,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
      );
      if (HuksOptions.properties[0].value == HksKeyAlg.HKS_ALG_DSA) {
        HuksOptions.properties.splice(2, 1);
      }
    } else {
      keyAlias = newSrcKeyAlies;
      await publicImportKey(keyAlias, HuksOptions);
    }
    console.log(`test init HuksOptions: ${JSON.stringify(HuksOptions)}`);
    await publicInitFunc(keyAlias, HuksOptions);
    await publicUpdateFunc(HuksOptions, isBigData);
    if (thirdInderfaceName == 'finish') {
      if (isSING) {
        HuksOptions.outData = new Uint8Array(new Array(1024));
        await publicFinishFunc(HuksOptions);
        HuksOptions.properties.splice(
          1,
          1,
          HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY
        );
        console.log(
          `test before exportKey Gen_HuksOptions: ${JSON.stringify(
            HuksOptions
          )}`
        );
        await publicExportKey(keyAlias, HuksOptions);
      } else {
        HuksOptions.outData = exportKey;
        await publicFinishFunc(HuksOptions);
      }
    } else {
      await publicAbortFucn(HuksOptions);
    }
    if (isSING && thirdInderfaceName == 'abort') {
      HuksOptions.properties.splice(
        1,
        1,
        HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY
      );
      await publicDeleteKeyFunc(srcKeyAlies, HuksOptions);
    } else if (!isSING) {
      HuksOptions.properties.splice(
        1,
        1,
        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
      );
      await publicDeleteKeyFunc(newSrcKeyAlies, HuksOptions);
    }
  } catch (e) {
    expect(null).assertFail();
  }
}

export { publicSignVerifyFunc };
