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
import { uint8ArrayToString, stringToUint8Array } from '../publicFunc.js';
import huks from '@ohos.security.huks';

let encryptedData;
let inputInData;
let updateResult = new Array();
var handle = {};
let exportKey;

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .generateKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .exportKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test ExportKey data: ${JSON.stringify(data)}`);
      exportKey = data.outData;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.inData = exportKey;
  await huks
    .importKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test ImportKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test ImportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
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
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicUpdateFunc(HuksOptions) {
  let dateSize = 64;
  let tempHuksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = stringToUint8Array('0');
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
      HuksOptions.inData = tempHuksOptionsInData;
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(tempHuksOptionsInData).slice(
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
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      expect(null).assertFail();
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
          expect(null).assertFail();
        } else {
          expect(data.errorCode == 0).assertTrue();
        }
      }
      if (!isEncrypt) {
        if (
          uint8ArrayToString(data.outData) === uint8ArrayToString(encryptedData)
        ) {
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

async function abort(HuksOptions) {
  await huks
    .abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  await huks
    .deleteKey(srcKeyAlies, genHuksOptionsNONC)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
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
    return updateResult;
  } catch (e) {
    expect(null).assertFail();
  }
}
export { publicCipherFunc };
