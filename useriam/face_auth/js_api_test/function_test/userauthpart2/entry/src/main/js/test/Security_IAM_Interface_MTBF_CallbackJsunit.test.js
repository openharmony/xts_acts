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

let userID = {
    User1 : 100,
    User2 : 2,
    User3 : 3,
    User4 : 4,
    User5 : 5
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

let SetPropertyType1 = {
    PROCESS_ALGORITHM : 1,
}

let SetPropertyType0 = {
    PROCESS_ALGORITHM : 0,
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

let GetPropertyType = {
    AUTH_SUB_TYPE : 1,
    REMAIN_TIMES : 2,
    FREEZING_TIME : 3
}

let Inputerdata = new Uint8Array([1, 2, 3, 4, 5, 6]);

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
    token: null
}

let CredentialInfoface2d = {
    credType: AuthType.FACE,
    credSubType: AuthSubType.FACE_2D,
    token: null
}



describe('userauthTest', function () {

    /*
        * @tc.number    : testGetEntriesString101
        * @tc.name      : Use getEntries get the value by mixing the string key
        * @tc.desc      : Mixed strings value can be obtained correctly
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 1
    */
    it('Security_IAM_Interface_MTBF_0101', 4, async function (done) {
        try {
            let verisioninfo = UserAuth.getVersion();
            console.log("Security_IAM_Interface_MTBF_0101 Version is: " + verisioninfo);
            publicFC.publicRegisterInputer(PinAuth,AuthSubType.PIN_SIX,Inputerdata);
            let challenge ;
            publicFC.publicOpenSession(UserIDM, function (data) {
                console.info('testFace Security_IAM_Interface_MTBF_0101 publicOpenSession challenge = ' + data);
                challenge = data;
                publicFC.publicaddCredential(UserIDM,CredentialInfopinsix, function (data) {
                    console.info('testFace Interface_MTBF_0101 publicaddCredential= ' + JSON.stringify(data));
                    let info101;
                    publicFC.publicauth(UserAuth,challenge,AuthType.PIN,AuthTurstLevel.ATL1, function (data) {
                        console.info('testFace Interface_MTBF_0101 publicauth = ' + JSON.stringify(data));
                        info101 = data;
                        let token = info101.authextr.token;
                        CredentialInfoface2d.token = token;
                        let faceinfo101 ;
                        publicFC.publicauthUser(UserAuth,userID.User1,challenge,AuthType.PIN,AuthTurstLevel.ATL1,
                            function (data) {
                            console.info('testFace Interface_MTBF_0101 publicauthUser = ' + JSON.stringify(data));
                            faceinfo101 = data;
                            expect(ResultCode.SUCCESS).assertEqual(faceinfo101.authresult);
//                            publicFC.publicaddCredential(UserIDM,CredentialInfoface2d, function (data) {
//                                console.info('testFace Interface_MTBF_0101 addCredential = ' + JSON.stringify(data));
                                let EnrolledCredInfo ;
                                publicFC.publicgetAuthInfo(UserIDM, AuthType.PIN, function (data) {
                                    console.info('testFace Interface_MTBF_0101 getAuthInfo' + JSON.stringify(data));
                                    EnrolledCredInfo = data;
                                    expect(AuthSubType.PIN_SIX).assertEqual(EnrolledCredInfo[0].authSubType);
                                    let ExecutorProperty101;
                                    publicFC.publicgetProperty(UserAuth,GetPropertyRequestpin, function (data) {
                                        console.info('testFace Interface getProperty data' + JSON.stringify(data));
                                        ExecutorProperty101 = data;
                                        expect(ResultCode.SUCCESS).assertEqual(ExecutorProperty101.result);
//                                        expect(AuthSubType.PIN_SIX).assertEqual(ExecutorProperty101.authSubType);
//                                        publicFC.publicsetProperty(UserAuth,SetPropertyType1, function (data) {
//                                            console.info('testFace Interface setProperty'+ JSON.stringify(data));
//                                            publicFC.publicsetProperty(UserAuth,SetPropertyType0, function (data) {
//                                                console.info('testFace setProperty data' + JSON.stringify(data));
//                                                let AvailabeStatus = publicFC.publicgetAvailabeStatus(
//                                                UserAuth,AuthType.FACE,AuthTurstLevel.ATL1)
//                                                expect(ResultCode.SUCCESS).assertEqual(AvailabeStatus);
                                                publicFC.publicdelUser(UserIDM,token, function (data) {
                                                    console.info('testFace Interface delUser='+ JSON.stringify(data));
                                                    publicFC.publicCloseSession(UserIDM, function (data) {
                                                        console.info('testFace Interface_MTBF_0101 CloseSession ');
                                                        publicFC.publicunRegisterInputer(PinAuth, function (data) {
                                                            console.info('testFace Interface_MTBF unRegisterInputer');
                                                            done();
                                                        })
                                                    })
                                                }, function (data) {
                                                })
//                                            })
//                                        })
                                    })
                                })
//                            }, function (data) {
//                            })
                        }, function (data) {
                        })
                    }, function (data) {
                    })
                }, function (data) {
                })
            })
        } catch (e) {
            console.log("Security_IAM_Interface_MTBF_0101 fail " + e);
            expect(null).assertFail();
        }
    })
})
