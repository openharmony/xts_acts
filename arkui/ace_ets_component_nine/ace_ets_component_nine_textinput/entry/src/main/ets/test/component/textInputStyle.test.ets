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

export default function textInputStyleTest() {
  describe('textStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputStyle state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputStyle pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textInputStyle page result: success");
        }
      } catch (err) {
        console.error("push textInputStyle page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputStyle beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputStyle after each called");
    })

 

    /**
     * @tc.number  textInputStyle0100
     * @tc.name    Test the style property of the textinput component
     * @tc.desc    set the style property value is TextInputStyle.Default
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputStyle0100', 0, async (done: Function) => {
      let tagName = 'textInputStyle0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "style":  TextInputStyle.Default
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 930,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_style');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text style is: ' + JSON.stringify(obj.$attrs.style));
 
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Default');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputStyle0200
     * @tc.name    Test the style property of the textinput component
     * @tc.desc    set the style property value is TextInputStyle.Inline
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputStyle0200', 0, async (done: Function) => {
      let tagName = 'textInputStyle0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "style":  TextInputStyle.Inline
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 931,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_style');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text style is: ' + JSON.stringify(obj.$attrs.style));
 
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Inline');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputStyle0300
     * @tc.name    Test the style property of the textinput component
     * @tc.desc    set the style property value is TextContentStyle.DEFAULT
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0 
     */
    it('textInputStyle0300', 0, async (done: Function) => {
      let tagName = 'textInputStyle0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "style":  TextContentStyle.DEFAULT
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 932,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_style');

      console.info(' Text Object json is:' + strJsonNew);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text style is: ' + JSON.stringify(obj.$attrs.style));
 
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Default');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputStyle0400
     * @tc.name    Test the style property of the textinput component
     * @tc.desc    set the style property value is TextContentStyle.INLINE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0
     */
    it('textInputStyle0400', 0, async (done: Function) => {
      let tagName = 'textInputStyle0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "style":  TextContentStyle.INLINE
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 933,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_style');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text style is: ' + JSON.stringify(obj.$attrs.style));
 
      expect(obj.$attrs.style).assertEqual('TextInputStyle.Inline');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
     
})
}
