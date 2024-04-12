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

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import router from '@ohos.router';

let emitKey = "emitUserAgent";

export default function search() {
  describe('ActsAceSearchTest', () => {
    beforeEach(async (done: Function) => {
      console.info("search beforeEach start");
      let options = {
        url: 'MainAbility/pages/Search/SearchTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Search state pages:" + JSON.stringify(pages));
        if (!("SearchTest" == pages.name)) {
          console.info("get SearchTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push SearchTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchTest page error:" + err);
      }
      console.info("SearchTest beforeEach end");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("search afterEach start");
      let caretWidthNumber: number = 5
      let caretWidthString: string = '15px'
      let caretWidthResource: Resource = $r('sys.float.ohos_id_text_margin_vertical')
      let caretColorColor: Color = Color.Red
      let caretColorNumber: number = 0x000000
      let caretColorString: string = '#ff9a35'
      let caretColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let leftSearchIconSizeNumber: number = 20
      let leftSearchIconSizeString: string = '50px'
      let leftSearchIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let leftSearchIconColorColor: Color = Color.Red
      let leftSearchIconColorNumber: number = 0x000000
      let leftSearchIconColorString: string = '#ff9a35'
      let leftSearchIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let searchSrcPath: string = 'common/icon.png'
      let rightButtonStyleParam: CancelButtonStyle = CancelButtonStyle.INPUT
      let rightCancelIconSizeNumber: number = 20
      let rightCancelIconSizeString: string = '50px'
      let rightCancelIconSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let rightCancelIconColorColor: Color = Color.Red
      let rightCancelIconColorNumber: number = 0x000000
      let rightCancelIconColorString: string = '#ff9a35'
      let rightCancelIconColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let rightIconSrcPath: string = 'common/icon.png'
      let searchButtonFontSizeNumber: number = 20
      let searchButtonFontSizeString: string = '10vp'
      let searchButtonFontSizeResource: Resource = $r('sys.float.ohos_id_text_paragraph_margin_m')
      let searchButtonFontColorColor: Color = Color.Blue
      let searchButtonFontColorNumber: number = 0x000000
      let searchButtonFontColorString: string = '#ff9a35'
      let searchButtonFontColorResource: Resource = $r('sys.color.ohos_id_color_connected')
      let textColorColor: Color = Color.Red
      let textColorNumber: number = 0x000000
      let textColorString: string = '#ff9a35'
      let textColorResource: Resource = $r('sys.color.ohos_id_color_connected')

      try {
        let eventData: events_emitter.EventData = {
          data: {
            'caretWidthNumber': caretWidthNumber,
            'caretWidthString': caretWidthString,
            'caretWidthResource': caretWidthResource,
            'caretColorColor': caretColorColor,
            'caretColorNumber': caretColorNumber,
            'caretColorString': caretColorString,
            'caretColorResource': caretColorResource,
            'leftSearchIconSizeNumber': leftSearchIconSizeNumber,
            'leftSearchIconSizeString': leftSearchIconSizeString,
            'leftSearchIconSizeResource': leftSearchIconSizeResource,
            'leftSearchIconColorColor': leftSearchIconColorColor,
            'leftSearchIconColorNumber': leftSearchIconColorNumber,
            'leftSearchIconColorString': leftSearchIconColorString,
            'leftSearchIconColorResource': leftSearchIconColorResource,
            'searchSrcPath': searchSrcPath,
            'rightButtonStyleParam': rightButtonStyleParam,
            'rightCancelIconSizeNumber': rightCancelIconSizeNumber,
            'rightCancelIconSizeString': rightCancelIconSizeString,
            'rightCancelIconSizeResource': rightCancelIconSizeResource,
            'rightCancelIconColorColor': rightCancelIconColorColor,
            'rightCancelIconColorNumber': rightCancelIconColorNumber,
            'rightCancelIconColorString': rightCancelIconColorString,
            'rightCancelIconColorResource': rightCancelIconColorResource,
            'rightIconSrcPath': rightIconSrcPath,
            'searchButtonFontSizeNumber': searchButtonFontSizeNumber,
            'searchButtonFontSizeString': searchButtonFontSizeString,
            'searchButtonFontSizeResource': searchButtonFontSizeResource,
            'searchButtonFontColorColor': searchButtonFontColorColor,
            'searchButtonFontColorNumber': searchButtonFontColorNumber,
            'searchButtonFontColorString': searchButtonFontColorString,
            'searchButtonFontColorResource': searchButtonFontColorResource,
            'textColorColor': textColorColor,
            'textColorNumber': textColorNumber,
            'textColorString': textColorString,
            'textColorResource': textColorResource
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("search afterEach start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.info("search afterEach start to publish change component data error: " + err.message);
      }
      await Utils.sleep(2000);
      done();
    })

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0100
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Get the default value of caretStyle.width
     */
    it('ArkUI_Stage_Search_CaretStyle_0100', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_0100]: " + JSON.stringify(newJson));

      let obj: ESObject = JSON.parse(newJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0100]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0100]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("1.50vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0200
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 10
     */
    it('ArkUI_Stage_Search_CaretStyle_0200', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(newJson));

      let caretWidthNumber = 10;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0200]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0300
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 15px
     */
    it('ArkUI_Stage_Search_CaretStyle_0300', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0300] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(newJson));

      let caretWidthString = '15px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0300]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("15.00px");
      console.info("[ArkUI_Stage_Search_CaretStyle_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0400
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 10fp
     */
    it('ArkUI_Stage_Search_CaretStyle_0400', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0400] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(newJson));

      let caretWidthString = '10fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0400]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00fp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0500
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 15lpx
     */
    it('ArkUI_Stage_Search_CaretStyle_0500', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(newJson));

      let caretWidthString = '15lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthString": caretWidthString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0500]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("15.00lpx");
      console.info("[ArkUI_Stage_Search_CaretStyle_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0600
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as sys.float.ohos_id_text_margin_vertical
     */
    it('ArkUI_Stage_Search_CaretStyle_0600', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(newJson));

      let caretWidthResource = $r('sys.float.ohos_id_text_margin_vertical');
      globalThis.value.message.notify({
        name: 'caretWidthResource', value: caretWidthResource
      });
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0600]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual('2.00vp');
      console.info("[ArkUI_Stage_Search_CaretStyle_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0700
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 0
     */
    it('ArkUI_Stage_Search_CaretStyle_0700', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(newJson));

      let caretWidthNumber = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0700]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("0.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0800
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as -1.5
     */
    it('ArkUI_Stage_Search_CaretStyle_0800', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(newJson));

      let caretWidthNumber = -1.5;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0800]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("1.50vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_0900
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 100000
     */
    it('ArkUI_Stage_Search_CaretStyle_0900', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_0900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(newJson));

      let caretWidthNumber = 100000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_0900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_0900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_0900]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("100000.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_0900] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1000
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as null
     */
    it('ArkUI_Stage_Search_CaretStyle_1000', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(newJson));

      let caretWidthNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1000]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("1.50vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_1000] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1100
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as undefined
     */
    it('ArkUI_Stage_Search_CaretStyle_1100', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1100] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(newJson));

      let caretWidthNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1100] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1100]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("1.50vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_1100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1200
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Get the default value of caretStyle.color
     */
    it('ArkUI_Stage_Search_CaretStyle_1200', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1200] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_CaretStyle_1200]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_CaretStyle_1200]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1200]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual(objDefault.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_1200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1300
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as 0xff0000
     */
    it('ArkUI_Stage_Search_CaretStyle_1300', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1300] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(newJson));

      let caretColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1300]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_1300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1400
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as Color.Red
     */
    it('ArkUI_Stage_Search_CaretStyle_1400', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1400] start");
      let newJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(newJson));

      let caretColorColor = Color.Red;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorColor": caretColorColor
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestColor');
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1400]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_1400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1500
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as #ff9a35
     */
    it('ArkUI_Stage_Search_CaretStyle_1500', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(newJson));

      let caretColorString = '#ff9a35';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1500]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF9A35");
      console.info("[ArkUI_Stage_Search_CaretStyle_1500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1600
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as $r('sys.color.ohos_id_color_connected')
     */
    it('ArkUI_Stage_Search_CaretStyle_1600', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(newJson));

      let caretColorResource = $r('sys.color.ohos_id_color_connected');
      globalThis.value.message.notify({
        name: 'caretColorResource', value: caretColorResource
      });
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      let strJson2 = getInspectorByKey('searchTestResource2');
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1600]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual(obj2.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_1600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1700
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as abcdefghijk
     */
    it('ArkUI_Stage_Search_CaretStyle_1700', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1700] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(newJson));

      let caretColorString = 'abcdefghijk';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorString": caretColorString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1700] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1700]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual(obj2.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_1700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1800
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as null
     */
    it('ArkUI_Stage_Search_CaretStyle_1800', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(newJson));

      let caretColorNumber = null;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1800]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual(obj2.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_1800] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_1900
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.color as undefined
     */
    it('ArkUI_Stage_Search_CaretStyle_1900', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_1900] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(newJson));

      let caretColorNumber = undefined;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_1900] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_1900] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      let strJson2 = getInspectorByKey('searchTestDefaultValue');
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_1900]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual(obj2.$attrs.caretStyle.color);
      console.info("[ArkUI_Stage_Search_CaretStyle_1900] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_CaretStyle_2000
     * @tc.name Tests the caretStyle property of the search component
     * @tc.desc Set the value of caretStyle.width as 10
     *               Set the value of caretStyle.color as 0xff0000
     */
    it('ArkUI_Stage_Search_CaretStyle_2000', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_CaretStyle_2000] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(newJson));

      let caretWidthNumber = 10;
      let caretColorNumber = 0xff0000;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "caretWidthNumber": caretWidthNumber,
            "caretColorNumber": caretColorNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_CaretStyle_2000] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_CaretStyle_2000] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle.width));
      expect(obj.$attrs.caretStyle.width).assertEqual("10.00vp");
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle));
      console.info("[ArkUI_Stage_Search_CaretStyle_2000]: " + JSON.stringify(obj.$attrs.caretStyle.color));
      expect(obj.$attrs.caretStyle.color).assertEqual("#FFFF0000");
      console.info("[ArkUI_Stage_Search_CaretStyle_2000] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0100
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Get the default value of searchIcon.size
     */
    it('ArkUI_Stage_Search_SearchIcon_0100', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] start");
      let newJson = getInspectorByKey('searchTestDefault');
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(newJson));
      let newJsonDefault = getInspectorByKey('searchTestDefaultValue');

      let obj: ESObject = JSON.parse(newJson);
      let objDefault: ESObject = JSON.parse(newJsonDefault);
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0100]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      expect(obj.$attrs.searchIcon.size).assertEqual(objDefault.$attrs.searchIcon.size);
      console.info("[ArkUI_Stage_Search_SearchIcon_0100] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0200
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as 26
     */
    it('ArkUI_Stage_Search_SearchIcon_0200', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 26;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0200] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0200] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 26;
      console.info("[ArkUI_Stage_Search_SearchIcon_0200]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0200] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0300
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as 50px
     */
    it('ArkUI_Stage_Search_SearchIcon_0300', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50px';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0300] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0300] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0300]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      expect(obj.$attrs.searchIcon.size).assertEqual("50.00px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0300] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0400
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as 50fp
     */
    it('ArkUI_Stage_Search_SearchIcon_0400', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50fp';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0400] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0400] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 50;
      console.info("[ArkUI_Stage_Search_SearchIcon_0400]: " + fp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(fp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0400] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0500
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as 50lpx
     */
    it('ArkUI_Stage_Search_SearchIcon_0500', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] start");
      let newJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(newJson));

      let leftSearchIconSizeString = '50lpx';
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeString": leftSearchIconSizeString
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0500] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0500] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestString');
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 50;
      console.info("[ArkUI_Stage_Search_SearchIcon_0500]: " + lpx2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(lpx2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0500] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0600
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as $r('sys.float.ohos_id_text_paragraph_margin_m')
     */
    it('ArkUI_Stage_Search_SearchIcon_0600', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] start");
      let newJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(newJson));

      let leftSearchIconSizeResource = $r('sys.float.ohos_id_text_paragraph_margin_m');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeResource": leftSearchIconSizeResource
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0600] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0600] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestResource');
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 16;
      console.info("[ArkUI_Stage_Search_SearchIcon_0600]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0600] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0700
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as 40
     */
    it('ArkUI_Stage_Search_SearchIcon_0700', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 40;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0700] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0700] change component data error: " + err.message);
      }
      await Utils.sleep(5000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 40;
      console.info("[ArkUI_Stage_Search_SearchIcon_0700]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0700] end");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Search_SearchIcon_0800
     * @tc.name Tests the searchIcon property of the search component
     * @tc.desc Set the value of searchIcon.size as 0
     */
    it('ArkUI_Stage_Search_SearchIcon_0800', 0, async (done: Function) => {
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] start");
      let newJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(newJson));

      let leftSearchIconSizeNumber = 0;
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "leftSearchIconSizeNumber": leftSearchIconSizeNumber
          }
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 183,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[ArkUI_Stage_Search_SearchIcon_0800] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[ArkUI_Stage_Search_SearchIcon_0800] change component data error: " + err.message);
      }
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('searchTestNumber');
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(strJson))
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(obj.$attrs.searchIcon));
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + JSON.stringify(obj.$attrs.searchIcon.size));
      let result: number = 0;
      console.info("[ArkUI_Stage_Search_SearchIcon_0800]: " + vp2px(result).toFixed(2));
      expect(obj.$attrs.searchIcon.size).assertEqual(vp2px(result).toFixed(2) + "px");
      console.info("[ArkUI_Stage_Search_SearchIcon_0800] end");
      done();
    });


  })
}
