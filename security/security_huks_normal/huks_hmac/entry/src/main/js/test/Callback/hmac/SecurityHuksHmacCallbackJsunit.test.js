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
import { HuksHmac } from '../../../../../../../../utils/param/hmac/publicHmacParam.js';
import { stringToArray } from '../../../../../../../../utils/param/publicFunc';
import Data from '../../../../../../../../utils/data.json';

var handle = {};
let srcData63Kb = Data.Date63KB;
let srcData65Kb = Data.Date65KB;

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log(
            'test generateKey err information: ' + JSON.stringify(err)
          );
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test generateKey err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function init(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.init(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test init err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          handle = {
            handle1: data.handle1,
            handle2: data.handle2,
          };
          resolve(data);
        }
      } catch (e) {
        console.log('test init err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function update(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.update(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test update err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test update err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function finish(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.finish(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test finish err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test finish err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function abort(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.abort(handle, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test abort err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test abort err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code !== 0) {
          console.log('test deleteKey err information: ' + JSON.stringify(err));
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.log('test deleteKey err information: ' + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

async function publicHmacUpdate(HuksOptions) {
  let dateSize = 64 * 1024;
  let tempHuksOptionsInData = HuksOptions.inData;
  let inDataArray = stringToArray(HuksOptions.inData);

  if (HuksOptions.inData.length <= dateSize) {
    HuksOptions.inData = new Uint8Array(inDataArray);
    await update(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data: ${data}`);
      })
      .catch((err) => {
        console.log('test update err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
    HuksOptions.inData = tempHuksOptionsInData;
  } else {
    let count = Math.floor(inDataArray.length / dateSize);
    let remainder = inDataArray.length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(tempHuksOptionsInData).slice(
          dateSize * i,
          dateSize * (i + 1)
        )
      );
      await update(handle, HuksOptions)
        .then((data) => {
          console.log(`test update data: ${data}`);
        })
        .catch((err) => {
          console.log('test update err information: ' + JSON.stringify(err));
          expect(null).assertFail();
        });
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(tempHuksOptionsInData).slice(
          dateSize * count,
          inDataArray.length
        )
      );
      await update(handle, HuksOptions)
        .then((data) => {
          console.log(`test update data: ${data}`);
        })
        .catch((err) => {
          console.log('test update err information: ' + JSON.stringify(err));
          expect(null).assertFail();
        });
    }
  }
}

async function publicHmacGenFunc(srcKeyAlies, HuksOptions, thirdInderfaceName) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log('test generateKey data = ' + JSON.stringify(data));
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });

  HuksOptions.properties.splice(1, 1);
  await init(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test init data: ${JSON.stringify(data)}`);
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
  await publicHmacUpdate(HuksOptions);

  if (thirdInderfaceName == 'finish') {
    HuksOptions.inData = new Uint8Array(stringToArray('0'));
    await finish(handle, HuksOptions)
      .then((data) => {
        console.log(`test update data: ${data}`);
      })
      .catch((err) => {
        console.log('test update err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  } else {
    await abort(handle, HuksOptions)
      .then((data) => {
        console.log(`test abort data: ${data}`);
      })
      .catch((err) => {
        console.log('test abort err information: ' + JSON.stringify(err));
        expect(null).assertFail();
      });
  }
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data: ${data}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log('test deleteKey err information: ' + JSON.stringify(err));
      expect(null).assertFail();
    });
}

describe('SecurityHuksHmacCallbackJsunit', function () {
  it('testHmacDigestSHA1001', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA1KeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA1
      ),
      inData: srcData63Kb,
    };

    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA1002', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA1KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA1
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA1003', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA1KeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA1
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA1004', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA1KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA1
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA224001', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA224KeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA224
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA224002', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA224KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA224
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA224003', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA224KeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA224
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA224004', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA224KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA224
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA256001', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA256KeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA256
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA256002', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA256KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA256
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA256003', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA256KeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA256
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA256004', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA256
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA384001', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA384KeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA384
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA384002', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA384KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA384
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA384003', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA384KeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA384
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA384004', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA384KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA384
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });
  it('testHmacDigestSHA512001', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA512KeyAlias001';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA512
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA512002', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA512KeyAlias002';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA512
      ),
      inData: srcData63Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'abort');
    done();
  });

  it('testHmacDigestSHA512003', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA512KeyAlias003';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA512
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });

  it('testHmacDigestSHA512004', 0, async function (done) {
    let srcKeyAlies = 'testHmacDigestSHA512KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksHmac.HuksKeyAlg,
        HuksHmac.HuksKeyPurpose,
        HuksHmac.HuksTagDigestSHA512
      ),
      inData: srcData65Kb,
    };
    await publicHmacGenFunc(srcKeyAlies, HuksOptions, 'finish');
    done();
  });
});
