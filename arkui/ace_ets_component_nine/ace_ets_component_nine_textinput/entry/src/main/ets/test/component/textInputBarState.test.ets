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

export default function textInputBarStateTest() {
  describe('textInputBarStateTest', () => {
    beforeEach(async (done: Function) => {
      console.info("textInputBarStateTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/textInputBarState',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputBarStateTest state pages: " + JSON.stringify(pages));
        if (!("heightAdaptivePolicy" == pages.name)) {
          console.info("get textInputBarStateTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push textInputBarStateTest page result: success");
        }
      } catch (err) {
        console.error("push textInputBarStateTest page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputBarStateTest beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("textInputBarStateTest after each called");
    })
 

    /**
     * @tc.number  textInputBarState0100
     * @tc.name    Test the BarState property of the TextInput component
     * @tc.desc    set the BarState property value is BarState.Auto
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputBarState0100', 0, async (done: Function) => {
      let tagName = 'textInputBarState0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState":  BarState.Auto
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 850,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_barstate');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text barstate is: ' + JSON.stringify(obj.$attrs.barState));
 
      expect(obj.$attrs.barState).assertEqual('BarState.AUTO');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number  textInputBarState0200
     * @tc.name    Test the BarState property of the TextInput component
     * @tc.desc    set the BarState property value is BarState.Off
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputBarState0200', 0, async (done: Function) => {
      let tagName = 'textInputBarState0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState":  BarState.Off
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 851,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_barstate');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text barstate is: ' + JSON.stringify(obj.$attrs.barState));
 
      expect(obj.$attrs.barState).assertEqual('BarState.OFF');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputBarState0300
     * @tc.name    Test the BarState property of the TextInput component
     * @tc.desc    set the BarState property value is BarState.On
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputBarState0300', 0, async (done: Function) => {
      let tagName = 'textInputBarState0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState":  BarState.On
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 852,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_barstate');

      console.info(' Text Object json is:' + strJsonNew);
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text barstate is: ' + JSON.stringify(obj.$attrs.barState));
 
      expect(obj.$attrs.barState).assertEqual('BarState.ON');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });


    /**
     * @tc.number  textInputBarState0400
     * @tc.name    Test the BarState property of the TextInput component
     * @tc.desc    set the BarState property value is -1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   0  
     */
    it('textInputBarState0400', 0, async (done: Function) => {
      let tagName = 'textInputBarState0400';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000)
 
       
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "barState":  -1
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 853,
          priority: events_emitter.EventPriority.LOW
        }
        console.info('[' + tagName + '] start to publish emit');
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log('[' + tagName + '] change component data error: ' + err.message);
      }
      await Utils.sleep(2000);
    
      let strJsonNew = getInspectorByKey('key_textinput_barstate');
      let obj: ESObject = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] Text barstate is: ' + JSON.stringify(obj.$attrs.barState));
 
      expect(obj.$attrs.barState).assertEqual('BarState.AUTO');
       
      console.info('[' + tagName + '] END ===========================');
      done();
    });
})
}
