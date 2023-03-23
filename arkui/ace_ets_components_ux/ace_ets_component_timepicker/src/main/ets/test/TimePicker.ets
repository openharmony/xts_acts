/*
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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets';
export default function timepicker() {
  describe('ActsAceTimePickerTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("timepicker beforeEach start");
      done();
    })

    afterEach(async function (done) {
      console.info("timepicker afterEach start");

       try {
          var eventData = {
            data: {
              "disappearTextStyle": {color:Color.Black,font:{size:8,weight:FontWeight.Lighter}},
              "textStyle": {color:Color.Red,font:{size:'10px',weight:FontWeight.Normal}},
              "selectedTextStyle": {color:Color.Blue,font:{size:'20px',weight:FontWeight.Bold}}
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[timepicker_afterEach] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
          } catch (err) {
            console.log("[selectTest_afterEach] change component data error: " + err.message);
        }
          done();
    })

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0001
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_timepicker_disappearTextStyle_0001', 0, async function (done) {
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0001] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF000000');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Lighter');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0002
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0002', 0, async function (done) {      
        let value = {color:Color.Black,font:{size:8,weight:FontWeight.Bolder}} 
        try {
          var eventData = {
            data: {
              "disappearTextStyle":JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0002] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0002] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.error("[ArkUI_Stage_timepicker_disappearTextStyle_0002] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF000000');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Bolder');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0003
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0003', 0, async function (done) {         
        let value = {color:0x808080,font:{size:8,weight:100}}         
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0003] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0003] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timePicker_disappearTextStyle_0003] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF808080');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('8.00fp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('100');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0004
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0004', 0, async function (done) {         
        let value = {color:'#ff0000',font:{size:'1px',weight:'700'}}    
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0004] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0004] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0004] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FFFF0000');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('1.00px');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('700');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0005
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0005', 0, async function (done) {         
        let value = {color:Color.Green,font:{size:30,weight:450}}         
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0005] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0005] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0005] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF008000');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('30.00fp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0006
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0006', 0, async function (done) {         
        let value = {color:'#80808g',font:{size:-1,weight:1000}}      
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0006] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0006] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0006] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF182431');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('14.00vp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0007
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0007', 0, async function (done) {         
        let value = {color:'xxx',font:{size:'xxx',weight:FontWeight.Bold}}       
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0007] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0007] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0007] disappearColor:" + obj.$attrs.disappearTextStyle.color);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF182431');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('14.00vp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Bold');
        done();
      });
	  
    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0008
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_disappearTextStyle_0008', 0, async function (done) { 
        let value = {color:'rgb(138,43,226)',font:{size:'20vp',weight:900}} 
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0008] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0008] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF8A2BE2');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('20.00vp');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('900');
        done();
      });
	  
    /*
     * @tc.number       ArkUI_Stage_timepicker_disappearTextStyle_0009
     * @tc.name         Tests the disappearTextStyle property of the picker component
     * @tc.desc         set disappearTextStyle then get the value
     */
	  it('ArkUI_Stage_timepicker_disappearTextStyle_0009', 0, async function (done) { 
        let value = {color:'rgb(138,43,226)',font:{size:'15lpx',weight:90}} 
        try {
          var eventData = {
            data: {
              "disappearTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_disappearTextStyle_0009] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_disappearTextStyle_0009] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.disappearTextStyle.color).assertEqual('#FF8A2BE2');
        expect(obj.$attrs.disappearTextStyle.font.size).assertEqual('15.00lpx');
        expect(obj.$attrs.disappearTextStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0001
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_timepicker_textStyle_0001', 0, async function (done) {
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_textStyle_0001] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FFFF0000');
        expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0002
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0002', 0, async function (done) {      
        let value = {color:Color.Red,font:{size:'10px',weight:FontWeight.Bolder}}      
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0002] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0002] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.error("[ArkUI_Stage_timepicker_textStyle_0002] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FFFF0000');
        expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Bolder');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0003
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0003', 0, async function (done) {         
        let value = {color:0xFF808080,font:{size:'10px',weight:100}}      
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0003] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0003] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_textStyle_0003] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF808080');
        expect(obj.$attrs.textStyle.font.size).assertEqual('10.00px');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('100');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0004
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0004', 0, async function (done) {         
        let value = {color:'#00ff00',font:{size:'1px',weight:'700'}}          
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0004] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0004] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_textStyle_0004] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF00FF00');
        expect(obj.$attrs.textStyle.font.size).assertEqual('1.00px');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('700');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0005
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0005', 0, async function (done) {         
        let value = {color:Color.Green,font:{size:30,weight:450}}        
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0005] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0005] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_textStyle_0005] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF008000');
        expect(obj.$attrs.textStyle.font.size).assertEqual('30.00fp');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0006
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0006', 0, async function (done) {         
        let value = {color:'#80808g',font:{size:-1,weight:1000}}         
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0006] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0006] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_textStyle_0006] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF182431');
        expect(obj.$attrs.textStyle.font.size).assertEqual('16.00vp');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0007
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0007', 0, async function (done) {         
        let value = {color:'xxx',font:{size:'xxx',weight:FontWeight.Lighter}}          
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0007] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0007] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_textStyle_0007] disappearColor:" + obj.$attrs.textStyle.color);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF182431');
        expect(obj.$attrs.textStyle.font.size).assertEqual('16.00vp');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Lighter');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0008
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
      it('ArkUI_Stage_timepicker_textStyle_0008', 0, async function (done) { 
        let value = {color:'rgb(138,43,226)',font:{size:'20vp',weight:900}} 
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0008] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0008] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF8A2BE2');
        expect(obj.$attrs.textStyle.font.size).assertEqual('20.00vp');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('900');
        done();
      });
	  
    /*
     * @tc.number       ArkUI_Stage_timepicker_textStyle_0009
     * @tc.name         Tests the textStyle property of the picker component
     * @tc.desc         set textStyle then get the value
     */
	  it('ArkUI_Stage_timepicker_textStyle_0009', 0, async function (done) { 
        let value = {color:'rgb(138,43,226)',font:{size:'15lpx',weight:90}} 
        try {
          var eventData = {
            data: {
              "textStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_textStyle_0009] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_textStyle_0009] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.textStyle.color).assertEqual('#FF8A2BE2');
        expect(obj.$attrs.textStyle.font.size).assertEqual('15.00lpx');
        expect(obj.$attrs.textStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });
	  
    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0001
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         get the default value
     */
    it('ArkUI_Stage_timepicker_selectedTextStyle_0001', 0, async function (done) {
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0001] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Bold');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0002
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0002', 0, async function (done) {      
        let value = {color:Color.Blue,font:{size:'20px',weight:FontWeight.Bolder}}       
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0002] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0002] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.error("[ArkUI_Stage_timepicker_selectedTextStyle_0002] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF0000FF');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Bolder');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0003
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0003', 0, async function (done) {         
        let value = {color:0xFF808080,font:{size:'20px',weight:100}}           
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0003] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0003] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0003] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF808080');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00px');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('100');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0004
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0004', 0, async function (done) {         
        let value = {color:'#00ff00',font:{size:'1px',weight:'700'}}         
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0004] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0004] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0004] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF00FF00');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('1.00px');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('700');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0005
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0005', 0, async function (done) {         
        let value = {color:Color.Green,font:{size:30,weight:450}}         
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0005] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0005] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0005] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF008000');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('30.00fp');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0006
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0006', 0, async function (done) {         
        let value = {color:'#80808g',font:{size:-1,weight:1000}}           
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0006] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0006] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0006] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF007DFF');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00vp');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });

    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0007
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0007', 0, async function (done) {         
        let value = {color:'xxx',font:{size:'xxx',weight:FontWeight.Lighter}}         
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0007] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0007] change component data error: " + err.message);
        }
        await Utils.sleep(2000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0007] disappearColor:" + obj.$attrs.selectedTextStyle.color);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF007DFF');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00vp');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Lighter');
        done();
      });
	  
    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0008
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
      it('ArkUI_Stage_timepicker_selectedTextStyle_0008', 0, async function (done) { 
        let value = {color:'rgb(138,43,226)',font:{size:'20vp',weight:900}} 
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0008] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0008] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF8A2BE2');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('20.00vp');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('900');
        done();
      });
	  
    /*
     * @tc.number       ArkUI_Stage_timepicker_selectedTextStyle_0009
     * @tc.name         Tests the selectedTextStyle property of the picker component
     * @tc.desc         set selectedTextStyle then get the value
     */
	  it('ArkUI_Stage_timepicker_selectedTextStyle_0009', 0, async function (done) { 
        let value = {color:'rgb(138,43,226)',font:{size:'15lpx',weight:90}} 
        try {
          var eventData = {
            data: {
              "selectedTextStyle": JSON.stringify(value)
            }
          }
          var innerEvent = {
            eventId: 184,
            priority: events_emitter.EventPriority.LOW
          }
          console.info("[ArkUI_Stage_timepicker_selectedTextStyle_0009] start to publish emit");
          events_emitter.emit(innerEvent, eventData);
        } catch (err) {
          console.log("[ArkUI_Stage_timepicker_selectedTextStyle_0009] change component data error: " + err.message);
        }
        await Utils.sleep(3000);
        let strJson = getInspectorByKey('timePicker');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.selectedTextStyle.color).assertEqual('#FF8A2BE2');
        expect(obj.$attrs.selectedTextStyle.font.size).assertEqual('15.00lpx');
        expect(obj.$attrs.selectedTextStyle.font.weight).assertEqual('FontWeight.Normal');
        done();
      });   
    })
  }

