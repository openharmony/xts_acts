/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import formManager from '@ohos.ability.formManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const TIMEOUT = 3000;
describe('getAllFormsInfoTest', function () {
    console.log("system application and has permissions Test");

    /**
     * @tc.name getAllFormsInfo test
     * @tc.number FMS_getFormsInfo_0400
     * @tc.desc All form configuration information is queried successfully (by AsyncCallback)
     */
    it('FMS_getFormsInfo_0400_callback', 0, async function (done) {
        console.log("FMS_getFormsInfo_0400_callback begin");

        var ret = formManager.getAllFormsInfo(
            (result, data) => {
                console.log("FMS_getFormsInfo_0400_callback async::sucess, data json:"
                    + JSON.stringify(data));
                console.log("FMS_getFormsInfo_0400_callback async::result, result:" + result);
                expect(result).assertEqual(1);

                expect(data[0].description).assertEqual("form_description");
                expect(data[0].type).assertEqual(1);
                expect(data[0].colorMode).assertEqual(-1);
                expect(data[0].jsComponentName).assertEqual("card");
                expect(data[0].isDefault).assertEqual(1);
                expect(data[0].updateEnabled).assertEqual(1);
                expect(data[0].updateDuration).assertEqual(1);
                expect(data[0].scheduledUpdateTime).assertEqual("10:30");
                expect(data[0].formVisibleNotify).assertEqual(1);
                expect(data[0].defaultDimension).assertEqual(1);
                expect(data[0].supportDimensions[0]).assertEqual(1);
                expect(data[0].supportDimensions[1]).assertEqual(2);
                expect(data[0].metaData.customizeData[0].name).assertEqual("originWidgetName");
                expect(data[0].metaData.customizeData[0].value).assertEqual("myTest");
                
                expect(data[0].name).assertEqual("FormB_Js001");
                console.log("FMS_getFormsInfo_0400_callback result end");
                done();
            }
        );

        setTimeout(function () {
            console.info('=====================FMS_getFormsInfo_0400_callback==================end');
        }, TIMEOUT)
        console.log("FMS_getFormsInfo_0400_callback end, ret:"+ret);
    })

    /**
     * @tc.name getAllFormsInfo test
     * @tc.number FMS_getFormsInfo_0400
     * @tc.desc All form configuration information is queried successfully (by Promise)
     */
    it('FMS_getFormsInfo_0400_promise', 0, async function (done) {
        console.log("FMS_getFormsInfo_0400_promise begin--------111");

        var promise = formManager.getAllFormsInfo();
        promise.then((data) => {
            console.log("FMS_getFormsInfo_0400_promise async::sucess, data json:" + JSON.stringify(data));
            
            expect(data[0].description).assertEqual("form_description");
            expect(data[0].type).assertEqual(1);
            expect(data[0].colorMode).assertEqual(-1);
            expect(data[0].jsComponentName).assertEqual("card");
            expect(data[0].isDefault).assertEqual(1);
            expect(data[0].updateEnabled).assertEqual(1);
            expect(data[0].updateDuration).assertEqual(1);
            expect(data[0].scheduledUpdateTime).assertEqual("10:30");
            expect(data[0].formVisibleNotify).assertEqual(1);
            expect(data[0].defaultDimension).assertEqual(1);
            expect(data[0].supportDimensions[0]).assertEqual(1);
            expect(data[0].supportDimensions[1]).assertEqual(2);
            expect(data[0].metaData.customizeData[0].name).assertEqual("originWidgetName");
            expect(data[0].metaData.customizeData[0].value).assertEqual("myTest");
            
            expect(data[0].name).assertEqual("FormB_Js001");
            console.log("FMS_getFormsInfo_0400_promise result end");
            done();
        }
        );

        setTimeout(function () {
            console.info('=====================FMS_getFormsInfo_0400_promise==================end');
        }, TIMEOUT)
    })

}) 
