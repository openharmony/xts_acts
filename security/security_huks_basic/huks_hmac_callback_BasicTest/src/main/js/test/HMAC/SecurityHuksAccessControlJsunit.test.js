/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, it, expect } from '@ohos/hypium';
import huks from '@ohos.security.huks';
import Data from '../../../../../../utils/data.json';
import { stringToUint8Array } from '../../../../../../utils/param/publicFunc';
import {
    HuksSignVerifyDSA,
    HuksSignVerifyRSA,
    HuksSignVerifyECC
} from '../../../../../../utils/param/signverify/publicSignverifyParam';
import { HuksAgreeDH, HuksAgreeECDH } from '../../../../../../utils/param/agree/publicAgreeParam';
import { HuksCipherAES, HuksCipherRSA } from '../../../../../../utils/param/cipher/publicCipherParam';
import { HuksHmac } from '../../../../../../utils/param/hmac/publicHmacParam';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);

function generateKey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.generateKey(srcKeyAlies, HuksOptions, function (err, data) {
            console.log(`test generateKey data: ${JSON.stringify(data)}`);
            if (err.code !== 0) {
                console.log('test generateKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

function exportKey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.exportKey(srcKeyAlies, HuksOptions, function (err, data) {
            console.log(`test exportKey data: ${JSON.stringify(data)}`);
            if (err.code !== 0) {
                console.log('test exportKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

function init(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.init(srcKeyAlies, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                console.log('test init err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

function deleteKey(srcKeyAlies, HuksOptions) {
    return new Promise((resolve, reject) => {
        huks.deleteKey(srcKeyAlies, HuksOptions, function (err, data) {
            if (err.code !== 0) {
                console.log('test deleteKey err information: ' + JSON.stringify(err));
                reject(err);
            } else {
                resolve(data);
            }
        });
    });
}

async function generateKeyFunc(srcKeyAlies, HuksOptions) {
    await generateKey(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test generateKey data: ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test generateKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function deleteKeyFunc(srcKeyAlies, HuksOptions) {
    await deleteKey(srcKeyAlies, HuksOptions)
        .then((data) => {
            console.log(`test deleteKey data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            console.log('test deleteKey err information: ' + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function exportKeyFunc(srcKeyAlias, HuksOptions) {
    await exportKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            console.log('test exportKey data = ' + JSON.stringify(data));
            expect(data.errorCode == 0).assertTrue();
        }).catch((err) => {
            console.log(`test exportKey err: " + ${JSON.stringify(err)}`);
            expect(null).assertFail();
        })
}

export function SecurityHuksAccessControlJsunit() {
describe('SecurityHuksAccessControlJsunit', function () {
    it('HUKS_Basic_Capability_AccessControl_0100', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0100";
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifyDSA.HuksKeyAlgDSA,
                HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
                HuksSignVerifyDSA.HuksKeySIZE1024,
                HuksSignVerifyDSA.HuksTagDSADigestSHA1
            ),
            inData: srcData63Kb,
        }
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksAgreeDH.HuksKeyPurposeDH);
        HuksOptions.properties.splice(3, 1);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -112).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_0200', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0200";
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifyECC.HuksKeyAlgECC,
                HuksSignVerifyECC.HuksKeyECCPurposeSINGVERIFY,
                HuksSignVerifyECC.HuksKeyECCSize224,
                HuksSignVerifyECC.HuksTagECCDigestNONE,
            ),
            inData: srcData63Kb,
        }
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(0, 1, HuksAgreeECDH.HuksKeyAlgECDH);
        HuksOptions.properties.splice(1, 1, HuksAgreeECDH.HuksKeyPurposeECDH);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -3).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -3).assertTrue();
        });
        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_0300', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0300";
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifyDSA.HuksKeyAlgDSA,
                HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
                HuksSignVerifyDSA.HuksKeySIZE1024,
                HuksSignVerifyDSA.HuksTagDSADigestSHA1
            ),
            inData: srcData63Kb,
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyPurposeENCRYPT);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(null).assertFail();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(null).assertFail();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    })

    it("HUKS_Basic_Capability_AccessControl_0400", 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0400";
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifyRSA.HuksKeyAlgRSA,
                HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
                HuksSignVerifyRSA.HuksTagPKCS1DigestMD5,
                HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
                HuksSignVerifyRSA.HuksKeyRSASize512
            ),
            inData: srcData63Kb,
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeENCRYPT);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -3).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -3).assertTrue();
        });

        HuksOptions.properties.splice(1, 1, HuksCipherRSA.HuksKeyPurposeDECRYPT);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -3).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -3).assertTrue();
        });

        HuksOptions.properties.splice(1, 1, HuksHmac.HuksKeyPurpose);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -112).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it("HUKS_Basic_Capability_AccessControl_0500", 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0500";
        let HuksOptions = {
            properties: new Array(
                HuksCipherAES.HuksKeyAlgAES,
                HuksCipherAES.HuksKeyPurpose,
                HuksCipherAES.HuksKeyAESSize128,
                HuksCipherAES.HuksKeyAESBLOCKMODE,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
            ),
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        HuksOptions.properties.splice(1, 1, HuksHmac.HuksKeyPurpose);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -112).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_0600', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0600";
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifyDSA.HuksKeyAlgDSA,
                HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
                HuksSignVerifyDSA.HuksKeySIZE1024,
                HuksSignVerifyDSA.HuksTagDSADigestSHA1
            ),
            inData: srcData63Kb,
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksHmac.HuksKeyPurpose);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(null).assertFail();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_0700', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0700";
        let HuksOptions = {
            properties: new Array(
                HuksCipherAES.HuksKeyAlgAES,
                HuksCipherAES.HuksKeyPurpose,
                HuksCipherAES.HuksKeyAESSize128,
                HuksCipherAES.HuksKeyAESBLOCKMODE,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
            ),
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN);
        HuksOptions.properties.splice(5, 1, HuksSignVerifyRSA.HuksTagPKCS1DigestNONE);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(null).assertFail();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        HuksOptions.properties.splice(1, 1, HuksSignVerifyRSA.HuksKeyRSAPurposeVERIFY);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(null).assertFail();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_0800', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0800";
        let HuksOptions = {
            properties: new Array(
                HuksAgreeECDH.HuksKeyAlgECC,
                HuksAgreeECDH.HuksKeyPurposeECDH,
                HuksAgreeECDH.HuksKeyECCSize224,
                HuksAgreeECDH.HuksKeyECCDIGEST,
                HuksAgreeECDH.HuksKeyECCPADDING,
                HuksAgreeECDH.HuksKeyECCBLOCKMODE
            ),
            inData: srcData63Kb,
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(0, 1, HuksSignVerifyECC.HuksKeyECCPurposeSIGN);
        HuksOptions.properties.splice(4, 2);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -3).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -3).assertTrue();
        });

        HuksOptions.properties.splice(0, 1, HuksSignVerifyECC.HuksKeyECCPurposeVERIFY);
        HuksOptions.properties.splice(4, 2);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -3).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -3).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_0900', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_0900";
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifyDSA.HuksKeyAlgDSA,
                HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY,
                HuksSignVerifyDSA.HuksKeySIZE1024,
                HuksSignVerifyDSA.HuksTagDSADigestSHA1
            ),
            inData: srcData63Kb,
        }
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        await exportKeyFunc(srcKeyAlias, HuksOptions);

        HuksOptions.properties.splice(1, 1, HuksAgreeDH.HuksKeyPurposeDH);
        HuksOptions.properties.splice(3, 1);
        await huks.init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -112).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -112).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_1000', 0, async function (done) {
        let srcKeyAlias = "HUKS_Basic_Capability_AccessControl_1000";
        let HuksOptions = {
            properties: new Array(
                HuksCipherAES.HuksKeyAlgAES,
                HuksCipherAES.HuksKeyPurposeENCRYPT,
                HuksCipherAES.HuksKeyAESSize128,
                HuksCipherAES.HuksKeyAESBLOCKMODE,
                HuksCipherAES.HuksKeyAESPADDINGNONE,
            ),
        };
        await generateKeyFunc(srcKeyAlias, HuksOptions);
        HuksOptions.properties.splice(1, 1, HuksCipherAES.HuksKeyPurposeDECRYPT);
        await init(srcKeyAlias, HuksOptions).then((data) => {
            console.log(`test init data: ${JSON.stringify(data)}`);
            expect(data.errorCode == -3).assertTrue();
        }).catch((err) => {
            console.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(err.code == -3).assertTrue();
        });

        await deleteKeyFunc(srcKeyAlias, HuksOptions);
        done();
    });

    it('HUKS_Basic_Capability_AccessControl_9000', 0, async function (done) {
        expect(-126).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_WRAPPED_FORMAT);
        expect(-127).assertEqual(huks.HuksErrorCode.HUKS_ERROR_INVALID_USAGE_OF_KEY);
        expect(0).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_PUBLIC_KEY);
        expect(1).assertEqual(huks.HuksImportKeyType.HUKS_KEY_TYPE_PRIVATE_KEY);
        done();
    });
});
}
