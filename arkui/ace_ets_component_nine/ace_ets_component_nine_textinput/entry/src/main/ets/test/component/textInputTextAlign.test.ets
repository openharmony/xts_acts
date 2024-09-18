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

export default function textInputTextAlignTest() {
  describe('textInputTextAlignTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputTextAlignTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputTextAlign',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputTextAlign state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputtextAlign pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textInputTextAlign page result: success");
        }
      } catch (err) {
        console.error("push textInputTextAlign page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputTextAlignTest beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputTextAlignTest after each called");
    })

 

    /**
     * @tc.number  textInputTextAlign0100
     * @tc.name    Test the textAlign property of the textinput component
     * @tc.desc    set the textAlign property value is TextAlign.Start
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputTextAlign0100', 0, async (done: Function) => {
      let tagName = 'textInputTextAlign0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
           "textAlign":  TextAlign.Start
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 960,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_textalign');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text TextAlign is: ' + JSON.stringify(obj.$attrs.textAlign));
 
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number : textInputTextAlign0200
     * @tc.name   : Test the textAlign property of the textinput component
     * @tc.desc    : set the textAlign property value is TextAlign.Center
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputTextAlign0200', 0, async (done: Function) => {
      let tagName = 'textInputTextAlign0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign":  TextAlign.Center
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 961,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_textalign');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textAlign is: ' + JSON.stringify(obj.$attrs.textAlign));
 
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Center');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number : textInputTextAlign0300
     * @tc.name   : Test the textAlign property of the textinput component
     * @tc.desc    : set the textAlign property value is TextAlign.End
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputTextAlign0300', 0, async (done: Function) => {
      let tagName = 'textInputTextAlign0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign":  TextAlign.End
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 962,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_textalign');

      console.info(' Text Object json is:' + strJsonNew);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textAlign is: ' + JSON.stringify(obj.$attrs.textAlign));
 
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.End');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number : textInputTextAlign0400
     * @tc.name   : Test the textAlign property of the textinput component
     * @tc.desc    : set the textAlign property value is TextAlign.JUSTIFY
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputTextAlign0400', 0, async (done: Function) => {
      let tagName = 'textInputTextAlign0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "textAlign":  TextAlign.JUSTIFY
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 963,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_textalign');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text textAlign is: ' + JSON.stringify(obj.$attrs.textAlign));
 
      expect(obj.$attrs.textAlign).assertEqual('TextAlign.Start');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
