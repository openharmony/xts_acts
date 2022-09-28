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
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString, } from "../common/publicDoString";

async function testMDDigestPromise(MDAlgoName) {
    var globalMd;
    var globalText = "my test data";

    globalMd = cryptoFramework.createMd(MDAlgoName);
    expect(globalMd != null).assertTrue();
    console.warn("md= " + globalMd);
    console.warn("MD algName is: " + globalMd.algName);
    // test input data
    let inBlob = {
        data: stringTouInt8Array(globalText)
    }
    //test functionalities by promise async
    globalMd.update(inBlob).then(() => {
        console.warn("[Promise]: update finished");
        let digestBlob = globalMd.digest();
        return digestBlob;
    }).then((mdOutput) => {
        console.warn("[Promise]: digest result1: " + uInt8ArrayToShowStr(mdOutput.data));
        console.warn("[Promise]: digest result2: " + mdOutput.data);
        let mdLen = globalMd.getMdLength();
        console.warn("Md len: " + mdLen);
        expect(mdOutput != null && mdLen == 16).assertTrue();
    }).catch(err => {
        console.error("[promise]catch err:" + err);
        expect(err == null).assertFail();
    })
}

async function testHMACDigestPromise(HMACAlgoName, keyAlgoName) {
    var globalHMAC;
    var globalText = "my test data";
    var globalsymKeyGenerator;
    var ginBlob = {
        data: stringTouInt8Array(globalText)
    };

    globalHMAC = cryptoFramework.createMac(HMACAlgoName);
    expect(globalHMAC != null).assertTrue();
    console.warn("mac= " + globalHMAC);
    console.warn("HMAC algName is: " + globalHMAC.algName);
    // create sym key generator
    console.log("start to call createSymKeyGenerator()");
    globalsymKeyGenerator = cryptoFramework.createSymKeyGenerator(keyAlgoName);
    expect(globalsymKeyGenerator != null).assertTrue();
    console.log("createSymKeyGenerator ok");
    console.warn("symKeyGenerator algName:" + globalsymKeyGenerator.algName);
    globalsymKeyGenerator.generateSymKey().then(key => {
        expect(key != null).assertTrue();
        console.warn("generateSymKey ok");
        console.warn("key algName:" + key.algName);
        console.warn("key format:" + key.format);
        var encodedKey = key.getEncoded();
        console.warn("key getEncoded hex: " + uInt8ArrayToShowStr(encodedKey.data));
        var promiseMacInit = globalHMAC.init(key);
        return promiseMacInit;
    }).then(() => {
        var promiseMacUpdate = globalHMAC.update(ginBlob);
        return promiseMacUpdate;
    }).then(() => {
        var promiseMacdoFinal = globalHMAC.doFinal();
        return promiseMacdoFinal;
    }).then(macOutput => {
        console.warn("HMAC result:" + macOutput.data);
        let macLen = globalHMAC.getMacLength();
        expect(macOutput != null && macLen == 20).assertTrue();
        console.warn("MAC len:" + macLen);
    }).catch(err => {
        console.error("[promise]catch err:" + err);
        expect(err == null).assertFail();
    })
}

export { testMDDigestPromise, testHMACDigestPromise };
