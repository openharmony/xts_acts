/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function CalendarPickerDialogBackgroundColorTest() {
  describe('CalendarPickerDialogBackgroundColorTest', async () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerDialogBackgroundColorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBackgroundStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerDialogBackgroundColorTest state pages:' + JSON.stringify(pages));
        if (!('calendarPickerDialogBackgroundStyle' == pages.name)) {
          console.info('get CalendarPickerDialogBackgroundColorTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push CalendarPickerDialogBackgroundColorTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerDialogBackgroundColorTest page error:' + err);
      }
      console.info('CalendarPickerDialogBackgroundColorTest beforeEach end');
      done();
    });

    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_001
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_001
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor Color.White
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_001', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_002
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_002
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor 'rgb(255, 100, 255)'
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_002', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_003
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_003
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor 0x008080
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_003', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_004
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_004
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor '#00FFFF'
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_004', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_005
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_005
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor $r('app.color.blue')
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_005', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_006
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_006
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor null
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_006', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerAnomaliesButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#00000000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_006
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_006
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor undefined
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_006', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerAnomaliesButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#00000000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_007
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_007
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor 'XXX'
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_007', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerAnomaliesButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#00000000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundColorTest_008
    * @tc.name  : CalendarPickerDialogBackgroundColorTest_008
    * @tc.desc  : To test the CalendarPickerDialog BackgroundColor -5
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundColorTest_008', 0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerAnomaliesButtonID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFFFFFB');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
  })
}
