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

import { describe, it, expect } from 'deccjsunit/index';
import huks from '@ohos.security.huks';
import Data from '../../../../../../../utils/data.json';

var handle = {};
var handle1;
var handle2;
let srcData63Kb = Data.Date63KB;
let HksKeyPurpose = {
  HKS_KEY_PURPOSE_MAC: 128,
};

let HksKeyAlg = {
  HKS_ALG_HMAC: 50,
};

let HksTagType = {
  HKS_TAG_TYPE_UINT: 2 << 28,
  HKS_TAG_TYPE_ERROR: 6 << 28,
};

let HksTag = {
  HKS_TAG_ALGORITHM: HksTagType.HKS_TAG_TYPE_UINT | 1,
  HKS_TAG_ERROR: HksTagType.HKS_TAG_TYPE_ERROR | 1,
  HKS_TAG_PURPOSE: HksTagType.HKS_TAG_TYPE_UINT | 2,
  HKS_TAG_KEY_SIZE: HksTagType.HKS_TAG_TYPE_UINT | 3,
  HKS_TAG_DIGEST: HksTagType.HKS_TAG_TYPE_UINT | 4,
};

let HksKeyDigest = {
  HKS_DIGEST_NONE: 0,
  HKS_DIGEST_SHA1: 10,
  HKS_DIGEST_SHA224: 11,
  HKS_DIGEST_SHA256: 12,
  HKS_DIGEST_SHA384: 13,
  HKS_DIGEST_SHA512: 14,
};

let HksKeySize = {
  HKS_RSA_KEY_SIZE_512: 512,
};

let HuksHmac = {
  HuksKeyAlg: { tag: HksTag.HKS_TAG_ALGORITHM, value: HksKeyAlg.HKS_ALG_HMAC },
  HuksKeyTAGERROR: { tag: HksTag.HKS_TAG_ERROR, value: HksKeyAlg.HKS_ALG_HMAC },
  HuksKeyPurpose: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value: HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeySIZE: {
    tag: HksTag.HKS_TAG_KEY_SIZE,
    value: HksKeySize.HKS_RSA_KEY_SIZE_512,
  },
  HuksTagDigestSHA1: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksTagDigestSHA224: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA224,
  },
  HuksTagDigestSHA256: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA256,
  },
  HuksTagDigestSHA384: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA384,
  },
  HuksTagDigestSHA512: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA512,
  },
  HuksKeyAlgECDH: {
    tag: HksTag.HKS_TAG_ALGORITHM,
    value: HksKeyAlg.HKS_ALG_ECDH,
  },
  HuksKeyAlgHMAC: {
    tag: HksTag.HKS_TAG_ALGORITHM,
    value: HksKeyAlg.HKS_ALG_HMAC,
  },
  HuksKeyPurposeHMAC: {
    tag: HksTag.HKS_TAG_PURPOSE,
    value: HksKeyPurpose.HKS_KEY_PURPOSE_MAC,
  },
  HuksKeyDIGESTSHA_1: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_SHA1,
  },
  HuksKeyDIGESTNONE: {
    tag: HksTag.HKS_TAG_DIGEST,
    value: HksKeyDigest.HKS_DIGEST_NONE,
  },
};

function stringToArray(str) {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

async function publicHmacGenFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await huks
    .generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test generateKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
  HuksOptions.properties.splice(1, 1);
}

async function publicHmacInitFunc(srcKeyAlies, HuksOptions, errorcode) {
  console.log(
    `test publicHmacInitFunc HuksOptions ${JSON.stringify(HuksOptions)}`
  );
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log('test init data' + JSON.stringify(data));
      handle1 = data.handle1;
      handle2 = data.handle2;
      handle = {
        handle1: handle1,
        handle2: handle2,
      };
      console.log('test init data.errorCode ' + data.errorCode);
      console.log('test init errorcode ' + errorcode);
      expect(data.errorCode).assertEqual(errorcode);
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
}

async function publicHmacUpdateFunc(HuksOptions, errorCode) {
  let dateSize = 64 * 1024;
  let _HuksOptions_inData = HuksOptions.inData;
  let inDataArray = stringToArray(HuksOptions.inData);
  if (inDataArray.length < dateSize) {
    HuksOptions.inData = new Uint8Array(inDataArray);
    await update(handle, HuksOptions, errorCode);
    HuksOptions.inData = _HuksOptions_inData;
  } else {
    let count = Math.floor(inDataArray.length / dateSize);
    let remainder = inDataArray.length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(_HuksOptions_inData).slice(
          dateSize * i,
          dateSize * (i + 1)
        )
      );
      await update(handle, HuksOptions, errorCode);
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(_HuksOptions_inData).slice(
          dateSize * count,
          inDataArray.length
        )
      );
      await update(handle, HuksOptions, errorCode);
    }
  }
}

async function publicHmacDelete(srcKeyAlies, HuksOptions) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
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

async function update(handle, HuksOptions, errorcode) {
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      console.log('test update data.errorCode ' + data.errorCode);
      console.log('test update errorcode ' + errorcode);
      expect(data.errorCode).assertEqual(errorcode);
    })
    .catch((err) => {
      console.log('test update err information: ' + err);
      expect(null).assertFail();
    });
}

describe('errorCodeHmac', function () {
  it('security_huks_third_errorCode_1004', 0, async function (done) {
    let srcKeyAlies_1 = 'testErrorCodeHmacAlias_01_004';
    let HuksOptions1 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        { tag: HksTag.HKS_TAG_DIGEST, value: 100 }
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions1);
    await publicHmacInitFunc(srcKeyAlies_1, HuksOptions2, -3);
    await publicHmacDelete(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1010', 0, async function (done) {
    let srcKeyAlies_1 = 'testErrorCodeHmacAlias_01_010';
    let srcKeyAlies_2 = 'security_huks_third_errorCode_Exceptions_1010';
    let HuksOptions1 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions1);
    await publicHmacInitFunc(srcKeyAlies_2, HuksOptions1, -13);
    await publicHmacDelete(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1011', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_011';
    let HuksOptions1 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions1);
    await publicHmacInitFunc(srcKeyAlies_1, HuksOptions2, -1);
    await publicHmacDelete(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1012', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_012';
    let HuksOptions1 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions1);
    await publicHmacInitFunc(srcKeyAlies_1, HuksOptions2, -1);
    await publicHmacDelete(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1013', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_013';
    let HuksOptions1 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    let HuksOptions2 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        { tag: HksTag.HKS_TAG_PURPOSE, value: 384 },
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions1);
    await publicHmacInitFunc(srcKeyAlies_1, HuksOptions2, -1);
    await publicHmacDelete(srcKeyAlies_1, HuksOptions1);
    done();
  });

  it('security_huks_third_errorCode_1015', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_015';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions);
    HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };
    await publicHmacInitFunc(srcKeyAlies_1, HuksOptions, -1);
    done();
  });

  it('security_huks_third_errorCode_1029', 0, async function (done) {
    let srcKeyAlies_1 = 'testAgreeDHKeyAlias_01_029';
    let HuksOptions1 = {
      properties: new Array(
        HuksHmac.HuksKeyAlgHMAC,
        HuksHmac.HuksKeyPurposeHMAC,
        HuksHmac.HuksKeyDIGESTSHA_1
      ),
      inData: srcData63Kb,
    };

    await publicHmacGenFunc(srcKeyAlies_1, HuksOptions1);
    await publicHmacInitFunc(srcKeyAlies_1, HuksOptions1, 0);
    handle = {
      handle1: -388552545,
      handle2: 124830659,
    };
    await publicHmacUpdateFunc(HuksOptions1, -2);
    await publicHmacDelete(srcKeyAlies_1, HuksOptions1);
    done();
  });
});
