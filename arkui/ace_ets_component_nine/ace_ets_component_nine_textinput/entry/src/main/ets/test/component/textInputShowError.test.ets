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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputShowErrorTest() {
  describe('textInputShowErrorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputShowErrorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputShowError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputShowError state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputShowError pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textInputShowError page result: success");
        }
      } catch (err) {
        console.error("push textInputShowError page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputShowError beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputShowError after each called");
    })



    /**
     * @tc.number  textInputShowError0100
     * @tc.name    Test the ShowError property of the textinput component
     * @tc.desc    set the ShowError property value is "default value modifier"
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputShowError0100', 0, async (done: Function) => {
      let tagName = 'textInputShowError0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)

      try {
        let eventData: events_emitter.EventData = {
          data: {
            "txtErrorInfo": "default value modifier"
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 870,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
      let strJsonNew = getInspectorByKey('key_textinput_showerror');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text ShowError is: ' + JSON.stringify(obj.$attrs.showError));
      expect(obj.$attrs.showError).assertEqual('default value modifier');
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
