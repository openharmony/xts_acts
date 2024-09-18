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

export default function textInputFontColorTest() {
  describe('textInputFontColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputFontColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputFontColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputFontColor state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputFontColor pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textInputFontColor page result: success");
        }
      } catch (err) {
        console.error("push textInputFontColor page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputFontColor beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputFontColor after each called");
    })

 

    /**
     * @tc.number  textInputFontColor0100
     * @tc.name    Test the FontColor property of the textinput component
     * @tc.desc    set the FontColor property value is Color.Black
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontColor0100', 0, async (done: Function) => {
      let tagName = 'textInputFontColor0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor":  Color.Black
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 900,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontcolor');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontColor is: ' + JSON.stringify(obj.$attrs.fontColor));
 
      expect(obj.$attrs.fontColor).assertEqual('#FF000000');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

 
    /**
     * @tc.number  textInputFontColor0200
     * @tc.name    Test the FontColor property of the textinput component
     * @tc.desc    set the FontColor property value is #D90013 from resource
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputFontColor0200', 0, async (done: Function) => {
      let tagName = 'textInputFontColor0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "fontColor":  'app.color.color_D90013_red'
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 901,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_fontcolor');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text fontColor is: ' + JSON.stringify(obj.$attrs.fontColor));
 
      expect(obj.$attrs.fontColor).assertEqual('#FFD90013');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
