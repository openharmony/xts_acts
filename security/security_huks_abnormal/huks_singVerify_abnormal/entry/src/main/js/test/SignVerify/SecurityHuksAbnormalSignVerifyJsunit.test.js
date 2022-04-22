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

let DSA_COMMON_SIZE = 1024;

let HuksSignVerifyDSA = {
  HuksKeySIZE: {
    tag: Params.HksTag.HKS_TAG_KEY_SIZE,
    value: Params.HksKeySize.HKS_DSA_KEY_SIZE_512,
  },
  HuksKeySIZE1024: {
    tag: Params.HksTag.HKS_TAG_KEY_SIZE,
    value: Params.HksKeySize.HKS_KEY_SIZE_1024,
  },
  HuksKeyAlgDSA: {
    tag: Params.HksTag.HKS_TAG_ALGORITHM,
    value: Params.HksKeyAlg.HKS_ALG_DSA,
  },
  HuksKeyDSAPurposeSIGN: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value: Params.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN,
  },
  HuksKeyDSAPurposeVERIFY: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value: Params.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDSADigestSHA1: {
    tag: Params.HksTag.HKS_TAG_DIGEST,
    value: Params.HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyRSAPurposeSING_VERIFY: {
    tag: Params.HksTag.HKS_TAG_PURPOSE,
    value:
      Params.HksKeyPurpose.HKS_KEY_PURPOSE_SIGN |
      Params.HksKeyPurpose.HKS_KEY_PURPOSE_VERIFY,
  },
  HuksTagDSACOMMONSIZE: {
    tag: Params.HksTag.HKS_TAG_KEY_SIZE,
    value: DSA_COMMON_SIZE,
  },
};

let finishOutData;
var handle = {};
let exportKey;
let srcData63 = Data.Data_63KB;
let srcData63Kb = Tools.stringToUint8Array(srcData63);

let srcData64 = Data.Data_64KB;
let srcData64Kb = Tools.stringToUint8Array(srcData64);

let HuksOptions;
let HuksOptionsVerify;

async function publicGenerateKeyFunc(keyAlias, HuksOptions) {
  await huks
    .generateKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data: ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicImportKey(keyAlias, HuksOptions, Type) {
  let tempInData = HuksOptions.inData;
  HuksOptions.inData = finishOutData;
  await huks
    .importKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test importKey data: ${JSON.stringify(data)}`);
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        expect(data.errorCode == Type).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test importKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
  HuksOptions.inData = tempInData;
}

async function publicExportKey(keyAlias, HuksOptions, Type) {
  await huks
    .exportKey(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test exportKey data: ${JSON.stringify(data)}`);
      finishOutData = data.outData;
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        expect(data.errorCode == Type).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test exportKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicInitFunc(keyAlias, HuksOptions, Type) {
  await huks
    .init(keyAlias, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        handle = {
          handle1: data.handle1,
          handle2: data.handle2,
        };
        expect(data.errorCode == Type).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test init err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicUpdateFunc(handle, HuksOptions, Type) {
  let dateSize = 64 * 1024;
  let tempHuksOptionsInData = HuksOptions.inData;
  let inDataArray = HuksOptions.inData;
  if (Tools.uint8ArrayToString(inDataArray).length < dateSize) {
    await update(handle, HuksOptions, Type);
    HuksOptions.inData = tempHuksOptionsInData;
  } else {
    let count = Math.floor(
      Tools.uint8ArrayToString(inDataArray).length / dateSize
    );
    let remainder = Tools.uint8ArrayToString(inDataArray).length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = Tools.stringToUint8Array(
        Tools.uint8ArrayToString(tempHuksOptionsInData).slice(
          dateSize * i,
          dateSize * (i + 1)
        )
      );
      await update(handle, HuksOptions, Type);
      HuksOptions.inData = tempHuksOptionsInData;
    }
    if (remainder !== 0) {
      HuksOptions.inData = Tools.stringToUint8Array(
        Tools.uint8ArrayToString(tempHuksOptionsInData).slice(
          dateSize * count,
          Tools.uint8ArrayToString(inDataArray).length
        )
      );
      await update(handle, HuksOptions, Type);
      HuksOptions.inData = tempHuksOptionsInData;
    }
  }
}

async function update(handle, HuksOptions, Type) {
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        expect(data.errorCode == Type).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      expect(null).assertFail();
    });
}

async function publicFinishFunc(handle, HuksOptions, Type) {
  await huks
    .finish(handle, HuksOptions)
    .then((data) => {
      console.log(`test finish data: ${JSON.stringify(data)}`);
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        exportKey = data.outData;
        expect(data.errorCode == Type).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test finish err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicAbortFunc(handle, HuksOptions, Type) {
  await huks
    .abort(handle, HuksOptions)
    .then((data) => {
      console.log(`test abort data: ${JSON.stringify(data)}`);
      if (Type !== 0) {
        expect(data.errorCode == Type).assertTrue();
      } else {
        expect(data.errorCode == Type).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test abort err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicDeleteKeyFunc(KeyAlias, HuksOptions, Type) {
  await huks
    .deleteKey(KeyAlias, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${JSON.stringify(data)}`);
      if (Type == 'Fail') {
        expect(data.errorCode !== 0).assertTrue();
      } else {
        expect(data.errorCode == 0).assertTrue();
      }
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

async function publicSignVerify(srcKeyAlias, HuksOptions, Type) {
  HuksOptions.properties.splice(
    1,
    1,
    HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
  );
  HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);

  await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
  HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
  HuksOptions.properties.splice(2, 1);

  await publicInitFunc(srcKeyAlias, HuksOptions, Type);
  await publicUpdateFunc(handle, HuksOptions, Type);
  HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
  await publicFinishFunc(handle, HuksOptions, Type);
  HuksOptions.properties.splice(
    1,
    1,
    HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
  );
  await publicExportKey(srcKeyAlias, HuksOptions, Type);
}

describe('SecurityHuksAbnormalSignVerifyJsunit', function () {
  beforeEach(function () {
    handle = {};
    HuksOptions = {
      properties: new Array(
        HuksSignVerifyDSA.HuksKeyAlgDSA,
        HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
        HuksSignVerifyDSA.HuksTagDSADigestSHA1
      ),
      inData: srcData63Kb,
    };
  });
  it('security_huks_third_abnormal_signVerify_1013', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1013';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    await publicInitFunc(srcKeyAlias, HuksOptions, -13);
    await publicUpdateFunc(handle, HuksOptions, -14);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1014', 0, async function (done) {
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    await publicUpdateFunc(handle, HuksOptions, -14);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1015', 0, async function (done) {
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1016', 0, async function (done) {
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1017', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1017';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1018', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1018';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1019', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1019';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1020', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1020';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1021', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1021';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1022', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1022';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);
    await publicAbortFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1023', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1023';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1024', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1024';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);
    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1025', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1025';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);
    await publicAbortFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1026', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1026';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1027', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1027';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });
  it('security_huks_third_abnormal_signVerify_1028', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1028';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1029', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1029';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1030', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1030';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);

    await publicUpdateFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1031', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1031';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, -14);
    await publicFinishFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1032', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1032';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, -14);
    await publicAbortFunc(handle, HuksOptions, -14);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });
  it('security_huks_third_abnormal_signVerify_1033', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1033';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);

    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1034', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1034';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicAbortFunc(handle, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1035', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1035';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1036', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1036';
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
    await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN
    );
    HuksOptions.properties.splice(2, 1);
    await publicInitFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    HuksOptions.outData = new Uint8Array(new Array(1024).fill(''));
    await publicFinishFunc(handle, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1038', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1038';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );

    await publicUpdateFunc(handle, HuksOptions, -2);

    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1039', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1039';

    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );

    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });
  it('security_huks_third_abnormal_signVerify_1040', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1040';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1041', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1041';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1041';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);

    let updateOutdate = HuksOptions.outData;
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -31);
    HuksOptions.outData = updateOutdate;
    await publicUpdateFunc(handle, HuksOptions, -2);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1042', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1042';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1042';

    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );

    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    let updateOutdate = HuksOptions.outData;
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.outData = updateOutdate;
    await publicUpdateFunc(handle, HuksOptions, -2);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1043', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1043';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1043';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1044', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1044';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1044';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1045', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1045';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1045';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1046', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1046';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1046';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1047', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1047';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1047';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1048', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1048';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1048';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1049', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1049';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1049';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1050', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1050';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1050';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1051', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1051';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1051';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1052', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1052';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1052';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1053', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1053';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1053';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1054', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1054';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1054';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1055', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1055';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1055';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);

    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    await publicFinishFunc(handle, HuksOptions, -2);

    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1056', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1056';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1056';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1057', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1057';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1057';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    let updateOutdate = HuksOptions.outData;
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -31);
    HuksOptions.inData = srcData63Kb;
    HuksOptions.outData = updateOutdate;
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1058', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1058';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1058';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    let updateOutdate = HuksOptions.outData;
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.inData = srcData63Kb;
    HuksOptions.outData = updateOutdate;
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1059', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1059';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1059';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.inData = srcData64Kb;
    await publicUpdateFunc(handle, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    await publicUpdateFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1060', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1060';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1060';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
    await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    await publicUpdateFunc(handle, HuksOptions, 0);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1061', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1061';
    const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1061';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicInitFunc(newSrcKeyAlias, HuksOptions, -13);
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1062', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1062';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    await publicUpdateFunc(handle, HuksOptions, -2);
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1063', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1063';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    HuksOptions.outData = exportKey;
    await publicFinishFunc(handle, HuksOptions, -2);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });

  it('security_huks_third_abnormal_signVerify_1064', 0, async function (done) {
    const srcKeyAlias = 'security_huks_third_abnormal_signVerify_1064';
    await publicSignVerify(srcKeyAlias, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY
    );
    HuksOptions.properties.splice(
      -1,
      0,
      HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
    );
    HuksOptions.outData = exportKey;
    await publicAbortFunc(handle, HuksOptions, 0);
    HuksOptions.properties.splice(
      1,
      1,
      HuksSignVerifyDSA.HuksKeyRSAPurposeSING_VERIFY
    );
    await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
    done();
  });
});
