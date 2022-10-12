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

import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium";
import {
  testHMACDigestPromise,
  testMDDigestPromise,
} from "./utils/digestalgorithm/publicDigestPromise";
import {
  testHMACDigestCallback,
  testMDDigestCallback,
} from "./utils/digestalgorithm/publicDigestCallback";

export default function DigestAlgorithmJsunit() {
  describe("DigestAlgorithmJsunit", function () {
    console.info("##########start DigestAlgorithmJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_MD_0100
     * @tc.name Test MD5 for MD digest algotithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_MD_0100", 0, async function (done) {
      await testMDDigestPromise("MD5")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0500
     * @tc.name Test SHA384 for MD digest algotithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0500", 0, async function (done) {
      await testMDDigestCallback("SHA384")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0100
     * @tc.name Test SHA1 for HMAC digest algorithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_HMAC_0100", 0, async function (done) {
      await testHMACDigestCallback("SHA1", "AES128")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0200
     * @tc.name Test SHA1 for HMAC digest algorithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0200", 0, async function (done) {
      await testHMACDigestPromise("SHA224", "AES192")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });
  });
}
