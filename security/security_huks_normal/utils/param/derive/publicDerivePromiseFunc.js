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
import { HuksDeriveHKDF } from './publicDeriveParam.js';
import huks from '@ohos.security.huks';

let handle = {};
async function publicDeriveGenFunc(srcKeyAlies, HuksOptions) {
  await huks
    .generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
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
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeriveUpdateFunc(HuksOptions) {
  await huks
    .update(handle, HuksOptions)
    .then((data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test update err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeriveFinishAbortFunc(
  HuksOptionsFinish,
  thirdInderfaceName
) {
  if (thirdInderfaceName == 'finish') {
    console.log(
      `test befor finish HuksOptionsFinish ${JSON.stringify(HuksOptionsFinish)}`
    );
    await huks
      .finish(handle, HuksOptionsFinish)
      .then((data) => {
        console.log(`test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.log('test finish err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else {
    await huks
      .abort(handle, HuksOptionsFinish)
      .then((data) => {
        console.log(`test abort data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.log('test abort err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  }
}

async function publicDeriveDeleteFunc(srcKeyAlies, HuksOptions) {
  console.log(
    'test before deleteKey HuksOptions: ' + JSON.stringify(HuksOptions)
  );
  await huks
    .deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeriveFunc(
  srcKeyAlies,
  HuksOptions,
  HuksOptionsFinish,
  thirdInderfaceName
) {
  try {
    await publicDeriveGenFunc(srcKeyAlies, HuksOptions);
    HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
    HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);

    await publicDeriveInitFunc(srcKeyAlies, HuksOptions);
    await publicDeriveUpdateFunc(HuksOptions);
    await publicDeriveFinishAbortFunc(HuksOptionsFinish, thirdInderfaceName);

    HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
    HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
    await publicDeriveDeleteFunc(srcKeyAlies, HuksOptions);
  } catch (e) {
    expect(null).assertFail();
  }
}
export { publicDeriveFunc };
