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
export default function tabs() {
  describe('ActsAceTabsTest', function () {
    beforeEach(async function (done) {
      await Utils.sleep(2000);
      console.info("tabs beforeEach start");
      done();
    })

    afterEach(async function (done) {
      console.info("tabs afterEach start");
      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',

            "nullFlag": false,

            "strokeWidthNum": 10,
            "dividerColorNum": 0xFFFF0000,
            "startMarginNum": 5,
            "endMarginNum": 5,

            "dividerColor": Color.Red,

            "strokeWidthRes": $r("app.string.Divider_Stroke_Width"),
            "dividerColorRes": $r("app.color.Divider_Color"),
            "startMarginRes": $r("app.string.Divider_Start_Margin"),
            "endMarginRes": $r("app.string.Divider_End_Margin"),

            "overflowFlag": false,
            "selfIndicatorColor": Color.Red,
            "selfIndicatorHeight": 10,
            "selfIndicatorWidth": 30,
            "selfIndicatorBorderRadius": 5,
            "selfMarginTop": 10,
            "selfSubTabBorderRadius": 20,
            "selfSelectedMode": SelectedMode.INDICATOR,

            "selfIndicatorColorStr": "#FFFF0000",
            "selfIndicatorHeightStr": "10vp",
            "selfIndicatorWidthStr": "30vp",
            "selfIndicatorBorderRadiusStr": "5vp",
            "selfSubTabBorderRadiusStr": "20vp",
            "selfMarginTopStr": "10vp",
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      done();
    })


    /**
     * @tc.number    ArkUI_Tabs_Divider_0100
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      the default divier parameter is {}
     */
    it('ArkUI_Tabs_Divider_0100', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0100 start");
      let strJson = getInspectorByKey('tabsTest5');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0100] divider:" + obj.$attrs.divider);
      if(!obj.$attrs.divider.strokeWidth) {
        expect(true).assertTrue();
      } else {
        expect(true).assertFalse();
      }
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0200
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type number
     */
    it('ArkUI_Tabs_Divider_0200', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0200 start");
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      
      console.info("[ArkUI_Tabs_Divider_0200] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0300
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type string
     */
    it('ArkUI_Tabs_Divider_0300', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0300 start");
      let strJson = getInspectorByKey('tabsTest2');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0300] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00vp");
      expect(dividerObject.color).assertEqual('#FFFF0000');
      expect(dividerObject.startMargin).assertEqual("5.00vp");
      expect(dividerObject.endMargin).assertEqual("5.00vp");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0400
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type Resource
     */
    it('ArkUI_Tabs_Divider_0400', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0400 start");
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest3');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0400] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual('#FF121212');
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0500
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to type Color
     */
    it('ArkUI_Tabs_Divider_0500', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0500 start");
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest4');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0500] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0600
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to null
     */
    it('ArkUI_Tabs_Divider_0600', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0600 start");

      try {
        var eventData = {
          data: {
            "nullFlag": true,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0600] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("0.00px");
      expect(dividerObject.color).assertEqual('#33182431');
      expect(dividerObject.startMargin).assertEqual('0.00px');
      expect(dividerObject.endMargin).assertEqual('0.00px');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0700
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol color value
     */
    it('ArkUI_Tabs_Divider_0700', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0700 start");

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'xxxxxxxx',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0700] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual('#33182431');
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0800
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol strokeWidthStr value
     */
    it('ArkUI_Tabs_Divider_0800', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0800 start");

      try {
        var eventData = {
          data: {
            "strokeWidthStr": 'xxxxxxxx',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0800] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_0900
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol startMarginStr value
     */
    it('ArkUI_Tabs_Divider_0900', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_0900 start");

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": 'xxxxxxxx',
            "endMarginStr": '5px',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_0900] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.startMargin).assertEqual('0.00vp');
      done();
    });

    /**
     * @tc.number    ArkUI_Tabs_Divider_1000
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol endMarginStr value
     */
    it('ArkUI_Tabs_Divider_1000', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_1000 start");

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": 'xxxxxxxx',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1000] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.endMargin).assertEqual('0.00vp');
      done();
    });
    
    /**
     * @tc.number    ArkUI_Tabs_Divider_1100
     * @tc.name      Tests the divider and indicator.selectedMode property of the tabs component
     * @tc.desc      set divider and indicator.selectedMode test
     */
    it('ArkUI_Tabs_Divider_1100', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_1100 start");
      
      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10px',
            "dividerColorStr": 'red',
            "startMarginStr": '5px',
            "endMarginStr": '5px',
            "selfSelectedMode": SelectedMode.BOARD,
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let strJson2 = getInspectorByKey('indicatorTest1');
      let obj = JSON.parse(strJson);
      let obj2 = JSON.parse(strJson2);
      console.info("[ArkUI_Tabs_Divider_1100] divider:" + JSON.stringify(obj.$attrs.divider));
      console.info("[ArkUI_Tabs_Divider_1100] selectedMode:" + obj2.$attrs.tabBar.selectedMode);
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual("10.00px");
      expect(dividerObject.color).assertEqual("#FFFF0000");
      expect(dividerObject.startMargin).assertEqual("5.00px");
      expect(dividerObject.endMargin).assertEqual("5.00px");
      expect(obj2.$attrs.tabBar.selectedMode).assertEqual("SelectedMode.BOARD");
      done();
    });
    
    /**
     * @tc.number    ArkUI_Tabs_Divider_1200
     * @tc.name      Tests the divier property of the tabs component
     * @tc.desc      set divier parameter to abnormol endMarginStr value
     */
    it('ArkUI_Tabs_Divider_1200', 0, async function (done) {
      console.info("ArkUI_Tabs_Divider_1200 start");

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10vp',
            "startMarginStr": '10vp',
            "endMarginStr": '10vp',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('tabsTest');
      let obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      let dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00vp');
      expect(dividerObject.startMargin).assertEqual('10.00vp');
      expect(dividerObject.endMargin).assertEqual('10.00vp');

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10px',
            "startMarginStr": '10px',
            "endMarginStr": '10px',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('tabsTest');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00px');
      expect(dividerObject.startMargin).assertEqual('10.00px');
      expect(dividerObject.endMargin).assertEqual('10.00px');

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10fp',
            "startMarginStr": '10fp',
            "endMarginStr": '10fp',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('tabsTest');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00fp');
      expect(dividerObject.startMargin).assertEqual('10.00fp');
      expect(dividerObject.endMargin).assertEqual('10.00fp');

      try {
        var eventData = {
          data: {
            "strokeWidthStr": '10lpx',
            "startMarginStr": '10lpx',
            "endMarginStr": '10lpx',
          }
        }
        var innerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Tabs_Divider_1200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Tabs_Divider_1200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      strJson = getInspectorByKey('tabsTest');
      obj = JSON.parse(strJson);
      console.info("[ArkUI_Tabs_Divider_1200] divider:" + JSON.stringify(obj.$attrs.divider));
      dividerObject = obj.$attrs.divider;
      expect(dividerObject.strokeWidth).assertEqual('10.00lpx');
      expect(dividerObject.startMargin).assertEqual('10.00lpx');
      expect(dividerObject.endMargin).assertEqual('10.00lpx');
      done();
    });
  })
}
