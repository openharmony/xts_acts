/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, it, expect} from 'deccjsunit/index'
import userAuth from '@ohos.userAuth'
import userIDM from '@ohos.userIDM'
import pinAuth from '@ohos.pinAuth'
import * as publicFC from './Publicfunction-n.js'

let UserIDM = new userIDM.UserIdentityManager();
let PinAuth = new pinAuth.PINAuth();
let UserAuth = new userAuth.UserAuth();

let AuthType = {
    PIN : 1,
    FACE : 2
}
let AuthSubType = {
    PIN_SIX : 10000,
    PIN_NUMBER : 10001,
    PIN_MIXED : 10002,
    FACE_2D : 20000,
    FACE_3D : 20001
}
let AuthTurstLevel = {
    ATL1 : 10000,
    ATL2 : 20000,
    ATL3 : 30000,
    ATL4 : 40000
}

let SetPropertyType = {
    PROCESS_ALGORITHM : 1,
}

let userID = {
    User1 : 100,
    User2 : 2,
    User3 : 3,
    User4 : 4,
    User5 : 5
}

let ResultCode = {
    SUCCESS : 0,
    FAIL : 1,
    GENERAL_ERROR : 2,
    CANCELED : 3,
    TIMEOUT : 4,
    TYPE_NOT_SUPPORT : 5,
    TRUST_LEVEL_NOT_SUPPORT : 6,
    BUSY : 7,
    INVALID_PARAMETERS : 8,
    LOCKED : 9,
    NOT_ENROLLED : 10,
    Authfail: 14
}

let GetPropertyType = {
    AUTH_SUB_TYPE : 1,
    REMAIN_TIMES : 2,
    FREEZING_TIME : 3
}

let Inputerdata = new Uint8Array([1,2,3,4,5,6]);

let GetPropertyTypearray=new Array();
GetPropertyTypearray[0]=GetPropertyType.AUTH_SUB_TYPE;      
GetPropertyTypearray[1]=GetPropertyType.FREEZING_TIME;
GetPropertyTypearray[2]=GetPropertyType.REMAIN_TIMES;

let GetPropertyRequestpin = {
    authType:AuthType.PIN,
    keys:GetPropertyTypearray
    }

let GetPropertyRequestface = {
    authType:AuthType.FACE,
    keys:GetPropertyTypearray
    }

let CredentialInfopinsix = {
    credType: AuthType.PIN,
    credSubType: AuthSubType.PIN_SIX,
    token:new Uint8Array([1,2,3,4,5,6])
}

let CredentialInfopinnum = {
    credType: AuthType.PIN,
    credSubType: AuthSubType.PIN_NUMBER,
    token: null
}

let CredentialInfopinmix = {
    credType: AuthType.PIN,
    credSubType: AuthSubType.PIN_MIXED,
    token: null
}

let CredentialInfoface2d = {
    credType: AuthType.FACE,
    credSubType: AuthSubType.FACE_2D,
    token: null
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

describe('userauthTest', function () {

    it('Security_IAM_Face_AddCred_Func_0101', 0, async function (done) {
        try {
            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata)
            let challenge ;
            publicFC.publicOpenSession(UserIDM, function (data) {
                console.info('Security_IAM_Face_AddCred_Func_0101 openSession challenge = ' + data);
                challenge = data;
                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (onresult) {
                    console.info('Face_AddCred_Func_0101 addCredential Result1 = ' + JSON.stringify(onresult));
                    let info101;
                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
                        console.info('Security_IAM_Face_AddCred_Func_0101 auth onResult = ' + JSON.stringify(data));
                        info101 = data;
                        let token = info101.authextr.token;
                        CredentialInfoface2d.token = token;
                        let addfaceresult;
                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, function (onresult) {
                            console.info('Face_AddCred_Func_0101 addCredential Result2=' + JSON.stringify(onresult));
                            addfaceresult = onresult;
                            expect(ResultCode.SUCCESS).assertEqual(addfaceresult.addCredresult);
                            publicFC.publicauth(UserAuth,challenge,AuthType.FACE,AuthTurstLevel.ATL1, function (data) {
                                console.info('testFace Face_AddCred_Func_0101 onResult = ' + JSON.stringify(data));
                                let faceauth101 = data;
                                expect(ResultCode.SUCCESS).assertEqual(faceauth101.authresult);
                                publicFC.publicauthUser(
                                    UserAuth,userID.User1,challenge,AuthType.FACE,AuthTurstLevel.ATL1,function (data) {
                                    console.info('testFace Face_AddCred_Func_0101 onResult= ' + JSON.stringify(data));
                                    faceauth101 = data;
                                    expect(ResultCode.SUCCESS).assertEqual(faceauth101.authresult);
                                    let credentialId = addfaceresult.credentialId;
                                    let delcredresult ;
                                    publicFC.publicdelCred(UserIDM,credentialId,token, function (data) {
                                        console.info('testFace Face_AddCred_Func_0101 del=' + JSON.stringify(data));
                                        delcredresult = data;
                                        expect(ResultCode.SUCCESS).assertEqual(delcredresult.delCredresult);
                                        publicFC.publicdelUser(UserIDM,token, function (data) {
                                            console.info('Face_AddCred_Func_0101 delUser= ' + JSON.stringify(data));
                                            publicFC.publicCloseSession(UserIDM, function (data) {
                                                console.info('Security_IAM_Face_AddCred_Func_0101 closeSession');
                                                publicFC.publicunRegisterInputer(PinAuth, function (data) {
                                                    console.info('Security_IAM_Face_AddCred_Func_0101 unRegister');
                                                    done();
                                                })
                                            })
                                        }, function (data) {
                                        })
                                    }, function (onacquireinfo) {
                                    })
                                }, function (onacquireinfo) {
                                })
                            }, function (onacquireinfo) {
                            })
                        }, function (onacquireinfo) {
                        })
                    }, function (data) {
                    })
                }, function (onacquireinfo) {
                })
            })
        } catch (e) {
            console.log("Security_IAM_Face_AddCred_Func_0101 fail " + e);
            expect(null).assertFail();
        }
    })

    it('Security_IAM_Face_AddCred_Func_0103', 0, async function (done) {
        try {
            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata)
            let challenge ;
            publicFC.publicOpenSession(UserIDM, function (data) {
                console.info('Security_IAM_Face_AddCred_Func_0103 openSession challenge = ' + data);
                challenge = data;
                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (onresult) {
                    console.info('Face_AddCred_Func_0103 addCredential Result1 = ' + JSON.stringify(onresult));
                    let info101;
                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, async function (data) {
                        console.info('Security_IAM_Face_AddCred_Func_0103 auth onResult = ' + JSON.stringify(data));
                        info101 = data;
                        let token = info101.authextr.token;
                        CredentialInfoface2d.token = token;
                        let addfaceresult;
                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, function (onresult) {
                            console.info('Face_AddCred_Func_0103 addCredential Result2=' + JSON.stringify(onresult));
                            addfaceresult = onresult;
                        }, function (onacquireinfo) {
                        })
                        let cancelresult = publicFC.publiccancel(UserIDM,challenge);
                        await sleep(2500);
                        if(cancelresult == 1){
                            console.info('Face_AddCred_Func_0103 cancel1 authresult = ' + addfaceresult.addCredresult);
                            expect(ResultCode.SUCCESS).assertEqual(addfaceresult.addCredresult);
                        }else if(cancelresult == 0){
                            console.info('Face_AddCred_Func_0103 cancel0 authresult = ' + addfaceresult.addCredresult);
                            expect(ResultCode.CANCELED).assertEqual(addfaceresult.addCredresult);
                        }
                        await publicFC.publicdelUser(UserIDM,token, function (data) {
                            console.info('Face_AddCred_Func_0103 delUser= ' + JSON.stringify(data));
                            publicFC.publicCloseSession(UserIDM, function (data) {
                                console.info('Security_IAM_Face_AddCred_Func_0103 closeSession');
                                publicFC.publicunRegisterInputer(PinAuth, function (data) {
                                    console.info('Security_IAM_Face_AddCred_Func_0103 unRegister');
                                    done();
                                })
                            })
                        }, function (data) {
                        })
                    }, function (data) {
                    })
                }, function (onacquireinfo) {
                })
            })
        } catch (e) {
            console.log("Security_IAM_Face_AddCred_Func_0101 fail " + e);
            expect(null).assertFail();
        }
    })

//    it('testaddfacecancel101', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge;
//            let result1 = null;
//            let extraInfo1 = null;
//            let module1 = null;
//            let acquire1 = null;
//            let extr1 = null;
//            let token;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testaddfacecancel101 OpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testaddfacecancel101 addCredential onResult = ' + JSON.stringify(data));
//                    let info101;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testaddfacecancel101 publicauth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        token = info101.authextr.token
//                        CredentialInfoface2d.token = token
//                        UserIDM.addCredential(CredentialInfoface2d, {
//                            onResult: function(result,extraInfo){
//                                console.log(result)
//                                result1 = result
//                                extraInfo1 = extraInfo.credentialId
//                            },
//                            onAcquireInfo:function (module,acquire,extr){
//                                module1 = module
//                                acquire1 = acquire
//                                extr1 = extr
//                                console.info(module);
//                            }
//                        })
//                    }, function (data) {
//                    })
//                }, function (data) {
//                })
//            })
//            await sleep(13000);
//            let cancelresult = publicFC.publiccancel(UserIDM,challenge)
//            expect(ResultCode.SUCCESS).assertEqual(cancelresult);
//            await sleep(1000);
//            expect(ResultCode.CANCELED).assertEqual(result1);
//            publicFC.publicCloseSession(UserIDM, function (data) {
//                console.info('testFace testaddfacecancel101 publicCloseSession ');
//                publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                    console.info('testFace testaddfacecancel101 publicunRegisterInputer ');
//                })
//                done();
//            })
//        } catch (e) {
//            console.log("testaddfacecancel101 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testaddfacecancel102', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testaddfacecancel102 OpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testaddfacecancel102 addCredential onResult = ' + JSON.stringify(data));
//                    let info101;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1,async function (data) {
//                        console.info('testFace testaddfacecancel102 publicauth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token
//                        CredentialInfoface2d.token = token
//                        let result1 = null
//                        let extraInfo1 = null
//                        let module1 = null
//                        let acquire1 = null
//                        let extr1 = null
//                        await UserIDM.addCredential(CredentialInfoface2d, {
//                            onResult: function(result,extraInfo){
//                                console.log(result)
//                                result1 = result
//                                extraInfo1 = extraInfo.credentialId
//                            },
//                            onAcquireInfo:function (module,acquire,extr){
//                                module1 = module
//                                acquire1 = acquire
//                                extr1 = extr
//                                console.info(module);
//                            }
//                        })
//                        await sleep(3000);
//                        let cancelresult = publicFC.publiccancel(UserIDM,challenge)
//                        expect(ResultCode.SUCCESS).assertEqual(cancelresult);
//                        expect(ResultCode.CANCELED).assertEqual(result1);
//                        publicFC.publicCloseSession(UserIDM, function (data) {
//                            console.info('testFace testaddfacecancel102 publicCloseSession ');
//                            publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                console.info('testFace testaddfacecancel102 publicunRegisterInputer ');
//                            })
//                            done();
//                        })
//                    }, function (data) {
//                    })
//                }, function (data) {
//                })
//            })
//        } catch (e) {
//            console.log("testaddfacecancel102 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testaddfacecancel103', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testaddfacecancel103 OpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testaddfacecancel103 addCredential onResult = ' + JSON.stringify(data));
//                    let info101;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, async function (data) {
//                        console.info('testFace testaddfacecancel103 publicauth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token
//                        CredentialInfoface2d.token = token
//                        let result1 = null
//                        let extraInfo1 = null
//                        let module1 = null
//                        let acquire1 = null
//                        let extr1 = null
//                        await UserIDM.addCredential(CredentialInfoface2d, {
//                            onResult: function(result,extraInfo){
//                                console.log(result)
//                                result1 = result
//                                extraInfo1 = extraInfo.credentialId
//                            },
//                            onAcquireInfo:function (module,acquire,extr){
//                                module1 = module
//                                acquire1 = acquire
//                                extr1 = extr
//                                console.info(module);
//                            }
//                        })
//                        await sleep(3000);
//                        let cancelresult = publicFC.publiccancel(UserIDM,challenge)
//                        expect(ResultCode.SUCCESS).assertEqual(cancelresult);
//                        expect(ResultCode.CANCELED).assertEqual(result1);
//                        publicFC.publicCloseSession(UserIDM, function (data) {
//                            console.info('testFace testaddfacecancel103 publicCloseSession ');
//                            publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                console.info('testFace testaddfacecancel103 publicunRegisterInputer ');
//                            })
//                            done();
//                        })
//                    }, function (data) {
//                    })
//                }, function (data) {
//                })
//            })
//        } catch (e) {
//            console.log("testaddfacecancel103 fail " + e);
//            expect(null).assertFail();
//        }
//    })

//    it('testauthfacecancel101', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge ;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testauthfacecancel101 publicOpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testauthfacecancel101 addCredential onResult=' + JSON.stringify(data));
//                    let info101 ;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testauthfacecancel101 auth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token
//                        CredentialInfoface2d.token = token
//                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, async function (data) {
//                            console.info('testFace testauthfacecancel101 addCredential = ' + JSON.stringify(data));
//                            let result1 = null;
//                            let extraInfo1 = null;
//                            let module1 = null;
//                            let acquire1 = null;
//                            let extr1 = null;
//                            let contextID1 = null;
//                            contextID1 = await UserAuth.auth(challenge, AuthType.FACE, AuthTurstLevel.ATL1, {
//                                onResult: function(result,extraInfo){
//                                    console.log(result);
//                                    result1 = result;
//                                    extraInfo1 = extraInfo;
//                                },
//                                onAcquireInfo:function (module,acquire,extr){
//                                    module1 = module;
//                                    acquire1 = acquire;
//                                    extr1 = extr;
//                                    console.info(module);
//                                }
//                            });
//                            await sleep(3000);
//                            let authfacecancel101 = publicFC.publicgecancelAuth(UserAuth,contextID1)
//                            expect(ResultCode.SUCCESS).assertEqual(authfacecancel101);
//                            expect(ResultCode.CANCELED).assertEqual(result1);
//                            publicFC.publicdelUser(UserIDM,token, function (data) {
//                                console.info('testFace testauthfacecancel101 delUser = ' + JSON.stringify(data));
//                                publicFC.publicCloseSession(UserIDM, function (data) {
//                                    console.info('testFace testauthfacecancel101 publicCloseSession');
//                                    publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                        console.info('testFace testauthfacecancel101 publicunRegisterInputer');
//                                        done();
//                                    })
//                                })
//                            })
//                        }, function (data) {
//                        })
//                    }, function (data) {
//                    })
//                }, function (data) {
//                })
//            })
//
//        } catch (e) {
//            console.log("testauthfacecancel101 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testauthfacecancel102', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge ;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testauthfacecancel102 publicOpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testauthfacecancel102 addCredential onResult = ' + JSON.stringify(data));
//                    let info101 ;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testauthfacecancel102 publicauth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token
//                        CredentialInfoface2d.token = token
//                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, async function (data) {
//                            console.info('testFace testauthfacecancel102 addCredential = ' + JSON.stringify(data));
//                            let result1 = null;
//                            let extraInfo1 = null;
//                            let module1 = null;
//                            let acquire1 = null;
//                            let extr1 = null;
//                            let contextID1 = null;
//                            contextID1 = await UserAuth.auth(challenge, AuthType.FACE, AuthTurstLevel.ATL1, {
//                                onResult: function(result,extraInfo){
//                                    console.log(result);
//                                    result1 = result;
//                                    extraInfo1 = extraInfo;
//                                },
//                                onAcquireInfo:function (module,acquire,extr){
//                                    module1 = module;
//                                    acquire1 = acquire;
//                                    extr1 = extr;
//                                    console.info(module);
//                                }
//                            });
//                            await sleep(8000);
//                            let authfacecancel101 = publicFC.publicgecancelAuth(UserAuth,contextID1)
//                            expect(ResultCode.SUCCESS).assertEqual(authfacecancel101);
//                            expect(ResultCode.CANCELED).assertEqual(result1);
//                            publicFC.publicdelUser(UserIDM,token, function (data) {
//                                console.info('testFace testauthfacecancel102 delUser = ' + JSON.stringify(data));
//                                publicFC.publicCloseSession(UserIDM, function (data) {
//                                    console.info('testFace testauthfacecancel102 publicCloseSession');
//                                    publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                        console.info('testFace testauthfacecancel102 publicunRegisterInputer');
//                                        done();
//                                    })
//                                })
//                            }, function (data) {
//                            })
//                        }, function (data) {
//                        })
//                    }, function (data) {
//                    })
//                }, function (data) {
//                })
//            })
//
//        } catch (e) {
//            console.log("testauthfacecancel102 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testauthfacecancel103', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge ;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testauthfacecancel103 publicOpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testauthfacecancel103 addCredential= ' + JSON.stringify(data));
//                    let info101 ;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testauthfacecancel103 publicauth = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token
//                        CredentialInfoface2d.token = token
//                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, async function (data) {
//                            console.info('testFace testauthfacecancel103 addCredential= ' + JSON.stringify(data));
//                            let result1 = null;
//                            let extraInfo1 = null;
//                            let module1 = null;
//                            let acquire1 = null;
//                            let extr1 = null;
//                            let contextID1 = null;
//                            contextID1 = await UserAuth.auth(challenge, AuthType.FACE, AuthTurstLevel.ATL1, {
//                                onResult: function(result,extraInfo){
//                                    console.log(result);
//                                    result1 = result;
//                                    extraInfo1 = extraInfo;
//                                },
//                                onAcquireInfo:function (module,acquire,extr){
//                                    module1 = module;
//                                    acquire1 = acquire;
//                                    extr1 = extr;
//                                    console.info(module);
//                                }
//                            });
//                            await sleep(10000);
//                            let authfacecancel101 = publicFC.publicgecancelAuth(UserAuth,contextID1)
//                            expect(ResultCode.SUCCESS).assertEqual(authfacecancel101);
//                            expect(ResultCode.CANCELED).assertEqual(result1);
//                            publicFC.publicdelUser(UserIDM,token, function (data) {
//                                console.info('testFace testauthfacecancel103 delUser = ' + JSON.stringify(data));
//                                publicFC.publicCloseSession(UserIDM, function (data) {
//                                    console.info('testFace testauthfacecancel103 publicCloseSession');
//                                    publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                        console.info('testFace testauthfacecancel103 publicunRegisterInputer');
//                                        done();
//                                    })
//                                })
//                            }, function (data) {
//                            })
//                        }, function (data) {
//                        })
//                    }, function (data) {
//                    })
//                }, function (data) {
//                })
//            })
//
//        } catch (e) {
//            console.log("testauthfacecancel103 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testauthuserfacecancel101', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge ;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testauthuserfacecancel101 publicOpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testauthuserfacecancel101 addCredential= ' + JSON.stringify(data));
//                    let info101 ;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testauthuserfacecancel101 auth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token;
//                        CredentialInfoface2d.token = token;
//                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, async function (data) {
//                            console.info('testFace testauthuserfacecancel101addCredential=' + JSON.stringify(data));
//                            let result1 = null;
//                            let extraInfo1 = null;
//                            let module1 = null;
//                            let acquire1 = null;
//                            let extr1 = null;
//                            let contextID1 = null;
//                            contextID1 = await UserAuth.authUser(
    //                            userID.User1, challenge, AuthType.FACE, AuthTurstLevel.ATL1, {
//                                onResult: function(result,extraInfo){
//                                    console.log(result);
//                                    result1 = result;
//                                    extraInfo1 = extraInfo;
//                                },
//                                onAcquireInfo:function (module,acquire,extr){
//                                    module1 = module;
//                                    acquire1 = acquire;
//                                    extr1 = extr;
//                                    console.info(module);
//                                }
//                            })
//                            await sleep(3000);
//                            let authfacecancel101 = publicFC.publicgecancelAuth(UserAuth,contextID1);
//                            expect(ResultCode.SUCCESS).assertEqual(authfacecancel101);
//                            expect(ResultCode.CANCELED).assertEqual(result1);
//                            publicFC.publicCloseSession(UserIDM, function (data) {
//                                console.info('testFace testauthuserfacecancel101 publicCloseSession');
//                                publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                    console.info('testFace testauthuserfacecancel101 publicunRegisterInputer');
//                                    done();
//                                })
//                            })
//                        }, function (data) {
//                        })
//                    }, function (data) {
//                    });
//                }, function (data) {
//                })
//            })
//        } catch (e) {
//            console.log("testauthuserfacecancel101 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testauthuserfacecancel102', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge ;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testauthuserfacecancel102 publicOpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testauthuserfacecancel102 addCredential Result=' + JSON.stringify(data));
//                    let info101 ;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testauthuserfacecancel102 auth onResult = ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token;
//                        CredentialInfoface2d.token = token;
//                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, async function (data) {
//                            console.info('testFace testauthuserfacecancel102 addCred=' + JSON.stringify(data));
//                            let result1 = null;
//                            let extraInfo1 = null;
//                            let module1 = null;
//                            let acquire1 = null;
//                            let extr1 = null;
//                            let contextID1 = null;
//                            contextID1 = await UserAuth.authUser(
    //                            userID.User1, challenge, AuthType.FACE, AuthTurstLevel.ATL1, {
//                                onResult: function(result,extraInfo){
//                                    console.log(result);
//                                    result1 = result;
//                                    extraInfo1 = extraInfo;
//                                },
//                                onAcquireInfo:function (module,acquire,extr){
//                                    module1 = module;
//                                    acquire1 = acquire;
//                                    extr1 = extr;
//                                    console.info(module);
//                                }
//                            })
//                            await sleep(8000);
//                            let authfacecancel101 = publicFC.publicgecancelAuth(UserAuth,contextID1);
//                            expect(ResultCode.SUCCESS).assertEqual(authfacecancel101);
//                            expect(ResultCode.CANCELED).assertEqual(result1);
//                            publicFC.publicCloseSession(UserIDM, function (data) {
//                                console.info('testFace testauthuserfacecancel102 publicCloseSession');
//                                publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                    console.info('testFace testauthuserfacecancel102 publicunRegisterInputer');
//                                    done();
//                                })
//                            })
//                        }, function (data) {
//                        })
//                    }, function (data) {
//                    });
//                }, function (data) {
//                })
//            })
//        } catch (e) {
//            console.log("testauthuserfacecancel102 fail " + e);
//            expect(null).assertFail();
//        }
//    })
//
//    it('testauthuserfacecancel103', 0, async function (done) {
//        try {
//            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
//            let challenge ;
//            publicFC.publicOpenSession(UserIDM, function (data) {
//                console.info('testFace testauthuserfacecancel103 publicOpenSession challenge = ' + data);
//                challenge = data;
//                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
//                    console.info('testFace testauthuserfacecancel103 addCredential= ' + JSON.stringify(data));
//                    let info101 ;
//                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
//                        console.info('testFace testauthuserfacecancel103 publicauth= ' + JSON.stringify(data));
//                        info101 = data;
//                        let token = info101.authextr.token;
//                        CredentialInfoface2d.token = token;
//                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, async function (data) {
//                            console.info('testFace testauthuserfacecancel103 addCred=' + JSON.stringify(data));
//                            let result1 = null;
//                            let extraInfo1 = null;
//                            let module1 = null;
//                            let acquire1 = null;
//                            let extr1 = null;
//                            let contextID1 = null;
//                            contextID1 = await UserAuth.authUser(
    //                            userID.User1, challenge, AuthType.FACE, AuthTurstLevel.ATL1, {
//                                onResult: function(result,extraInfo){
//                                    console.log(result);
//                                    result1 = result;
//                                    extraInfo1 = extraInfo;
//                                },
//                                onAcquireInfo:function (module,acquire,extr){
//                                    module1 = module;
//                                    acquire1 = acquire;
//                                    extr1 = extr;
//                                    console.info(module);
//                                }
//                            })
//                            await sleep(11000);
//                            let authfacecancel101 = publicFC.publicgecancelAuth(UserAuth,contextID1);
//                            expect(ResultCode.SUCCESS).assertEqual(authfacecancel101);
//                            expect(ResultCode.CANCELED).assertEqual(result1);
//                            publicFC.publicCloseSession(UserIDM, function (data) {
//                                console.info('testFace testauthuserfacecancel103 publicCloseSession');
//                                publicFC.publicunRegisterInputer(PinAuth, function (data) {
//                                    console.info('testFace testauthuserfacecancel103 publicunRegisterInputer');
//                                    done();
//                                })
//                            })
//                        }, function (data) {
//                        })
//                    }, function (data) {
//                    });
//                }, function (data) {
//                })
//            })
//        } catch (e) {
//            console.log("testauthuserfacecancel103 fail " + e);
//            expect(null).assertFail();
//        }
//    })

    it('Security_IAM_Face_AddCred_Func_0102', 2, async function (done) {
        try {
            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
            let challenge ;
            publicFC.publicOpenSession(UserIDM, function (data) {
                console.info('testFace Security_IAM_Face_AddCred_Func_0102 publicOpenSession challenge = ' + data);
                challenge = data;
                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
                    console.info('testFace Face_AddCred_Func_0102 addCredential= ' + JSON.stringify(data));
                    let info101 ;
                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
                        console.info('testFace Face_AddCred_Func_0102 publicauth = ' + JSON.stringify(data));
                        info101 = data;
                        let token = info101.authextr.token;
                        CredentialInfoface2d.token = token;
                        let addfaceresult ;
                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, function (data) {
                            console.info('testFace Face_AddCred_Func_0102 addCredential=' + JSON.stringify(data));
                            addfaceresult = data;
                            let credentialId = addfaceresult.credentialId;
                            let token1 = token + "Wrong Word";
                            let delcredresult ;
                            publicFC.publicdelCred(UserIDM,credentialId,token1, function (data) {
                                console.info('testFace Face_AddCred_Func_0102 publicdelCred=' + JSON.stringify(data));
                                delcredresult = data;
                                expect(ResultCode.Authfail).assertEqual(delcredresult.delCredresult);
                                publicFC.publicdelUser(UserIDM,token, function (data) {
                                    console.info('testFace Face_AddCred_Func_0102 delUser= ' + JSON.stringify(data));
                                    publicFC.publicCloseSession(UserIDM, function (data) {
                                        console.info('testFace Face_AddCred_Func_0102 publicCloseSession ');
                                        publicFC.publicunRegisterInputer(PinAuth, function (data) {
                                            console.info('testFace Face_AddCred_Func_0102 publicunRegister ');
                                            done();
                                        })
                                    })
                                }, function (data) {
                                })
                            }, function (data) {
                            })
                        }, function (data) {
                        })
                    }, function (data) {
                    })
                }, function (data) {
                })
            })
        } catch (e) {
            console.log("testdelface102 fail " + e);
            expect(null).assertFail();
        }
    })

})
