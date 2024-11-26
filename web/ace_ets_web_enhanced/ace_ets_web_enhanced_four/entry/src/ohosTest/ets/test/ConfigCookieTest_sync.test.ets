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

export default function ActsAceConfigCookieSync() {
  describe('ConfigCookieSyncUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ConfigCookieTest_sync',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("configCookieTest_sync" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7100
     * @tc.name testErrorCodeMessage7100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7100', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7100",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10100, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_url_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7101
     * @tc.name testErrorCodeMessage7101
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7101', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7101",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10101, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_url_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7102
     * @tc.name testErrorCodeMessage7102
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7102', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7102",
        "401", "BusinessError 401: Parameter error. The type of 'url' must be string.", 10102, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_url_any', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7200
     * @tc.name testErrorCodeMessage7200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7200', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7200",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10103, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_value_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7201
     * @tc.name testErrorCodeMessage7201
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7201', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7201",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10104, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_value_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7202
     * @tc.name testErrorCodeMessage7202
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7202', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7202",
        "401", "BusinessError 401: Parameter error. The type of 'value' must be string.", 10105, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_value_any', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7300
     * @tc.name testErrorCodeMessage7300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7300', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7300",
        "17100005", "Invalid cookie value", 10106, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_value_error', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7400
     * @tc.name testErrorCodeMessage7400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7400', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7400",
        "17100002", "Invalid url", 10107, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_url_error_1', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7401
     * @tc.name testErrorCodeMessage7401
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7401', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7401",
        "17100002", "Invalid url", 10108, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_url_error_2', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7402
     * @tc.name testErrorCodeMessage7402
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7402', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7402",
        "17100002", "Invalid url", 10109, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('configCookieSync_url_error_3', 10, '');
    });

  });
}