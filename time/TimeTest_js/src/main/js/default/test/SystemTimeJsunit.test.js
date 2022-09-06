/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

// @ts-nocheck
import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect,
} from "deccjsunit/index";
import systemTime from "@ohos.systemTime";

describe("TimeTest", function () {
    console.log("start################################start");

    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0001", 0, async function (done) {
        console.log("---------------UB_systemTime_getCurrentTime_JS_API_0001 start----------------");
        systemTime.getCurrentTime(true, (error, data) => {
            if (error) {
                console.error(`failed to systemTime.getCurrentTime because ` + JSON.stringify(error));
                expect().assertFail()
            }
            console.log(`systemTime.getCurrentTime success data : ` + JSON.stringify(data));
            expect(data != null).assertEqual(true);
        });

        console.log("---------------SUB_systemTime_getRealActiveTime_JS_API_0100 end-----------------");
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0002
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0002", 0, async function (done) {
        console.log("----------SUB_systemTime_getCurrentTime_JS_API_0002 start----------------");
        systemTime.getCurrentTime(true).then((data) => {
            console.log(`systemTime.getCurrentTime promise success data : ` + JSON.stringify(data));
            expect(data != null).assertEqual(true);
        }).catch(err => {
            console.error(`failed to systemTime.getCurrentTime promise because ` + JSON.stringify(error));
            expect().assertFail()
        })
        console.log("----------SUB_systemTime_getCurrentTime_JS_API_0002 end------------");
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getRealActiveTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0001", 0, async function (done) {
        console.log("---------------SUB_systemTime_getRealActiveTime_JS_API_0001 start----------------");
        systemTime.getRealActiveTime(true, (error, data) => {
            if (error) {
                console.error(`failed to systemTime.getRealActiveTime because ` + JSON.stringify(error));
                expect().assertFail()
            }
            console.log(`systemTime.getRealActiveTime success data : ` + JSON.stringify(data));
            expect(data != null).assertEqual(true);
        });

        console.log("---------------SUB_systemTime_getRealActiveTime_JS_API_0001 end-----------------");
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getRealActiveTime_JS_API_0002
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealActiveTime_JS_API_0002", 0, async function (done) {
        console.log("----------SUB_systemTime_getRealActiveTime_JS_API_0002 start----------------");
        systemTime.getRealActiveTime(true).then((data) => {
            onsole.log(`systemTime.getRealActiveTime promise success data : ` + JSON.stringify(data));
            expect(data != null).assertEqual(true);
        }).catch(err => {
            console.error(`failed to systemTime.getRealActiveTime promise because ` + JSON.stringify(error));
            expect().assertFail()
        })
        console.log("----------SUB_systemTime_getRealActiveTime_JS_API_0002 end------------");
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getRealTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealTime_JS_API_0001", 0, async function (done) {
        console.log("---------------SUB_systemTime_getRealTime_JS_API_0001 start----------------");
        systemTime.getRealTime(true, (error, data) => {
            if (error) {
                console.error(`failed to systemTime.getRealTime because ` + JSON.stringify(error));
                expect().assertFail()
            }
            console.log(`systemTime.getRealTime success data : ` + JSON.stringify(data));
            expect(data != null).assertEqual(true);
        });

        console.log("---------------SUB_systemTime_getRealTime_JS_API_0001 end-----------------");
        done();
    });

    /**
     * @tc.number    SUB_systemTime_getRealTime_JS_API_0002
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds elapsed since the system was booted, not including deep sleep time.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getRealTime_JS_API_0002", 0, async function (done) {
        console.log("----------SUB_systemTime_getRealTime_JS_API_0002 start----------------");
        systemTime.getRealTime(true).then((data) => {
            console.log(`systemTime.getRealTime promise success data : ` + JSON.stringify(data));
            expect(data != null).assertEqual(true);
        }).catch(err => {
            console.error(`failed to systemTime.getRealTime promise because ` + JSON.stringify(error));
            expect().assertFail()
        })
        console.log("----------SUB_systemTime_getRealTime_JS_API_0002 end------------");
        done();
    });



});
  