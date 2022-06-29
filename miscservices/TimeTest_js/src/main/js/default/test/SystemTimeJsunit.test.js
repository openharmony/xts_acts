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
  import systemTime from "@ohos.systemtime";
  
  describe("TimeTest", function () {
    console.log("start################################start");  
    /**
     * @tc.number    SUB_systemTime_getRealActiveTime_JS_API_0100
     * @tc.name      Test systemTime.getRealActiveTime
     * @tc.desc      Test systemTime_getRealActiveTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_getRealActiveTime_test1", 0, async function (done) {
      console.log("SUB_systemTime_getRealActiveTime_JS_API_0100 start");
  
      systemTime.getRealActiveTime().then((data) => {
        console.log("f_ActiveTime1: getRealActiveTime data = " + data);
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_getRealActiveTime_JS_API_0100 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_getRealTime_JS_API_0100
     * @tc.name      Test systemTime.getRealTime
     * @tc.desc      Test systemTime_getRealTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_getRealTime_test1", 0, async function (done) {
      console.log("SUB_systemTime_getRealTime_JS_API_0100 start");
  
      systemTime.getRealTime().then((data) => {
        console.log("f_RealTime1: getRealTime data = " + data);
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_getRealTime_JS_API_0100 end");
      done();
    });
  });
  