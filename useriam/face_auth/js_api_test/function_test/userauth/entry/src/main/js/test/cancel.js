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

/**
 * test case
 */
describe('userAuthTest', function () {
    beforeEach(function(done) {
        let waitTime = 1000;
        setTimeout(function() {
            done();
        }, waitTime);
    })
    afterEach(function() {
    })

    /**
    * @tc.name      execute_authentication_callback_cancel
    * @tc.number    JSAPI_Function_Cancel_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Cancel_0100', 0, function (done) {
        console.log("JSAPI_Function_Cancel_0100 start");
        const auth = userAuth.getAuthenticator();
        let flag = false;
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Cancel_0100 execute:" + data);
            if(data == 0){
                flag = true;
            }
            setTimeout(function() {
                done();
            }, 1);
            if(flag && data != 0){
                expect(data).assertEqual(2);
            }
        });
        let result = auth.cancel();
        console.log("JSAPI_Function_Cancel_0100 auth.cancel:" + result);
        expect(result).assertEqual(0);
        console.log("JSAPI_Function_Cancel_0100 end");
    })

    /**
    * @tc.name      execute_authentication_promise_cancel
    * @tc.number    JSAPI_Function_Cancel_0200
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Cancel_0200', 0, function (done) {
        console.log("JSAPI_Function_Cancel_0200 start");
        const auth = userAuth.getAuthenticator();
        let flag = false;
        auth.execute("FACE_ONLY", "S2").then(function(data) {
            console.log("JSAPI_Function_Cancel_0200 auth.execute:" + data);
            if(data == 0){
                flag = true;
            }
            setTimeout(function() {
                done();
            }, 1);
            if(flag && data != 0){
                expect(data).assertEqual(2);
            }
        });
        let result = auth.cancel();
        expect(result).assertEqual(0);
        console.log("JSAPI_Function_Cancel_0200 auth.cancel:" + result);
        console.log("JSAPI_Function_Cancel_0200 end");
    })

    /**
    * @tc.name      no userAuth cancel
    * @tc.number    JSAPI_Function_Cancel_0300
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Cancel_0300', 0, function () {
        console.log("JSAPI_Function_Cancel_0300 start");
        const auth = userAuth.getAuthenticator();
        let result = auth.cancel();
        console.log("JSAPI_Function_Cancel_0300 cancel result:" + Number(result));
        expect(result).assertEqual(1);
        console.log("JSAPI_Function_Cancel_0300 end");
    })

    /**
    * @tc.name      repeat cancel
    * @tc.number    JSAPI_Function_Cancel_0400
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Function_Cancel_0400', 0, function (done) {
        console.log("JSAPI_Function_Cancel_0400 start");
        const auth = userAuth.getAuthenticator();
        let flag = false;
        auth.execute("FACE_ONLY", "S2", function(data) {
            console.log("JSAPI_Function_Cancel_0400 auth.execute:" + data);
            if(data == 0){
                flag = true;
            }
            setTimeout(function() {
                done();
            }, 1);
            if(flag && data != 0){
                expect(data).assertEqual(2);
            }
            // CANCELED(2)
            let result2 = auth.cancel();
            console.log("JSAPI_Function_Cancel_0400 2 cancel result2:" + result2);
            expect(result2).assertEqual(1);
            setTimeout(function() {
                done();
            }, 1);
        });
        let result1 = auth.cancel();
        console.log("JSAPI_Function_Cancel_0400 1 cancel result1:" + result1);
        console.log("JSAPI_Function_Cancel_0400 end");
    })
})