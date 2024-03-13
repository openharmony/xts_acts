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
import { BusinessError } from '@ohos.base';

export default function systemTimeAuthorityJsunit() {
  describe('systemTimeAuthorityTest', () => {
    console.info('====>---------------systemTimeAuthorityTest start-----------------------');

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    let zone: string;
    beforeEach(async (done: Function) => {
      systemTime.getTimezone().then( (data) => {
        console.info("====>beforeEach data " + data);
        zone = data
        done()
      }).catch((error: BusinessError) => {
        console.info("====>beforeEach error " + error);
      });
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(async (done: Function) => {
      systemTime.setTimezone(zone).then( () => {
        console.info("====>afterEach zone " + zone);
        done()
      }).catch((error: BusinessError) => {
        console.info("====>afterEach error " + JSON.stringify(error));
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0100
     * @tc.name      Test systemTime.setTime
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0100', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0100 start");
      let currentTime = new Date().getTime() + 2000;
      systemTime.setTime(currentTime, (err) => {
        try{
          if(err){
            console.info("====>SUB_systemTime_setTime_JS_API_0100 setTime fail: " + JSON.stringify(err));
            expect().assertFail();
          }
          console.info('====>SUB_systemTime_setTime_JS_API_0100 success');
          expect(true).assertTrue();
          done();
        }catch(err){
          console.info("====>SUB_systemTime_setTime_JS_API_0100 catch error: " + JSON.stringify(err));
          done();
        }
      });
      console.info("====>SUB_systemTime_setTime_JS_API_0100 end");
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0200
     * @tc.name      Test systemTime.setTime Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0200', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0200 start");
      systemTime.setTime(15222).then(() => {
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime fail')
        expect().assertFail();
      }).catch((error: BusinessError)=>{
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime err:' + JSON.stringify(error))
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 setTime err:' + JSON.stringify(error.code))
        expect(error.code).assertEqual(-1);
        console.debug('====>SUB_systemTime_setTime_JS_API_0200 end');
        done();
      })
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0300
     * @tc.name      Test systemTime.setTime3
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0300', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0300 start");
      let currentTime = new Date().getTime() + 2000;
      await systemTime.setTime(currentTime).then(() => {
        console.info('====>SUB_systemTime_setTime_JS_API_0300 success')
        expect(true).assertTrue();
        done();
      }).catch((error: BusinessError)=>{
        console.debug('====>SUB_systemTime_setTime_JS_API_0300 setTime fail:' + JSON.stringify(error))
        expect().assertFail();
        done();
      })
      console.info("====>SUB_systemTime_setTime_JS_API_0300 end");
    });

    /**
     * @tc.number    SUB_systemTime_setTime_JS_API_0400
     * @tc.name      Test systemTime.setTime4  Invalid value
     * @tc.desc      Test systemTime_setTime API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTime_JS_API_0400', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTime_JS_API_0400 start");
      systemTime.setTime(18, (err) => {
        try {
          expect(err.code).assertEqual(-1);
          console.info("====>SUB_systemTime_setTime_JS_API_0400 error: " + err);
          console.info('====>SUB_systemTime_setTime_JS_API_0400 end');
        } catch (err) {
          console.info('====>SUB_systemTime_setTime_JS_API_0400 err: ' + JSON.stringify(err));
        }
        done();
      })
    });

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0200
     * @tc.name      Test systemTime.setDate Invalid value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setDate_JS_API_0200', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setDate_JS_API_0200 start");
      systemTime.setDate(new Date(0)).then( () => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 setDate fail ");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setDate_JS_API_0200 error: " + error);
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0400
     * @tc.name      Test systemTime.setDate true value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setDate_JS_API_0400', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setDate_JS_API_0400 start");
      let currentTime = new Date().getTime();
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      systemTime.setDate(date, (error) => {
        try {
          if(error){
            console.info("====>SUB_systemTime_setDate_JS_API_0400 setDate fail: " + JSON.stringify(error));
            expect().assertFail();
            done();
          }
          systemTime.getDate().then(async (data) => {
            try {
              console.info("====>SUB_systemTime_setDate_JS_API_0400 getDate: " + data);
              console.info("====>SUB_systemTime_setDate_JS_API_0400 getDate: " + JSON.stringify(data).slice(1,17));
              await systemTime.setTime(currentTime + 20)
              expect(JSON.stringify(data).slice(1,17) == '2020-10-13T03:13').assertTrue();
              done();
            } catch (err) {
              console.info("====>SUB_systemTime_setDate_JS_API_0400 catch err: " + err);
              done();
            }
          })
        } catch (err) {
          console.info("====>SUB_systemTime_setDate_JS_API_0400 catch error " + JSON.stringify(err));
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_systemTime_setDate_JS_API_0500
     * @tc.name      Test systemTime.setDate true value
     * @tc.desc      Test systemTime_setDate API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setDate_JS_API_0500', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setDate_JS_API_0500 start");
      let currentTime = new Date().getTime();
      let date = new Date("Tue Oct 13 2020 11:13:00 GMT+0800");
      try {
        await systemTime.setDate(date);
        console.info("====>SUB_systemTime_setDate_JS_API_0500 setDate successful");
        systemTime.getDate().then(async data => {
          try {
            console.info("====>SUB_systemTime_setDate_JS_API_0500 getDate: " + data);
            console.info("====>SUB_systemTime_setDate_JS_API_0500 getDate: " + JSON.stringify(data).slice(1,17));
            await systemTime.setTime(currentTime + 20)
            expect(JSON.stringify(data).slice(1,17) == '2020-10-13T03:13').assertTrue();
            done();
          } catch (err) {
            console.info("====>SUB_systemTime_setDate_JS_API_0500 catch err: " + err);
            done();
          }
        })
      } catch (err) {
        console.info("====>SUB_systemTime_setDate_JS_API_0500 setDate fail: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0100
     * @tc.name      Test systemTime.setTimezone Invalid value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0100', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0100 start");
      systemTime.setTimezone('Asia, Shanghai').then(() => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 setTimezone fail");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0100 error " + JSON.stringify(error));
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0200
     * @tc.name      Test systemTime.setTimezone Invalid value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0200', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0200 start");
      systemTime.setTimezone('Beijing,China').then(() => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 fail");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0200 error " + JSON.stringify(error));
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0300
     * @tc.name      Test systemTime.setTimezone Invalid value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0300', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0300 start");
      systemTime.setTimezone('Baker Island, U.S.A.').then(() => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 data fail");
        expect().assertFail();
        done();
      }).catch((error: BusinessError) => {
        console.info("====>SUB_systemTime_setTimezone_JS_API_0300 error " + JSON.stringify(error));
        expect(error.code).assertEqual(-1);
        done();
      });
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0400
     * @tc.name      Test systemTime.setTimezone true value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0400', 0, (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0400 start");
      systemTime.setTimezone('Asia/Jakarta',async (err) => {
        try{
          if(err){
            console.info("====>SUB_systemTime_setTimezone_JS_API_0400 setTimezone fail: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          console.info("====>SUB_systemTime_setTimezone_JS_API_0400 success ");
          systemTime.getTimezone().then( data => {
            try {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0400 getTimezone " + data);
              expect(data == 'Asia/Jakarta').assertTrue();
              done();
            } catch (error) {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0400 getTimezone catch error " + error);
              done();
            }
          }).catch((error: BusinessError) => {
            console.info("====>SUB_systemTime_setTimezone_JS_API_0400 error " + error);
            done();
          });
        }catch(err){
          console.info("====>SUB_systemTime_setTimezone_JS_API_0400 error " + err);
          done();
        }
      })
    });

    /**
     * @tc.number    SUB_systemTime_setTimezone_JS_API_0500
     * @tc.name      Test systemTime.setTimezone true value
     * @tc.desc      Test systemTime_setTimezone API functionality.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_systemTime_setTimezone_JS_API_0500', 0, async (done: Function) => {
      console.info("====>SUB_systemTime_setTimezone_JS_API_0500 start");
      try{
        await systemTime.setTimezone('Europe/Moscow').then(() => {
          console.info("====>SUB_systemTime_setTimezone_JS_API_0500 promise successful " );
          systemTime.getTimezone().then( data => {
            try {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0500 getTimezone " + data);
              expect(data == 'Europe/Moscow').assertTrue();
              done();
            } catch (error) {
              console.info("====>SUB_systemTime_setTimezone_JS_API_0500 getTimezone catch error " + error);
              done();
            }
          }).catch((error: BusinessError) => {
            console.info("====>SUB_systemTime_setTimezone_JS_API_0500 error " + error);
            expect().assertFail();
            done();
          });
        }).catch((error: BusinessError) => {
          console.info("====>SUB_systemTime_setTimezone_JS_API_0500 error " + error.code);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info("====>SUB_systemTime_setTimezone_JS_API_0500 catch error: " + err.code);
        expect().assertFail();
        done();
      };
    });
  });
};
