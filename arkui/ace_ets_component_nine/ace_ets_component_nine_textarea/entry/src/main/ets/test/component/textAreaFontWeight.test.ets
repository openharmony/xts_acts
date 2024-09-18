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

export default function textAreaFontWeight() {
  describe('fontWeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info("fontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textAreaFontWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fontWeight state pages: " + JSON.stringify(pages));
        if (!("textAreaFontWeight" == pages.name)) {
          console.info("get textAreaFontWeight pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textAreaFontWeight page result: success");
        }
      } catch (err) {
        console.error("push textAreaFontWeight page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaFontWeight beforeEach end");
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("fontWeight after each called");
    });
     /**
     * @tc.number TextArea_FontWeight_10010
     * @tc.name   testTextAreaFontWeightNumber
     * @tc.desc   The FontWeight property of the TextArea component is set to Number
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontWeightNumber', 0, async (done: Function) => {
      let tagName = 'testTextAreaFontWeightNumber';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": 500,
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
      let strJson = getInspectorByKey('key_textArea_fontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontWeight));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontWeight).assertEqual("500");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontWeight_10020
     * @tc.name   testTextAreaFontWeightFontWeight
     * @tc.desc   The FontWeight property of the TextArea component is set to FontWeight
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontWeightFontWeight', 0, async (done: Function) => {
      let tagName = 'testTextAreaFontWeightFontWeight';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": FontWeight.Bold,
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
      let strJson = getInspectorByKey('key_textArea_fontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontWeight));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontWeight).assertEqual("FontWeight.Bold");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_FontWeight_10030
     * @tc.name   testTextAreaFontWeightString
     * @tc.desc   The FontWeight property of the TextArea component is set to String
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaFontWeightString', 0, async (done: Function) => {
      let tagName = 'testTextAreaFontWeightString';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontWeight": "lighter",
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 6803,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('key_textArea_fontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.fontWeight));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.fontWeight).assertEqual("FontWeight.Lighter");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}