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

export default function ActsAceSetCookie() {
  describe('ConfigSetCookieUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/SetCookieTest',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("setCookieTest" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7500
     * @tc.name testErrorCodeMessage7500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7500', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7500",
        "17100002", "Invalid url", 10110, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('setCookie_url_error_1', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7501
     * @tc.name testErrorCodeMessage7501
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7501', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7501",
        "17100002", "Invalid url", 10111, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('setCookie_url_error_2', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7502
     * @tc.name testErrorCodeMessage7502
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7502', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7502",
        "17100002", "Invalid url", 10112, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('setCookie_url_error_3', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_7600
     * @tc.name testErrorCodeMessage7600
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage7600', 0, (done: Function) => {
      Utils.registerBaseEventObject("testErrorCodeMessage7600",
        "17100005", "Invalid cookie value", 10113, done,
        (backData: events_emitter.EventData, code: string, message: string) => {
          expect(backData?.data?.ACTION.code).assertEqual(code);
          expect(backData?.data?.ACTION.message).assertEqual(message);
        });
      sendEventByKey('setCookie_value_error', 10, '');
    });

  });
}