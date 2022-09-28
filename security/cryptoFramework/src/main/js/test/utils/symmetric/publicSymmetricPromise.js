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
    genGcmParamsSpec,
    genIvParamsSpec,
    genCcmParamsSpec
} from "../common/publicDoString";

function testEncryptionDecryptionPromise(symAlgoName, cipherAlgoName, paramType) {
    var globalCipher;
    var globalParams;
    var globalKey;
    var globalCipherText;
    var globalText = "aaa this is test! this is test! bbb";

    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.error("");
            resolve("")
        }, 50);
    }).then(() => {
        // createSymKeyGenerator
        var symKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
        expect(symKeyGenerator != null).assertTrue();
        console.info("[promise]createGenerator ok");
        console.warn("[promise]symKeyGenerator algName: " + symKeyGenerator.algName);

        //createCipher
        globalCipher = cryptoFramework.createCipher(cipherAlgoName);
        expect(globalCipher != null).assertTrue();
        console.info("[promise]createCipher ok");
        console.warn("[promise]cipher algName:" + globalCipher.algName);

        if (paramType == "genIvParamsSpec") {
            if (symAlgoName.includes("AES")) {
                globalParams = genIvParamsSpec(16);
            } else if (symAlgoName.includes("3DES")) {
                globalParams = genIvParamsSpec(8);
            } else {
                console.error("[promise]Gen params error");
                throw "[promise]Gen params error";
            }
        } else if (paramType == "genGcmParamsSpec") {
            globalParams = genGcmParamsSpec();
        } else if (paramType == "genCcmParamsSpec") {
            globalParams = genCcmParamsSpec();
        } else if (paramType == "null") {
            globalParams = null;
        } else {
            console.error("[promise]globalParams not match");
            throw "[promise]globalParams not match";
        }

        var promiseKey = symKeyGenerator.generateSymKey();
        expect(promiseKey != null).assertTrue();
        return promiseKey;
    }).then(key => {
        console.info("[promise]generaeSymkey ok");
        console.warn("[promise]key algName:" + key.algName);
        console.warn("[promise]key format:" + key.format);
        var encodeKey = key.getEncoded();
        console.warn("[promise]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        globalKey = key;
        return key;
    }).then(key => {
        //encrypt init
        console.info("[promise]start init ==================[encrypt]");
        var mode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        console.warn("[promise]mode:" + mode);
        var promiseInit = globalCipher.init(mode, key, globalParams);
        console.info("[promise]init ok");
        return promiseInit;
    }).then(() => {
        //encrypt update
        console.info("[promise]start update ==================[encrypt]");
        var plaintext = { data: stringTouInt8Array(globalText) };
        console.warn("[promise]plaintext hex: " + uInt8ArrayToShowStr(plaintext.data));
        var promiseUpdate = globalCipher.update(plaintext);
        console.info("[promise]update ok");
        return promiseUpdate;
    }).then((updateOutput) => {
        //encrypt doFinall
        console.info("[promise]start doFinall ==================[encrypt]");
        console.warn("[promise]encrypt update out hex:" + uInt8ArrayToShowStr(updateOutput.data));
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        var promiseFinal = globalCipher.doFinal(null);
        console.info("[promise]doFinal ok");
        return promiseFinal;
    }).then(finalOutput => {
        if (finalOutput == null) {
            ;
        } else {
            if (paramType == "genGcmParamsSpec" || paramType == "genCcmParamsSpec") {
                console.warn("[promise]encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                globalParams.authTag = finalOutput;
            } else {
                console.warn("[promise]encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                globalCipherText = Array.from(globalCipherText.data);
                finalOutput = Array.from(finalOutput.data);
                globalCipherText = globalCipherText.concat(finalOutput);
                globalCipherText = new Uint8Array(globalCipherText);
                globalCipherText = { data: globalCipherText };
            }
        }
        return;
    }).then(() => {
        //decrypt init
        console.info("[promise]start init ==================[decrypt]");
        var mode = cryptoFramework.CryptoMode.DECRYPT_MODE;
        console.warn("[promise]mode: " + mode);
        var promiseInit = globalCipher.init(mode, globalKey, globalParams);
        console.info("[promise]init ok");
        return promiseInit;
    }).then(() => {
        //decrypt update
        console.info("[promise]start update ==================[decrypt]");
        var promiseUpdate = globalCipher.update(globalCipherText);
        console.info("[promise]update ok");
        return promiseUpdate;
    }).then(updateOutput => {
        //decrypt doFinal
        console.info("[promise]start doFinal ==================[decrypt]");
        console.warn("[promise]decrypt update out: " + uInt8ArrayToString(updateOutput.data));
        expect(uInt8ArrayToString(updateOutput.data) == globalText).assertTrue();
        var promiseFinal = globalCipher.doFinal(null);
        console.info("[promise]doFinal ok");
        return promiseFinal;
    }).then(finalOutput => {
        if (finalOutput == null) {
            console.error("[promise]decrypt doFinal out is null");
        } else {
            console.log("[promise]decrypt doFinal out hex: " + uInt8ArrayToShowStr(finalOutput.data));
        }
    }).catch(err => {
        console.error("[promise]catch err:" + err);
        expect(null).assertFail();
    })
}

function testEncryptionDecryptionConvertKeyPromise(symAlgoName, cipherAlgoName, paramType) {
    var globalCipher;
    var globalParams;
    var globalKey;
    var globalCipherText;
    var globalSymKeyGenerator;
    var globalText = "aaa this is test! this is test! bbb";

    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.error("");
            resolve("")
        }, 50);
    }).then(() => {
        // createSymKeyGenerator
        globalSymKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
        expect(globalSymKeyGenerator != null).assertTrue();
        console.info("[promise]createGenerator ok");
        console.warn("[promise]symKeyGenerator algName: " + globalSymKeyGenerator.algName);

        //createCipher
        globalCipher = cryptoFramework.createCipher(cipherAlgoName);
        expect(globalCipher != null).assertTrue();
        console.info("[promise]createCipher ok");
        console.warn("[promise]cipher algName:" + globalCipher.algName);

        if (paramType == "genIvParamsSpec") {
            if (symAlgoName.includes("AES")) {
                globalParams = genIvParamsSpec(16);
            } else if (symAlgoName.includes("3DES")) {
                globalParams = genIvParamsSpec(8);
            } else {
                console.error("[promise]Gen params error");
                throw "[promise]Gen params error";
            }
        } else if (paramType == "genGcmParamsSpec") {
            globalParams = genGcmParamsSpec();
        } else if (paramType == "genCcmParamsSpec") {
            globalParams = genCcmParamsSpec();
        } else if (paramType == "null") {
            globalParams = null;
        } else {
            console.error("[promise]globalParams not match");
            throw "[promise]globalParams not match";
        }

        var promiseKey = globalSymKeyGenerator.generateSymKey();
        return promiseKey;
    }).then(key => {
        var encodeKey = key.getEncoded();
        console.warn("[promise]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        var convertKey = globalSymKeyGenerator.convertKey(encodeKey);
        return convertKey;
    }).then(key => {
        //encrypt init
        console.warn("[promise]convertkey getEncoded hex: " + uInt8ArrayToShowStr(key.getEncoded().data));
        globalKey = key;
        console.info("[promise]start init ==================[encrypt]");
        var mode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        console.warn("[promise]mode:" + mode);
        var promiseInit = globalCipher.init(mode, key, globalParams);
        console.info("[promise]init ok");
        return promiseInit;
    }).then(() => {
        //encrypt update
        console.info("[promise]start update ==================[encrypt]");
        var plaintext = { data: stringTouInt8Array(globalText) };
        console.warn("[promise]plaintext hex: " + uInt8ArrayToShowStr(plaintext.data));
        var promiseUpdate = globalCipher.update(plaintext);
        console.info("[promise]update ok");
        return promiseUpdate;
    }).then((updateOutput) => {
        //encrypt doFinall
        console.info("[promise]start doFinall ==================[encrypt]");
        console.warn("[promise]encrypt update out hex:" + uInt8ArrayToShowStr(updateOutput.data));
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        var promiseFinal = globalCipher.doFinal(null);
        console.info("[promise]doFinal ok");
        return promiseFinal;
    }).then(finalOutput => {
        if (finalOutput == null) {
            ;
        } else {
            if (paramType == "genGcmParamsSpec" || paramType == "genCcmParamsSpec") {
                console.warn("[promise]encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                globalParams.authTag = finalOutput;
            } else {
                console.warn("[promise]encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                globalCipherText = Array.from(globalCipherText.data);
                finalOutput = Array.from(finalOutput.data);
                globalCipherText = globalCipherText.concat(finalOutput);
                globalCipherText = new Uint8Array(globalCipherText);
                globalCipherText = { data: globalCipherText };
            }
        }
        return;
    }).then(() => {
        //decrypt init
        console.info("[promise]start init ==================[decrypt]");
        var mode = cryptoFramework.CryptoMode.DECRYPT_MODE;
        console.warn("[promise]mode: " + mode);
        var promiseInit = globalCipher.init(mode, globalKey, globalParams);
        console.info("[promise]init ok");
        return promiseInit;
    }).then(() => {
        //decrypt update
        console.info("[promise]start update ==================[decrypt]");
        var promiseUpdate = globalCipher.update(globalCipherText);
        console.info("[promise]update ok");
        return promiseUpdate;
    }).then(updateOutput => {
        //decrypt doFinal
        console.info("[promise]start doFinal ==================[decrypt]");
        console.warn("[promise]decrypt update out: " + uInt8ArrayToString(updateOutput.data));
        expect(uInt8ArrayToString(updateOutput.data) == globalText).assertTrue();
        var promiseFinal = globalCipher.doFinal(null);
        console.info("[promise]doFinal ok");
        return promiseFinal;
    }).then(finalOutput => {
        if (finalOutput == null) {
            console.error("[promise]decrypt doFinal out is null");
        } else {
            console.log("[promise]decrypt doFinal out hex: " + uInt8ArrayToShowStr(finalOutput.data));
        }
    }).catch(err => {
        console.error("[promise]catch err:" + err);
        expect(null).assertFail();
    })
}

function testClearMemPromise(symAlgoName) {
    var globalSymKeyGenerator;
    // createSymKeyGenerator
    globalSymKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
    expect(globalSymKeyGenerator != null).assertTrue();
    console.info("[promise]createGenerator ok");
    console.warn("[promise]symKeyGenerator algName: " + globalSymKeyGenerator.algName);

    globalSymKeyGenerator.generateSymKey().then(symKey => {
        console.info("[promise]generaeSymkey ok");
        console.warn("[promise]key algName:" + symKey.algName);
        console.warn("[promise]key format:" + symKey.format);
        var encodeKey = symKey.getEncoded();
        console.warn("[promise]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        let ret = symKey.clearMem();
        console.log("ret = ", ret);
        expect(ret == null).assertTrue()
    }).catch(err => {
        console.error("catch err is: " + err);
        expect(err == null).assertFail();
    })
}

export { testEncryptionDecryptionPromise, testEncryptionDecryptionConvertKeyPromise, testClearMemPromise };
