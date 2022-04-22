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

import { describe, it, beforeEach } from 'deccjsunit/index';
import Data from '../../../../../../../../../utils/data.json';
import { HuksAgreeX25519 } from '../../../../../../../../../utils/param/agree/publicAgreeParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { HksTag } from '../../../../../../../../../utils/param/publicParam.js';
import { publicAgreeFunc } from '../../../../../../../../../utils/param/agree/publicAgreeCallback.js';

let HuksOptions65kb = {};

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

describe('SecurityHuksAgreeX25519PromiseJsunit', function () {
  beforeEach(function () {
    HuksOptions65kb = {
      properties: new Array(
        HuksAgreeX25519.HuksKeyAlgX25519,
        HuksAgreeX25519.HuksKeyPurposeAGREE,
        HuksAgreeX25519.HuksKeyCURVE25519Size256,
        HuksAgreeX25519.HuksKeyDIGEST,
        HuksAgreeX25519.HuksKeyPADDING,
        HuksAgreeX25519.HuksKeyBLOCKMODE
      ),
      inData: srcData65Kb,
    };
    console.info('test beforeEach called');
  });
  it('testAgreeX25519Size256Abort65KBAgree101', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_001';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree102', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_002';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_002';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree103', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_003';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_003';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGPKCS7,
        HuksAgreeX25519.HuksKeyBLOCKMODECBC
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree104', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_004';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_004';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGPKCS7,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree105', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_005';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_005';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECCM
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree106', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_006';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_006';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree107', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_007';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_007';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECTR
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree108', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_008';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_008';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree109', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_009';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_009';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree110', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_010';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_010';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree111', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_011';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_011';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECBC
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree112', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_012';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_012';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree113', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_013';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_013';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGPKCS7,
        HuksAgreeX25519.HuksKeyBLOCKMODECBC
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree114', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_014';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_014';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGPKCS7,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree115', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_015';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_015';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECCM
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree116', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_016';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_016';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree117', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_017';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_017';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECTR
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree118', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_018';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_018';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree119', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_019';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_019';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree120', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_020';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_020';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE128,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree121', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_021';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_021';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECBC
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree122', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_022';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_022';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree123', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_023';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_023';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGPKCS7,
        HuksAgreeX25519.HuksKeyBLOCKMODECBC
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree124', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_024';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_024';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGPKCS7,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree125', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_025';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_025';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECCM
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree126', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_026';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_026';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree127', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_027';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_027';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeX25519.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODECTR
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree128', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_028';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_028';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree129', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_029';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_029';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree130', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_030';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_030';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMHMAC,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeMAC,
        HuksAgreeX25519.HuksKeyDIGESTSHA1,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree131', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_031';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_031';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMHMAC,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeMAC,
        HuksAgreeX25519.HuksKeyDIGESTSHA224,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree132', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_032';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_032';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMHMAC,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeMAC,
        HuksAgreeX25519.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree133', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_033';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_033';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMHMAC,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeMAC,
        HuksAgreeX25519.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree134', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_034';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_034';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMHMAC,
        HuksAgreeX25519.HuksKeySIZE256,
        HuksAgreeX25519.HuksKeyPurposeMAC,
        HuksAgreeX25519.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });

  it('testAgreeX25519Size256Abort65KBAgree135', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_035';
    const srcKeyAliesSecond =
      'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_035';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeX25519.HuksKeySTORAGE,
        HuksAgreeX25519.HuksKeyISKEYALIAS,
        HuksAgreeX25519.HuksKeyALGORITHMAES,
        HuksAgreeX25519.HuksKeySIZE192,
        HuksAgreeX25519.HuksKeyPurposeDERIVE,
        HuksAgreeX25519.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeX25519.HuksKeyPADDINGNONE,
        HuksAgreeX25519.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions65kb,
      HuksOptionsFinish,
      'abort'
    );
    done();
  });
});
