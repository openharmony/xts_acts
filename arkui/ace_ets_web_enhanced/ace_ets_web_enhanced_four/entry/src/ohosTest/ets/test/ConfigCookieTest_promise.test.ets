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
import { LocalContext } from './GloablConfig';

export default function ActsAceConfigCookiePromise() {
  describe('ConfigCookiePromiseUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ConfigCookieTest_promise',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("configCookieTest_promise" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6700
     * @tc.name testErrorCodeMessage6700
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6700', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6700",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10048, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6701
     * @tc.name testErrorCodeMessage6701
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6701', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6701",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10049, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6702
     * @tc.name testErrorCodeMessage6702
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6702', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6702",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10050, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_any', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6800
     * @tc.name testErrorCodeMessage6800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6800', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6800",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10051, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6801
     * @tc.name testErrorCodeMessage6801
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6801', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6801",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10052, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6802
     * @tc.name testErrorCodeMessage6802
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6802', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6802",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10053, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_any', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6900
     * @tc.name testErrorCodeMessage6900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6900', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6900",
        "17100005", "Invalid cookie value", 10054, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_error', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7000
     * @tc.name testErrorCodeMessage7000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7000', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7000",
        "17100002", "Invalid url", 10055, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_error_1', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7001
     * @tc.name testErrorCodeMessage7001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7001', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7001",
        "17100002", "Invalid url", 10056, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_error_2', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7002
     * @tc.name testErrorCodeMessage7002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7002', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7002",
        "17100002", "Invalid url", 10057, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_error_3', 10, '');
    });

  });
}