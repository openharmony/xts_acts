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

/**
 * performance case
 */
describe('userAuthPerformanceTest', function () {
    beforeEach(function(){
    })
    afterEach(function(){
    })

    /**
    * @tc.name      checkAvailability performance
    * @tc.number    JSAPI_Performance_CheckAvailability_0100
    * @tc.size      MEDIUM
    * @tc.type      FUNC
    * @tc.level     Level2
    */
    it('JSAPI_Performance_CheckAvailability_0100', 0, function () {
        console.log("JSAPI_Performance_CheckAvailability_0100 start");
        const auth = userAuth.getAuthenticator();
        let allTime = 0;
        for(let i = 0;i<1000;i++){
            console.log("JSAPI_Performance_CheckAvailability_0100 count"+ i);
            let startDate = new Date();
            auth.checkAvailability("FACE_ONLY", "S2")
            let endDate = new Date();
            allTime += (endDate.getTime() - startDate.getTime());
        }
        console.log("JSAPI_Performance_CheckAvailability_0100 performance allTime:" + allTime);
        console.log("JSAPI_Performance_CheckAvailability_0100 performance avg" + (allTime/1000));
        expect((allTime/1000) < 2).assertTrue();
        console.log("JSAPI_Performance_CheckAvailability_0100 end");
    })
})