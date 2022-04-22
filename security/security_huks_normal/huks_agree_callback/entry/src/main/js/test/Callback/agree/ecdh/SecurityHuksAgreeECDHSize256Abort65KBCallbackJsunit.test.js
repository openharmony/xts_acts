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
import { HuksAgreeECDH } from '../../../../../../../../../utils/param/agree/publicAgreeParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { HksTag } from '../../../../../../../../../utils/param/publicParam.js';
import { publicAgreeFunc } from '../../../../../../../../../utils/param/agree/publicAgreeCallback.js';

let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let HuksOptions65kb = {};

describe('SecurityHuksAgreeECDHCallbackJsunit', function () {
  beforeEach(function () {
    HuksOptions65kb = {
      properties: new Array(
        HuksAgreeECDH.HuksKeyAlgECC,
        HuksAgreeECDH.HuksKeyPurposeECDH,
        HuksAgreeECDH.HuksKeyECCSize256,
        HuksAgreeECDH.HuksKeyECCDIGEST,
        HuksAgreeECDH.HuksKeyECCPADDING,
        HuksAgreeECDH.HuksKeyECCBLOCKMODE
      ),
      inData: srcData65Kb,
    };
    console.info('test beforeEach called');
  });

  it('testAgreeECDHSize256Abort65KBAgree001', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_001';
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

  it('testAgreeECDHSize256Abort65KBAgree002', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_002';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_002';
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

  it('testAgreeECDHSize256Abort65KBAgree003', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_003';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_003';
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

  it('testAgreeECDHSize256Abort65KBAgree004', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_004';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_004';
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

  it('testAgreeECDHSize256Abort65KBAgree005', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_005';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_005';
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

  it('testAgreeECDHSize256Abort65KBAgree006', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_006';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_006';
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

  it('testAgreeECDHSize256Abort65KBAgree007', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_007';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_007';
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

  it('testAgreeECDHSize256Abort65KBAgree008', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_008';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_008';
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

  it('testAgreeECDHSize256Abort65KBAgree009', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_009';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_009';
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

  it('testAgreeECDHSize256Abort65KBAgree010', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_010';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_010';
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

  it('testAgreeECDHSize256Abort65KBAgree011', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_011';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_011';
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

  it('testAgreeECDHSize256Abort65KBAgree012', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_012';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_012';
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

  it('testAgreeECDHSize256Abort65KBAgree013', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_013';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_013';
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

  it('testAgreeECDHSize256Abort65KBAgree014', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_014';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_014';
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

  it('testAgreeECDHSize256Abort65KBAgree015', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_015';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_015';
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

  it('testAgreeECDHSize256Abort65KBAgree016', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_016';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_016';
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

  it('testAgreeECDHSize256Abort65KBAgree017', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_017';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_017';
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

  it('testAgreeECDHSize256Abort65KBAgree018', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_018';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_018';
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

  it('testAgreeECDHSize256Abort65KBAgree019', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_019';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_019';
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

  it('testAgreeECDHSize256Abort65KBAgree020', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_020';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_020';
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

  it('testAgreeECDHSize256Abort65KBAgree021', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_021';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_021';
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

  it('testAgreeECDHSize256Abort65KBAgree022', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_022';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_022';
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

  it('testAgreeECDHSize256Abort65KBAgree023', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_023';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_023';
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

  it('testAgreeECDHSize256Abort65KBAgree024', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_024';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_024';
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

  it('testAgreeECDHSize256Abort65KBAgree025', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_025';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_025';
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

  it('testAgreeECDHSize256Abort65KBAgree026', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_026';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_026';
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

  it('testAgreeECDHSize256Abort65KBAgree027', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_027';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_027';
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

  it('testAgreeECDHSize256Abort65KBAgree028', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_028';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_028';
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

  it('testAgreeECDHSize256Abort65KBAgree029', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_029';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_029';
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

  it('testAgreeECDHSize256Abort65KBAgree030', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_030';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_030';
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

  it('testAgreeECDHSize256Abort65KBAgree031', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_031';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_031';
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

  it('testAgreeECDHSize256Abort65KBAgree032', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_032';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_032';
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

  it('testAgreeECDHSize256Abort65KBAgree033', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_033';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_033';
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

  it('testAgreeECDHSize256Abort65KBAgree034', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_034';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_034';
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

  it('testAgreeECDHSize256Abort65KBAgree035', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_035';
    const srcKeyAliesSecond =
      'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_035';
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
