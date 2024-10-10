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
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { LocalContext } from './GloablConfig';

export default function ActsAceConfigCookieCallback() {
  describe('ConfigCookieCallBackUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ConfigCookieTest_callback',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("configCookieTest_callback" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6300
     * @tc.name testErrorCodeMessage6300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6300', 0, async (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6300",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10038, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      await Utils.sleep(500)
      sendEventByKey('configCookie_url_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6301
     * @tc.name testErrorCodeMessage6301
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6301', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6301",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10039, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6302
     * @tc.name testErrorCodeMessage6302
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6302', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6302",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10040, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_any', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6400
     * @tc.name testErrorCodeMessage6400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6400', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6400",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10041, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6401
     * @tc.name testErrorCodeMessage6401
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6401', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6401",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10042, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6402
     * @tc.name testErrorCodeMessage6402
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6402', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6402",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10043, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_any', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6500
     * @tc.name testErrorCodeMessage6500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6500', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6500",
        "17100005", "Invalid cookie value", 10044, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_value_error', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6600
     * @tc.name testErrorCodeMessage6600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6600', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6600",
        "17100002", "Invalid url", 10045, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_error_1', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6601
     * @tc.name testErrorCodeMessage6601
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6601', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6601",
        "17100002", "Invalid url", 10046, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_error_2', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_6602
     * @tc.name testErrorCodeMessage6602
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage6602', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage6602",
        "17100002", "Invalid url", 10047, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookie_url_error_3', 10, '');
    });

  });
}