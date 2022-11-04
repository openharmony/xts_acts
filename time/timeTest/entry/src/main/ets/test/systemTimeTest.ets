// @ts-nocheck
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import systemTime from "@ohos.systemTime";

export default function systemTimeJsunit() {
  describe('systemTimeTest', function () {
    console.info('====>---------------systemTimeTest start-----------------------');
    /**
     * @tc.number    SUB_systemTime_getCurrentTime_JS_API_0001
     * @tc.name      Test systemTime.getCurrentTime
     * @tc.desc      Obtains the number of milliseconds that have elapsed since the Unix epoch.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_systemTime_getCurrentTime_JS_API_0001", 0, async function (done) {
      console.info("====>----------UB_systemTime_getCurrentTime_JS_API_0001 start----------------");
      systemTime.getCurrentTime(true, (error, data) => {
        if (error) {
          console.error(`failed to systemTime.getCurrentTime because ` + JSON.stringify(error));
          expect().assertFail();
        };
        console.info(`systemTime.getCurrentTime success data : ` + JSON.stringify(data));
        expect(data != null).assertEqual(true);
      });

      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0100 end-----------------");
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
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0002 start----------------");
      systemTime.getCurrentTime(true).then((data) => {
        console.info(`SUB_systemTime_getCurrentTime_JS_API_0002 data : ` + JSON.stringify(data));
        expect(data != null).assertEqual(true);
      }).catch(err => {
        console.error(`SUB_systemTime_getCurrentTime_JS_API_0002 err: ` + JSON.stringify(error));
        expect().assertFail()
      });
      console.info("====>-----SUB_systemTime_getCurrentTime_JS_API_0002 end------------");
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
      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0001 start----------------");
      systemTime.getRealActiveTime(true, (error, data) => {
        if (error) {
          console.error(`SUB_systemTime_getRealActiveTime_JS_API_0001 err: ` + JSON.stringify(error));
          expect().assertFail()
        };
        console.info(`SUB_systemTime_getRealActiveTime_JS_API_0001 data : ` + JSON.stringify(data));
        expect(data != null).assertEqual(true);
      });

      console.info("====>----------SUB_systemTime_getRealActiveTime_JS_API_0001 end-----------------");
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
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0002 start----------------");
      systemTime.getRealActiveTime(true).then((data) => {
        onsole.log(`SUB_systemTime_getRealActiveTime_JS_API_0002 data : ` + JSON.stringify(data));
        expect(data != null).assertEqual(true);
      }).catch(err => {
        console.error(`SUB_systemTime_getRealActiveTime_JS_API_0002 err: ` + JSON.stringify(error));
        expect().assertFail()
      });
      console.info("====>-----SUB_systemTime_getRealActiveTime_JS_API_0002 end------------");
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
      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0001 start----------------");
      systemTime.getRealTime(true, (error, data) => {
        if (error) {
          console.error(`SUB_systemTime_getRealTime_JS_API_0001 err: ` + JSON.stringify(error));
          expect().assertFail()
        };
        console.info(`SUB_systemTime_getRealTime_JS_API_0001 data : ` + JSON.stringify(data));
        expect(data != null).assertEqual(true);
      });

      console.info("====>----------SUB_systemTime_getRealTime_JS_API_0001 end-----------------");
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
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0002 start----------------");
      systemTime.getRealTime(true).then((data) => {
        console.info(`SUB_systemTime_getRealTime_JS_API_0002 data : ` + JSON.stringify(data));
        expect(data != null).assertEqual(true);
      }).catch(err => {
        console.error(`SUB_systemTime_getRealTime_JS_API_0002 err: ` + JSON.stringify(error));
        expect().assertFail();
      });
      console.info("====>-----SUB_systemTime_getRealTime_JS_API_0002 end------------");
      done();
    });

    /**
   * @tc.number    SUB_systemTime_setTime_JS_API_0100
   * @tc.name      Test systemTime.setTime
   * @tc.desc      Test systemTime_setTime API functionality.
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
    it('SUB_systemTime_setTime_JS_API_0100', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0100 start");
      let currentTime = new Date().getTime() + 2000
      try{
        await systemTime.setTime(currentTime)
        expect(true).assertTrue();
        done();
      }catch(err){
        console.info("====>SUB_systemTime_setTime_JS_API_0100 error " + err);
        expect().assertFail();
        done();
      }
    });

    /**
       * @tc.number    SUB_systemTime_setTime_JS_API_0200
       * @tc.name      Test systemTime.setTime Invalid value
       * @tc.desc      Test systemTime_setTime API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
    it('SUB_systemTime_setTime_JS_API_0200', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0200 start");
      try{
        systemTime.setTime(15222).then(() => {   
          console.debug('SUB_systemTime_setTime_JS_API_0200 setTime fail')         
          expect().assertFail();
          done();
        }).catch((err)=>{
          console.debug('SUB_systemTime_setTime_JS_API_0200 setTime err:' + JSON.stringify(err))
          expect(true).assertTrue();
          console.debug('SUB_systemTime_setTime_JS_API_0200 end');
          done();
        })
      }catch(err){
          console.debug('SUB_systemTime_setTime_JS_API_0200 setTime throw_err' + JSON.stringify(err))
          expect(err.code).assertEqual('401');
          done();
      }
    });

    /**
       * @tc.number    SUB_systemTime_setTime_JS_API_0300
       * @tc.name      Test systemTime.setTime3
       * @tc.desc      Test systemTime_setTime API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
    it('SUB_systemTime_setTime_JS_API_0300', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0300 start");
      let currentTime = new Date().getTime() + 2000
      systemTime.setTime(currentTime, (err) => {
        try{
          expect(true).assertTrue();          
          console.info('SUB_systemTime_setTime_JS_API_0300 end');
          done();
        }catch(err){
          console.info("====>SUB_systemTime_setTime_JS_API_0300 error: " + err);
          expect().assertFail();
          done();
        }
      });
    });

    /**
       * @tc.number    SUB_systemTime_setTime_JS_API_0400
       * @tc.name      Test systemTime.setTime4  Invalid value
       * @tc.desc      Test systemTime_setTime API functionality.
       * @tc.size      : MEDIUM
       * @tc.type      : Function
       * @tc.level     : Level 0
       */
    it('SUB_systemTime_setTime_JS_API_0400', 0, async function (done) {
      console.info("====>SUB_systemTime_setTime_JS_API_0400 start");
      try{
        systemTime.setTime(18, (err, data) => {
          console.info("====>SUB_systemTime_setTime_JS_API_0400 data: " + data);
          console.info("====>SUB_systemTime_setTime_JS_API_0400 error: " + err);
          expect(true).assertTrue();
        })}catch(error) {error => {
        expect(1).assertLarger(0);
      };
      };
      console.info('SUB_systemTime_setTime_JS_API_0400 end');
      done();
    });

    /**
      * @tc.number    SUB_systemTime_setDate_JS_API_0100
      * @tc.name      Test systemTime.setDate Invalid value
      * @tc.desc      Test systemTime_setDate API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('SUB_systemTime_setDate_JS_API_0100', 0, async function (done) {
      console.info("====>SUB_systemTime_setDate_JS_API_0100 start");
      var data = new Date("October 13, 2020 11:13:00");
      systemTime.setDate(1).then(data => {
        console.info("====>SUB_systemTime_setDate_JS_API_0100 data " + data);
        expect(true).assertTrue();
      }).catch(error => {
        console.info("====>SUB_systemTime_setDate_JS_API_0100 error " + error);
        expect().assertFail();
      });
      done();
    });

    /**
      * @tc.number    SUB_systemTime_setDate_JS_API_0200
      * @tc.name      Test systemTime.setDate Invalid value
      * @tc.desc      Test systemTime_setDate API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('SUB_systemTime_setDate_JS_API_0200', 0, async function (done) {
      console.info("====>SUB_systemTime_setDate_JS_API_0200 start");
      systemTime.setDate(0).then(data => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 data " + data);
        expect(true).assertTrue();
      }).catch(error => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 error " + error);
        expect().assertFail();
      });
      done();
    });

    /**
      * @tc.number    SUB_systemTime_setDate_JS_API_0300
      * @tc.name      Test systemTime.setDate Invalid value
      * @tc.desc      Test systemTime_setDate API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('SUB_systemTime_setDate_JS_API_0300', 0, async function (done) {
      console.info("====>SUB_systemTime_setDate_JS_API_0300 start");
      var data = new Date("October 13, 2020 11:13:00");
      systemTime.setDate(data, (error, data) => {
        if(error){
          console.info("====>SUB_systemTime_setDate_JS_API_0300 error " + error);
          expect().assertFail();
        }else{
          console.info("====>SUB_systemTime_setDate_JS_API_0300 data " + data);
          expect(true).assertTrue();
        };
      });
      done();
    });

    /**
      * @tc.number    SUB_systemTime_setTimezone_JS_API_0100
      * @tc.name      Test systemTime.setTimezone Invalid value
      * @tc.desc      Test systemTime_setTimezone API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('SUB_systemTime_setTimezone_JS_API_0100', 0, async function (done) {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0100 start");
      systemTime.setTimezone('Asia, Shanghai').then(data => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 data " + data);
        expect().assertFail();
      }).catch(error => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 error " + error);
        expect(true).assertTrue();
      });
      done();
    });

    /**
      * @tc.number    SUB_systemTime_setTimezone_JS_API_0200
      * @tc.name      Test systemTime.setTimezone Invalid value
      * @tc.desc      Test systemTime_setTimezone API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('SUB_systemTime_setTimezone_JS_API_0200', 0, async function (done) {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0200 start");
      systemTime.setTimezone('Beijing,China').then(data => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 data " + data);
        expect().assertFail();
      }).catch(error => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 error " + error);
        expect(true).assertTrue();
      });
      done();
    });

    /**
      * @tc.number    SUB_systemTime_setTimezone_JS_API_0300
      * @tc.name      Test systemTime.setTimezone Invalid value
      * @tc.desc      Test systemTime_setTimezone API functionality.
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
      */
    it('SUB_systemTime_setTimezone_JS_API_0300', 0, async function (done) {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0300 start");
      systemTime.setTimezone('Baker Island, U.S.A.').then(data => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 data " + data);
        expect().assertFail();
      }).catch(error => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 error " + error);
        expect(true).assertTrue();
      });
      done();
    });
  })
}
