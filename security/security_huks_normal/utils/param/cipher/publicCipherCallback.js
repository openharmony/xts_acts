import { expect } from 'deccjsunit/index';
import { uint8ArrayToString } from '../publicFunc.js';
import huks from '@ohos.security.huks';

let encryptedData;
var handle = {};
let updateResult = new Array();

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await generateKey(srcKeyAlies, genHuksOptionsNONECBC)
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

async function publicInitFunc(srcKeyAlies, HuksOptions) {
  await init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      handle = {
        handle1: data.handle1,
        handle2: data.handle2,
      };
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

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  let dateSize = 64;
  let tempHuksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = new Uint8Array(new Array());
    await publicFinishAbortFunc(
      HuksOptions,
      thirdInderfaceName,
      isEncrypt,
      0,
      tempHuksOptionsInData.length
    );
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        Array.from(tempHuksOptionsInData).slice(
          dateSize * i,
          dateSize * (i + 1)
        )
      );
      await update(handle, HuksOptions);
    }
    HuksOptions.inData = tempHuksOptionsInData;
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(tempHuksOptionsInData).slice(
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
      tempHuksOptionsInData.length
    );
  }
}

async function update(handle, HuksOptions) {
  await updateCallback(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      if (updateResult.length !== 0) {
        updateResult = updateResult.concat(Array.from(data.outData));
      } else {
        updateResult = Array.from(data.outData);
      }
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

async function publicFinishAbortFunc(
  HuksOptions,
  thirdInderfaceName,
  isEncrypt,
  remainder,
  dataLength
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
  await finishCallback(handle, HuksOptions)
    .then((data) => {
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
          expect(null).assertFail();
        } else {
          expect(data.errorCode == 0).assertTrue();
        }
      }
      if (!isEncrypt) {
        if (finishData === uint8ArrayToString(encryptedData)) {
          expect(data.errorCode == 0).assertTrue();
        } else {
          expect(null).assertFail();
        }
      }
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function finishCallback(handle, HuksOptionsFinish) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, HuksOptionsFinish, function (err, data) {
      if (err.code !== 0) {
        console.log('test finish err information: ' + JSON.stringify(err));
        reject(err);
      } else {
        resolve(data);
      }
    });
  });
}

async function abort(HuksOptions) {
  await abortCallback(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

function abortCallback(handle, HuksOptionsAbort) {
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

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  await deleteKey(srcKeyAlies, genHuksOptionsNONECBC)
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
    return updateResult;
  } catch (e) {
    expect(null).assertFail();
  }
}
export { publicCipherFunc };
