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

import { describe, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import { HuksCipherAES } from '../../../../../../utils/param/cipher/publicCipherParam';
import { HksTag } from '../../../../../../utils/param/publicParam';
import { stringToUint8Array, uint8ArrayToString } from '../../../../../../utils/param/publicFunc';
let IV = '0000000000000000';

let srcData63 = 'Hks_AES_Cipher_Test_000000000000000000000_string';
let srcData63Kb = stringToUint8Array(srcData63);
let updateResult = new Array();
let encryptedData;
var handle;

let genHuksOptions = {
  properties: new Array(HuksCipherAES.HuksKeyAlgAES, HuksCipherAES.HuksKeyPurpose),
  inData: new Uint8Array(new Array()),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(srcKeyAlies, genHuksOptionsNONECBC)
      .then((data) => {
        console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicInitFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise doInit`);
  try {
    await huks.initSession(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch(error => {
        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicUpdateFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  let dateSize = 64;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Array.from(inDataArray).length < dateSize) {
    await update(handle, HuksOptions);
    HuksOptions.inData = new Uint8Array(new Array());
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt, 0);
  } else {
    let count = Math.floor(Array.from(inDataArray).length / dateSize);
    let remainder = Array.from(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
      await update(handle, HuksOptions);
    }
    HuksOptions.inData = huksOptionsInData;
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
      );
    } else {
      HuksOptions.inData = new Uint8Array(new Array());
    }
    await publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt);
  }
}

async function update(handle, HuksOptions) {
  console.info(`enter promise doUpdate`);
  try {
    await huks.updateSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
        if (updateResult.length !== 0) {
          console.log(`test update outDatalength ${updateResult.length}`);
          updateResult = updateResult.concat(Array.from(data.outData));
        } else {
          console.log(`test update outDatalength ${updateResult.length}`);
          updateResult = Array.from(data.outData);
        }
      })
      .catch(error => {
        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicFinishAbortFunc(HuksOptions, thirdInderfaceName, isEncrypt) {
  if (thirdInderfaceName == 'finish') {
    await finish(HuksOptions, isEncrypt);
  } else if (thirdInderfaceName == 'abort') {
    await abort(HuksOptions);
  }
}

async function finish(HuksOptions, isEncrypt) {
  console.info(`enter promise doFinish`);
  try {
    await huks.finishSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
        let finishData;
        if (encryptedData.length > 64) {
          finishData = uint8ArrayToString(updateResult.concat(Array.from(data.outData)));
          updateResult = updateResult.concat(Array.from(data.outData));
        } else {
          finishData = uint8ArrayToString(updateResult);
        }
      })
      .catch(error => {
        console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function abort(HuksOptions) {
  console.info(`enter promise doAbort`);
  try {
    await huks.abortSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONECBC) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlies, genHuksOptionsNONECBC)
      .then ((data) => {
        console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicCipherFunc(srcKeyAlies, genHuksOptionsNONECBC, HuksOptions, thirdInderfaceName, isEncrypt) {
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
    expect(null).assertFail();
  }
}

export default function SecurityHuksCipherAESBasicPromiseJsunit() {
  describe('SecurityHuksCipherAESBasicPromiseJsunit', function () {
    it('testCipherAES101_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias101';
      genHuksOptions.properties.splice(2, 1, HuksCipherAES.HuksKeyAESSize128);
      genHuksOptions.properties.splice(3, 1, HuksCipherAES.HuksKeyAESBLOCKMODE);
      genHuksOptions.properties.splice(4, 1, HuksCipherAES.HuksKeyAESPADDINGNONE);
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGNONE,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: srcData63Kb,
      };
      await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeDECRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGNONE,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(updateResult),
      };
      await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testCipherAES102_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias102';
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGNONE,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(updateResult),
      };
      await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });

    it('testCipherAES103_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGNONE,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: srcData63Kb,
      };
      await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeDECRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGNONE,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(updateResult),
      };
      await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testCipherAES104_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherAESSize128PADDINGNONEMODECBCKeyAlias104';
      let HuksOptions = {
        properties: new Array(
          HuksCipherAES.HuksKeyAlgAES,
          HuksCipherAES.HuksKeyPurposeENCRYPT,
          HuksCipherAES.HuksKeyAESSize128,
          HuksCipherAES.HuksKeyAESPADDINGNONE,
          HuksCipherAES.HuksKeyAESBLOCKMODE,
          HuksCipherAES.HuksKeyAESDIGESTNONE,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) }
        ),
        inData: new Uint8Array(updateResult),
      };
      await publicCipherFunc(srcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });
  });
}

export { publicCipherFunc, IV, updateResult };