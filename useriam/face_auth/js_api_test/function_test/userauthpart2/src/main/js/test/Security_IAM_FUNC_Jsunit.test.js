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

export default function userauthTest() {
describe('userauthTest_API9', function () {

    /*
        * @tc.number    : Security_IAM_Func_0101
        * @tc.name      : Kit interface get version
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0101', 0, async function (done) {
        try {
            let getversionresult = null;
            getversionresult = userAuthNorth.getVersion();
            console.info('GetVersionTest_0101 getversionresult = ' + getversionresult);
            done();
        } catch (e) {
            console.log("testFace GetVersionTest_0101 fail " + e);
            expect(null).assertFail();
        }
    })

    /*
        * @tc.number    : Security_IAM_Func_0102
        * @tc.name      : Kit interface get AvailabeStatus
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0102', 0, async function (done) {
        console.info('testFace GetAvailabeStatusTest0102 start');
        try {
            userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE,
                userAuthNorth.AuthTrustLevel.ATL1);
        } catch (e) {
            console.log("GetAvailabeStatusTest0102 fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.NOT_ENROLLED);
            done();
        }
    })
    
    /*
        * @tc.number    : Security_IAM_Func_0111
        * @tc.name      : Kit interface get AvailabeStatus
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0111', 0, async function (done) {
        console.info('testFace Security_IAM_Func_0111 start');
        try {
            userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE,
                userAuthNorth.AuthTrustLevel.ATL4);
        } catch (e) {
            console.log("Security_IAM_Func_0111 fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.NOT_ENROLLED);
            done();
        }
    })
    
    /*
        * @tc.number    : Security_IAM_Func_0104
        * @tc.name      : getAvailabeStatus invalid parameters
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0104', 0, async function (done) {
        console.info('testFace GetAvailabeStatusTest0104 start');
        //No AuthType
        try {
            userAuthNorth.getAvailableStatus(userAuthNorth.AuthTrustLevel.ATL1);
        } catch (e) {
            console.log("GetAvailabeStatusTest0104 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //No AuthTrustLevel
        try {
            userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE);
        } catch (e) {
            console.log("GetAvailabeStatusTest0104 no AuthTrustLevel fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //authType invalid
        try {
            userAuthNorth.getAvailableStatus(1, userAuthNorth.AuthTrustLevel.ATL1);
        } catch (e) {
            console.log("GetAvailabeStatusTest0104 authType invalid :1 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        //authType invalid
        try {
            userAuthNorth.getAvailableStatus(5, userAuthNorth.AuthTrustLevel.ATL1);
        } catch (e) {
            console.log("GetAvailabeStatusTest0104  authType invalid :5 " + e); 
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        //AuthTrustLevel invalid
        try {
            userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE, 15000);
        } catch (e) {
            console.log("GetAvailabeStatusTest0104 AuthTrustLevel invalid 15000 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        //AuthTrustLevel invalid
        try {
            userAuthNorth.getAvailableStatus(userAuthNorth.UserAuthType.FACE, 50000);
        } catch (e) {
            console.log("GetAvailabeStatusTest0104 AuthTrustLevel invalid 50000 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
            done();
        }
    })

    /*
        * @tc.number    : Security_IAM_Func_0105
        * @tc.name      : getAuthInstance invalid parameters
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0105', 0, async function (done) {
        console.info('testFace Security_IAM_Func_0105 start');
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let authType = userAuthNorth.UserAuthType.FACE;
        let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;
        
        // no challenge
        try {
            var authInstance = userAuthNorth.getAuthInstance(authType, authTrustLevel);
        } catch (e) {
            console.log("Security_IAM_Func_0105 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        // no authType
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authTrustLevel);
        } catch (e) {
            console.log("Security_IAM_Func_0105 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        // no AuthTrustLevel
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge,authType);
        } catch (e) {
            console.log("Security_IAM_Func_0105 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //authType invalid
        try {
             var authInstance = userAuthNorth.getAuthInstance(challenge, 1, authTrustLevel);
        } catch (e) {
            console.log("Security_IAM_Func_0105 authType invalid :1 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //authType invalid
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, 5, authTrustLevel);
        } catch (e) {
            console.log("Security_IAM_Func_0105  authType invalid :5 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        //AuthTrustLevel invalid
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, 15000);
        } catch (e) {
            console.log("Security_IAM_Func_0105 AuthTrustLevel invalid 15000 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        //AuthTrustLevel invalid
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, 50000);
        } catch (e) {
            console.log("Security_IAM_Func_0105 AuthTrustLevel invalid 50000 " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
            done();
        }
    })
    
    /*
        * @tc.number    : Security_IAM_Func_0106
        * @tc.name      : on,off invalid parameters
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0106', 0, async function (done) {
        console.info('testFace Security_IAM_Func_0106 start');
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let authType = userAuthNorth.UserAuthType.FACE;
        let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;
        
        //on: invalid parameter
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.on("results", {
                callback: function(result) {
                  if (result.result != userAuthNorth.ResultCodeV9.SUCCESS) {
                    console.log("Security_IAM_Func_0106 on result = " + result.result);
                  }
                }
              });
        } catch (e) {
            console.log("Security_IAM_Func_0106 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //on: invalid parameter
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.on("", {
                callback: function(result) {
                  if (result.result != userAuthNorth.ResultCodeV9.SUCCESS) {
                    console.log("Security_IAM_Func_0106 on result = " + result.result);
                  }
                }
              });
        } catch (e) {
            console.log("Security_IAM_Func_0106 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //on: invalid parameter
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.on("result");
        } catch (e) {
            console.log("Security_IAM_Func_0106 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //off: invalid parameter
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.off("results");
        } catch (e) {
            console.log("Security_IAM_Func_0106 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        }
        
        //off: invalid parameter
        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.off("");
        } catch (e) {
            console.log("Security_IAM_Func_0106 noAuthType fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
            done();
        }
    })
    
    
    /*
    * @tc.number    : Security_IAM_Func_0103
    * @tc.name      : Kit interface auth & cancel auth
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0103', 0, async function (done) {
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let authType = userAuthNorth.UserAuthType.FACE;
        let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;

        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            // register result and tip
            authInstance.on("result", {
            callback: (result) => {
            console.log("authV9 result " + result.result);
            console.log("authV9 token " + result.token);
            console.log("authV9 remainAttempts " + result.remainAttempts);
            console.log("authV9 lockoutDuration " + result.lockoutDuration);
            expect(result.result).assertEqual(userAuthNorth.ResultCodeV9.NOT_ENROLLED);
            }
            });

            authInstance.on("tip", {
            callback: (result) => {
            console.log("authV9 module " + result.module);
            console.log("authV9 tip " + result.tip);
            }
            });

            //start auth
            authInstance.start();
        } catch (e) {
            console.log("Security_IAM_Func_0103 fail " + e);
        }
        
        // cancel auth
        try {
            authInstance.cancel();
        } catch (e) {
            console.log("Security_IAM_Func_0103 cancel fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.GENERAL_ERROR);
        }
        
        // unregister result and tip
        try {
                authInstance.off("result");
                authInstance.off("tip");
                done();
        } catch (e) {
            console.log("Security_IAM_Func_0103 fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.GENERAL_ERROR);
            done();
        }
    })

   /*
    * @tc.number    : Security_IAM_Func_0108
    * @tc.name      : off direct
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0108', 0, async function (done) {
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let authType = userAuthNorth.UserAuthType.FACE;
        let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;

        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.off("result");
            done();
        } catch (e) {
            console.log("Security_IAM_Func_0108 fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.GENERAL_ERROR);
            done();
        }
    })

   /*
    * @tc.number    : Security_IAM_Func_0109
    * @tc.name      : cancel direct
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0109', 0, async function (done) {
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let authType = userAuthNorth.UserAuthType.FACE;
        let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL1;

        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            authInstance.cancel();
        } catch (e) {
            console.log("Security_IAM_Func_0109 fail " + e);
            expect(e.code).assertEqual(userAuthNorth.ResultCodeV9.GENERAL_ERROR);
            done();
        }
    })
    
   /*
    * @tc.number    : Security_IAM_Func_0110
    * @tc.name      : getAuthInstance faceType ATL4
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0110', 0, async function (done) {
        let challenge = new Uint8Array([253, 19, 58, 160, 67, 200, 247, 37])
        let authType = userAuthNorth.UserAuthType.FACE;
        let authTrustLevel = userAuthNorth.AuthTrustLevel.ATL4;

        try {
            var authInstance = userAuthNorth.getAuthInstance(challenge, authType, authTrustLevel);
            done();
        } catch (e) {
            console.log("Security_IAM_Func_0110 FACE ATL4 fail" + e);
            expect(null).assertFail();
            done();
        }
    })

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0104
        * @tc.name      : Kit interface enum AuthTrustLevel
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0104', 0, async function (done) {
        console.info('testFace Security_IAM_PIN_Kit_Func_0104 start');
        expect(10000).assertEqual(userAuthNorth.AuthTrustLevel.ATL1);
        expect(20000).assertEqual(userAuthNorth.AuthTrustLevel.ATL2);
        expect(30000).assertEqual(userAuthNorth.AuthTrustLevel.ATL3);
        expect(40000).assertEqual(userAuthNorth.AuthTrustLevel.ATL4);
        console.info('testFace Security_IAM_PIN_Kit_Func_0104 end');
        done();
    })

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0105
        * @tc.name      : Kit interface enum FaceTips
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0105', 0, async function (done) {
        console.info('testFace Security_IAM_PIN_Kit_Func_0105 start');
        expect(1).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_BRIGHT);
        expect(2).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_DARK);
        expect(3).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_CLOSE);
        expect(4).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_FAR);
        expect(5).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_HIGH);
        expect(6).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_LOW);
        expect(7).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_RIGHT);
        expect(8).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_LEFT);
        expect(9).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_TOO_MUCH_MOTION);
        expect(10).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_POOR_GAZE);
        expect(11).assertEqual(userAuthNorth.FaceTips.FACE_AUTH_TIP_NOT_DETECTED);
        console.info('testFace Security_IAM_PIN_Kit_Func_0105 end');
        done();
    })

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0106
        * @tc.name      : Kit interface enum UserAuthType
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0106', 0, async function (done) {
        console.info('testFace Security_IAM_PIN_Kit_Func_0106 start');
        expect(2).assertEqual(userAuthNorth.UserAuthType.FACE);
        expect(4).assertEqual(userAuthNorth.UserAuthType.FINGERPRINT);
        console.info('testFace Security_IAM_PIN_Kit_Func_0106 end');
        done();
    })

    /*
        * @tc.number    : Security_IAM_Func_0107
        * @tc.name      : Kit interface enum ResultCode
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_Func_0107', 0, async function (done) {
        console.info('testFace Security_IAM_Func_0107 start');
        expect(12500000).assertEqual(userAuthNorth.ResultCodeV9.SUCCESS);
        expect(12500001).assertEqual(userAuthNorth.ResultCodeV9.FAIL);
        expect(12500002).assertEqual(userAuthNorth.ResultCodeV9.GENERAL_ERROR);
        expect(12500003).assertEqual(userAuthNorth.ResultCodeV9.CANCELED);
        expect(12500004).assertEqual(userAuthNorth.ResultCodeV9.TIMEOUT);
        expect(12500005).assertEqual(userAuthNorth.ResultCodeV9.TYPE_NOT_SUPPORT);
        expect(12500006).assertEqual(userAuthNorth.ResultCodeV9.TRUST_LEVEL_NOT_SUPPORT);
        expect(12500007).assertEqual(userAuthNorth.ResultCodeV9.BUSY);
        expect(12500008).assertEqual(userAuthNorth.ResultCodeV9.INVALID_PARAMETERS);
        expect(12500009).assertEqual(userAuthNorth.ResultCodeV9.LOCKED);
        expect(12500010).assertEqual(userAuthNorth.ResultCodeV9.NOT_ENROLLED);
        console.info('testFace Security_IAM_Func_0107 end');
        done();
    })

    /*
        * @tc.number    : Security_IAM_PIN_Kit_Func_0108
        * @tc.name      : Kit interface enum FingerprintTips
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('Security_IAM_PIN_Kit_Func_0108', 0, async function (done) {
        console.info('testFace Security_IAM_PIN_Kit_Func_0108 start');
        expect(0).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_GOOD);
        expect(1).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_DIRTY);
        expect(2).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_INSUFFICIENT);
        expect(3).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_PARTIAL);
        expect(4).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_TOO_FAST);
        expect(5).assertEqual(userAuthNorth.FingerprintTips.FINGERPRINT_AUTH_TIP_TOO_SLOW);
        console.info('testFace Security_IAM_PIN_Kit_Func_0108 end');
        done();
    })

})

}
