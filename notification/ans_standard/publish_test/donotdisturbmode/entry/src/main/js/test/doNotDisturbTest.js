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

import notify from '@ohos.notification'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
var ERR_ANS_INVALID_PARAM = 67108867
describe('ActsAnsDoNotDisturbTest', function () {
    console.info("===ActsAnsDoNotDisturbTest start===>");
    function connectCallbacka() {
        console.debug("==>connectCallbacka code==>");
    }
    function subscribeCallbacka(err) {
        console.debug("==>subscribeCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbacka(err){
        console.debug("==>unSubscribeCallbacka code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function connectCallbackb() {
        console.debug("==>connectCallbackb code==>");
    }
    function subscribeCallbackb(err) {
        console.debug("==>subscribeCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }
    function unSubscribeCallbackb(err){
        console.debug("==>unSubscribeCallbackb code==>" +err.code);
        expect(err.code).assertEqual(0);
    }

    /*
     * @tc.number: ActsSetDoNotDisturbTest_test_1900
     * @tc.name: setDoNotDisturbDate()
     * @tc.desc: verify the function of setDoNotDisturbDate
     */
    it('ActsSetDoNotDisturbTest_test_1900', 0, async function (done) {
        await notify.setDoNotDisturbDate({
            type:notify.DoNotDisturbType.TYPE_CLEARLY,
            begin:100,
            end:100
        },async(err) => {
            console.log("===>test_1900 success===>"+err.code);
            await notify.getDoNotDisturbDate((err,data)=>{
                console.log("===>test_1900 getDoNotDisturbDate success===>"+err.code+JSON.stringify(data));
            })
        })
        done();
    })

    /*
     * @tc.number: ActsSetDoNotDisturbTest_test_2000
     * @tc.name: displayBadge()
     * @tc.desc: verify the function of displayBadge
     */
    it('ActsSetDoNotDisturbTest_test_2000', 0, async function (done) {
        var promise = notify.setDoNotDisturbDate({
            type:notify.DoNotDisturbType.TYPE_CLEARLY,
            begin:100,
            end:100
        })
        console.log("===>ActsSetDoNotDisturbTest_test_2000 promise===>"+promise);
        expect(promise).assertEqual(undefined);
        done();
    })
})


