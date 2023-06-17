/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCommon from "./utils/common/publicDoSpec";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecuritySignatureVerificationJsunit() {
  describe("SecuritySignatureVerificationJsunit", function () {
    console.log(
      "##########start SecuritySignatureVerificationJsunit##########"
    );
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0100
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the RSAKeyPar structure with a signature verification type of "RSA512|PKCS1|MD5"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0100",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA512|PKCS1|MD5"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0200
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec after init Sign/Verify object
     * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA768|PSS|SHA1|MGF1_SHA1", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0200",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA768|PSS|SHA1|MGF1_SHA1",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0300
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec before init Sign/Verify object
     * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA1024|PSS|SHA224|MGF1_SHA224", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0300",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PSS|SHA224|MGF1_SHA224",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0400
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec after init Sign/Verify object
     * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA2048|PSS|SHA256|MGF1_SHA256", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0400",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA2048|PSS|SHA256|MGF1_SHA256",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0500
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec before init Sign/Verify object
     * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA3072|PSS|SHA384|MGF1_SHA384", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0500",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA3072|PSS|SHA384|MGF1_SHA384",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0600
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec after init Sign/Verify object
     * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA4096|PSS|SHA512|MGF1_SHA512", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0600",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA4096|PSS|SHA512|MGF1_SHA512",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0700
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec before init Sign/Verify object
     * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA8192|PSS|SHA512|MGF1_SHA512", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0700",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA8192|PSS|SHA512|MGF1_SHA512",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0800
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the RSAKeyPar structure with a signature verification type of "RSA|PKCS1|MD5"
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0800",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyBySpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA|PKCS1|MD5"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_0900
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec before init Sign/Verify object
     * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA|PSS|SHA256|MGF1_SHA256", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_0900",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA|PSS|SHA256|MGF1_SHA256",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1000
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec after init Sign/Verify object
     * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA|PSS|SHA384|MGF1_SHA384", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1000",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA|PSS|SHA384|MGF1_SHA384",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1100
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec before init Sign/Verify object
     * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA|PSS|SHA512|MGF1_SHA512", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1100",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA|PSS|SHA512|MGF1_SHA512",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "asyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1200
     * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
     * and Signature verification combination scenario testing
     * and set Sign/Verify spec after init Sign/Verify object
     * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
     * "RSA|PSS|SHA224|MGF1_SHA224", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
     * and parameter 32
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1200",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifySetAndGetSpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA|PSS|SHA224|MGF1_SHA224",
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            32
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1300
     * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC256|SHA256"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1300",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genEccCommonSpec(),
            "ECC256|SHA256"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1400
     * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the ECCKeyPair structure with a signature verification type of "ECC|SHA224"(No length)
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1400",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyBySpecProcess(
            asyCommon.genEccCommonSpec(),
            "ECC|SHA224"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1500
     * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC224|SHA256"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1500",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genEccCommonSpec(),
            "ECC224|SHA256"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1600
     * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC384|SHA224"
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1600",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyBySpecProcess(
            asyCommon.genEccCommonSpec(),
            "ECC384|SHA224"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1700
     * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC521|SHA256"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1700",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genEccCommonSpec(),
            "ECC521|SHA256"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1800
     * @tc.name Use createAsyKeyGenerator to Create DSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the DSAKeyPar structure with a signature verification type of "DSA|SHA1"
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1800",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA|SHA1"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1900
     * @tc.name Use createAsyKeyGenerator to Create DSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the DSAKeyPar structure with a signature verification type of "DSA|SHA224"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1900",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA|SHA224"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2000
     * @tc.name Use createAsyKeyGenerator to Create DSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the DSAKeyPar structure with a signature verification type of "DSA1024|SHA224"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2000",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA1024|SHA224"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2100
     * @tc.name Use createAsyKeyGenerator to Create DSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the DSAKeyPar structure with a signature verification type of "DSA2048|SHA256"
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2100",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA2048|SHA256"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2200
     * @tc.name Use createAsyKeyGenerator to Create DSA asyKeySpec
     * and Signature verification combination scenario testing
     * @tc.desc Pass in the DSAKeyPar structure with a signature verification type of "DSA3072|SHA384"
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2200",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA3072|SHA384"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2300
     * @tc.name Scenario testing of signature verification and key generation and conversion combination
     * @tc.desc Pass in key generation parameter "DSA1024|PRIMES_2",
     * signature verification parameter "DSA1024|SHA1",
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2300",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyNormalProcess("DSA1024", "DSA1024|SHA1")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2400
     * @tc.name Scenario testing of signature verification and key generation and conversion combination
     * @tc.desc Pass in key generation parameter "DSA2048|PRIMES_2",
     * signature verification parameter "DSA2048|SHA256",
     * and use a callback style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2400",
      0,
      async function (done) {
        await asyCallback
          .signAndVerifyNormalProcess("DSA2048", "DSA2048|SHA256")
          .then((result) => {
            expect(result == true).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2500
     * @tc.name Scenario testing of signature verification and key generation and conversion combination
     * @tc.desc Pass in key generation parameter "DSA3072|PRIMES_2",
     * signature verification parameter "DSA3072|SHA384",
     * and use a promise style interface
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2500",
      0,
      async function (done) {
        await asyPromise
          .signAndVerifyNormalProcess("DSA3072", "DSA3072|SHA384")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise signAndVerifyNormalProcess catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2600
     * @tc.name Exception in creating signature object
     * @tc.desc Pass in an exception parameter "RSA10000|PKCS1|SHA224" and call it as a synchronously
     * @tc.desc Pass in an exception parameter null and call it as a synchronously
     * @tc.desc Pass in an exception parameter "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5" and
     * call it as a synchronously
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2600",
      0,
      async function (done) {
        try {
          cryptoFramework.createSign("RSA10000|PKCS1|SHA224");
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_2600 1 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          cryptoFramework.createSign(null);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_2600 2 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          cryptoFramework.createSign(
            "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5"
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_2600 3 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2700
     * @tc.name Exception while initializing rsa signature object
     * @tc.desc Pass in an exception parameter null and call it as a async
     * @tc.desc Pass in the two public keys generated by the exception parameter rsa and call them as async
     * @tc.desc Pass in the public key generated by the exception parameter dsa and call it as a async
     * @tc.desc Pass in an exception parameter "sroundpriKey" and call it as a async
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2700",
      0,
      async function (done) {
        let specGenerator = cryptoFramework.createAsyKeyGeneratorBySpec(
          asyCommon.genRsa2048KeyPairSpec()
        );
        let signGenerator = cryptoFramework.createSign("RSA1024|PKCS1|SHA224");
        let signKeyPair;
        await new Promise((resolve, reject) => {
          specGenerator.generateKeyPair((err, keyPair) => {
            if (err) {
              reject(err);
            } else {
              signKeyPair = keyPair;
              resolve();
            }
          });
        });

        try {
          signGenerator.init(null);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }

        try {
          signGenerator.init(signKeyPair.priKey, signKeyPair.priKey);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }

        let dsaGenerator = cryptoFramework.createAsyKeyGeneratorBySpec(
          asyCommon.genDsa2048KeyPairSpecBigE()
        );
        let dsaKeyPair;
        await new Promise((resolve, reject) => {
          dsaGenerator.generateKeyPair((err, keyPair) => {
            if (err) {
              reject(err);
            } else {
              dsaKeyPair = keyPair;
              resolve();
            }
          });
        });
        try {
          await signGenerator.init(dsaKeyPair.pubKey);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }

        try {
          signGenerator.init("sroundpriKey");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }

        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2800
     * @tc.name Exception in adding signature data to rsa objects
     * @tc.desc Call it as a promise without passing in parameters
     * @tc.desc Pass in two exception parameters "This is a sign test" and "This is a sign test"
     * and call them as promise
     * @tc.desc Pass in an exception parameter null and call it as a promise
     * @tc.desc Pass in an exception parameter of "This is a sign test" multiplied by 1000 times and call it promise
     * @tc.desc The signature object was not initialized, and the data to be signed "This is a sign test"
     * was passed in as a promise to be called
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2800",
      0,
      async function (done) {
        await asyPromise
          .updateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            0
          )
          .then((data) => {
            console.log("data 1 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise updateAbnormalParameterProcess 1 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .updateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            1
          )
          .then((data) => {
            console.log("data 2 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise updateAbnormalParameterProcess 2 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .updateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            2
          )
          .then((data) => {
            console.log("data 3 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise updateAbnormalParameterProcess 3 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .updateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            3
          )
          .then((data) => {
            console.log("data 4 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise updateAbnormalParameterProcess 4 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .updateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            4
          )
          .then((data) => {
            console.log("data 5 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise updateAbnormalParameterProcess 5 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2900
     * @tc.name Signature data anomaly
     * @tc.desc Pass in an exception parameter "This is a sign test" and "This is a sign test"
     * call it in the form of a callback
     * @tc.descPass in an exception parameter null and call it as a callback
     * @tc.desc Pass in an exception parameter "" and call it as a callback
     * @tc.desc The signature object was not initialized, and the data to be signed 'This is a sign test'
     * was passed in as a callback to be called
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2900",
      0,
      async function (done) {
        await asyCallback
          .signAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            0
          )
          .then((data) => {
            console.log("data 1 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAbnormalParameterProcess 1 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyCallback
          .signAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            1
          )
          .then((data) => {
            console.log("data 2 : " + data);
            expect(data != null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAbnormalParameterProcess 2 catch error: " + err
            );
            expect(err.code == undefined).assertTrue();
          });

        await asyCallback
          .signAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            2
          )
          .then((data) => {
            console.log("data 3 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAbnormalParameterProcess 3 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyCallback
          .signAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            3
          )
          .then((data) => {
            console.log("data 4 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback signAbnormalParameterProcess 4 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3000
     * @tc.name Exception in signature setting parameter mode
     * @tc.desc Pass in exception parameter mode 1024, parameter 2, and call it synchronously
     * @tc.desc Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
     * parameter 4294967296, and call it synchronously
     * @tc.desc Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, parameter "string",
     * and call it synchronously
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3000",
      0,
      async function (done) {
        let signGenerator = cryptoFramework.createSign(
          "RSA1024|PSS|SHA224|MGF1_SHA224"
        );
        try {
          signGenerator.setSignSpec(1024, 2);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3100 1 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          signGenerator.setSignSpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            4294967296
          );
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3100 2 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          signGenerator.setSignSpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            "string"
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3100 5 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3100
     * @tc.name Exception in signature getting parameter mode
     * @tc.desc Pass in exception parameter mode 10000, and call it synchronously
     * @tc.desc Pass in exception parameter mode 6, and call it synchronously
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3100",
      0,
      async function (done) {
        let signGenerator = cryptoFramework.createSign(
          "RSA1024|PSS|SHA224|MGF1_SHA224"
        );

        try {
          signGenerator.getSignSpec(10000);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3100 1 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          signGenerator.getSignSpec(6);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3100 4 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3200
     * @tc.name Abnormal situation of creating verification objects
     * @tc.desc Pass in an exception parameter "RSA10000|SHA224" and call it as a synchronously
     * @tc.desc Pass in an exception parameter null and call it as a synchronously
     * @tc.desc Pass in an exception parameter "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5" and
     * call it as a synchronously
     * @tc.desc Pass in an exception parameter "DSA512|PKCS1|MD5" and call it as a synchronously
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3200",
      0,
      async function (done) {
        try {
          cryptoFramework.createVerify("RSA10000|SHA224");
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 1 catch err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          cryptoFramework.createVerify(null);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 2 catch err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          cryptoFramework.createVerify(
            "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5"
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 3 catch err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          cryptoFramework.createVerify("DSA512|PKCS1|MD5");
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 5 catch err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3300
     * @tc.name Abnormal situation of initialization verification object
     * @tc.desc Pass in an exception parameter null and call it as a async
     * @tc.desc Pass in the two public keys generated by the exception parameter rsa and call them as async
     * @tc.desc Pass in the public key generated by the exception parameter dsa and call it as a async
     * @tc.desc Pass in an exception parameter "sroundpriKey" and call it as a async
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3300",
      0,
      async function (done) {
        let specGenerator = cryptoFramework.createAsyKeyGeneratorBySpec(
          asyCommon.genRsa2048KeyPairSpec()
        );
        let verifyGenerator = cryptoFramework.createVerify(
          "RSA1024|PKCS1|SHA224"
        );
        let verifyKeyPair;
        await new Promise((resolve, reject) => {
          specGenerator.generateKeyPair((err, keyPair) => {
            if (err) {
              reject(err);
            } else {
              verifyKeyPair = keyPair;
              resolve();
            }
          });
        });

        try {
          verifyGenerator.init(null);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        try {
          verifyGenerator.init(verifyKeyPair.pubKey, verifyKeyPair.pubKey);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        let dsaGenerator = cryptoFramework.createAsyKeyGeneratorBySpec(
          asyCommon.genDsa2048KeyPairSpecBigE()
        );
        let dsaKeyPair;
        await new Promise((resolve, reject) => {
          dsaGenerator.generateKeyPair((err, keyPair) => {
            if (err) {
              reject(err);
            } else {
              dsaKeyPair = keyPair;
              resolve();
            }
          });
        });
        try {
          await verifyGenerator.init(dsaKeyPair.pubKey);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        try {
          verifyGenerator.init("sroundpriKey");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3400
     * @tc.name Abnormal situation of additional signature verification data
     * @tc.desc Call it as a promise without passing in parameters
     * @tc.desc Pass in an exception parameter null and call it as a promise
     * @tc.desc Pass in an exception parameter "" and call it as a promise
     * @tc.desc Pass in two exception parameters "This is a sign test" and "This is a sign test"
     * and call them as promise
     * @tc.desc The verify object was not initialized, and the data to be signed "This is a sign test"
     * was passed in as a promise to be called
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3400",
      0,
      async function (done) {
        await asyPromise
          .verifyUpdateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            0
          )
          .then((data) => {
            console.log("data 1 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise verifyUpdateAbnormalParameterProcess 1 catch error: " +
                err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .verifyUpdateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            1
          )
          .then((data) => {
            console.log("data 2 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise verifyUpdateAbnormalParameterProcess 2 catch error: " +
                err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .verifyUpdateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            2
          )
          .then((data) => {
            console.log("data 3 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise verifyUpdateAbnormalParameterProcess 3 catch error: " +
                err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .verifyUpdateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            3
          )
          .then((data) => {
            console.log("data 4 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise verifyUpdateAbnormalParameterProcess 4 catch error: " +
                err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyPromise
          .verifyUpdateAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            4
          )
          .then((data) => {
            console.log("data 5 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyPromise verifyUpdateAbnormalParameterProcess 5 catch error: " +
                err
            );
            expect(err.code == 401).assertTrue();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3500
     * @tc.name Abnormal situation of visa verification signature data
     * @tc.desc Call it as a callback without passing in parameters
     * @tc.desc Pass in an exception parameter null and call it as a callback
     * @tc.desc Pass in an exception parameter "" and call it as a callback
     * @tc.desc Pass in an exception parameter "This is a sign test" and "This is a sign test"
     * call it in the form of a callback
     * @tc.desc The verify object was not initialized, and the data to be signed 'This is a sign test'
     * was passed in as a callback to be called
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3500",
      0,
      async function (done) {
        await asyCallback
          .verifyAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            0
          )
          .then((data) => {
            console.log("data 1 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback verifyAbnormalParameterProcess 1 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyCallback
          .verifyAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            1
          )
          .then((data) => {
            console.log("data 2 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback verifyAbnormalParameterProcess 2 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyCallback
          .verifyAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            2
          )
          .then((data) => {
            console.log("data 3 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback verifyAbnormalParameterProcess 3 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyCallback
          .verifyAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            3
          )
          .then((data) => {
            console.log("data 4 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback verifyAbnormalParameterProcess 4 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });

        await asyCallback
          .verifyAbnormalParameterProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "RSA1024|PKCS1|SHA224",
            4
          )
          .then((data) => {
            console.log("data 4 : " + data);
            expect(null).assertFail();
          })
          .catch((err) => {
            console.error(
              "AsyCallback verifyAbnormalParameterProcess 4 catch error: " + err
            );
            expect(err.code == 401).assertTrue();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3600
     * @tc.name Abnormal situation of parameter mode for signature verification setting
     * @tc.desc Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
     * parameter 0, and call it synchronously
     * @tc.desc Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
     * parameter -1, and call it synchronously
     * @tc.desc Pass in exception parameter mode 1024, parameter 2, and call it synchronously
     * @tc.desc Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
     * parameter 65535, and call it synchronously
     * @tc.desc Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, parameter "string",
     * and call it synchronously
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3600",
      0,
      async function (done) {
        let verifyGenerator = cryptoFramework.createVerify(
          "RSA1024|PKCS1|SHA224"
        );
        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            0
          );
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            -1
          );
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        try {
          verifyGenerator.setVerifySpec(1024, 2);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            65535
          );
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }

        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            "string"
          );
          expect(null).assertFail();
        } catch (err) {
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3700
     * @tc.name Abnormal situation of parameter mode for signature verification getting
     * @tc.desc Pass in exception parameter mode 10000, and call it synchronously
     * @tc.desc Call it as a synchronously without passing in parameters
     * @tc.desc Pass in exception parameter mode 6, and call it synchronously
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3700",
      0,
      async function (done) {
        let verifyGenerator = cryptoFramework.createVerify(
          "RSA1024|PKCS1|SHA224"
        );

        try {
          verifyGenerator.getVerifySpec(10000);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3700 1 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          verifyGenerator.getVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3700 2 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }

        try {
          verifyGenerator.getVerifySpec(6);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3700 4 err" +
              err
          );
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3800
     * @tc.name Signature verification and corresponding algorithm for obtaining signatures
     * @tc.desc Pass in algorithm name "RSA1024|PKCS1|SHA512" and call it using the promise method
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3800",
      0,
      async function (done) {
        try {
          let signGenerator = cryptoFramework.createSign(
            "RSA1024|PKCS1|SHA512"
          );
          expect(signGenerator.algName == "RSA1024|PKCS1|SHA512").assertTrue();
          let verifyGenerator = cryptoFramework.createVerify(
            "RSA1024|PKCS1|SHA512"
          );
          expect(
            verifyGenerator.algName == "RSA1024|PKCS1|SHA512"
          ).assertTrue();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3800 catch err: " +
              err
          );
          expect(err.code == 401).assertTrue();
        }
        done();
      }
    );
  });
}
