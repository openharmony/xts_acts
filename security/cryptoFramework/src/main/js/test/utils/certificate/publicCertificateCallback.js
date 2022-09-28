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

function createX509CertInstanceCallback(certType) {
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
        cryptoFramework.createX509Cert(encodingBlob, (err, data) => {
            if (data == null) {
                console.error("[callback] create X509 Cert failed! err code: " + err.code);
                reject(err);
            } else {
                console.warn("[callback] create X509 Cert success! format is: " + certformat);
                resolve(data);
            }
        });
    });
}

function createX509CertInstanceforCrlTestCallback(flag) {
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
        cryptoFramework.createX509Cert(encodingBlob, (err, data) => {
            if (data == null) {
                console.error("[callback] create X509 Cert failed! err code: " + err.code);
                reject(err);
            } else {
                console.warn("[callback] create X509 Cert success! format is: " + certformat);
                resolve(data);
            }
        });
    });
}

async function verifyX509CertCallback(certType) {
    var gInstance;
    await createX509CertInstanceCallback(certType)
        .then(instance => {
            gInstance = instance;
            gInstance.getPublicKey((err, publicKey) => {
                if (publicKey == null) {
                    console.error("[callback] getPublickey failed, publickey is null");
                    expect(null).assertFail();
                }
                console.warn("[callback] getPublickey success");
                gInstance.verify(publicKey, (err1,) => {
                    if (err1) {
                        console.error("[callback] certificate verify failed");
                        expect(err1.code == 0).assertFail();
                    } else {
                        console.warn("[callback] certificate verify success");
                        expect(1 == 1).assertTrue();
                    }
                })
            })
        }).catch(err => {
            console.error("[callback] getPublickey failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

async function checkValidityX509CertCallback(certType, date) {
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
        cryptoFramework.createX509Cert(encodingBlob, (err, instance) => {
            if (instance == null) {
                console.error("[callback] create X509 Cert failed! err code: " + err.code);
                reject(instance);
            } else {
                console.warn("[callback] create X509 Cert success! format is: " + certformat);
                instance.checkValidityWithDate(date, (err,) => {
                    if (err) {
                        console.warn("[callback] checkValidityX509Cert failed! err.code is:" + err.code);
                        reject(err);
                    } else {
                        console.warn("[callback] checkValidityX509Cert success!");
                        resolve("");
                    }
                });
            }
        });
    });
}

async function getX509CertInfoCallback(certType, processType) {
    var gInstance;
    await createX509CertInstanceCallback(certType)
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
            console.error("[callback] getX509CertInfo failed! error is: " + err);
            expect(null).assertFail();
        });
}

async function checkGetEncodedX509CertCallback(certType) {
    var gInstance;
    await createX509CertInstanceCallback(certType)
        .then(instance => {
            gInstance = instance;
            gInstance.getEncoded((err, EncodingBlob) => {
                if (err) {
                    console.error("[callback] getEncoded failed, err code is:" + err.code);
                    expect(null).assertFail();
                } else {
                    console.warn("[callback] getEncoded success, EncodingBlob is:" + EncodingBlob);
                    expect(EncodingBlob != null).assertTrue();
                }
            })
        }).catch(err => {
            console.error("[callback] getPublickey failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}


async function checkGetPublicKeyX509CertCallback(certType) {
    var gInstance;
    await createX509CertInstanceCallback(certType)
        .then(instance => {
            gInstance = instance;
            gInstance.getPublicKey((err, publicKey) => {
                if (err) {
                    console.error("[callback] getPublicKey failed, err code is:" + err.code);
                    expect(null).assertFail();
                } else {
                    console.warn("[callback] getPublicKey success, publicKey is:" + publicKey);
                    expect(publicKey != null).assertTrue();
                }
            })
        }).catch(err => {
            console.error("[callback] getPublickey failed! error code is: " + err.code);
            expect(null).assertFail();
        });
}

function createX509CrlInstanceCallback(certType) {
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
        cryptoFramework.createX509Crl(encodingBlob, (err, data) => {
            if (err) {
                console.error("[callback] createX509Crl failed! error code is: " + err.code);
                reject(err);
            } else {
                console.warn("[callback] createX509Crl success! format is: " + certformat);
                resolve(data);
            }
        });
    });
}

function checkIsRevokedX509CrlCallback(crlInstance, flag) {
    return new Promise((resolve, reject) => {
        createX509CertInstanceforCrlTestCallback(flag)
            .then(certInstance => {
                crlInstance.isRevoked(certInstance, (err, status) => {
                    if (err) {
                        console.error("[callback] isRevoked failed! err code is:" + err.code);
                        reject(err);
                    } else {
                        console.warn("[callback] isRevoked status is:" + status);
                        resolve(status);
                    }
                });
            }).catch(err => {
            console.error("[callback] isRevoked failed!");
            reject(err);
        });
    });
}

async function checkGetEncodedX509CrlCallback(certType) {
    var gInstance;
    await createX509CrlInstanceCallback(certType)
        .then(instance => {
            gInstance = instance;
            gInstance.getEncoded((err, EncodingBlob) => {
                if (err) {
                    console.error("[callback] Crl getEncoded failed, err code is:" + err.code);
                    expect(null).assertFail();
                } else {
                    console.warn("[callback] Crl getEncoded success, EncodingBlob is:" + EncodingBlob);
                    expect(EncodingBlob != null).assertTrue();
                }
            })
        }).catch(err => {
            console.error("[callback] Crl getEncoded failed, err code is: " + err.code);
            expect(null).assertFail();
        });
}

function verifyX509CrlCallback() {
    var certformat;
    var priKeyEncodingData;
    var pubKeyEncodingData;
    var crlEncodingData;

    certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
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
        console.error("[callback]createAsyKeyGenerator is null");
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
        encodingFormat: certformat
    };

    asyKeyGenerator.convertKey(pubEncodingBlob, priEncodingBlob, (err, keyPair) => {
        if (err) {
            console.error("[callback]catch err: " + err);
            expect(err == null).assertFail();
        } else {
            let crlInstance = cryptoFramework.createX509Crl(crlEncodingBlob);
            crlInstance.verify(keyPair.pubKey, (err1,) => {
                if (err1) {
                    console.error("[callback]catch err: " + err1);
                    expect(err1 == null).assertFail();
                } else {
                    console.log("[callback]verify success!");
                    expect(null).assertTrue();
                }
            })
        }
    });
}

async function getX509CrlInfoCallback(certType, processType) {
    var gInstance;
    await createX509CrlInstanceCallback(certType)
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
                    gInstance.getTbsInfo((err, tbsInfo) => {
                        if (tbsInfo == null) {
                            console.error(processType + " is null");
                            expect(null).assertFail();
                        } else {
                            console.log(processType + " is : " + uInt8ArrayToString(tbsInfo.data));
                            expect(tbsInfo != null).assertTrue();
                        }
                    });
                    break;
                default:
                    console.log("Invalid parameter !");
                    expect(null).assertFail();
            }
        }).catch(err => {
            console.error("[callback] getX509CrtInfo failed! error is: " + err);
            expect(null).assertFail();
        });
}

function checkGetRevokedCertWithCertX509CrlCallback(crlInstance, flag) {
    return new Promise((resolve, reject) => {
        createX509CertInstanceforCrlTestCallback(flag)
            .then(certInstance => {
                crlInstance.getRevokedCertWithCert(certInstance, (err, crlEntry) => {
                    if (err) {
                        console.error("[callback] getRevokedCertWithCert failed! err code is:" + err.code);
                        reject(err);
                    } else {
                        console.warn("[callback] getRevokedCertWithCert is:" + crlEntry);
                        let num = crlEntry.getSerialNumber();
                        console.warn("[num] getRevokedCertWithCert num is:" + num);
                        resolve(crlEntry);
                    }
                });
            }).catch(err => {
            console.error("[callback] getRevokedCertWithCert failed! err is:" + err);
            reject(err);
        });
    });
}

async function checkGetRevokedCertsX509CrlCallback(certType) {
    var gInstance;
    var gIndex;
    await createX509CrlInstanceCallback(certType)
        .then(instance => {
            gInstance = instance;
            gInstance.getRevokedCerts((err, certs) => {
                if (certs == null) {
                    console.error("[callback] Crl get revoked certs failed, certs is null");
                    expect(null).assertFail();
                }
                console.warn("[callback] Crl get gevoked certs success");
                if (certs.length == 0) {
                    console.error("[callback] Crl revoked certs length is 0");
                    expect(null).assertFail();
                }
                for (var i = 0; i < certs.length; i++) {
                    gIndex = i;
                    console.log("[callback] certs i: " + gIndex + " serialNumber is: " + certs[gIndex].getSerialNumber());
                    certs[gIndex].getRevocationDate((err1, revocation) => {
                        if (revocation == null) {
                            console.error("[callback] certs i: " + gIndex + " revocation date is:  null");
                            expect(null).assertFail();
                        }
                        console.log("[callback] certs i: " + gIndex + " revocation date is: " + revocation);
                        certs[gIndex].getEncoded((err2, eData) => {
                            if (eData == null) {
                                console.error("[callback] certs i: " + gIndex + " getEncoded is:  null");
                                expect(null).assertFail();
                            }
                            console.log("[callback] certs i: " + gIndex + " getEncoded is: " + eData);
                        });
                    });
                }
            })
        }).catch(err => {
            console.error("[callback] Crl getPublickey failed! error is: " + err);
            expect(null).assertFail();
        });
}

async function checkGetRevokedCertX509CrlCallback(certType) {
    var gInstance;
    await createX509CrlInstanceCallback(certType)
        .then(instance => {
            gInstance = instance;
            gInstance.getRevokedCert(1, (err, cert) => {
                if (cert == null) {
                    console.error("[callback] Crl get revoked cert failed, cert is null");
                    expect(null).assertFail();
                }
                console.warn("[callback] Crl get gevoked cert success");
                cert.getRevocationDate((err1, revocation) => {
                    if (revocation == null) {
                        console.error("[callback] cert revocation date is:  null");
                        expect(null).assertFail();
                    }
                    console.log("[callback] cert revocation date is: " + revocation);
                });
                cert.getCertIssuer((err2, certIssuer) => {
                    if (certIssuer == null) {
                        console.error("[callback] cert certIssuer is:  null");
                        expect(null).assertFail();
                    }
                    console.log("[callback] cert certIssuer is: " + uInt8ArrayToString(certIssuer.data));
                });
            })
        }).catch(err => {
            console.error("[callback] Crl getPublickey failed! error is: " + err);
            expect(null).assertFail();
        });
}

function checkValidateOfCertChainValidatorCallback(algName) {
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
    validator.validate(certChainData, (err,) => {
        if (err) {
            console.error("[callback]: validate error: " + err);
            expect(null).assertFail();
        } else {
            console.warn("[callback]: validate success!");
            expect(1 == 1).assertTrue();
        }
    })
}

export {
    createX509CertInstanceCallback,
    verifyX509CertCallback,
    checkValidityX509CertCallback,
    checkGetEncodedX509CertCallback,
    checkGetPublicKeyX509CertCallback,
    getX509CertInfoCallback,
    createX509CrlInstanceCallback,
    checkIsRevokedX509CrlCallback,
    checkGetEncodedX509CrlCallback,
    verifyX509CrlCallback,
    getX509CrlInfoCallback,
    checkGetRevokedCertWithCertX509CrlCallback,
    checkGetRevokedCertsX509CrlCallback,
    checkGetRevokedCertX509CrlCallback,
    checkValidateOfCertChainValidatorCallback,
};
