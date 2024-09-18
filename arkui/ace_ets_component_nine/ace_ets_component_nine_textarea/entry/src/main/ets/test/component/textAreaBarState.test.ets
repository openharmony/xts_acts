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

export default function textAreaBarState() {
  describe('barstateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("barstateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textAreaBarState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barState state pages: " + JSON.stringify(pages));
        if (!("textAreaBarState" == pages.name)) {
          console.info("get textAreaBarState pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textAreaBarState page result: success");
        }
      } catch (err) {
        console.error("push textAreaBarState page error: " + err);
      }
      await Utils.sleep(1000);
      console.info("textAreaBarState beforeEach end");
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("barState after each called");
    });
     /**
     * @tc.number TextArea_BarState_10010
     * @tc.name   testTextAreaBarStateOff
     * @tc.desc   The BarState property of the TextArea component is set to BarState.Off
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaBarStateOff', 0, async (done: Function) => {
      let tagName = 'testTextAreaBarStateOff';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState": BarState.Off,
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
      let strJson = getInspectorByKey('key_textArea_barState');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.barState));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.barState).assertEqual("BarState.OFF");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_BarState_10020
     * @tc.name   testTextAreaBarStateAuto
     * @tc.desc   The BarState property of the TextArea component is set to BarState.Auto
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaBarStateAuto', 0, async (done: Function) => {
      let tagName = 'testTextAreaBarStateAuto';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState": BarState.Auto,
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
      let strJson = getInspectorByKey('key_textArea_barState');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.barState));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.barState).assertEqual("BarState.AUTO");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     /**
     * @tc.number TextArea_BarState_10030
     * @tc.name   testTextAreaBarStateOn
     * @tc.desc   The BarState property of the TextArea component is set to BarState.On
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('testTextAreaBarStateOn', 0, async (done: Function) => {
      let tagName = 'testTextAreaBarStateOn';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState": BarState.On,
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
      let strJson = getInspectorByKey('key_textArea_barState');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[' + tagName + '] component obj is: ' + JSON.stringify(obj.$attrs.barState));
      console.info('textarea obj.$attrs is:' + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.barState).assertEqual("BarState.ON");
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}