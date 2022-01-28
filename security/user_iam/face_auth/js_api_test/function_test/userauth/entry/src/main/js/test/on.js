/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import userAuth from '@ohos.userIAM.userAuth'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
var index = require('../default/pages/index/index.js');
var waitFlag = false;

/**
 * test case
 */
describe('userAuthTest', function () {
    beforeEach(function(done) {
        let waitTime = 1000;
        if (waitFlag) {
            waitTime = 30000;
        }
        setTimeout(function() {
            done();
        }, waitTime);
    })
    afterEach(function() {
    })

    /**
    * @tc.name      on getTips 0100
    * @tc.number    JSAPI_Function_On_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_On_0100', 0, function (done) {
        console.log("JSAPI_Function_On_0100 start");
        index.default.fileSave('JSAPI_Function_On_0100','12',
            '8200  0 0 0 0 0 0 0 0 0 0',
            '13  0 0 0 0 0 0 0 0 0 0',
            '4  0 0 0 0 0 0 0 0 0 0',
            '3  0 0 0 0 0 0 0 0 0 0',
            '6  0 0 0 0 0 0 0 0 0 0',
            '8  0 0 0 0 0 0 0 0 0 0',
            '7  0 0 0 0 0 0 0 0 0 0',
            '5  0 0 0 0 0 0 0 0 0 0',
            '4105  0 0 0 0 0 0 0 0 0 0',
            '9  0 0 0 0 0 0 0 0 0 0',
            '2  0 0 0 0 0 0 0 0 0 0',
            '17 0 0 0 0 0 0 0 0 0 0');
        const auth = userAuth.getAuthenticator();
        let tipCodeIndex = 1;
        auth.on("tip", function(data) {
            console.log("JSAPI_Function_On_0100 on.index:" + tipCodeIndex);
            console.log("JSAPI_Function_On_0100 on.errorCode:" + data.errorCode);
            console.log("JSAPI_Function_On_0100 on.tipEvent:" + data.tipEvent);
            console.log("JSAPI_Function_On_0100 on.tipCode:" + data.tipCode);
            if(tipCodeIndex<12){
                // errorCode = Success
                expect(data.errorCode).assertEqual(0);
                // ACQUIRE = 3
                expect(data.tipEvent).assertEqual(3);

                // FACE_AUTH_TIP_TOO_BRIGHT = 1,
                // FACE_AUTH_TIP_TOO_DARK = 2,
                // FACE_AUTH_TIP_TOO_CLOSE = 3,
                // FACE_AUTH_TIP_TOO_FAR = 4,
                // FACE_AUTH_TIP_TOO_HIGH = 5,
                // FACE_AUTH_TIP_TOO_LOW = 6,
                // FACE_AUTH_TIP_TOO_RIGHT = 7,
                // FACE_AUTH_TIP_TOO_LEFT = 8,
                // FACE_AUTH_TIP_TOO_MUCH_MOTION = 9,
                // FACE_AUTH_TIP_POOR_GAZE = 10,
                // FACE_AUTH_TIP_NOT_DETECTED = 11,
                expect(data.tipCode).assertEqual(tipCodeIndex);
                tipCodeIndex = tipCodeIndex + 1;
            }else{
                // errorCode = Success
                expect(data.errorCode).assertEqual(0);
                // result = 1
                expect(data.tipEvent).assertEqual(1);
                expect(data.tipCode).assertEqual(0);
            }
        });
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_On_0100 auth.execute:" + data);
            auth.off("tip", function(data) {
                console.log("JSAPI_Function_On_0100 off:" + data);
            });
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_On_0100 end");
    })

    /**
    * @tc.name      on getTips 0200
    * @tc.number    JSAPI_Function_On_0200
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_On_0200', 0, function (done) {
        console.log("JSAPI_Function_On_0200 start");
        const auth = userAuth.getAuthenticator();
       waitFlag = true;
        auth.on("tip", function(data) {
            console.log("JSAPI_Function_On_0200 on.errorCode:" + data.errorCode);
            console.log("JSAPI_Function_On_0200 on.tipEvent:" + data.tipEvent);
            if(data.tipEvent == 1){
                // errorCode= SUCCESS
                expect(data.errorCode).assertEqual(0);
                // RESULT = 1
                expect(data.tipEvent).assertEqual(1);
            }
            setTimeout(function() {
                done();
            }, 1);
        });
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_On_0200 auth.execute:" + data);
            expect(data).assertEqual(0);
            auth.off("tip", function(data) {
                console.log("JSAPI_Function_On_0200 off:" + data);
            });
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_On_0200 end");
    })

    /**
    * @tc.name      on getTips 0300
    * @tc.number    JSAPI_Function_On_0300
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_On_0300', 0, function (done) {
        console.log("JSAPI_Function_On_0300 start");
        index.default.fileSave('JSAPI_Function_On_0300','1','18  0 0 0 0 0 0 0 0 0 0');
        const auth = userAuth.getAuthenticator();
       waitFlag = false;
        auth.on("tip", function(data) {
            console.log("JSAPI_Function_On_0300 on.errorCode:" + data.errorCode);
            console.log("JSAPI_Function_On_0300 on.tipEvent:" + data.tipEvent);
            // errorCode= Success
            expect(data.errorCode).assertEqual(0);
            // RESULT = 1
            expect(data.tipEvent).assertEqual(1);
            setTimeout(function() {
                done();
            }, 1);
        });

        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_On_0300 auth.execute:" + data);
            expect(data).assertEqual(1);
            auth.off("tip", function(data) {
                console.log("JSAPI_Function_On_0300 off:" + data);
            });
            setTimeout(function() {
                done();
            }, 1);
        });
        console.log("JSAPI_Function_On_0300 end");
    })

    /**
    * @tc.name      on getTips 0400
    * @tc.number    JSAPI_Function_On_0400
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_On_0400', 0, function (done) {
        console.log("JSAPI_Function_On_0400 start");
        const auth = userAuth.getAuthenticator();
       waitFlag = true;
        auth.on("tip", function(data) {
            console.log("JSAPI_Function_On_0400 on.errorCode:" + data.errorCode);
            console.log("JSAPI_Function_On_0400 on.tipEvent:" + data.tipEvent);
            if(data.tipCode == 5){
                expect(data.tipCode).assertEqual(5);
                // errorCode= SUCCESS
                expect(data.errorCode).assertEqual(0);
                // RESULT = 1
                expect(data.tipEvent).assertEqual(1);
            }
        });
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_On_0400 auth.execute:" + data);
        });
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_On_0400 auth.execute:" + data);
            auth.off("tip", function(data) {
                console.log("JSAPI_Function_On_0400 off:" + data);
            });
            setTimeout(function() {
                done();
            }, 3000);
        });

        console.log("JSAPI_Function_On_0400 end");
    })

    /**
    * @tc.name      on getTips 0500
    * @tc.number    JSAPI_Function_On_0500
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_On_0500', 0, function (done) {
        console.log("JSAPI_Function_On_0500 start");
        const auth = userAuth.getAuthenticator();
       waitFlag = false;
        auth.on("tip", function(data) {
            console.log("JSAPI_Function_On_0500 on.errorCode:" + data.errorCode);
            console.log("JSAPI_Function_On_0500 on.tipEvent:" + data.tipEvent);
            // errorCode= SUCCESS
            expect(data.errorCode).assertEqual(0);
            // CANCEL = 2
            expect(data.tipEvent).assertEqual(2);
            setTimeout(function() {
                done();
            }, 1);
        });
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_On_0500 auth.execute:" + data);
            auth.off("tip", function(data) {
                console.log("JSAPI_Function_On_0500 off:" + data);
            });
            setTimeout(function() {
                done();
            }, 1);
        });
        let result = auth.cancel();
        console.log("JSAPI_Function_On_0500 auth.cancel:" + result);
        console.log("JSAPI_Function_On_0500 end");
    })
})