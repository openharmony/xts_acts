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
        HuksAgreeDH.HuksKeyDHSize2048
      ),
      inData: srcData63Kb,
    };
    console.info('test beforeEach called');
  });
  it('testAgreeDHSize2048Abort63KBAgree101', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_101';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_101';
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

  it('testAgreeDHSize2048Abort63KBAgree102', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_102';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_102';
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

  it('testAgreeDHSize2048Abort63KBAgree103', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_103';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_103';
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

  it('testAgreeDHSize2048Abort63KBAgree104', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_104';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_104';
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

  it('testAgreeDHSize2048Abort63KBAgree105', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_105';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_105';
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

  it('testAgreeDHSize2048Abort63KBAgree106', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_106';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_106';
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

  it('testAgreeDHSize2048Abort63KBAgree107', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_107';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_107';
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

  it('testAgreeDHSize2048Abort63KBAgree108', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_108';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_108';
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

  it('testAgreeDHSize2048Abort63KBAgree109', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_109';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_109';
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

  it('testAgreeDHSize2048Abort63KBAgree110', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_110';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_110';
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

  it('testAgreeDHSize2048Abort63KBAgree111', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_111';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_111';
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

  it('testAgreeDHSize2048Abort63KBAgree112', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_112';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_112';
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

  it('testAgreeDHSize2048Abort63KBAgree113', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_113';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_113';
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

  it('testAgreeDHSize2048Abort63KBAgree114', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_114';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_114';
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

  it('testAgreeDHSize2048Abort63KBAgree115', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_115';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_115';
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

  it('testAgreeDHSize2048Abort63KBAgree116', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_116';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_116';
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

  it('testAgreeDHSize2048Abort63KBAgree117', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_117';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_117';
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

  it('testAgreeDHSize2048Abort63KBAgree118', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_118';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_118';
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

  it('testAgreeDHSize2048Abort63KBAgree119', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_119';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_119';
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

  it('testAgreeDHSize2048Abort63KBAgree120', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_120';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_120';
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

  it('testAgreeDHSize2048Abort63KBAgree121', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_121';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_121';
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

  it('testAgreeDHSize2048Abort63KBAgree122', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_122';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_122';
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

  it('testAgreeDHSize2048Abort63KBAgree123', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_123';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_123';
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

  it('testAgreeDHSize2048Abort63KBAgree124', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_124';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_124';
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

  it('testAgreeDHSize2048Abort63KBAgree125', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_125';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_125';
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

  it('testAgreeDHSize2048Abort63KBAgree126', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_126';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_126';
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

  it('testAgreeDHSize2048Abort63KBAgree127', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_127';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_127';
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

  it('testAgreeDHSize2048Abort63KBAgree128', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_128';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_128';
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

  it('testAgreeDHSize2048Abort63KBAgree129', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_129';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_129';
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

  it('testAgreeDHSize2048Abort63KBAgree130', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_130';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_130';
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

  it('testAgreeDHSize2048Abort63KBAgree131', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_131';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_131';
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

  it('testAgreeDHSize2048Abort63KBAgree132', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_132';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_132';
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

  it('testAgreeDHSize2048Abort63KBAgree133', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_133';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_133';
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

  it('testAgreeDHSize2048Abort63KBAgree134', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_134';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_134';
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

  it('testAgreeDHSize2048Abort63KBAgree135', 0, async function (done) {
    const srcKeyAliesFrist = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_135';
    const srcKeyAliesSecond =
      'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_135';
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
