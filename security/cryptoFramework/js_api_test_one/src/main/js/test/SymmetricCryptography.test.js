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
import * as symPromise from "./utils/symmetric/publicSymmetricPromise";
import * as symCallback from "./utils/symmetric/publicSymmetricCallback";

export default function SymmetricCryptographyJsunit() {
  describe("SymmetricCryptographyJsunit", function () {
    console.info("##########start SymmetricCryptographyJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0100
     * @tc.name Test AES128|GCM|PKCS7 normal encryption and decryption
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0100",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalProcess(
            "AES128",
            "AES128|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0700
     * @tc.name Test AES256|0FB|PKCS7 normal encryption and decryption
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_0700",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalProcess(
            "AES256",
            "AES256|OFB|PKCS7",
            "genIvParamsSpec"
          )
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_0700 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_2100
     * @tc.name Test AES128|GCM|PKCS7 convertKey encryption and decryption
     * @tc.desc Use the Callback Style of Interface
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_2100",
      0,
      async function (done) {
        await symCallback
          .convertKeyEncryptAndDecryptProcess(
            "AES128",
            "AES128|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_2100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_2300
     * @tc.name Test AES256|GCM|PKCS7 convertKey encryption and decryption
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_2300",
      0,
      async function (done) {
        await symPromise
          .convertKeyEncryptAndDecryptProcess(
            "AES256",
            "AES256|GCM|PKCS7",
            "genGcmParamsSpec"
          )
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_2300 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_3700
     * @tc.name Test clearMem interface
     * @tc.desc Use the Promise Style of Interface
     */
    it(
      "Security_crypto_framework_Symmetric_Encryption_AES_3700",
      0,
      async function (done) {
        await symPromise
          .ClearMemProcess("AES256")
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_crypto_framework_Symmetric_Encryption_AES_3700 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );
  });
}
