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
    testEncryptionDecryptionPromise,
    testEncryptionDecryptionConvertKeyPromise,
    testClearMemPromise
} from "./utils/symmetric/publicSymmetricPromise";
import { testEncryptionDecryptionCallback, testClearMemCallback } from "./utils/symmetric/publicSymmetricCallback";

export default function SymmetricCryptographyJsunit() {
    describe("SymmetricCryptographyJsunit", function () {
        console.info("##########start SymmetricCryptographyJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

        /**
         * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_3700
         * @tc.name Test clearMem interface
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_Symmetric_Encryption_AES_3700",
            0,
            async function (done) {
                await testClearMemPromise("AES256");
                done();
            }
        );
        
        /**
         * @tc.number Security_crypto_framework_Symmetric_Encryption_AES_0100
         * @tc.name Test AES128|GCM|PKCS7 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
         it(
            "Security_crypto_framework_Symmetric_Encryption_AES_0100",
            0,
            async function (done) {
                testEncryptionDecryptionPromise("AES128", "AES128|GCM|PKCS7", "genGcmParamsSpec");
                done();
            }
        );
    });
}
