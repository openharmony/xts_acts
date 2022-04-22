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

import { describe, it, beforeEach, expect } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import Data from '../../../../../../../../../utils/data.json';
import { HuksAgreeECDH } from '../../../../../../../../../utils/param/agree/publicAgreeParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { HksTag } from '../../../../../../../../../utils/param/publicParam.js';
import { publicAgreeFunc } from '../../../../../../../../../utils/param/agree/publicAgreePromise.js';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let HuksOptions63kb = {};

describe('SecurityHuksAgreeECDHPromiseJsunit', function () {
  beforeEach(function () {
    HuksOptions63kb = {
      properties: new Array(
        HuksAgreeECDH.HuksKeyAlgECC,
        HuksAgreeECDH.HuksKeyPurposeECDH,
        HuksAgreeECDH.HuksKeyECCSize521,
        HuksAgreeECDH.HuksKeyECCDIGEST,
        HuksAgreeECDH.HuksKeyECCPADDING,
        HuksAgreeECDH.HuksKeyECCBLOCKMODE
      ),
      inData: srcData63Kb,
    };
    console.info('test beforeEach called');
  });

  it('testAgreeECDHSize521Abort63KBAgree101', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_001';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree102', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_002';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_002';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree103', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_003';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_003';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGPKCS7,
        HuksAgreeECDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree104', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_004';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_004';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGPKCS7,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree105', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_005';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_005';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree106', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_006';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_006';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree107', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_007';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_007';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECTR
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree108', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_008';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_008';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree109', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_009';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_009';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree110', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_010';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_010';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree111', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_011';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_011';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree112', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_012';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_012';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree113', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_013';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_013';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGPKCS7,
        HuksAgreeECDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree114', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_014';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_014';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGPKCS7,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree115', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_015';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_015';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree116', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_016';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_016';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree117', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_017';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_017';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECTR
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree118', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_018';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_018';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree119', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_019';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_019';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree120', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_020';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_020';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE128,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree121', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_021';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_021';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree122', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_022';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_022';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree123', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_023';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_023';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGPKCS7,
        HuksAgreeECDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree124', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_024';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_024';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGPKCS7,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree125', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_025';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_025';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree126', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_026';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_026';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree127', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_027';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_027';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeECDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODECTR
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree128', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_028';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_028';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree129', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_029';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_029';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree130', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_030';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_030';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMHMAC,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeMAC,
        HuksAgreeECDH.HuksKeyDIGESTSHA1,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree131', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_031';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_031';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMHMAC,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeMAC,
        HuksAgreeECDH.HuksKeyDIGESTSHA224,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree132', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_032';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_032';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMHMAC,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeMAC,
        HuksAgreeECDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree133', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_033';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_033';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMHMAC,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeMAC,
        HuksAgreeECDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree134', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_034';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_034';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMHMAC,
        HuksAgreeECDH.HuksKeySIZE256,
        HuksAgreeECDH.HuksKeyPurposeMAC,
        HuksAgreeECDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeECDHSize521Abort63KBAgree135', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_01_035';
    const srcKeyAliesSecond =
      'testAgreeECDHSize521Abort63KBAgreeKeyAlias_02_035';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeECDH.HuksKeySTORAGE,
        HuksAgreeECDH.HuksKeyISKEYALIAS,
        HuksAgreeECDH.HuksKeyALGORITHMAES,
        HuksAgreeECDH.HuksKeySIZE192,
        HuksAgreeECDH.HuksKeyPurposeDERIVE,
        HuksAgreeECDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });
});
