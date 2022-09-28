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
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString } from "../common/publicDoString";

async function testAsyKeyEncryptDecryptPromise(asyAlgoName, cipherAlgoName) {
    var globalPubKey;
    var globalPriKey;
    var globalCipherEncrypt;
    var globalCipherDecrypt;
    var globalCipherBlob;
    var globalText = "This is a cipher test";
    var input = { data: stringTouInt8Array(globalText) };

    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.warn("[Promise]: algName = " + rsaGenerator.algName);
    expect(rsaGenerator != null).assertTrue();
    globalCipherEncrypt = cryptoFramework.createCipher(cipherAlgoName);
    expect(globalCipherEncrypt != null).assertTrue();
    let keyGenPromise = rsaGenerator.generateKeyPair().then(rsaKeyPair => {
        expect(keyGenPromise != null).assertTrue();
        globalPubKey = rsaKeyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Promise]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Promise]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Promise]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = rsaKeyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Promise]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Promise]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Promise]: priKey.getFormat= " + globalPriKey.format);
        console.info("[Promise]:start init =====================[encrypt]");
        return globalCipherEncrypt.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, globalPubKey, null);
    }).then(() => {
        console.warn("plaintext hex: " + uInt8ArrayToShowStr(input.data));
        console.info("[Promise]:start doFinal =====================[encrypt]");
        return globalCipherEncrypt.doFinal(input);
    }).then(dataBlob => {
        expect(dataBlob != null).assertTrue();
        globalCipherBlob = dataBlob;
        console.log("cipherOutput: " + uInt8ArrayToShowStr(dataBlob.data));
        globalCipherDecrypt = cryptoFramework.createCipher(cipherAlgoName);
        expect(globalCipherDecrypt != null).assertTrue();
        console.log("[Promise]:start init =====================[decrypt]");
        return globalCipherDecrypt.init(cryptoFramework.CryptoMode.DECRYPT_MODE, globalPriKey, null);
    }).then(() => {
        console.log("[Promise]:start doFinal =====================[decrypt]");
        let promiseFinal = globalCipherDecrypt.doFinal(globalCipherBlob);
        return promiseFinal;
    }).then(finalOutput => {
        expect(finalOutput != null).assertTrue();
        if (finalOutput == null) {
            console.warn("decrypt doFinal out is null");
        } else {
            console.warn("decrypt doFinal output hex:" + uInt8ArrayToShowStr(finalOutput.data));
            console.warn("decrypt doFinal output :" + uInt8ArrayToString(finalOutput.data));
        }
        let decryptData = uInt8ArrayToString(finalOutput.data);
        expect(decryptData == globalText).assertTrue();
    }).catch(err => {
        console.error("err: " + err.code);
        expect(err == null).assertFail();
    })
}

async function testAsyKeySignVerifyPromise(asyAlgoName, signAlgoName) {
    var globalPubKey;
    var globalPriKey;
    var globalSigner;
    var globalVerify;
    var globalSignBlob;
    var globalText1 = "This is a sign test1";
    var input1 = { data: stringTouInt8Array(globalText1) };
    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.warn("[Promise]: algName = " + rsaGenerator.algName);
    expect(rsaGenerator != null).assertTrue();
    rsaGenerator.generateKeyPair().then(rsaKeyPair => {
        expect(rsaKeyPair != null).assertTrue();
        globalPubKey = rsaKeyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Promise]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Promise]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Promise]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = rsaKeyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Promise]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Promise]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Promise]: priKey.getFormat= " + globalPriKey.format);
        globalSigner = cryptoFramework.createSign(signAlgoName);
        expect(globalSigner != null).assertTrue();
        console.log("sign algoname is: ", globalSigner.algName);
        return globalSigner.init(globalPriKey);
    }).then(() => {
        console.warn("plaintext1 hex: " + uInt8ArrayToShowStr(input1.data));
        return globalSigner.update(input1);
    }).then(() => {
        return globalSigner.sign(input1);
    }).then(promiseSign => {
        console.log("promiseSign success: ", promiseSign);
        globalSignBlob = promiseSign;
    }).then(() => {
        globalVerify = cryptoFramework.createVerify(signAlgoName);
        expect(globalVerify != null).assertTrue();
        console.log("verify algname is: ", globalVerify.algName);
        return globalVerify.init(globalPubKey);
    }).then(() => {
        console.warn("plaintext1 hex: " + uInt8ArrayToShowStr(input1.data));
        return globalVerify.update(input1);
    }).then(() => {
        console.log("111111111");
        return globalVerify.verify(input1, globalSignBlob);
    }).then((status) => {
        console.log("22222222222");
        expect(status).assertTrue();
    }).catch(err => {
        console.error("err: " + err.code);
        expect(err == null).assertFail();
    })
}

async function testAsyKeyECDHPromise(ECDHAlgoName) {
    var globalPubKey;
    var globalPriKey;
    var globalECDHData;

    try {
        let rsaGenerator = cryptoFramework.createAsyKeyGenerator(ECDHAlgoName);
        console.warn("[Promise]: algName = " + rsaGenerator.algName);
        expect(rsaGenerator != null).assertTrue();
        rsaGenerator.generateKeyPair().then(rsaKeyPair => {
            expect(rsaKeyPair != null).assertTrue();
            globalPubKey = rsaKeyPair.pubKey;
            let encodedPubKey = globalPubKey.getEncoded();
            console.warn("[Promise]: pubKey.getAlgorithm= " + globalPubKey.algName);
            console.warn("[Promise]: pubKey.getEncoded= " + encodedPubKey.data);
            console.warn("[Promise]: pubKey.getFormat= " + globalPubKey.format);
            globalPriKey = rsaKeyPair.priKey;
            let encodedPriKey = globalPriKey.getEncoded();
            console.warn("[Promise]: priKey.getAlgorithm= " + globalPriKey.algName);
            console.warn("[Promise]: priKey.getEncoded= " + encodedPriKey.data);
            console.warn("[Promise]: priKey.getFormat= " + globalPriKey.format);
            globalECDHData = cryptoFramework.createKeyAgreement(ECDHAlgoName);
            expect(globalECDHData != null).assertTrue();
            console.warn("ECDH algoname is: " + globalECDHData.algName);
            let result = globalECDHData.generateSecret(globalPriKey, globalPubKey);
            return result;
        }).then(secretResult => {
            console.warn("result data is  " + uInt8ArrayToShowStr(secretResult.data));
            expect(secretResult != null).assertTrue();
        })
    } catch (err) {
        console.error("catch err: " + err.code);
        expect(err == null).assertFail();
    }
}

async function testAsyKeyConvertKeyPromise(asyAlgoName) {
    var globalPubKey;
    var globalPriKey;

    try {
        var globalRsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
        console.warn("[Promise]: algName = " + globalRsaGenerator.algName);
        expect(globalRsaGenerator != null).assertTrue();
        globalRsaGenerator.generateKeyPair().then(rsaKeyPair => {
            expect(rsaKeyPair != null).assertTrue();
            globalPubKey = rsaKeyPair.pubKey;
            let encodedPubKey = globalPubKey.getEncoded();
            console.warn("[Promise]: pubKey.getAlgorithm= " + globalPubKey.algName);
            console.warn("[Promise]: pubKey.getEncoded= " + encodedPubKey.data);
            console.warn("[Promise]: pubKey.getFormat= " + globalPubKey.format);
            globalPriKey = rsaKeyPair.priKey;
            let encodedPriKey = globalPriKey.getEncoded();
            console.warn("[Promise]: priKey.getAlgorithm= " + globalPriKey.algName);
            console.warn("[Promise]: priKey.getEncoded= " + encodedPriKey.data);
            console.warn("[Promise]: priKey.getFormat= " + globalPriKey.format);
            return globalRsaGenerator.convertKey(encodedPubKey, encodedPriKey);
        }).then(convertKeyPair => {
            expect(convertKeyPair != null).assertTrue();
            let encodedConvertPubKey = convertKeyPair.pubKey.getEncoded();
            console.warn("[Promise]: pubKey.getAlgorithm= " + convertKeyPair.pubKey.algName);
            console.warn("[Promise]: pubKey.getEncoded= " + encodedConvertPubKey.data);
            console.warn("[Promise]: pubKey.getFormat= " + convertKeyPair.pubKey.format);
            let encodedConvertPriKey = convertKeyPair.priKey.getEncoded();
            console.warn("[Promise]: priKey.getAlgorithm= " + convertKeyPair.priKey.algName);
            console.warn("[Promise]: priKey.getEncoded= " + encodedConvertPriKey.data);
            console.warn("[Promise]: priKey.getFormat= " + convertKeyPair.priKey.format);
        })
    } catch (err) {
        console.error("err: " + err.code);
        expect(err == null).assertFail();
    }
}

async function testAsyKeyPriKeyClearPromise(asyAlgoName) {
    var globalPubKey;
    var globalPriKey;

    var globalRsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.warn("[Promise]: algName = " + globalRsaGenerator.algName);
    expect(globalRsaGenerator != null).assertTrue();
    globalRsaGenerator.generateKeyPair().then(rsaKeyPair => {
        expect(rsaKeyPair != null).assertTrue();
        globalPubKey = rsaKeyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Promise]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Promise]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Promise]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = rsaKeyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Promise]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Promise]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Promise]: priKey.getFormat= " + globalPriKey.format);
        let result = globalPriKey.clearMem();
        console.log("result is: " + result);
        expect(result == undefined).assertTrue();
    }).catch(err => {
        console.error("err: " + err.code);
        expect(err == null).assertFail();
    })
}

export {
    testAsyKeyEncryptDecryptPromise,
    testAsyKeySignVerifyPromise,
    testAsyKeyECDHPromise,
    testAsyKeyConvertKeyPromise,
    testAsyKeyPriKeyClearPromise,
};