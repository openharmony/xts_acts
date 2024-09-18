/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textAreaEnableKeyboardOnFocus() {
  describe('enableKeyboardOnFocusTest', () => {
    beforeEach(async (done: Function) => {
      console.info("enableKeyboardOnFocusTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textAreaEnableKeyboardOnFocus',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get enableKeyboardOnFocus state pages: " + JSON.stringify(pages));
        if (!("textAreaEnableKeyboardOnFocus" == pages.name)) {
          console.info("get textAreaEnableKeyboardOnFocus pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textAreaEnableKeyboardOnFocus page result: success");
        }
      } catch (err) {
        console.error("push textAreaEnableKeyboardOnFocus page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaEnableKeyboardOnFocus beforeEach end");
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("enableKeyboardOnFocus after each called");
    });
     /**
     * @tc.number TextArea_EnableKeyboardOnFocus_10010
     * @tc.name   testTextAreaEnableKeyboardOnFocusFalse
     * @tc.desc   The EnableKeyboardOnFocus property of the TextArea component is set to false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaEnableKeyboardOnFocusFalse', 0, async (done: Function) => {
      let tagName = 'testTextAreaEnableKeyboardOnFocusFalse';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enableKeyboardOnFocus": false,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6801,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_enableKeyboardOnFocus');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.enableKeyboardOnFocus));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual("false");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_EnableKeyboardOnFocus_10020
     * @tc.name   testTextAreaEnableKeyboardOnFocusTrue
     * @tc.desc   The EnableKeyboardOnFocus property of the TextArea component is set to true
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaEnableKeyboardOnFocusTrue', 0, async (done: Function) => {
      let tagName = 'testTextAreaEnableKeyboardOnFocusTrue';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enableKeyboardOnFocus": true,
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6802,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_enableKeyboardOnFocus');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.enableKeyboardOnFocus));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.enableKeyboardOnFocus).assertEqual("true");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}