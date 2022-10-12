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
} from "../common/publicDoString";
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
  crlHex,
} from "../common/publicParam";

function createX509CertInstanceCallback(certType) {
  var certformat;
  var encodingData;

  if (certType == "der") {
    certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(
      selfSignedCaCertDer.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
  } else {
    certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(selfSignedCaCertPem);
  }

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cryptoFramework.createX509Cert(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback] create X509 Cert failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
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
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cryptoFramework.createX509Cert(encodingBlob, (err, data) => {
      if (data == null) {
        console.error(
          "[callback] create X509 Cert failed! err code: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

async function getX509CertPublicKey(certInstance) {
  return new Promise((resolve, reject) => {
    certInstance.getPublicKey((err, publicKey) => {
      if (err) {
        console.error("[Callback]getPublicKey failed. error is " + err);
        reject(err);
      } else {
        console.log(
          "[Callback]getPublicKey success. publicKey is " + publicKey
        );
        resolve(publicKey);
      }
    });
  });
}

async function verifyX509Cert(certInstance, pubKey) {
  return new Promise((resolve, reject) => {
    certInstance.verify(pubKey, (err) => {
      if (err) {
        console.error("[Callback]verify failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]verify success!");
        resolve();
      }
    });
  });
}

async function verifyX509CertCallback(certType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        return getX509CertPublicKey(gInstance);
      })
      .then((pubKey) => {
        expect(pubKey != null).assertTrue();
        return verifyX509Cert(gInstance, pubKey);
      })
      .then((output) => {
        resolve(output);
      })
      .catch((err) => {
        console.error(
          "[callback] verifyX509CertCallback failed! error is: " + err
        );
        reject(err);
      });
  });
}

async function checkValidityX509CertCallback(certType, date) {
  var certformat;
  var encodingData;

  if (certType == "der") {
    certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(
      selfSignedCaCertDer.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
  } else {
    certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(selfSignedCaCertPem);
  }

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cryptoFramework.createX509Cert(encodingBlob, (err, instance) => {
      if (instance == null) {
        console.error(
          "[callback] create X509 Cert failed! err code: " + err.code
        );
        reject(instance);
      } else {
        console.warn(
          "[callback] create X509 Cert success! format is: " + certformat
        );
        instance.checkValidityWithDate(date, (err) => {
          if (err) {
            console.warn(
              "[callback] checkValidityX509Cert failed! err.code is:" + err.code
            );
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
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
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
            console.log(
              processType + " is : " + uInt8ArrayToString(issuerName.data)
            );
            expect(issuerName != null).assertTrue();
            break;
          case "getSubjectName":
            let subjectName = gInstance.getSubjectName();
            console.log(
              processType + " is : " + uInt8ArrayToString(subjectName.data)
            );
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
            console.log(
              processType + " is : " + uInt8ArrayToString(signature.data)
            );
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
            console.log(
              processType +
                " is : " +
                uInt8ArrayToString(signatureAlgParams.data)
            );
            expect(signatureAlgParams != null).assertTrue();
            break;
          case "getKeyUsage":
            let keyUsage = gInstance.getKeyUsage();
            console.log(
              processType + " is : " + uInt8ArrayToString(keyUsage.data)
            );
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
            reject(processType);
        }
        resolve();
      })
      .catch((err) => {
        console.error("[callback] getX509CertInfo failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetEncodedX509CertCallback(certType) {
  var gInstance;

  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getEncoded((err, EncodingBlob) => {
          if (err) {
            console.error(
              "[callback] getEncoded failed, err code is:" + err.code
            );
            reject(err);
          } else {
            console.warn(
              "[callback] getEncoded success, EncodingBlob is:" + EncodingBlob
            );
            expect(EncodingBlob != null).assertTrue();
            resolve();
          }
        });
      })
      .catch((err) => {
        console.error("[callback] getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetPublicKeyX509CertCallback(certType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CertInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getPublicKey((err, publicKey) => {
          if (err) {
            console.error("[callback] getPublicKey failed, err is:" + err);
            reject(err);
          } else {
            console.warn(
              "[callback] getPublicKey success, publicKey is:" + publicKey
            );
            expect(publicKey != null).assertTrue();
            resolve();
          }
        });
      })
      .catch((err) => {
        console.error("[callback] getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

function createX509CrlInstanceCallback(certType) {
  var certformat;
  var encodingData;

  if (certType == "der") {
    certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
    encodingData = new Uint8Array(
      testCrlDer.match(/[\da-f]{2}/gi).map(function (h) {
        return parseInt(h, 16);
      })
    );
  } else {
    certformat = cryptoFramework.EncodingFormat.FORMAT_PEM;
    encodingData = stringTouInt8Array(testCrlPem);
  }

  var encodingBlob = {
    data: encodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    cryptoFramework.createX509Crl(encodingBlob, (err, data) => {
      if (err) {
        console.error(
          "[callback] createX509Crl failed! error code is: " + err.code
        );
        reject(err);
      } else {
        console.warn(
          "[callback] createX509Crl success! format is: " + certformat
        );
        resolve(data);
      }
    });
  });
}

function checkIsRevokedX509CrlCallback(crlInstance, flag) {
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCrlTestCallback(flag)
      .then((certInstance) => {
        crlInstance.isRevoked(certInstance, (err, status) => {
          if (err) {
            console.error(
              "[callback] isRevoked failed! err code is:" + err.code
            );
            reject(err);
          } else {
            console.warn("[callback] isRevoked status is:" + status);
            resolve(status);
          }
        });
      })
      .catch((err) => {
        console.error("[callback] isRevoked failed!");
        reject(err);
      });
  });
}

async function checkGetEncodedX509CrlCallback(certType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getEncoded((err, EncodingBlob) => {
          if (err) {
            console.error("[callback] Crl getEncoded failed, err is:" + err);
            reject(err);
          } else {
            console.warn(
              "[callback] Crl getEncoded success, EncodingBlob is:" +
                EncodingBlob
            );
            expect(EncodingBlob != null).assertTrue();
            resolve();
          }
        });
      })
      .catch((err) => {
        console.error("[callback] Crl getEncoded failed, err is: " + err);
        reject(err);
      });
  });
}

async function convertAsyKey(rsaGenerator, pubKeyDataBlob, priKeyDataBlob) {
  return new Promise((resolve, reject) => {
    rsaGenerator.convertKey(
      pubKeyDataBlob,
      priKeyDataBlob,
      (err, convertKeyPair) => {
        if (err) {
          console.error("[Callback]convertKey failed. error is " + err);
          reject(err);
        } else {
          console.log(
            "[Callback]convertKey success. convertKeyPair is " + convertKeyPair
          );
          resolve(convertKeyPair);
        }
      }
    );
  });
}

async function verifyX509Crl(crlInstance, pubKey) {
  return new Promise((resolve, reject) => {
    crlInstance.verify(pubKey, (err) => {
      if (err) {
        console.error("[Callback]verifyX509Crl failed. error is " + err);
        reject(err);
      } else {
        console.log("[Callback]verifyX509Crl success!");
        resolve();
      }
    });
  });
}

function verifyX509CrlCallback() {
  var certformat;
  var priKeyEncodingData;
  var pubKeyEncodingData;
  var crlEncodingData;
  var globalCrlInstance;

  certformat = cryptoFramework.EncodingFormat.FORMAT_DER;
  priKeyEncodingData = new Uint8Array(
    crlVerifyPriKeyHex.match(/[\da-f]{2}/gi).map(function (h) {
      return parseInt(h, 16);
    })
  );
  pubKeyEncodingData = new Uint8Array(
    crlVerifyPubKeyHex.match(/[\da-f]{2}/gi).map(function (h) {
      return parseInt(h, 16);
    })
  );
  crlEncodingData = new Uint8Array(
    crlHex.match(/[\da-f]{2}/gi).map(function (h) {
      return parseInt(h, 16);
    })
  );
  var priEncodingBlob = {
    data: priKeyEncodingData,
  };
  var pubEncodingBlob = {
    data: pubKeyEncodingData,
  };
  var crlEncodingBlob = {
    data: crlEncodingData,
    encodingFormat: certformat,
  };

  return new Promise((resolve, reject) => {
    var asyKeyGenerator =
      cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_3");
    expect(asyKeyGenerator != null).assertTrue();
    cryptoFramework
      .createX509Crl(crlEncodingBlob)
      .then((crlInstance) => {
        expect(crlInstance != null).assertTrue();
        globalCrlInstance = crlInstance;
        return convertAsyKey(asyKeyGenerator, pubEncodingBlob, priEncodingBlob);
      })
      .then((convertKeyPair) => {
        expect(convertKeyPair != null).assertTrue();
        let pubKey = convertKeyPair.pubKey;
        return verifyX509Crl(globalCrlInstance, pubKey);
      })
      .then((result) => {
        resolve(result);
      })
      .catch((err) => {
        console.error(
          "[Callback]verifyX509CrlCallback failed. error is " + err
        );
        reject(err);
      });
  });
}

async function getX509CrlInfoCallback(certType, processType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
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
            console.log(
              processType + " is : " + uInt8ArrayToString(issuerName.data)
            );
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
            console.log(
              processType + " is : " + uInt8ArrayToString(signature.data)
            );
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
            console.log(
              processType +
                " is : " +
                uInt8ArrayToString(signatureAlgParams.data)
            );
            expect(signatureAlgParams != null).assertTrue();
            break;
          case "getTbsInfo":
            gInstance.getTbsInfo((err, tbsInfo) => {
              if (err) {
                console.error("[callback] getTbsInfo failed! error is: " + err);
                reject(err);
              }
              expect(tbsInfo != null).assertTrue();
              console.log(
                processType + " is : " + uInt8ArrayToString(tbsInfo.data)
              );
            });
            break;
          default:
            console.log("Invalid parameter !");
            reject(processType);
        }
        resolve();
      })
      .catch((err) => {
        console.error("[callback] getX509CrtInfo failed! error is: " + err);
        reject(err);
      });
  });
}

async function getRevokedCertWithCert(crlInstance, certInstance) {
  return new Promise((resolve, reject) => {
    crlInstance.getRevokedCertWithCert(certInstance, (err, x509CrlEntry) => {
      if (err) {
        console.error(
          "[Callback]getRevokedCertWithCert failed. error is " + err
        );
        reject(err);
      } else {
        console.log(
          "[Callback]getRevokedCertWithCert success. x509CrlEntry is " +
            x509CrlEntry
        );
        resolve(x509CrlEntry);
      }
    });
  });
}

function checkGetRevokedCertWithCertX509CrlCallback(crlInstance, flag) {
  return new Promise((resolve, reject) => {
    createX509CertInstanceforCrlTestCallback(flag)
      .then((certInstance) => {
        return getRevokedCertWithCert(crlInstance, certInstance);
      })
      .then((x509CrlEntry) => {
        expect(x509CrlEntry != null).assertTrue();
        let num = x509CrlEntry.getSerialNumber();
        console.warn("[num] getRevokedCertWithCert num is:" + num);
        resolve(x509CrlEntry);
      })
      .catch((err) => {
        console.error(
          "[callback] getRevokedCertWithCert failed! err is:" + err
        );
        reject(err);
      });
  });
}

async function checkGetRevokedCertsX509CrlCallback(certType) {
  var gInstance;
  var gIndex;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getRevokedCerts((err, certs) => {
          expect(certs != null && certs.length != 0).assertTrue();
          console.warn("[callback] Crl get gevoked certs success");
          for (var i = 0; i < certs.length; i++) {
            gIndex = i;
            console.log(
              "[callback] certs i: " +
                gIndex +
                " serialNumber is: " +
                certs[gIndex].getSerialNumber()
            );
            certs[gIndex].getRevocationDate((err1, revocation) => {
              expect(revocation != null).assertTrue();
              console.log(
                "[callback] certs i: " +
                  gIndex +
                  " revocation date is: " +
                  revocation
              );
              certs[gIndex].getEncoded((err2, eData) => {
                expect(eData != null).assertTrue();
                console.log(
                  "[callback] certs i: " + gIndex + " getEncoded is: " + eData
                );
              });
            });
          }
        });
        resolve();
      })
      .catch((err) => {
        console.error("[callback] Crl getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

async function checkGetRevokedCertX509CrlCallback(certType) {
  var gInstance;
  return new Promise((resolve, reject) => {
    createX509CrlInstanceCallback(certType)
      .then((instance) => {
        gInstance = instance;
        gInstance.getRevokedCert(1, (err, cert) => {
          expect(cert != null).assertTrue();
          console.warn("[callback] Crl get gevoked cert success");
          cert.getRevocationDate((err1, revocation) => {
            expect(revocation != null).assertTrue();
            console.log("[callback] cert revocation date is: " + revocation);
          });
          cert.getCertIssuer((err2, certIssuer) => {
            expect(certIssuer != null).assertTrue();
            console.log(
              "[callback] cert certIssuer is: " +
                uInt8ArrayToString(certIssuer.data)
            );
          });
        });
        resolve();
      })
      .catch((err) => {
        console.error("[callback] Crl getPublickey failed! error is: " + err);
        reject(err);
      });
  });
}

function checkValidateOfCertChainValidatorCallback(algName) {
  return new Promise((resolve, reject) => {
    var validator = cryptoFramework.createCertChainValidator(algName);
    expect(validator != null).assertTrue();
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

    var dataArray = new Uint8Array(
      uInt8CertLength2.length +
        certArray2.length +
        uInt8CertLength1.length +
        certArray1.length
    );
    for (var i = 0; i < uInt8CertLength2.length; i++) {
      dataArray[i] = uInt8CertLength2[i];
    }
    for (var i = 0; i < certArray2.length; i++) {
      dataArray[i + uInt8CertLength2.length] = certArray2[i];
    }
    for (var i = 0; i < uInt8CertLength1.length; i++) {
      dataArray[i + uInt8CertLength2.length + certArray2.length] =
        uInt8CertLength1[i];
    }
    for (var i = 0; i < certArray1.length; i++) {
      dataArray[
        i +
          uInt8CertLength2.length +
          certArray2.length +
          uInt8CertLength1.length
      ] = certArray1[i];
    }
    var certChainData = {
      data: dataArray,
      count: 2,
      encodingFormat: cryptoFramework.EncodingFormat.FORMAT_PEM,
    };
    validator.validate(certChainData, (err) => {
      if (err) {
        console.error("[callback]: validate error: " + err);
        reject(err);
      } else {
        console.warn("[callback]: validate success!");
        resolve();
      }
    });
  });
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
