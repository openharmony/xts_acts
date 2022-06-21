/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import appManager from '@ohos.application.appManager';
import formBindingData from '@ohos.application.formBindingData';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index";

describe('CoverApiTest', function () {
    let TAG = '';

    /*
     * @tc.number  SUB_AA_OpenHarmony_CoverApi_0500
     * @tc.name    whether the system is under stability test
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('SUB_AA_OpenHarmony_CoverApi_0500', 0, async function (done) {
        console.log("------------start SUB_AA_OpenHarmony_CoverApi_0500-------------");
        appManager.isRunningInStabilityTest()
            .then((data) => {
                console.info('SUB_AA_OpenHarmony_CoverApi_0500 successful. data: ' + JSON.stringify(data));
                expect(data == false).assertTrue();
                done();
            }).catch((error) => {
            console.error('SUB_AA_OpenHarmony_CoverApi_0500 failed. error: ' + JSON.stringify(error));
            expect().assertFalse();
            done();
        })
    });
    
        /*
         * @tc.number  SUB_AA_OpenHarmony_FormBase_1000
         * @tc.name    Validate formbindingdata creation data
         * @tc.desc    Function test
         * @tc.level   0
         */
        it('SUB_AA_OpenHarmony_FormBase_1000', 0, async function (done) {
            console.info('------------start SUB_AA_OpenHarmony_FormBase_1000-------------');
            TAG = 'SUB_AA_OpenHarmony_FormBase_1000';
            var dataObj = {
                temperature:"11c",
                "time":"11:00",
                "test":11,
                "test3":true
            }
            var result = formBindingData.createFormBindingData(dataObj)
            console.log(TAG + " result is : " + JSON.stringify(result))
            expect(JSON.stringify(result)).
            assertEqual(JSON.stringify(
                {"data":"{\"temperature\":\"11c\",\"time\":\"11:00\",\"test\":11,\"test3\":true}"}));
            done();
            console.info('------------end SUB_AA_OpenHarmony_FormBase_1000-------------');
        });
})