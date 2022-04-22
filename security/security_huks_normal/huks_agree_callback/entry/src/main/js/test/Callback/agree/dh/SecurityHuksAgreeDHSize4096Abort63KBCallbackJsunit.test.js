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
import { publicAgreeFunc } from '../../../../../../../../../utils/param/agree/publicAgreeCallback.js';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let HuksOptions63kb = {};

describe('SecurityHuksAgreeDHCallbackJsunit', function () {
  beforeEach(function () {
    HuksOptions63kb = {
      properties: new Array(
        HuksAgreeDH.HuksKeyAlgDH,
        HuksAgreeDH.HuksKeyPurposeDH,
        HuksAgreeDH.HuksKeyDHSize4096
      ),
      inData: srcData63Kb,
    };
    console.info('test beforeEach called');
  });
  it('testAgreeDHSize4096Abort63KBAgree001', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_001';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree002', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_002';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_002';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree003', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_003';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_003';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree004', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_004';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_004';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree005', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_005';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_005';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree006', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_006';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_006';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree007', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_007';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_007';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree008', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_008';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_008';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree009', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_009';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_009';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree010', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_010';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_010';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree011', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_011';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_011';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree012', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_012';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_012';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree013', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_013';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_013';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree014', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_014';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_014';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree015', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_015';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_015';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree016', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_016';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_016';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree017', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_017';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_017';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree018', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_018';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_018';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree019', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_019';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_019';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree020', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_020';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_020';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree021', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_021';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_021';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree022', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_022';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_022';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree023', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_023';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_023';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree024', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_024';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_024';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree025', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_025';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_025';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree026', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_026';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_026';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree027', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_027';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_027';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree028', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_028';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_028';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree029', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_029';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_029';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree030', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_030';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_030';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree031', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_031';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_031';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree032', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_032';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_032';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree033', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_033';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_033';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree034', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_034';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_034';
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
      'abort'
    );
    done();
  });

  it('testAgreeDHSize4096Abort63KBAgree035', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize4096Abort63KBAgreeKeyAlias_01_035';
    const srcKeyAliesSecond =
      'testAgreeDHSize4096Abort63KBAgreeKeyAlias_02_035';
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
      'abort'
    );
    done();
  });
});
