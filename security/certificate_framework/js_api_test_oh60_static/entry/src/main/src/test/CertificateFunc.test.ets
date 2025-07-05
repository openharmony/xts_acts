/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import cryptoFramework from '@ohos.security.cryptoFramework';
import util from '@ohos.util';
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";
import * as certCommon from "./utils/certificate/publicCertificateCommon";
import {
  uInt8ArrayToString,
  uInt8ArrayToShowStr,
} from "./utils/common/publicDoString";

export default function CertFrameworkFuncIDLTestJSUnit() {
  describe("CertFrameworkFuncIDLTestJSUnit", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.number Security_CertificateFramework_CertTest_Func_0101
     * @tc.name X509 getItem for CERT_ITEM_TYPE_TBS Test
     * @tc.desc Create Der Cert with Promise Style
     */
    it("Security_CertificateFramework_CertTest_Func_0101",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certPromise.createX509CertInstancePromise("der")
          expect(certObject != null && certObject != undefined).assertTrue();
          let data: cert.EncodingBlob = await certObject.getEncoded();
          expect(data != null).assertTrue();
          let pubKey: cryptoFramework.PubKey = certObject.getPublicKey();
          await certObject.verify(pubKey);
        } catch (err: BusinessError) {
          console.error(
            "createX509CertInstancePromise error, error code is: " + err.code
          );
        }
        done();
      });

    /**
     * @tc.number Security_CertificateFramework_CertTest_Func_0200
     * @tc.name X509 getItem for CERT_ITEM_TYPE_PUBLIC_KEY Test
     * @tc.desc Create Der Cert with Callback Style
     */
    it("Security_CertificateFramework_CertTest_Func_0201",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certCallback.createX509CertInstanceCallback("der")
          expect(certObject != null && certObject != undefined).assertTrue();
          let data: cert.EncodingBlob = await new Promise<cert.EncodingBlob>((resolve, reject) => {
            certObject.getEncoded((err: BusinessError<void>|null, data: cert.EncodingBlob|undefined) => {
              if (err?.code != 0 || data === undefined) {
                reject(err as Error);
              } else {
                resolve(data as cert.EncodingBlob);
              }
            });
          })
          expect(data != undefined).assertTrue();
          let pubKey: cryptoFramework.PubKey = certObject.getPublicKey();
          await new Promise<string>((resolve, reject) => {
            certObject.verify(pubKey, (err: BusinessError<void>|null) => {
              if (err?.code != 0) {
                reject(err as Error);
              } else {
                resolve("verify success");
              }
            });
          });
        } catch (err: BusinessError) {
          console.error(
            "createX509CertInstanceCallback pubKey error, error code is: " + err.code
          );
        }
        done();
      });

    /**
     * @tc.number Security_CertificateFramework_CertTest_Func_0300
     * @tc.name X509 getItem for CERT_ITEM_TYPE_TBS Test
     * @tc.desc Create Der Cert with Promise Style
     */
    it("Security_CertificateFramework_CertTest_Func_0301",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certPromise.createX509CertInstancePromise("pem")
          expect(certObject != null && certObject != undefined).assertTrue();
          let data: cert.EncodingBlob = await new Promise<cert.EncodingBlob>((resolve, reject) => {
            certObject.getEncoded((err: BusinessError<void>|null, data: cert.EncodingBlob|undefined) => {
              if (err?.code != 0 || data === undefined) {
                reject(err as Error);
              } else {
                resolve(data as cert.EncodingBlob);
              }
            });
          })
          expect(data != undefined).assertTrue();
          let pubKey: cryptoFramework.PubKey = certObject.getPublicKey();
          await new Promise<string>((resolve, reject) => {
            certObject.verify(pubKey, (err: BusinessError<void>|null) => {
              if (err?.code != 0) {
                reject(err as Error);
              } else {
                resolve("verify success");
              }
            });
          });
        } catch (err: BusinessError) {
          console.error(
            "createX509CertInstancePromise error, error code is: " + err.code
          );
        }
        done();
      });

    /**
     * @tc.number Security_CertificateFramework_CertTest_Func_0400
     * @tc.name X509 getItem for CERT_ITEM_TYPE_PUBLIC_KEY Test
     * @tc.desc Create Der Cert with Callback Style
     */
    it("Security_CertificateFramework_CertTest_Func_0401",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let certObject: cert.X509Cert = await certCallback.createX509CertInstanceCallback("pem")
          expect(certObject != null && certObject != undefined).assertTrue();
          let data: cert.EncodingBlob = await certObject.getEncoded();
          expect(data != null).assertTrue();
          let pubKey: cryptoFramework.PubKey = certObject.getPublicKey();
          await certObject.verify(pubKey);
        } catch (err: BusinessError) {
          console.error(
            "createX509CertInstanceCallback pubKey error, error code is: " + err.code
          );
        }
        done();
      });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_8700
     * @tc.name parse cert chain, return ERR_CRYPTO_OPERATION
     * @tc.desc Use Promise Type
     * @tc.size Medium
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_8701",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          cert.createCertChainValidator("PKIX2")
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`createCertChainValidator ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.NOT_SUPPORT);
        }
        let validator: cert.CertChainValidator = cert.createCertChainValidator("PKIX");
        console.log("validator alg:" + validator.algorithm);
        let data: cert.CertChainData;
        let data2: cert.DataBlob;
        try {
          await validator.validate(data);
        } catch (error: BusinessError) {
          console.error(`validator.validate Promise ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(19020001);
        }
        try {
          validator.validate(data, (err: BusinessError<void>|null) => {});
        } catch (error: BusinessError) {
          console.error(`validator.validate Callback ${error}, error code: ${error.code}`);
          expect(error.code).assertEqual(19020001);
        }
        done();
      });

    /**
     * @tc.number Security_CertificateFramework_Enum_Func_0501
     * @tc.name X509 Cert Enum Type Test
     * @tc.desc X509 Cert Enum Type Test
     */
    it("Security_CertificateFramework_Enum_Func_0501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          certCommon.certificateEnumTypeTest();
        } catch (err: BusinessError) {
          expect(null).assertFail();
        }
        done();
      });

  })
}
