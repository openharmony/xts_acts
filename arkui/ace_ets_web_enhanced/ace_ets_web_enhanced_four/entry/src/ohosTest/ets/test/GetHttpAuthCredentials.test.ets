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

export default function ActsAceGetHttpAuthCredentials() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('GetHttpAuthCredentialsUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/GetHttpAuthCredentials',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("getHttpAuthCredentials" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5300
     * @tc.name testErrorCodeMessage5300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5300', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5300", "401BusinessError 401: Parameter error. The type of 'host' must be string.", 10001, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getHttpAuthCredentials_host_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5400
     * @tc.name testErrorCodeMessage5400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5400', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5400", "401BusinessError 401: Parameter error. The type of 'realm' must be string.", 10002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('getHttpAuthCredentials_realm_null', 10, '');
    });

  });
}