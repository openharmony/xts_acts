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

export default function textInputFontStyleTest() {
  describe('textInputFontStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputFontStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputFontStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputFontStyle state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputFontStyle pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textInputFontStyle page result: success");
        }
      } catch (err) {
        console.error("push textInputFontStyle page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputFontStyleTest beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputFontStyleTest after each called");
    })

 

    /**
     * @tc.number  textInputFontStyle0100
     * @tc.name    Test the FontStyle property of the textinput component
     * @tc.desc    set the FontStyle property value is FontStyle.Normal
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontStyle0100', 0, async (done: Function) => {
      let tagName = 'textInputFontStyle0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontstyle":  FontStyle.Normal
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 990,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontstyle');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontStyle is: ' + JSON.stringify(obj.$attrs.fontStyle));
 
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Normal');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputFontStyle0200
     * @tc.name    Test the FontStyle property of the textinput component
     * @tc.desc    set the FontStyle property value is FontStyle.Italic
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontStyle0200', 0, async (done: Function) => {
      let tagName = 'textInputFontStyle0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontstyle":  FontStyle.Italic
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 991,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontstyle');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontStyle is: ' + JSON.stringify(obj.$attrs.fontStyle));
 
      expect(obj.$attrs.fontStyle).assertEqual('FontStyle.Italic');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
