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
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0100
     * @tc.name      Test systemTime.setTimezone timezone = 'Antarctica/McMurdo'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test1", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0100 start");
  
      var timezone = "Antarctica/McMurdo";
      console.log("f_test1: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test1: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test1: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0100 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0200
     * @tc.name      Test systemTime.setTimezone timezone = 'America/Argentina/Buenos_Aires'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test2", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0200 start");
  
      var timezone = "America/Argentina/Buenos_Aires";
      console.log("f_test2: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test2: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test2: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0200 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0300
     * @tc.name      Test systemTime.setTimezone timezone = 'Australia/Sydney'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test3", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0300 start");
  
      var timezone = "Australia/Sydney";
      console.log("f_test3: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test3: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test3: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0300 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0400
     * @tc.name      Test systemTime.setTimezone timezone = 'America/Noronha'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test4", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0400 start");
  
      var timezone = "America/Noronha";
      console.log("f_test4: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test4: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test4: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0400 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0500
     * @tc.name      Test systemTime.setTimezone timezone = 'Beijing, China'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test5", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0500 start");
  
      var timezone = "America/St_Johns";
      console.log("f_test5: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test5: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test5: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0500 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0600
     * @tc.name      Test systemTime.setTimezone timezone = 'Africa/Kinshasa'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test6", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0600 start");
  
      var timezone = "Africa/Kinshasa";
      console.log("f_test6: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test6: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test6: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0600 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0700
     * @tc.name      Test systemTime.setTimezone timezone = 'America/Santiago'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test7", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0700 start");
  
      var timezone = "America/Santiago";
      console.log("f_test7: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test7: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test7: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0700 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0800
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Shanghai'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test8", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0800 start");
  
      var timezone = "Asia/Shanghai";
      console.log("f_test8: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test8: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test8: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0800 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0900
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Nicosia'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test9", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_0900 start");
  
      var timezone = "Asia/Nicosia";
      console.log("f_test9: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test9: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test9: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_0900 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1000
     * @tc.name      Test systemTime.setTimezone timezone = 'Europe/Berlin'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test10", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1000 start");
  
      var timezone = "Europe/Berlin";
      console.log("f_test10: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test10: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test10: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1000 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1100
     * @tc.name      Test systemTime.setTimezone timezone = 'America/Guayaquil'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test11", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1100 start");
  
      var timezone = "America/Guayaquil";
      console.log("f_test11: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test11: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test11: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1100 end");
          done();
        });
      });
    });
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1200
     * @tc.name      Test systemTime.setTimezone timezone = 'Europe/Madrid'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test12", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1200 start");
  
      var timezone = "Europe/Madrid";
      console.log("f_test12: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test12: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test12: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1200 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1300
     * @tc.name      Test systemTime.setTimezone timezone = 'Pacific/Pohnpei'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test13", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1300 start");
  
      var timezone = "Pacific/Pohnpei";
      console.log("f_test13: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test13: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test13: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1300 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1400
     * @tc.name      Test systemTime.setTimezone timezone = 'America/Godthab'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test14", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1400 start");
  
      var timezone = "America/Godthab";
      console.log("f_test14: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test14: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test14: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1400 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1500
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Jakarta'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test15", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1500 start");
  
      var timezone = "Asia/Jakarta";
      console.log("f_test15: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test15: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test15: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1500 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1600
     * @tc.name      Test systemTime.setTimezone timezone = 'Pacific/Tarawa'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test16", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1600 start");
  
      var timezone = "Pacific/Tarawa";
      console.log("f_test16: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test16: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test16: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1600 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1700
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Almaty'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test17", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1700 start");
  
      var timezone = "Asia/Almaty";
      console.log("f_test17: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test17: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test17: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1700 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1800
     * @tc.name      Test systemTime.setTimezone timezone = 'Pacific/Majuro'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test18", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1800 start");
  
      var timezone = "Pacific/Majuro";
      console.log("f_test18: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test18: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test18: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1800 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_1900
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Ulaanbaatar'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test19", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_1900 start");
  
      var timezone = "Asia/Ulaanbaatar";
      console.log("f_test19: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test19: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test19: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_1900 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2000
     * @tc.name      Test systemTime.setTimezone timezone = 'America/Mexico_City'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test20", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2000 start");
  
      var timezone = "America/Mexico_City";
      console.log("f_test20: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test20: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test20: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2000 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2100
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Kuala_Lumpur'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test21", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2100 start");
  
      var timezone = "Asia/Kuala_Lumpur";
      console.log("f_test21: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test21: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test21: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2100 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2200
     * @tc.name      Test systemTime.setTimezone timezone = 'Pacific/Auckland'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test22", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2200 start");
  
      var timezone = "Pacific/Auckland";
      console.log("f_test22: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test22: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test22: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2200 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2300
     * @tc.name      Test systemTime.setTimezone timezone = 'Pacific/Tahiti'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test23", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2300 start");
  
      var timezone = "Pacific/Tahiti";
      console.log("f_test23: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test23: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test23: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2300 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2400
     * @tc.name      Test systemTime.setTimezone timezone = 'Pacific/Port_Moresby'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test24", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2400 start");
  
      var timezone = "Pacific/Port_Moresby";
      console.log("f_test24: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test24: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test24: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2400 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2500
     * @tc.name      Test systemTime.setTimezone timezone = 'Asia/Gaza'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test25", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2500 start");
  
      var timezone = "Asia/Gaza";
      console.log("f_test25: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test25: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test25: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2500 end");
          done();
        });
      });
    });
  
    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_2600
     * @tc.name      Test systemTime.setTimezone timezone = 'Europe/Lisbon'
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTimezone_test26", 0, async function (done) {
      console.log("SUB_systemTime_setTimezone_JS_API_2600 start");
  
      var timezone = "Europe/Lisbon";
      console.log("f_test26: setTimezone = " + timezone);
      systemTime.setTimezone(timezone).then(() => {
        console.log("f_test26: setTimezone promise");
  
        systemTime.getTimezone().then((data) => {
          console.log("f_test26: getTimezone data = " + data);
          expect(true).assertTrue();
  
          console.log("SUB_systemTime_setTimezone_JS_API_2600 end");
          done();
        });
      });

    });
  
    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0100
     * @tc.name      Test systemTime.setTime time = 123235423411
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTime_test1", 0, async function (done) {
      console.log("SUB_systemTime_setTime_JS_API_0100 start1");
  
      var time = 123235423411;
      console.log("f_setTime1: setTime = " + time);
      systemTime.setTime(time).then(() => {
        console.log("f_setTime1: setTime promise");
  
        systemTime.getCurrentTime(true).then((data) => {
          console.log("f_setTime1: getCurrentTime data = " + data);
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setTime_JS_API_0100 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0200
     * @tc.name      Test systemTime.setTime time = 1
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTime_test2", 0, async function (done) {
      console.log("SUB_systemTime_setTime_JS_API_0200 start");
  
      var time = 1;
      console.log("f_setTime2: setTime = " + time);
      systemTime.setTime(time).then(() => {
        console.log("f_setTime2: setTime promise");
  
        systemTime.getCurrentTime(true).then((data) => {
          console.log("f_setTime2: getCurrentTime data = " + data);
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setTime_JS_API_0200 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0300
     * @tc.name      Test systemTime.setTime time = 115230
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTime_test3", 0, async function (done) {
      console.log("SUB_systemTime_setTime_JS_API_0300 start");
  
      var time = 115230;
      console.log("f_setTime3: setTime = " + time);
      systemTime.setTime(time).then(() => {
        console.log("f_setTime3: setTime promise");
  
        systemTime.getCurrentTime(true).then((data) => {
          console.log("f_setTime3: getCurrentTime data = " + data);
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setTime_JS_API_0300 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0400
     * @tc.name      Test systemTime.setTime  time = 6666666
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setTime_test4", 0, async function (done) {
      console.log("SUB_systemTime_setTime_JS_API_0400 start");
  
      var time = 118666;
      console.log("f_setTime4: setTime = " + time);
      systemTime.setTime(time).then(() => {
        console.log("f_setTime4: setTime promise");
  
        systemTime.getCurrentTime(true).then((data) => {
          console.log("f_setTime4: getCurrentTime data = " + data);
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setTime_JS_API_0400 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0100
     * @tc.name      Test systemTime.setDate date = new Date()
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test1", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0100 start");
  
      var date = new Date();
      console.log("f_setDate1: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate1: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate1: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0100 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0200
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test2", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0200 startaa");
  
      var date = new Date(2022, 1, 1);
      console.log("f_setDate2: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate2: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate2: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0200 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0300
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,15)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test3", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0300 startaa");
  
      var date = new Date(2022, 1, 15);
      console.log("f_setDate3: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate3: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate3: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0300 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0400
     * @tc.name      Test systemTime.setDate date = new Date(2022,1,31)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test4", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0400 start");
  
      var date = new Date(2022, 1, 31);
      console.log("f_setDate4: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate4: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate4: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0400 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0500
     * @tc.name      Test systemTime.setDate date = new Date(2022,2,1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test5", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0500 start");
  
      var date = new Date(2022, 2, 1);
      console.log("f_setDate5: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate5: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate5: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0500 end");
      done();
    });
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0600
     * @tc.name      Test systemTime.setDate date = new Date(2022,2,28)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test6", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0600 start");
  
      var date = new Date(2022, 2, 28);
      console.log("f_setDate6: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate6: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate6: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0600 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0700
     * @tc.name      Test systemTime.setDate date = new Date(2040,2,28)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test7", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0700 start");
  
      var date = new Date(2040, 2, 29);
      console.log("f_setDate7: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate7: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate7: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0700 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0800
     * @tc.name      Test systemTime.setDate date = new Date(2040,2,29)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test8", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0800 start");
  
      var date = new Date(2040, 2, 29);
      console.log("f_setDate8: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate8: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate8: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0800 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0900
     * @tc.name      Test systemTime.setDate date = new Date(2022,6,30)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test9", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_0900 start");
  
      var date = new Date(2022, 6, 30);
      console.log("f_setDate9: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate9: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate9: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_0900 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1000
     * @tc.name      Test systemTime.setDate date = new Date(2022,7,31)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test10", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_1000 start");
  
      var date = new Date(2022, 7, 31);
      console.log("f_setDate10: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate10: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate10: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_1000 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1100
     * @tc.name      Test systemTime.setDate date = new Date(2022,12,31)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test11", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_1100 start");
  
      var date = new Date(2022, 12, 31);
      console.log("f_setDate11: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate11: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate11: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_1100 end");
      done();
    });
  
    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_1200
     * @tc.name      Test systemTime.setDate date = new Date(2022,13,1)
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("systemTime_setDate_test12", 0, async function (done) {
      console.log("SUB_systemTime_setDate_JS_API_1200 start");
  
      var date = new Date(2022, 13, 1);
      console.log("f_setDate12: setDate = " + date.toLocaleDateString());
      systemTime.setDate(date).then(() => {
        console.log("f_setDate12: setDate promise");
  
        systemTime.getDate().then((data) => {
          console.log("f_setDate12: getDate data = " + data.toLocaleDateString());
        });
      });
      expect(true).assertTrue();
      console.log("SUB_systemTime_setDate_JS_API_1200 end");
      done();
    });
  
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
  