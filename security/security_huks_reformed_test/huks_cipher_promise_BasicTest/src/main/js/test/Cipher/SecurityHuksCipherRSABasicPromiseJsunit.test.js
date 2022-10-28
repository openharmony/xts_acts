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
import { HuksCipherRSA } from '../../../../../../utils/param/cipher/publicCipherParam';
import { stringToUint8Array, uint8ArrayToString } from '../../../../../../utils/param/publicFunc';
let gInData64 = 'RSA_64_ttttttttttttttttttttttttttttttttttttttttttttttttttttttttt';

let defaultData = '0';

let gInData64Array = stringToUint8Array(gInData64);

let encryptedData;
let inputInData;
var handle;
let updateResult = new Array();
let exportKey;

let genHuksOptions = {
  properties: new Array(HuksCipherRSA.HuksKeyAlgRSA, HuksCipherRSA.HuksKeyPurpose, HuksCipherRSA.HuksKeyRSASize512),
  inData: new Uint8Array(defaultData),
};

async function publicGenerateKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(srcKeyAlies, genHuksOptionsNONC)
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

async function publicExportKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  console.info(`enter promise export`);
  try {
    await huks.exportKeyItem(srcKeyAlies, genHuksOptionsNONC)
      .then((data) => {
        console.info(`promise: exportKeyItem success, data = ${JSON.stringify(data)}`);
        exportKey = data.outData;
      })
      .catch(error => {
        console.error(`promise: exportKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: exportKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicImportKeyFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.inData = exportKey;
  console.info(`enter promise importKeyItem`);
  try {
    await huks.importKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: importKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: importKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: importKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
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
        expect(data.challenge == undefined).assertTrue();
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
      HuksOptions.inData = new Uint8Array(Array.from(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1)));
      await update(handle, HuksOptions);
      HuksOptions.inData = huksOptionsInData;
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        Array.from(huksOptionsInData).slice(dateSize * count, uint8ArrayToString(inDataArray).length)
      );
      await update(handle, HuksOptions);
    }
  }
}

async function update(handle, HuksOptions) {
  console.info(`enter promise doUpdate`);
  try {
    await huks.updateSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
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
    HuksOptions.inData = new Uint8Array(new Array());
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
        if (isEncrypt) {
          updateResult = Array.from(data.outData);
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

async function publicDeleteKeyFunc(srcKeyAlies, genHuksOptionsNONC) {
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlies, genHuksOptionsNONC)
      .then((data) => {
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
    expect(null).assertFail();
  }
}

export default function SecurityHuksCipherRSABasicPromiseJsunit() {
  describe('SecurityHuksCipherRSABasicPromiseJsunit', function () {
    it('testCipherRSA101_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias101';
      const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias101';
      genHuksOptions.properties.splice(3, 1, HuksCipherRSA.HuksKeyRSABLOCKMODEECB);
      genHuksOptions.properties.splice(4, 1, HuksCipherRSA.HuksKeyRSAPADDINGNONE);
      genHuksOptions.properties.splice(5, 1, HuksCipherRSA.HuksKeyRSADIGESTSHA256);

      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: new Uint8Array(updateResult),
      };
      await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testCipherRSA102_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias102';
      const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias101';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });

    it('testCipherRSA103_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias103';
      const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias103';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', true);
      HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeDECRYPT,
          HuksCipherRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: new Uint8Array(updateResult),
      };
      await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'finish', false);
      done();
    });

    it('testCipherRSA104_reformed', 0, async function (done) {
      const srcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256KeyAlias104';
      const newSrcKeyAlies = 'testCipherRSASize512PADDINGNONESHA256NewKeyAlias104';
      let HuksOptions = {
        properties: new Array(
          HuksCipherRSA.HuksKeyAlgRSA,
          HuksCipherRSA.HuksKeyPurposeENCRYPT,
          HuksCipherRSA.HuksKeyRSASize512,
          HuksCipherRSA.HuksKeyRSAPADDINGNONE,
          HuksCipherRSA.HuksKeyRSABLOCKMODEECB,
          HuksCipherRSA.HuksKeyRSADIGESTSHA256
        ),
        inData: gInData64Array,
      };
      await publicCipherFunc(srcKeyAlies, newSrcKeyAlies, genHuksOptions, HuksOptions, 'abort', true);
      done();
    });
  });
}
