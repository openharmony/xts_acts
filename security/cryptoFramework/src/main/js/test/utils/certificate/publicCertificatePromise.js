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
import {
    chainFirstCaCert,
    chainSecondCaCert,
    selfSignedCaCertPem,
    selfSignedCaCertDer,
    rootCert,
    testInvalidCert,
    testErrorCert,
    testCert,
    testCrlPem,
    testCrlDer,
    crlVerifyPriKeyHex,
    crlVerifyPubKeyHex,
    crlHex
} from "../common/publicParam";

function createX509CertInstancePromise(certType) {
    var certformat;
    var encodingData;

    if (certType == "der") {
        certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
        encodingData = new Uint8Array(selfSignedCaCertDer.match(/[\da-f]{2}/gi).map(function (h) {
            return parseInt(h, 16);
        }));
    } else {
        certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
        encodingData = stringTouInt8Array(selfSignedCaCertPem);
    }

    var encodingBlob = {
        data: encodingData,
        encodingFormat: certformat
    };

    return new Promise((resolve, reject) => {
        cryptoFramework.createX509Cert(encodingBlob).then(data => {
            console.warn("[promise] create X509 Cert success! format is: " + certformat);
            resolve(data);
        }).catch(err => {
            console.error("[promise] create X509 Cert failed! error code is: " + err.code);
            reject(err);
        });
    })
}

function createX509CertInstanceforCrlTestPromise(flag) {
    var certformat;
    var encodingData;

    if (flag == "normal") {
        certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
        encodingData = stringTouInt8Array(testCert);
    } else {
        certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
        encodingData = stringTouInt8Array(testErrorCert);
    }

    var encodingBlob = {
        data: encodingData,
        encodingFormat: certformat
    };

    return new Promise((resolve, reject) => {
        cryptoFramework.createX509Cert(encodingBlob).then(data => {
            console.warn("[promise] create X509 Cert success! format is: " + certformat);
            resolve(data);
        }).catch(err => {
            console.error("[promise] create X509 Cert failed! error code is: " + err.code);
            reject(err);
        });
    })
}

async function verifyX509CertPromise(certType) {
    var gInstance;
    await createX509CertInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let data = gInstance.getPublicKey();
            gInstance = instance;
            return data;
        }).then(publicKey => {
            if (publicKey == null) {
                console.error("[promise] getPublickey failed! data is null ");
                return;
            }
            console.warn("[promise]  getPublickey success!");
            let verifyret = gInstance.verify(publicKey);
            return verifyret;
        }).then(verifyret => {
            expect(verifyret == null).assertTrue();
        }).catch(err => {
            console.error("[promise] getPublickey failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

async function checkValidityX509CertPromise(certType, date) {
    var gInstance;
    await createX509CertInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let result = gInstance.checkValidityWithDate(date);
            return result;
        }).then(result => {
            console.warn("[promise] checkValidityX509Cert success!");
            expect(result == null).assertTrue();
        }).catch(err => {
            console.error("[promise] checkValidityX509Cert failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

async function getX509CertInfoPromise(certType, processType) {
    var gInstance;
    await createX509CertInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            switch (processType) {
                case "getVersion":
                    let version = gInstance.getVersion();
                    console.log(processType + " is : " + version);
                    expect(version != null).assertTrue();
                    break;
                case "getSerialNumber":
                    let serialNumber = gInstance.getSerialNumber();
                    console.log(processType + " is : " + serialNumber);
                    expect(serialNumber != null).assertTrue();
                    break;
                case "getIssuerName":
                    let issuerName = gInstance.getIssuerName();
                    console.log(processType + " is : " + uInt8ArrayToString(issuerName.data));
                    expect(issuerName != null).assertTrue();
                    break;
                case "getSubjectName":
                    let subjectName = gInstance.getSubjectName();
                    console.log(processType + " is : " + uInt8ArrayToString(subjectName.data));
                    expect(subjectName != null).assertTrue();
                    break;
                case "getNotBeforeTime":
                    let notBeforeTime = gInstance.getNotBeforeTime();
                    console.log(processType + " is : " + notBeforeTime);
                    expect(notBeforeTime != null).assertTrue();
                    break;
                case "getNotAfterTime":
                    let notAfterTime = gInstance.getNotAfterTime();
                    console.log(processType + " is : " + notAfterTime);
                    expect(notAfterTime != null).assertTrue();
                    break;
                case "getSignature":
                    let signature = gInstance.getSignature();
                    console.log(processType + " is : " + uInt8ArrayToString(signature.data));
                    expect(signature != null).assertTrue();
                    break;
                case "getSignatureAlgName":
                    let signatureAlgName = gInstance.getSignatureAlgName();
                    console.log(processType + " is : " + signatureAlgName);
                    expect(signatureAlgName != null).assertTrue();
                    break;
                case "getSignatureAlgOid":
                    let signatureAlgOid = gInstance.getSignatureAlgOid();
                    console.log(processType + " is : " + signatureAlgOid);
                    expect(signatureAlgOid != null).assertTrue();
                    break;
                case "getSignatureAlgParams":
                    let signatureAlgParams = gInstance.getSignatureAlgParams();
                    console.log(processType + " is : " + uInt8ArrayToString(signatureAlgParams.data));
                    expect(signatureAlgParams != null).assertTrue();
                    break;
                case "getKeyUsage":
                    let keyUsage = gInstance.getKeyUsage();
                    console.log(processType + " is : " + uInt8ArrayToString(keyUsage.data));
                    expect(keyUsage != null).assertTrue();
                    break;
                case "getExtKeyUsage":
                    let extKeyUsage = gInstance.getExtKeyUsage();
                    console.log(processType + " is : " + extKeyUsage.data);
                    expect(extKeyUsage != null).assertTrue();
                    break;
                case "getBasicConstraints":
                    let basicConstraints = gInstance.getBasicConstraints();
                    console.log(processType + " is : " + basicConstraints);
                    expect(basicConstraints != null).assertTrue();
                    break;
                case "getSubjectAltNames":
                    let subjectAltNames = gInstance.getSubjectAltNames();
                    console.log(processType + " is : " + subjectAltNames.data);
                    expect(subjectAltNames != null).assertTrue();
                    break;
                case "getIssuerAltNames":
                    let issuerAltNames = gInstance.getIssuerAltNames();
                    console.log(processType + " is : " + issuerAltNames.data);
                    expect(issuerAltNames != null).assertTrue();
                    break;
                default:
                    console.log("Invalid parameter !");
                    expect(null).assertFail();
            }
        }).catch(err => {
            console.error("[promise] getX509CertInfo failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}


async function checkGetEncodedX509CertPromise(certType) {
    var gInstance;
    await createX509CertInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let encodedBlob = gInstance.getEncoded();
            return encodedBlob;
        }).then(encodedBlob => {
            console.warn("[promise] getEncoded success, EncodingBlob is:" + encodedBlob);
            expect(encodedBlob != null).assertTrue();
        }).catch(err => {
            console.error("[promise] getEncoded failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

async function checkGetPublicKeyX509CertPromise(certType) {
    var gInstance;
    await createX509CertInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let publicKey = gInstance.getPublicKey();
            return publicKey;
        }).then(publicKey => {
            console.warn("[promise] publicKey success, publicKey is:" + publicKey);
            expect(publicKey != null).assertTrue();
        }).catch(err => {
            console.error("[promise] publicKey failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

function createX509CrlInstancePromise(certType) {
    var certformat;
    var encodingData;

    if (certType == "der") {
        certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
        encodingData = new Uint8Array(testCrlDer.match(/[\da-f]{2}/gi).map(function (h) {
            return parseInt(h, 16);
        }));
    } else {
        certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
        encodingData = stringTouInt8Array(testCrlPem);
    }

    var encodingBlob = {
        data: encodingData,
        encodingFormat: certformat
    };

    return new Promise((resolve, reject) => {
        cryptoFramework.createX509Crl(encodingBlob).then(data => {
            console.warn("[promise] createX509Crl success! format is: " + certformat);
            resolve(data);
        }).catch(err => {
            console.error("[promise] createX509Crl failed! error code is: " + err.code);
            reject(err);
        });
    })
}

function checkIsRevokedX509CrlPromise(crlInstance, flag) {
    return new Promise((resolve, reject) => {
        createX509CertInstanceforCrlTestPromise(flag)
            .then(certInstance => {
                let status = crlInstance.isRevoked(certInstance);
                return status;
            }).then(status => {
            console.warn("[promise] isRevoked status is:" + status);
            resolve(status);
        }).catch(err => {
            console.error("[promise] isRevoked failed!");
            reject(err);
        });
    });
}

async function checkGetEncodedX509CrlPromise(certType) {
    var gInstance;
    await createX509CrlInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let encodedBlob = gInstance.getEncoded();
            return encodedBlob;
        }).then(encodedBlob => {
            console.warn("[promise] Crl getEncoded success, EncodingBlob is:" + encodedBlob);
            expect(encodedBlob != null).assertTrue();
        }).catch(err => {
            console.error("[promise] Crl getEncoded failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

function verifyX509CrlPromise() {
    var certFormat;
    var priKeyEncodingData;
    var pubKeyEncodingData;
    var crlEncodingData;

    certFormat = cryptoFramework.EncodingFormat.FORMAT_DER;
    priKeyEncodingData = new Uint8Array(crlVerifyPriKeyHex.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
    }));
    pubKeyEncodingData = new Uint8Array(crlVerifyPubKeyHex.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
    }));
    crlEncodingData = new Uint8Array(crlHex.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
    }));

    var asyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
    if (asyKeyGenerator == null) {
        console.error("[promise]createAsyKeyGenerator is null");
        expect(asyKeyGenerator == null).assertFail();
    }

    var priEncodingBlob = {
        data: priKeyEncodingData,
    };

    var pubEncodingBlob = {
        data: pubKeyEncodingData,
    };

    var crlEncodingBlob = {
        data: crlEncodingData,
        encodingFormat: certFormat
    };

    asyKeyGenerator.convertKey(pubEncodingBlob, priEncodingBlob).then(keyPair => {
        let crlInstance = cryptoFramework.createX509Crl(crlEncodingBlob);
        let ret = crlInstance.verify(keyPair.pubKey);
        return ret;
    }).then(() => {
        console.log("[promise]verify success!");
        expect(null).assertTrue();
    }).catch(err => {
        console.error("[promise]catch err: " + err);
        expect(err == null).assertFail();
    });
}

async function getX509CrlInfoPromise(certType, processType) {
    var gInstance;
    await createX509CrlInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            switch (processType) {
                case "getType":
                    let type = gInstance.getType();
                    console.log(processType + " is : " + type);
                    expect(type != null).assertTrue();
                    break;
                case "getVersion":
                    let version = gInstance.getVersion();
                    console.log(processType + " is : " + version);
                    expect(version != null).assertTrue();
                    break;
                case "getIssuerName":
                    let issuerName = gInstance.getIssuerName();
                    console.log(processType + " is : " + uInt8ArrayToString(issuerName.data));
                    expect(issuerName != null).assertTrue();
                    break;
                case "getLastUpdate":
                    let lastUpdate = gInstance.getLastUpdate();
                    console.log(processType + " is : " + lastUpdate);
                    expect(lastUpdate != null).assertTrue();
                    break;
                case "getNextUpdate":
                    let nextUpdate = gInstance.getNextUpdate();
                    console.log(processType + " is : " + nextUpdate);
                    expect(nextUpdate != null).assertTrue();
                    break;
                case "getSignature":
                    let signature = gInstance.getSignature();
                    console.log(processType + " is : " + uInt8ArrayToString(signature.data));
                    expect(signature != null).assertTrue();
                    break;
                case "getSignatureAlgName":
                    let signatureAlgName = gInstance.getSignatureAlgName();
                    console.log(processType + " is : " + signatureAlgName);
                    expect(signatureAlgName != null).assertTrue();
                    break;
                case "getSignatureAlgOid":
                    let signatureAlgOid = gInstance.getSignatureAlgOid();
                    console.log(processType + " is : " + signatureAlgOid);
                    expect(signatureAlgOid != null).assertTrue();
                    break;
                case "getSignatureAlgParams":
                    let signatureAlgParams = gInstance.getSignatureAlgParams();
                    console.log(processType + " is : " + uInt8ArrayToString(signatureAlgParams.data));
                    expect(signatureAlgParams != null).assertTrue();
                    break;
                case "getTbsInfo":
                    let tbsInfo = gInstance.getTbsInfo();
                    return tbsInfo;
                default:
                    console.log("Invalid parameter !");
                    expect(null).assertFail();
            }
        }).then(tbsInfo => {
            if (processType == "getTbsInfo") {
                if (tbsInfo == null) {
                    console.error(processType + " is null");
                    expect(null).assertFail();
                } else {
                    console.log(processType + " is : " + uInt8ArrayToString(tbsInfo.data));
                    expect(tbsInfo != null).assertTrue();
                }
            }
        }).catch(err => {
            console.error("[promise] getX509CrtInfo failed! error is: " + err);
            expect(null).assertFail();
        });
}

function checkGetRevokedCertWithCertX509CrlPromise(crlInstance, flag) {
    return new Promise((resolve, reject) => {
        createX509CertInstanceforCrlTestPromise(flag)
            .then(certInstance => {
                let crlEntry = crlInstance.getRevokedCertWithCert(certInstance);
                return crlEntry;
            }).then(crlEntry => {
            console.warn("[promise] getRevokedCertWithCert is:" + crlEntry);
            let num = crlEntry.getSerialNumber();
            console.warn("[promise] getRevokedCertWithCert num is:" + num);
            resolve(crlEntry);
        }).catch(err => {
            console.error("[promise] getRevokedCertWithCert failed!");
            reject(err);
        });
    });
}

async function checkGetRevokedCertsX509CrlPromise(certType) {
    var gInstance;
    var gIndex;
    await createX509CrlInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let certs = gInstance.getRevokedCerts();
            return certs;
        }).then(certs => {
            if (certs == null) {
                console.error("[Promise] Crl get revoked certs failed, certs is null");
                expect(null).assertFail();
            }
            console.warn("[Promise] Crl get gevoked certs success");
            if (certs.length == 0) {
                console.error("[Promise] Crl revoked certs length is 0");
                expect(null).assertFail();
            }
            for (var i = 0; i < certs.length; i++) {
                gIndex = i;
                console.log("[Promise] certs i: " + gIndex + " serialNumber is: " + certs[gIndex].getSerialNumber());
                certs[gIndex].getRevocationDate()
                    .then(revocation => {
                        if (revocation == null) {
                            console.error("[Promise] certs i: " + gIndex + " revocation date is:  null");
                            expect(null).assertFail();
                        }
                        console.log("[Promise] certs i: " + gIndex + " revocation date is: " + revocation);
                    }).catch(err => {
                    console.error("[Promise] certs i: " + gIndex + " revocation date is: " + err);
                })
                certs[gIndex].getEncoded()
                    .then(eData => {
                        if (eData == null) {
                            console.error("[Promise] certs i: " + gIndex + " getEncoded is:  null");
                            expect(null).assertFail();
                        }
                        console.log("[Promise] certs i: " + gIndex + " getEncoded is: " + eData);
                    }).catch(err => {
                    console.error("[Promise] certs i: " + gIndex + " getEncoded err is: " + err);
                })
            }
        }).catch(err => {
            console.error("[Promise] Crl gevoked certs failed! error  is: " + err);
            expect(null).assertFail();
        });
}

async function checkGetRevokedCertX509CrlPromise(certType) {
    var gInstance;
    await createX509CrlInstancePromise(certType)
        .then(instance => {
            gInstance = instance;
            let cert = gInstance.getRevokedCert(1);
            return cert;
        }).then(cert => {
            if (cert == null) {
                console.error("[Promise] Crl get revoked cert failed, cert is null");
                expect(null).assertFail();
            }
            console.warn("[Promise] Crl get gevoked certs success");
            cert.getRevocationDate()
                .then(revocation => {
                    if (revocation == null) {
                        console.error("[Promise] certs revocation date is:  null");
                        expect(null).assertFail();
                    }
                    console.log("[Promise] cert revocation date is: " + revocation);
                }).catch(err => {
                console.error("[Promise] cert  revocation date is: " + err);
            });
            cert.getCertIssuer()
                .then(certIssuer => {
                    if (certIssuer == null) {
                        console.error("[Promise] certs certIssuer is:  null");
                        expect(null).assertFail();
                    }
                    console.log("[Promise] cert certIssuer is: " + +uInt8ArrayToString(certIssuer.data));
                }).catch(err => {
                console.error("[Promise] cert  certIssuer is: " + err);
            });
        }).catch(err => {
            console.error("[Promise] Crl gevoked cert failed! error  is: " + err);
            expect(null).assertFail();
        });
}

function checkValidateOfCertChainValidatorPromise(algName) {
    var validator = cryptoFramework.createCertChainValidator(algName);
    if (validator == null) {
        console.error("createCertChainValidator failed, validator is null");
        expect(null).assertFail();
    }
    var algorithm = validator.algorithm;
    console.log("createCertChainValidator success! algorithm is: " + algorithm);
    var certArray1 = stringTouInt8Array(chainFirstCaCert);
    var byteLength1 = certArray1.byteLength;
    var uInt16CertLength1 = new Uint16Array([byteLength1]);
    var uInt8CertLength1 = new Uint8Array([uInt16CertLength1.buffer]);

    var certArray2 = stringTouInt8Array(chainSecondCaCert);
    var byteLength2 = certArray2.byteLength;
    var uInt16CertLength2 = new Uint16Array([byteLength2]);
    var uInt8CertLength2 = new Uint8Array([uInt16CertLength2.buffer]);

    var dataArray = new Uint8Array(uInt8CertLength2.length + certArray2.length + uInt8CertLength1.length + certArray1.length);
    for (var i = 0; i < uInt8CertLength2.length; i++) {
        dataArray[i] = uInt8CertLength2[i];
    }
    for (var i = 0; i < certArray2.length; i++) {
        dataArray[i+uInt8CertLength2.length] = certArray2[i];
    }
    for (var i = 0; i < uInt8CertLength1.length; i++) {
        dataArray[i + uInt8CertLength2.length + certArray2.length] = uInt8CertLength1[i];
    }
    for (var i = 0; i < certArray1.length; i++) {
        dataArray[i + uInt8CertLength2.length + certArray2.length + uInt8CertLength1.length] = certArray1[i];
    }
    var certChainData = {
        data: dataArray,
        count: 2,
        encodingFormat: cryptoFramework.EncodingFormat.FORMAT_PEM
    };
    validator.validate(certChainData).then(() => {
        console.warn("[promise]: validate success!");
        expect(1 == 1).assertTrue();
    }).catch(err => {
        console.error("[promise]: validate error: " + err);
        expect(null).assertFail();
    });
}

export {
    createX509CertInstancePromise,
    verifyX509CertPromise,
    checkValidityX509CertPromise,
    checkGetEncodedX509CertPromise,
    checkGetPublicKeyX509CertPromise,
    getX509CertInfoPromise,
    createX509CrlInstancePromise,
    checkIsRevokedX509CrlPromise,
    checkGetEncodedX509CrlPromise,
    verifyX509CrlPromise,
    getX509CrlInfoPromise,
    checkGetRevokedCertWithCertX509CrlPromise,
    checkGetRevokedCertsX509CrlPromise,
    checkGetRevokedCertX509CrlPromise,
    checkValidateOfCertChainValidatorPromise,
};
