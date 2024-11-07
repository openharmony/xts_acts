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

export default function ActsAceWebMessageExt() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('WebMessageExtTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebMessageExtTest',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("WebMessageExtTest" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2400
     * @tc.name testErrorCodeMessage2400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage2400', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage2400", "401BusinessError 401: Parameter error. The type of 'message' must be boolean.", 10025, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setBoolean_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2500
     * @tc.name testErrorCodeMessage2500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage2500', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage2500", "17100014The type and value of the message do not match.", 10026, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setBoolean_not_match', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2600
     * @tc.name testErrorCodeMessage2600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage2600', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage2600", "401BusinessError 401: Parameter error. The type of 'message' must be number.", 10027, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setNumber_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2700
     * @tc.name testErrorCodeMessage2700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage2700', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage2700", "17100014The type and value of the message do not match.", 10028, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setNumber_not_match', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2800
     * @tc.name testErrorCodeMessage2800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage2800', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage2800", "401BusinessError 401: Parameter error. The type of 'message' must be string.", 10029, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setString_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_2900
     * @tc.name testErrorCodeMessage2900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage2900', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage2900", "17100014The type and value of the message do not match.", 10030, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setString_not_match', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3000
     * @tc.name testErrorCodeMessage3000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3000', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3000", "401BusinessError 401: Parameter error. The type of params must be int.", 10031, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setType_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3100
     * @tc.name testErrorCodeMessage3100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3100', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3100", "17100014The type and value of the message do not match.", 10032, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('setType_not_match', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3200
     * @tc.name testErrorCodeMessage3200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3200', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3200", "17100014The type and value of the message do not match.", 10033, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        sendEventByKey('getArray', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3300
     * @tc.name testErrorCodeMessage3300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3300', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3300", "17100014The type and value of the message do not match.", 10034, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getArrayBuffer', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3400
     * @tc.name testErrorCodeMessage3400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3400', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3400", "17100014The type and value of the message do not match.", 10035, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getBoolean', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3500
     * @tc.name testErrorCodeMessage3500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3500', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3500", "17100014The type and value of the message do not match.", 10036, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getNumber', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_3600
     * @tc.name testErrorCodeMessage3600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage3600', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage3600", "17100014The type and value of the message do not match.", 10037, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getString', 10, '');
    });
  });
}