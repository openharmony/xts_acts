/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import userAuth from '@ohos.userauth'
import userIDM from '@ohos.useridm'
import pinAuth from '@ohos.pinauth'
import * as publicFC from './Publicfunction-n'

let UserIDM = userIDM.constructor()
let PinAuth = pinAuth.constructor()
let UserAuth = userAuth.constructor()

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

let userID = {
    User1: 100,
    User2: 2,
    User3: 3,
    User4: 4,
    User5: 5
}

let CredentialInfoface2d = {
    credType: AuthType.FACE,
    credSubType: AuthSubType.FACE_2D,
    token: null
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
    NOT_ENROLLED : 10
}

let Inputerdata = new Uint8Array([1,2,3,4,5,6]);

let CredentialInfopinsix = {
    credType: AuthType.PIN,
    credSubType: AuthSubType.PIN_SIX,
    token: null
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function authcycle(challenge,fcycle){
    let finishicon = 0
    let token;
    for(let i = 0; i < 5; i++){
        //未到达10个认证时，完成认证
        //闭包方法
        (function c(output){
            publicFC.publicauth(UserAuth ,challenge,AuthType.PIN,AuthTurstLevel.ATL1,
                function (data) {
                    expect(true).assertEqual(data.authresult);
                    console.info('testFace Coauth_Auth_MTBF_0101 pinauth '+output + '=' + data.authresult);
                    if(i == 4){
                        finishicon = finishicon + 1
                        token = data.authextr.token
                    }
                },
                function(data){
                })
            publicFC.publicauth(UserAuth ,challenge,AuthType.FACE,AuthTurstLevel.ATL1,
                function (data) {
                    expect(true).assertEqual(data.authresult);
                    console.info('testFace Coauth_Auth_MTBF_0101 faceauth '+output + '=' + data.authresult);
                    if(i == 4){
                        finishicon = finishicon + 1
                    }
                },
                function(data){
                })
        })(i)
    }
    publicFC.publicauth(UserAuth, challenge,AuthType.FACE,AuthTurstLevel.ATL1,
        async function (data) {
            console.info('testFace Coauth_Auth_MTBF_0101 auth11 =' + data.authresult);
            if(data.authresult == ResultCode.SUCCESS){
            }
            while(finishicon < 2){
                await sleep(100);
            }
            fcycle(data.authresult)
        },
        function(data){
        })
}

function authUsercycle(challenge,fcycle){
    let finishicon = 0
    for(let i = 0; i < 10; i++){
        //未到达10个认证时，完成认证
        //闭包方法
        (function c(output){
            publicFC.publicauthUser(UserAuth ,userID.User1,challenge,AuthType.PIN,AuthTurstLevel.ATL1,
                function (data) {
                    expect(true).assertEqual(data.authresult);
                    console.info('testFace FACE_Auth_MTBF_0102 auth '+output + '=' + data.authresult);
                    if(i == 4){
                        finishicon = finishicon + 1
                    }
                },
                function(data){
                })
            publicFC.publicauthUser(UserAuth ,userID.User1,challenge,AuthType.PIN,AuthTurstLevel.ATL1,
                function (data) {
                    expect(true).assertEqual(data.authresult);
                    console.info('testFace FACE_Auth_MTBF_0102 auth '+output + '=' + data.authresult);
                    if(i == 4){
                        finishicon = finishicon + 1
                    }
                },
                function(data){
                })
        })(i)
    }
    publicFC.publicauthUser(UserAuth, userID.User1,challenge,AuthType.FACE,AuthTurstLevel.ATL1,
        async function (data) {
            console.info('testFace FACE_Auth_MTBF_0102 auth11 =' + data.authresult);
            if(data.authresult == ResultCode.SUCCESS){
            }
            while(finishicon < 2){
                await sleep(100);
            }
            fcycle(data.authresult)
        },
        function(data){
        })
}

describe('userauthTest', function () {

    it('Security_IAM_FACE_Auth_MTBF_0101', 4, async function (done) {
        try {
            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
            let challenge ;
            publicFC.publicOpenSession(UserIDM, function (data) {
                console.info('testFace FACE_Auth_MTBF_0101 OpenSession challenge = ' + data);
                challenge = data;
                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
                    console.info('testFace FACE_Auth_MTBF_0101 addCredential onResult = ' + JSON.stringify(data));
                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
                        console.info('FACE_Auth_MTBF_0101 auth onResult = ' + JSON.stringify(data));
                        let info101 = data;
                        let token = info101.authextr.token;
                        CredentialInfoface2d.token = token;
                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, function (onresult) {
                            console.info('testface FACE_Auth_MTBF_0101 addCredential=' + JSON.stringify(onresult));
                            authcycle(challenge,function(data){
                                publicFC.publicdelUser(UserIDM,token, function (data) {
                                    console.info('testFace FACE_Auth_MTBF_0101 delUser = ' + JSON.stringify(data));
                                    publicFC.publicCloseSession(UserIDM, function (data) {
                                        console.info('testFace FACE_Auth_MTBF_0101 publicCloseSession');
                                        publicFC.publicunRegisterInputer(PinAuth, function (data) {
                                            console.info('testFace FACE_Auth_MTBF_0101 publicunRegisterInputer');
                                            done();
                                        })
                                    })
                                }, function (data) {
                                })
                            })
                        }, function (data) {
                        })
                    }, function (data) {
                    })
                }, function (data) {
                })
            })
        } catch (e) {
            console.log("FACE_Auth_MTBF_0101 fail " + e);
            expect(null).assertFail();
        }
    })

    it('Security_IAM_FACE_Auth_MTBF_0102', 4, async function (done) {
        try {
            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
            let challenge ;
            publicFC.publicOpenSession(UserIDM, function (data) {
                console.info('testFace FACE_Auth_MTBF_0102 OpenSession challenge = ' + data);
                challenge = data;
                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
                    console.info('testFace FACE_Auth_MTBF_0102 addCredential onResult = ' + JSON.stringify(data));
                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
                        console.info('testface FACE_Auth_MTBF_0102 auth onResult = ' + JSON.stringify(data));
                        let info101 = data;
                        let token = info101.authextr.token;
                        CredentialInfoface2d.token = token;
                        publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, function (onresult) {
                            console.info('FACE_Auth_MTBF_0102 addCredential Result2=' + JSON.stringify(onresult));
                            authUsercycle(challenge,function(data){
                                publicFC.publicdelUser(UserIDM,token, function (data) {
                                    console.info('testFace FACE_Auth_MTBF_0102 delUser = ' + JSON.stringify(data));
                                    publicFC.publicCloseSession(UserIDM, function (data) {
                                        console.info('testFace FACE_Auth_MTBF_0102 publicCloseSession');
                                        publicFC.publicunRegisterInputer(PinAuth, function (data) {
                                            console.info('testFace FACE_Auth_MTBF_0102 publicunRegisterInputer');
                                            done();
                                        })
                                    })
                                }, function (data) {
                                })
                            })
                        }, function (data) {
                        })
                    }, function (data) {
                    })
                }, function (data) {
                })
            })
        } catch (e) {
            console.log("FACE_Auth_MTBF_0102 fail " + e);
            expect(null).assertFail();
        }
    })
})
