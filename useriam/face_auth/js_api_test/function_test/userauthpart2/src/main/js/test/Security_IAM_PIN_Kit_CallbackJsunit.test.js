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

import {describe, it, expect} from '@ohos/hypium'
import userAuthNorth from '@ohos.userIAM.userAuth'

let UserAuthKit = new userAuthNorth.UserAuth()


export default function userauthTest() {
describe('userauthTest', function () {

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0101
        * @tc.name      : Kit interface get version
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0101', 0, async function (done) {
        try {
            let getversionresult = null;
            getversionresult = UserAuthKit.getVersion();
            console.info('GetVersionTest_0101 getversionresult = ' + getversionresult);
            expect(false).assertEqual(getversionresult == null);
            done();
        } catch (e) {
            console.log("testFace GetVersionTest_0101 fail " + e);
            expect(null).assertFail();
        }
    })

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0102
        * @tc.name      : Kit interface get AvailabeStatus
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0102', 0, async function (done) {
        console.info('testFace GetAvailabeStatusTest0101 start');
        try {
            let AvailabeStatus = null
            AvailabeStatus = UserAuthKit.getAvailableStatus(userAuthNorth.UserAuthType.FACE,
                userAuthNorth.AuthTrustLevel.ATL1);
            console.info('testFace publicgetAvailableStatus result = ' + JSON.stringify(AvailabeStatus));
            expect(6).assertEqual(AvailabeStatus);
            done();
        } catch (e) {
            console.log("GetAvailabeStatusTest0101 fail " + e);
            expect(null).assertFail();
        }
    })

    /*
    * @tc.number    : Security_IAM_PIN_Kit_Func_0103
    * @tc.name      : Kit interface auth & cancel auth
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0103', 0, async function (done) {
        let contextID1 = null
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let onresult = {
            authresult: null,
            authextr: null,
        }
        let onacquireinfo = {
            authmodule : null,
            authacquire : null,
            authextr : null
        }
        contextID1 = UserAuthKit.auth(challenge, userAuthNorth.UserAuthType.FACE,userAuthNorth.AuthTrustLevel.ATL1, {
            onResult: function(result,extraInfo){
                console.log("testFace faceDemo auth result = " + result);
                onresult.authresult = result;
                console.log("testFace faceDemo auth extraInfo = " + JSON.stringify(extraInfo));
                onresult.authextr = extraInfo;
                console.info('testFace publicauth auth onResult = ' + JSON.stringify(onresult));
                expect(1).assertEqual(result);
                console.info('testFace publicauth auth contextID1 = ' + contextID1);
                let cancelResult = UserAuthKit.cancelAuth(contextID1);
                console.info('testFace publicauth cancelResult = ' + cancelResult);
                done();
            },
            onAcquireInfo: function (modulea,acquire,extr){
                console.info('faceTest publicauth auth onAcquireInfo in');
                onacquireinfo.authmodule = modulea;
                onacquireinfo.authacquire = acquire;
                onacquireinfo.authextr = extr;
                console.log("testFace faceDemo auth module = " + JSON.stringify(modulea));
                console.info('testFace publicauth auth onAcquireInfo = ' + JSON.stringify(onacquireinfo));
            }
        });

    })

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0107
        * @tc.name      : Kit interface enum ResultCode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0107', 0, async function (done) {
        console.info('testFace Security_IAM_PIN_Kit_Func_0107 start');
        expect(0).assertEqual(userAuthNorth.ResultCode.SUCCESS);
        expect(1).assertEqual(userAuthNorth.ResultCode.FAIL);
        expect(2).assertEqual(userAuthNorth.ResultCode.GENERAL_ERROR);
        expect(3).assertEqual(userAuthNorth.ResultCode.CANCELED);
        expect(4).assertEqual(userAuthNorth.ResultCode.TIMEOUT);
        expect(5).assertEqual(userAuthNorth.ResultCode.TYPE_NOT_SUPPORT);
        expect(6).assertEqual(userAuthNorth.ResultCode.TRUST_LEVEL_NOT_SUPPORT);
        expect(7).assertEqual(userAuthNorth.ResultCode.BUSY);
        expect(8).assertEqual(userAuthNorth.ResultCode.INVALID_PARAMETERS);
        expect(9).assertEqual(userAuthNorth.ResultCode.LOCKED);
        expect(10).assertEqual(userAuthNorth.ResultCode.NOT_ENROLLED);
        console.info('testFace Security_IAM_PIN_Kit_Func_0107 end');
        done();
    })

})

}

