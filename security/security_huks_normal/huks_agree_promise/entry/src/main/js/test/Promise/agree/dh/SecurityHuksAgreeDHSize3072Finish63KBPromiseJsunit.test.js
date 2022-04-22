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
import { HuksAgreeDH } from '../../../../../../../../../utils/param/agree/publicAgreeParam.js';
import { stringToUint8Array } from '../../../../../../../../../utils/param/publicFunc.js';
import { HksTag } from '../../../../../../../../../utils/param/publicParam.js';
import { publicAgreeFunc } from '../../../../../../../../../utils/param/agree/publicAgreePromise.js';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let HuksOptions63kb = {};

describe('SecurityHuksAgreeDHPromiseJsunit', function () {
  beforeEach(function () {
    HuksOptions63kb = {
      properties: new Array(
        HuksAgreeDH.HuksKeyAlgDH,
        HuksAgreeDH.HuksKeyPurposeDH,
        HuksAgreeDH.HuksKeyDHSize3072
      ),
      inData: srcData63Kb,
    };
    console.info('test beforeEach called');
  });
  it('testAgreeDHSize3072Finish63KBAgree101', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_001';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,

        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree102', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_002';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_002';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree103', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_003';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_003';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGPKCS7,
        HuksAgreeDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree104', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_004';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_004';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGPKCS7,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree105', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_005';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_005';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree106', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_006';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_006';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree107', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_007';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_007';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECTR
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree108', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_008';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_008';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree109', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_009';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_009';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree110', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_010';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_010';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree111', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_011';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_011';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree112', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_012';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_012';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree113', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_013';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_013';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGPKCS7,
        HuksAgreeDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree114', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_014';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_014';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGPKCS7,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree115', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_015';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_015';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree116', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_016';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_016';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree117', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_017';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_017';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECTR
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree118', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_018';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_018';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree119', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_019';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_019';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree120', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_020';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_020';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE128,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree121', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_021';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_021';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree122', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_022';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_022';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree123', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_023';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_023';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGPKCS7,
        HuksAgreeDH.HuksKeyBLOCKMODECBC
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree124', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_024';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_024';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGPKCS7,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree125', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_025';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_025';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree126', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_026';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_026';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree127', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_027';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_027';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODECTR
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree128', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_028';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_028';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree129', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_029';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_029';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree130', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_030';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_030';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMHMAC,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeMAC,
        HuksAgreeDH.HuksKeyDIGESTSHA1,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree131', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_031';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_031';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMHMAC,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeMAC,
        HuksAgreeDH.HuksKeyDIGESTSHA224,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree132', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_032';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_032';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMHMAC,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeMAC,
        HuksAgreeDH.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree133', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_033';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_033';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMHMAC,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeMAC,
        HuksAgreeDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree134', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_034';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_034';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMHMAC,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeMAC,
        HuksAgreeDH.HuksKeyDIGESTSHA512,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });

  it('testAgreeDHSize3072Finish63KBAgree135', 0, async function (done) {
    const srcKeyAliesFrist =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_01_035';
    const srcKeyAliesSecond =
      'testAgreeDHSize3072Finish63KBAgreeKeyAlias_02_035';
    let HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE192,
        HuksAgreeDH.HuksKeyPurposeDERIVE,
        HuksAgreeDH.HuksKeyDIGESTSHA384,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFrist),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
    await publicAgreeFunc(
      srcKeyAliesFrist,
      srcKeyAliesSecond,
      HuksOptions63kb,
      HuksOptionsFinish,
      'finish'
    );
    done();
  });
});
