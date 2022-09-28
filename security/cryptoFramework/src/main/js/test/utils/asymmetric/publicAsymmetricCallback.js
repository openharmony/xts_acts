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

async function testAsyKeyEncryptDecryptCallback(asyAlgoName, cipherAlgoName) {
    var globalPubKey;
    var globalPriKey;
    var globalCipherEncrypt;
    var globalCipherDecrypt;
    var globalText = "This is a cipher test";
    var globalInput = { data: stringTouInt8Array(globalText) };

    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.warn("[Callback]: algName = " + rsaGenerator.algName);
    expect(rsaGenerator != null).assertTrue();
    globalCipherEncrypt = cryptoFramework.createCipher(cipherAlgoName);
    globalCipherDecrypt = cryptoFramework.createCipher(cipherAlgoName);
    expect(globalCipherEncrypt != null).assertTrue();
    expect(globalCipherDecrypt != null).assertTrue();

    rsaGenerator.generateKeyPair((err, keyPair)=> {
        if (err) {
            expect(err == null).assertFail();
        }
        expect(keyPair != null).assertTrue();
        globalPubKey = keyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Callback]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Callback]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = keyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Callback]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Callback]: priKey.getFormat= " + globalPriKey.format);
        console.info("[Callback]:start init =====================[encrypt]");
        globalCipherEncrypt.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, globalPubKey, null, (err0,) => {
            if (err0) {
                expect(err0 == null).assertFail();
            }
            console.warn("plaintext hex: " + uInt8ArrayToShowStr(globalInput.data));
            console.info("[Callback]:start doFinal =====================[encrypt]");
            globalCipherEncrypt.doFinal(globalInput, (err1, cipherFinalEncrypt) => {
                if (err1) {
                    expect(err1 == null).assertFail();
                }
                expect(cipherFinalEncrypt != null).assertTrue();
                console.log("cipherOutput: " + uInt8ArrayToShowStr(cipherFinalEncrypt.data));
                expect(globalCipherDecrypt != null).assertTrue();
                console.log("[Callback]:start init =====================[decrypt]");
                globalCipherDecrypt.init(cryptoFramework.CryptoMode.DECRYPT_MODE, globalPriKey, null, (err,) => {
                    console.log("[Callback]:start doFinal =====================[decrypt]");
                    globalCipherDecrypt.doFinal(cipherFinalEncrypt, (err2, cipherFinalDecrypt) => {
                        if (err2) {
                            expect(err2 == null).assertFail();
                        }
                        expect(cipherFinalDecrypt != null).assertTrue();
                        if (cipherFinalDecrypt == null) {
                            console.warn("decrypt doFinal out is null");
                        } else {
                            console.warn("decrypt doFinal output hex:" + uInt8ArrayToShowStr(cipherFinalDecrypt.data));
                            console.warn("decrypt doFinal output :" + uInt8ArrayToString(cipherFinalDecrypt.data));
                        }
                        let decryptData = uInt8ArrayToString(cipherFinalDecrypt.data);
                        expect(decryptData == globalText).assertTrue();
                    });
                })
            });
        });
    });
}

async function testAsyKeySignVerifyCallback(asyAlgoName, signAlgoName) {
    var globalPubKey;
    var globalPriKey;
    var globalSigner;
    var globalVerify;
    var globalText = "This is a sign test";
    var globalInput = { data: stringTouInt8Array(globalText) };
    var globalSignBlob;

    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.warn("[Callback]: algName = " + rsaGenerator.algName);
    expect(rsaGenerator != null).assertTrue();
    globalSigner = cryptoFramework.createSign(signAlgoName);
    globalVerify = cryptoFramework.createVerify(signAlgoName);
    expect(globalSigner != null).assertTrue();
    expect(globalVerify != null).assertTrue();

    rsaGenerator.generateKeyPair((err, keyPair)=> {
        if (err) {
            expect(err == null).assertFail();
        }
        expect(keyPair != null).assertTrue();
        globalPubKey = keyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Callback]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Callback]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = keyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Callback]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Callback]: priKey.getFormat= " + globalPriKey.format);
        globalSigner.init(globalPriKey, (err0,) => {
            if (err0) {
                expect(err0 == null).assertFail();
            }
            console.warn("plaintext hex: " + uInt8ArrayToShowStr(globalInput.data));
            globalSigner.update(globalInput, (err1,) => {
                if (err1) {
                    expect(err1 == null).assertFail();
                }
            });
            globalSigner.sign(globalInput, (err2, signData) => {
                if (err2) {
                    expect(err2 == null).assertFail();
                }
                globalSignBlob = signData;
                console.log("signOutput: " + uInt8ArrayToShowStr(signData.data));
                globalVerify.init(globalPubKey, null, (err3,) => {
                    if (err3) {
                        expect(err3 == null).assertFail();
                    }
                    globalVerify.update(globalInput, (err4,) => {
                        if (err4) {
                            expect(err4 == null).assertFail();
                        }
                    });
                    globalVerify.verify(globalInput,globalSignBlob,(err5, finalStatus) => {
                        if (err5) {
                            expect(err5 == null).assertFail();
                        }
                        expect(finalStatus).assertTrue();
                    });
                });
            });
        });
    });
}

async function testAsyKeyECDHCallback(ECDHAlgoName) {
    var globalPubKey;
    var globalPriKey;
    var globalECDHData;

    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(ECDHAlgoName);
    console.warn("[Callback]: algName = " + rsaGenerator.algName);
    expect(rsaGenerator != null).assertTrue();
    rsaGenerator.generateKeyPair((err, rsaKeyPair)=> {
        if (err) {
            expect(err == null).assertFail();
        }
        globalPubKey = rsaKeyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Callback]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Callback]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = rsaKeyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Callback]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Callback]: priKey.getFormat= " + globalPriKey.format);
        globalECDHData = cryptoFramework.createKeyAgreement(ECDHAlgoName);
        expect(globalECDHData != null).assertTrue();
        console.log("ECDH algoname is: ", globalECDHData.algName);
        globalECDHData.generateSecret(globalPriKey, globalPubKey, (err1, result) => {
            if (err1) {
                expect(err1 == null).assertFail();
            }
            console.warn("result data is  " + uInt8ArrayToShowStr(result.data));
            expect(result != null).assertTrue();
        });
    });
}

async function testAsyKeyConvertKeyCallback(asyAlgoName) {
    var globalPubKey;
    var globalPriKey;

    let rsaGenerator = cryptoFramework.createAsyKeyGenerator(asyAlgoName);
    console.warn("[Callback]: algName = " + rsaGenerator.algName);
    expect(rsaGenerator != null).assertTrue();
    rsaGenerator.generateKeyPair((err, rsaKeyPair)=> {
        if (err) {
            expect(err == null).assertFail();
        }
        globalPubKey = rsaKeyPair.pubKey;
        let encodedPubKey = globalPubKey.getEncoded();
        console.warn("[Callback]: pubKey.getAlgorithm= " + globalPubKey.algName);
        console.warn("[Callback]: pubKey.getEncoded= " + encodedPubKey.data);
        console.warn("[Callback]: pubKey.getFormat= " + globalPubKey.format);
        globalPriKey = rsaKeyPair.priKey;
        let encodedPriKey = globalPriKey.getEncoded();
        console.warn("[Callback]: priKey.getAlgorithm= " + globalPriKey.algName);
        console.warn("[Callback]: priKey.getEncoded= " + encodedPriKey.data);
        console.warn("[Callback]: priKey.getFormat= " + globalPriKey.format);
        rsaGenerator.convertKey(encodedPubKey, encodedPriKey, (err1, convertKeyPair)=>{
            if (err1) {
                expect(err1 == null).assertFail();
            }
            expect(convertKeyPair != null).assertTrue();
            let encodedConvertPubKey = convertKeyPair.pubKey.getEncoded();
            console.warn("[Callback]: pubKey.getAlgorithm= " + convertKeyPair.pubKey.algName);
            console.warn("[Callback]: pubKey.getEncoded= " + encodedConvertPubKey.data);
            console.warn("[Callback]: pubKey.getFormat= " + convertKeyPair.pubKey.format);
            let encodedConvertPriKey = convertKeyPair.priKey.getEncoded();
            console.warn("[Callback]: priKey.getAlgorithm= " + convertKeyPair.priKey.algName);
            console.warn("[Callback]: priKey.getEncoded= " + encodedConvertPriKey.data);
            console.warn("[Callback]: priKey.getFormat= " + convertKeyPair.priKey.format);
        });
    });
}

export {
    testAsyKeyEncryptDecryptCallback,
    testAsyKeySignVerifyCallback,
    testAsyKeyECDHCallback,
    testAsyKeyConvertKeyCallback,
};