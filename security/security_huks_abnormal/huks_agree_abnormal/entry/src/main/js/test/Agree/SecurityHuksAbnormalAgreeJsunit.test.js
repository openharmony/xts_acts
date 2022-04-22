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

import { describe, it, expect, beforeEach } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import Data from '../../../../../../../utils/Base/data/data.json';
import * as Params from '../../../../../../../utils/Base/data/params';
import * as Tools from '../../../../../../../utils/Base/tools';

let exportKeyFrist;
let exportKeySecond;
let handle = {};

let srcData63 = Data.Data_63KB;
let srcData63Kb = Tools.stringToUint8Array(srcData63);

let srcData64 = Data.Data_64KB;
let srcData64Kb = Tools.stringToUint8Array(srcData64);

let HuksAgreeDH = {
  HuksKeySTORAGE: {
    tag: Params.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
    value: Params.HksKeyStorageType.HKS_STORAGE_PERSISTENT,
  },
  HuksKeyISKEYALIAS: { tag: Params.HksTag.HKS_TAG_IS_KEY_ALIAS, value: true },
  HuksKeyDIGESTNONE: {
    tag: Params.HksTag.HKS_TAG_DIGEST,
    value: Params.HksKeyDigest.HKS_DIGEST_NONE,
  },
  HuksKeyPADDINGNONE: {
    tag: Params.HksTag.HKS_TAG_PADDING,
    value: Params.HksKeyPadding.HKS_PADDING_NONE,
  },
  HuksKeyBLOCKMODEECB: {
    tag: Params.HksTag.HKS_TAG_BLOCK_MODE,
    value: Params.HksCipherMode.HKS_MODE_ECB,
  },
  HuksKeyALGORITHMAES: {
    tag: Params.HksTag.HKS_TAG_ALGORITHM,
    value: Params.HksKeyAlg.HKS_ALG_AES,
  },
  HuksKeySIZE256: {
    tag: Params.HksTag.HKS_TAG_KEY_SIZE,
    value: Params.HksKeySize.HKS_KEY_SIZE_256,
  },
  HuksKeyAlgDH: {
    tag: Params.HksTag.HKS_TAG_ALGORITHM,
    value: Params.HksKeyAlg.HKS_ALG_DH,
  },
  HuksKeyPurposeENCRYPTDECRYPT: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value:
      Params.HksKeyPurpose.HKS_KEY_PURPOSE_ENCRYPT |
      Params.HksKeyPurpose.HKS_KEY_PURPOSE_DECRYPT,
  },
  HuksKeyPurposeDH: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value: Params.HksKeyPurpose.HKS_KEY_PURPOSE_AGREE,
  },
  HuksKeyDHSize2048: {
    tag: Params.HksTag.HKS_TAG_KEY_SIZE,
    value: Params.HksKeySize.HKS_KEY_SIZE_2048,
  },
};
let HuksOptions;

let HuksOptionsFinish;

async function publicAgreeGenFunc(srcKeyAlias, HuksOptions) {
  await huks
    .generateKey(srcKeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicAgreeExportFunc(
  srcKeyAlias,
  HuksOptions,
  exportKey,
  Type
) {
  await huks
    .exportKey(srcKeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      if (exportKey == 1) {
        exportKeyFrist = data.outData;
      } else {
        exportKeySecond = data.outData;
      }
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicAgreeInitFunc(srcKeyAlias, HuksOptions, Type) {
  await huks
    .init(srcKeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test init data ${JSON.stringify(data)}`);
      handle = {
        handle1: data.handle1,
        handle2: data.handle2,
      };
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicAgreeUpdateFunc(handle, HuksOptions, exportKey, Type) {
  if (exportKey == 1) {
    HuksOptions.inData = exportKeySecond;
  } else {
    HuksOptions.inData = exportKeyFrist;
  }
  await huks
    .update(handle, HuksOptions)
    .then((data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test update err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicAgreeFinishAbortFunc(
  handle,
  HuksOptionsFinish,
  thirdInderfaceName,
  Type
) {
  if (thirdInderfaceName == 'finish') {
    await huks
      .finish(handle, HuksOptionsFinish)
      .then((data) => {
        console.log(`test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == Type).assertTrue();
      })
      .catch((err) => {
        console.log('test finish err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else {
    let HuksOptionsAbort = new Array({
      tag: Params.HksTag.HKS_TAG_KEY_STORAGE_FLAG,
      value: Params.HksKeyStorageType.HKS_STORAGE_TEMP,
    });
    await huks
      .abort(handle, HuksOptionsAbort)
      .then((data) => {
        console.log(`test abort data ${JSON.stringify(data)}`);
        expect(data.errorCode == Type).assertTrue();
      })
      .catch((err) => {
        console.log('test abort err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  }
}

async function publicAgreeDeleteFunc(srcKeyAlias, HuksOptions, Type) {
  await huks
    .deleteKey(srcKeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data ${JSON.stringify(data)}`);
      expect(data.errorCode == Type).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicAgree(
  srcKeyAliasFirst,
  srcKeyAliasSecond,
  HuksOptions,
  HuksOptionsFinish
) {
  await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
  await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
  await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
  await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
  await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
  await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
  await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
}

describe('SecurityHuksAbnormalAgreeDHPromiseJsunit', function () {
  beforeEach(function () {
    handle = {};
    exportKeyFrist = {};
    exportKeySecond = {};
    HuksOptions = {
      properties: new Array(
        HuksAgreeDH.HuksKeyAlgDH,
        HuksAgreeDH.HuksKeyPurposeDH,
        HuksAgreeDH.HuksKeyDHSize2048
      ),
      inData: srcData63Kb,
    };
    HuksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData63Kb,
    };
  });

  it('security_huks_third_abnormal_agree_1016', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1016_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1016_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    done();
  });

  it('security_huks_third_abnormal_agree_1017', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1017_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1017_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    done();
  });

  it('security_huks_third_abnormal_agree_1018', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1018_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1018_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    done();
  });

  it('security_huks_third_abnormal_agree_1019', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1019_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1019_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1020', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1020_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1020_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1021', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1021_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1021_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    let srcKeyAlias_3 = srcKeyAliasSecond + 'final';
    await publicAgreeDeleteFunc(srcKeyAlias_3, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1022', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1022_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1022_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    let srcKeyAlias_3 = srcKeyAliasSecond + 'final';
    await publicAgreeDeleteFunc(srcKeyAlias_3, HuksOptions, -13);
    done();
  });

  it('security_huks_third_abnormal_agree_1023', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1023_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1023_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1024', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1024_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1024_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1025', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1025_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1025_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1026', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1026_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1026_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1027', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1027_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1027_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1028', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1028_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1028_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1029', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1029_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1029_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1030', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1030_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1030_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1031', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1031_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1031_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1032', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1032_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1032_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1033', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1033_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1033_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1034', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1034_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1034_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1035', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1035_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1035_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1036', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1036_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1036_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', -14);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1037', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1037_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1037_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1038', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1038_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1038_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1039', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1039_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1039_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    HuksOptions.inData = srcData63Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1040', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1040_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1040_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
    await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
    await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1, 0);
    await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 1, 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1041', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1041_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1041_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    done();
  });

  it('security_huks_third_abnormal_agree_1042', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1042_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1042_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });

    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    done();
  });

  it('security_huks_third_abnormal_agree_1043', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1043_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1043_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1044', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1044_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1044_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1045', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1045_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1045_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });

    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1046', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1046_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1046_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });

    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1047', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1047_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1047_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });

    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1048', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1048_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1048_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1049', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1049_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1049_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1050', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1050_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1050_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1051', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1051_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1051_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1052', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1052_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1052_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });

    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );

    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);

    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1053', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1053_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1053_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1054', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1054_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1054_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1055', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1055_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1055_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1056', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1056_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1056_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1057', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1057_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1057_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1058', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1058_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1058_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    let srcKeyAlias_3 = srcKeyAliasSecond + 'final';
    await publicAgreeDeleteFunc(srcKeyAlias_3, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1059', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1059_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1059_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'abort', 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, -2);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1060', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1060_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1060_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_agree_1061', 0, async function (done) {
    let srcKeyAliasFirst = 'security_huks_third_abnormal_agree_1061_1';
    let srcKeyAliasSecond = 'security_huks_third_abnormal_agree_1061_2';
    HuksOptionsFinish.properties.splice(7, 0, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasFirst),
    });
    await publicAgree(
      srcKeyAliasFirst,
      srcKeyAliasSecond,
      HuksOptions,
      HuksOptionsFinish
    );
    await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
    await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
    await publicAgreeUpdateFunc(handle, HuksOptions, 2, 0);
    HuksOptionsFinish.properties.splice(6, 1, {
      tag: Params.HksTag.HKS_TAG_KEY_ALIAS,
      value: Tools.stringToUint8Array(srcKeyAliasSecond + 'final'),
    });
    await publicAgreeFinishAbortFunc(handle, HuksOptionsFinish, 'finish', 0);
    done();
  });
});
