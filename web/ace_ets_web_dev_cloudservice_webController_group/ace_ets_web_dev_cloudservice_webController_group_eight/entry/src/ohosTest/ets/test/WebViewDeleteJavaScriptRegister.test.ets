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
import { hilog } from '@kit.PerformanceAnalysisKit';


let emitKey = "";

export default function ActsAceDeleteJavaScriptRegister() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('DeleteJavaScriptRegisterUnitTest', async () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebviewDeleteJavaScriptRegister',
      }
      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get webviewBFCacheSuspendPlayer state success " + JSON.stringify(pages));
        if (!("webviewDeleteJavaScriptRegister" == pages.name)) {
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
      await Utils.sleep(500);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": ''
          }
        }
        let backEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      await Utils.sleep(1000);
      done();
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    it('assertContain', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      let a = 'abc';
      let b = 'b';
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
    })

    /**
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0001
     * @tc.name testWebView_deleteJavaScriptRegister_0001
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testWebView_deleteJavaScriptRegister_0001', 0, async (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0001", '"success"', 10072, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('deleteWithoutRefresh', 10)
      await Utils.sleep(100)
      sendEventByKey('deleteJavaScriptRegister_withOutRefresh', 10, '');
      setTimeout(() => {
        sendEventByKey('runJavaScript', 10, '');
      }, 500)
    });

    /**
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0002
     * @tc.name testWebView_deleteJavaScriptRegister_0002
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_deleteJavaScriptRegister_0002', 0, async (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0002",
        '"ReferenceError: testObjName is not defined"', 10073,
        done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent('deleteWithRefresh', 10)
      await Utils.sleep(100)
      sendEventByKey('deleteJavaScriptRegister_withRefresh', 10, '');
      setTimeout(() => {
        sendEventByKey('runJavaScript', 10, '');
      }, 1000)
    });


    /**
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0003
     * @tc.name testWebView_deleteJavaScriptRegister_0003
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_deleteJavaScriptRegister_0003', 0, (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0003",
        '17100008Failed to delete JavaScriptProxy because it does not exist.', 10074, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('deleteJavaScriptRegister_name_err', 10, '');
    });


    /**
     * @tc.number SUB_ACE_WEB_deleteJavaScriptRegister_SDK_0004
     * @tc.name testWebView_deleteJavaScriptRegister_0004
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_deleteJavaScriptRegister_0004', 0, (done: Function) => {
      Utils.registerBaseEvent("testWebView_deleteJavaScriptRegister_0004",
        "401BusinessError 401: Parameter error. The type of 'name' must be string.", 10075, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('deleteJavaScriptRegister_name_null', 10, '');
    });


  });
}