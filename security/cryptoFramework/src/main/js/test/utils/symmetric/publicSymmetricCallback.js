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


function testEncryptionDecryptionCallback(symAlgoName, cipherAlgoName, paramType) {
    var globalCipher;
    var globalParams;
    var globalKey;
    var globalCipherText;
    var globalText = "aaa this is test! this is test! bbb";

    // createSymKeyGenerator
    var symKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    console.info("[callback]createGenerator ok");
    console.warn("[callback]symKeyGenerator algName: " + symKeyGenerator.algName);

    //createCipher
    globalCipher = cryptoFramework.createCipher(cipherAlgoName);
    expect(globalCipher != null).assertTrue();
    console.info("[callback]createCipher ok");
    console.warn("[callback]cipher algName:" + globalCipher.algName);

    if (paramType == "genIvParamsSpec") {
        if (symAlgoName.includes("AES")) {
            globalParams = genIvParamsSpec(16);
        } else if (symAlgoName.includes("3DES")) {
            globalParams = genIvParamsSpec(8);
        } else {
            console.error("[callback]Gen params error");
            throw "[callback]Gen params error";
        }
    } else if (paramType == "genGcmParamsSpec") {
        globalParams = genGcmParamsSpec();
    } else if (paramType == "genCcmParamsSpec") {
        globalParams = genCcmParamsSpec();
    } else if (paramType == "null") {
        globalParams = null;
    } else {
        console.error("[callback]globalParams not match");
        expect(null).assertFail();
    }

    symKeyGenerator.generateSymKey((err, key) => {
        if (err) {
            console.error("[callback]generateSymKey err, error code: " + err.code);
            expect(null).assertFail();
        }
        expect(key != null).assertTrue();
        console.info("[callback]generaeSymkey ok");
        console.warn("[callback]key algName:" + key.algName);
        console.warn("[callback]key format:" + key.format);
        var encodeKey = key.getEncoded();
        console.warn("[callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        globalKey = key;
        //encrypt init
        console.info("[callback]start init ==================[encrypt]");
        var mode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        console.warn("[callback]mode:" + mode);
        globalCipher.init(mode, key, globalParams, (err,) => {
            if (err) {
                console.error("[callback]init error! error code: " + err.code);
                expect(null).assertFail();
            }
            console.info("[callback]init ok");
            console.info("[callback]start update ==================[encrypt]");
            var plaintext = { data: stringTouInt8Array(globalText) };
            console.warn("[callback]plaintext hex: " + uInt8ArrayToShowStr(plaintext.data));
            globalCipher.update(plaintext, (err, updateOutput) => {
                if (err) {
                    console.error("[callback]update error! error code: " + err.code);
                    expect(null).assertFail();
                }
                console.info("[callback]update ok");
                console.warn("[callback]encrypt update out hex:" + uInt8ArrayToShowStr(updateOutput.data));
                globalCipherText = updateOutput;
                expect(globalCipherText != null).assertTrue();
                //encrypt doFinall
                console.info("[callback]start doFinall ==================[encrypt]");
                globalCipher.doFinal(null, (err, finalOutput) => {
                    if (err.code != 0) {
                        console.error("[callback]doFinall err: ", err.code);
                        expect(null).assertFail();
                        return;
                    }
                    console.info("[callback]doFinal ok");
                    if (finalOutput == null) {
                    } else {
                        if (paramType == "genGcmParamsSpec" || paramType == "genCcmParamsSpec") {
                            console.warn("encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                            globalParams.authTag = finalOutput;
                        } else {
                            console.warn("encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                            globalCipherText = Array.from(globalCipherText.data);
                            finalOutput = Array.from(finalOutput.data);
                            globalCipherText = globalCipherText.concat(finalOutput);
                            globalCipherText = new Uint8Array(globalCipherText);
                            globalCipherText = { data: globalCipherText };
                        }
                    }
                    //decrypt init
                    console.info("[callback]start init ==================[decrypt]");
                    var mode = cryptoFramework.CryptoMode.DECRYPT_MODE;
                    console.warn("[callback]mode: " + mode);
                    globalCipher.init(mode, globalKey, globalParams, (err,) => {
                        console.info("[callback]init ok");
                        //decrypt update
                        console.info("[callback]start update ==================[decrypt]");
                        globalCipher.update(globalCipherText, (err, updateOutput) => {
                            console.info("[callback]update ok");
                            console.warn("[callback]decrypt update out: " + uInt8ArrayToString(updateOutput.data));
                            expect(uInt8ArrayToString(updateOutput.data) == globalText).assertTrue();
                            //decrypt doFinal
                            console.info("[callback]start doFinal ==================[decrypt]");
                            globalCipher.doFinal(null, (err, finalOutput) => {
                                if (err) {
                                    console.error("[callback]decrypt doFinal failed! error code is: " + err.code);
                                    expect(null).assertFail();
                                }
                                console.info("[callback]doFinal ok");
                                if (finalOutput == null) {
                                    console.error("[callback]decrypt doFinal out is null");
                                } else {
                                    console.log("[callback]decrypt doFinal out hex: " + uInt8ArrayToString(finalOutput.data));
                                }
                            })
                        })
                    })
                })
            })
        })
    })
}

function testEncryptionDecryptionConvertKeyCallback(symAlgoName, cipherAlgoName, paramType) {
    var globalCipher;
    var globalParams;
    var globalKey;
    var globalCipherText;
    var globalText = "aaa this is test! this is test! bbb";

    // createSymKeyGenerator
    var symKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    console.info("[callback]createGenerator ok");
    console.warn("[callback]symKeyGenerator algName: " + symKeyGenerator.algName);

    //createCipher
    globalCipher = cryptoFramework.createCipher(cipherAlgoName);
    expect(globalCipher != null).assertTrue();
    console.info("[callback]createCipher ok");
    console.warn("[callback]cipher algName:" + globalCipher.algName);

    if (paramType == "genIvParamsSpec") {
        if (symAlgoName.includes("AES")) {
            globalParams = genIvParamsSpec(16);
        } else if (symAlgoName.includes("3DES")) {
            globalParams = genIvParamsSpec(8);
        } else {
            console.error("[callback]Gen params error");
            throw "[callback]Gen params error";
        }
    } else if (paramType == "genGcmParamsSpec") {
        globalParams = genGcmParamsSpec();
    } else if (paramType == "genCcmParamsSpec") {
        globalParams = genCcmParamsSpec();
    } else if (paramType == "null") {
        globalParams = null;
    } else {
        console.error("[callback]globalParams not match");
        expect(null).assertFail();
    }

    symKeyGenerator.generateSymKey((err, key) => {
        if (err) {
            console.error("[callback]generateSymKey err, error code: " + err.code);
            expect(null).assertFail();
        }
        expect(key != null).assertTrue();
        console.info("[callback]generaeSymkey ok");
        console.warn("[callback]key algName:" + key.algName);
        console.warn("[callback]key format:" + key.format);
        var encodeKey = key.getEncoded();
        console.warn("[callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        symKeyGenerator.convertKey(encodeKey, (err0, convertKey)=>{
            if (err0) {
                console.error("[callback]generateSymKey err, error code: " + err0.code);
                expect(null).assertFail();
            } else {
                globalKey = convertKey;
            }
        });
        //encrypt init
        console.info("[callback]start init ==================[encrypt]");
        var mode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        console.warn("[callback]mode:" + mode);
        globalCipher.init(mode, key, globalParams, (err,) => {
            if (err) {
                console.error("[callback]init error! error code: " + err.code);
                expect(null).assertFail();
            }
            console.info("[callback]init ok");
            console.info("[callback]start update ==================[encrypt]");
            var plaintext = { data: stringTouInt8Array(globalText) };
            console.warn("[callback]plaintext hex: " + uInt8ArrayToShowStr(plaintext.data));
            globalCipher.update(plaintext, (err, updateOutput) => {
                if (err) {
                    console.error("[callback]update error! error code: " + err.code);
                    expect(null).assertFail();
                }
                console.info("[callback]update ok");
                console.warn("[callback]encrypt update out hex:" + uInt8ArrayToShowStr(updateOutput.data));
                globalCipherText = updateOutput;
                expect(globalCipherText != null).assertTrue();
                //encrypt doFinall
                console.info("[callback]start doFinall ==================[encrypt]");
                globalCipher.doFinal(null, (err, finalOutput) => {
                    if (err.code != 0) {
                        console.error("[callback]doFinall err: ", err.code);
                        expect(null).assertFail();
                        return;
                    }
                    console.info("[callback]doFinal ok");
                    if (finalOutput == null) {
                    } else {
                        if (paramType == "genGcmParamsSpec" || paramType == "genCcmParamsSpec") {
                            console.warn("encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                            globalParams.authTag = finalOutput;
                        } else {
                            console.warn("encrypt authTag(finalOutput) hex: " + uInt8ArrayToShowStr(finalOutput.data));
                            globalCipherText = Array.from(globalCipherText.data);
                            finalOutput = Array.from(finalOutput.data);
                            globalCipherText = globalCipherText.concat(finalOutput);
                            globalCipherText = new Uint8Array(globalCipherText);
                            globalCipherText = { data: globalCipherText };
                        }
                    }
                    //decrypt init
                    console.info("[callback]start init ==================[decrypt]");
                    var mode = cryptoFramework.CryptoMode.DECRYPT_MODE;
                    console.warn("[callback]mode: " + mode);
                    globalCipher.init(mode, globalKey, globalParams, (err,) => {
                        console.info("[callback]init ok");
                        //decrypt update
                        console.info("[callback]start update ==================[decrypt]");
                        globalCipher.update(globalCipherText, (err, updateOutput) => {
                            console.info("[callback]update ok");
                            console.warn("[callback]decrypt update out: " + uInt8ArrayToString(updateOutput.data));
                            expect(uInt8ArrayToString(updateOutput.data) == globalText).assertTrue();
                            //decrypt doFinal
                            console.info("[callback]start doFinal ==================[decrypt]");
                            globalCipher.doFinal(null, (err, finalOutput) => {
                                if (err) {
                                    console.error("[callback]decrypt doFinal failed! error code is: " + err.code);
                                    expect(null).assertFail();
                                }
                                console.info("[callback]doFinal ok");
                                if (finalOutput == null) {
                                    console.error("[callback]decrypt doFinal out is null");
                                } else {
                                    console.log("[callback]decrypt doFinal out hex: " + uInt8ArrayToString(finalOutput.data));
                                }
                            })
                        })
                    })
                })
            })
        })
    })
}

function testClearMemCallback(symAlgoName) {
    var globalSymKeyGenerator;
    // createSymKeyGenerator
    globalSymKeyGenerator = cryptoFramework.createSymKeyGenerator(symAlgoName);
    expect(globalSymKeyGenerator != null).assertTrue();
    console.info("[callback]createGenerator ok");
    console.warn("[callback]symKeyGenerator algName: " + globalSymKeyGenerator.algName);

    globalSymKeyGenerator.generateSymKey((err, symKey) => {
        if (err) {
            console.error("catch err is: " + err);
            expect(err == null).assertFail();
        }
        console.info("[callback]generaeSymkey ok");
        console.warn("[callback]key algName:" + symKey.algName);
        console.warn("[callback]key format:" + symKey.format);
        var encodeKey = symKey.getEncoded();
        console.warn("[callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        let ret = symKey.clearMem();
        console.log("ret = ", ret);
        expect(ret == null).assertTrue()
    })
}

export { testEncryptionDecryptionCallback, testEncryptionDecryptionConvertKeyCallback, testClearMemCallback };
