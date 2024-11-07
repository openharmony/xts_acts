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

export default function ActsAceSaveHttpAuthCredentials() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('SaveHttpAuthCredentialsUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/SaveHttpAuthCredentials',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("saveHttpAuthCredentials" == pages.name)) {
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
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4900
     * @tc.name testErrorCodeMessage4900
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4900', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage4900", "401BusinessError 401: Parameter error. The type of 'host' must be string.", 10017, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_host_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_4900
     * @tc.name testErrorCodeMessage4901
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage4901', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage4900", "401BusinessError 401: Parameter error. The type of 'host' must be string.", 10018, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_host_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5000
     * @tc.name testErrorCodeMessage5000
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5000', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5000", "401BusinessError 401: Parameter error. The type of 'realm' must be string.", 10019, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_realm_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5000
     * @tc.name testErrorCodeMessage5001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5001', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5000", "401BusinessError 401: Parameter error. The type of 'realm' must be string.", 10020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_realm_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5100
     * @tc.name testErrorCodeMessage5100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5100', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5100", "401BusinessError 401: Parameter error. The type of 'username' must be string.", 10021, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_username_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5100
     * @tc.name testErrorCodeMessage5101
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5101', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5100", "401BusinessError 401: Parameter error. The type of 'username' must be string.", 10022, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_username_undefined', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5200
     * @tc.name testErrorCodeMessage5200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5200', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5200", "401BusinessError 401: Parameter error. The length of 'password' must be between 0 and 256.", 10023, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_password_null', 10, '');
    });

    /**
     * @tc.number SUB_WEB_ERRORCODEANDERRORMESSAGE_5200
     * @tc.name testErrorCodeMessage5201
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testErrorCodeMessage5201', 0, (done: Function) => {
      Utils.registerBaseEvent("testErrorCodeMessage5200", "401BusinessError 401: Parameter error. The length of 'password' must be between 0 and 256.", 10024, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('saveHttpAuthCredentials_password_undefined', 10, '');
    });
  });
}