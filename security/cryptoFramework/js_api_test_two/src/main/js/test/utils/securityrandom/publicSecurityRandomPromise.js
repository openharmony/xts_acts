/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { expect } from "@ohos/hypium";
import cryptoFramework from "@ohos.security.cryptoFramework";
import {
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  uInt8ArrayToString,
} from "../common/publicDoString";

async function testSecurityRandomPromise(length) {
  var rand;

  return new Promise((resolve, reject) => {
    rand = cryptoFramework.createRandom();
    expect(rand != null).assertTrue();
    rand
      .generateRandom(length)
      .then((randData) => {
        expect(randData != null).assertTrue();
        console.log(
          "[Promise] rand result first:" + uInt8ArrayToShowStr(randData.data)
        );
        let result = rand.setSeed(randData);
        return result;
      })
      .then(() => {
        console.log("[Promise] rand set Seed is success！");
      })
      .catch((err) => {
        console.error("[promise]catch err1:" + err);
        reject(err);
      });

    rand
      .generateRandom(length)
      .then((randData) => {
        expect(randData != null).assertTrue();
        console.log(
          "[Promise] rand result second: " + uInt8ArrayToShowStr(randData.data)
        );
        resolve();
      })
      .catch((err) => {
        console.error("[promise]catch err2:" + err);
        reject(err);
      });
  });
}

function testSecurityRandomEnumPromise() {
  expect(401).assertEqual(cryptoFramework.Result.INVALID_PARAMS);
  expect(801).assertEqual(cryptoFramework.Result.NOT_SUPPORT);
  expect(17620001).assertEqual(cryptoFramework.Result.ERR_OUT_OF_MEMORY);
  expect(17620002).assertEqual(cryptoFramework.Result.ERR_RUNTIME_ERROR);
  expect(17630001).assertEqual(cryptoFramework.Result.ERR_CRYPTO_OPERATION);
  expect(17630002).assertEqual(
    cryptoFramework.Result.ERR_CERT_SIGNATURE_FAILURE
  );
  expect(17630003).assertEqual(cryptoFramework.Result.ERR_CERT_NOT_YET_VALID);
  expect(17630004).assertEqual(cryptoFramework.Result.ERR_CERT_HAS_EXPIRED);
  expect(17630005).assertEqual(
    cryptoFramework.Result.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY
  );
  expect(17630006).assertEqual(cryptoFramework.Result.ERR_KEYUSAGE_NO_CERTSIGN);
  expect(17630007).assertEqual(
    cryptoFramework.Result.ERR_KEYUSAGE_NO_DIGITAL_SIGNATURE
  );
  expect(0).assertEqual(cryptoFramework.EncodingFormat.FORMAT_DER);
  expect(1).assertEqual(cryptoFramework.EncodingFormat.FORMAT_PEM);
  expect(0).assertEqual(cryptoFramework.CryptoMode.ENCRYPT_MODE);
  expect(1).assertEqual(cryptoFramework.CryptoMode.DECRYPT_MODE);
}

export { testSecurityRandomPromise, testSecurityRandomEnumPromise };
