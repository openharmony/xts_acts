/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let emitKey = "";

export default function ActsAceGetOriginQuota() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('WebMessageTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/GetOriginQuota',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("getOriginQuota" == pages.name)) {
          console.info("get index state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push index state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push index page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      done();
    });

    afterEach(() => {

    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5900
     * @tc.name testErrorCodeMessage5900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5900', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5900", "17100011Invalid origin", 10003, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('callBack_false_getOriginQuota', 10, '');
    });


    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6000
     * @tc.name testErrorCodeMessage6000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6000', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage6000", "401BusinessError 401: Parameter error. The type of 'origin' must be string.", 10004, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('callBack_null_getOriginQuota', 10, '');
    });


    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6000
     * @tc.name testErrorCodeMessage6001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6001', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage6001", "401BusinessError 401: Parameter error. The type of 'origin' must be string.", 10005, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('callBack_undefined_getOriginQuota', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6100
     * @tc.name testErrorCodeMessage6100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6100', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage6100", "17100011Invalid origin", 10006, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('promise_false_getOriginQuota', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6200
     * @tc.name testErrorCodeMessage6200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6200', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage6200", "401BusinessError 401: Parameter error. The type of 'origin' must be string.", 10007, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('promise_null_getOriginQuota', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6200
     * @tc.name testErrorCodeMessage6201
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6201', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage6201", "401BusinessError 401: Parameter error. The type of 'origin' must be string.", 10008, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('promise_undefined_getOriginQuota', 10, '');
    });
  });
}