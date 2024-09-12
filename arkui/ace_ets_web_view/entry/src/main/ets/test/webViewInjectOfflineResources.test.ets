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
import { webview } from '@kit.ArkWeb';


let emitKey = "";

export default function ActsAceInjectOfflineResources() {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('localUnitTest', async () => {
    beforeAll(async (done: Function) => {
      await Utils.sleep(1000)
      webview.WebviewController.initializeWebEngine()
      router.pushUrl({
        url: "MainAbility/pages/IndexOthers"
      })
      await Utils.sleep(1000)
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    });

    afterEach(() => {

    })

    afterAll(() => {
      router.clear()
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number Sub_WEB_injectOfflineResource_0100
     * @tc.name testInjectOfflineResource0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testInjectOfflineResource0100', 0, (done: Function) => {
      Utils.registerBaseEvent("WebSetInjectOfflineResource", "17100002Invalid url", 1001, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetInjectOfflineUrlList', 10, '');
    });

    /**
     * @tc.number Sub_WEB_injectOfflineResource_0200
     * @tc.name testInjectOfflineResource0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testInjectOfflineResource0200', 0, (done: Function) => {
      Utils.registerBaseEvent("WebSetInjectOfflineResource", "401Invalid input parameter", 1002, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetInjectOfflineResource', 10, '');
    });

    /**
     * @tc.number Sub_WEB_injectOfflineResource_0300
     * @tc.name testInjectOfflineResource0300
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testInjectOfflineResource0300', 0, (done: Function) => {
      Utils.registerBaseEvent("WebSetInjectOfflineResource", "401Invalid input parameter", 1003, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetInjectOfflineHeaderKey', 10, '');
    });

    /**
     * @tc.number Sub_WEB_injectOfflineResource_0400
     * @tc.name testInjectOfflineResource0400
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testInjectOfflineResource0400', 0, (done: Function) => {
      Utils.registerBaseEvent("WebSetInjectOfflineResource", "401Invalid input parameter", 1004, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetInjectOfflineHeaderValue', 10, '');
    });

    /**
     * @tc.number Sub_WEB_injectOfflineResource_0500
     * @tc.name testInjectOfflineResource0500
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testInjectOfflineResource0500', 0, (done: Function) => {
      Utils.registerBaseEvent("WebSetInjectOfflineResource", "401Invalid input parameter", 1005, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('SetInjectOfflineType', 10, '');
    });

    /**
     * @tc.number Sub_WEB_PrefetchResource_0800
     * @tc.name testInjectOfflineResource0800
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testInjectOfflineResource0800', 0, async (done: Function) => {
      Utils.registerBaseEvent("WebSetInjectOfflineResource", "17100001", 1006, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('InitializationFailed', 10, '');
    });
  });
}