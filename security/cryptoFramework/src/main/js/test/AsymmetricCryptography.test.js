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
    testAsyKeyEncryptDecryptPromise,
    testAsyKeySignVerifyPromise,
    testAsyKeyECDHPromise,
    testAsyKeyConvertKeyPromise,
    testAsyKeyPriKeyClearPromise,
} from "./utils/asymmetric/publicAsymmetricPromise";


export default function AsymmetricCryptographyJsunit() {
    describe("AsymmetricCryptographyJsunit", function () {
        console.info("##########start AsymmetricCryptographyJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0100
         * @tc.name Test RSA1024|PRIMES_2 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0100",
            0,
            async function (done) {
                testAsyKeyEncryptDecryptPromise("RSA1024|PRIMES_2", "RSA1024|PKCS1|SHA256");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0200
         * @tc.name Test RSA2048|PRIMES_2 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0200",
            0,
            async function (done) {
                testAsyKeyEncryptDecryptPromise("RSA2048|PRIMES_2", "RSA2048|PKCS1|MD5");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0100
         * @tc.name Test RSA1024|PKCS1|MD5 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0100",
            0,
            async function (done) {
                testAsyKeySignVerifyPromise("RSA1024|PRIMES_2", "RSA1024|PKCS1|MD5");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0200
         * @tc.name Test RSA2048|PKCS1|SHA1 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0200",
            0,
            async function (done) {
                testAsyKeySignVerifyPromise("RSA2048|PRIMES_2", "RSA2048|PKCS1|SHA1");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100
         * @tc.name Test ECC224 SignVerify ECDH
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100",
            0,
            async function (done) {
                testAsyKeyECDHPromise("ECC224");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200
         * @tc.name Test ECC256 SignVerify ECDH
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200",
            0,
            async function (done) {
                testAsyKeyECDHPromise("ECC256");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3300
         * @tc.name Test convertKey
         * @tc.desc Use RSA3072|PRIMES_2 algorithm
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_3300",
            0,
            async function (done) {
                testAsyKeyConvertKeyPromise("RSA3072|PRIMES_2");
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3100
         * @tc.name Test convertKey
         * @tc.desc Use RSA1024|PRIMES_2 algorithm
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_3100",
            0,
            async function (done) {
                testAsyKeyPriKeyClearPromise("RSA1024|PRIMES_2");
                done();
            }
        );
    });
}
