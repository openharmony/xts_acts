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

export default function CalendarPickerDialogBackgroundShadowTest() {
  describe('CalendarPickerDialogBackgroundShadowTest', async () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerDialogBackgroundShadowTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBackgroundStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerDialogBackgroundShadowTest state pages:' + JSON.stringify(pages));
        if (!('CalendarPickerDialogBackgroundColor' == pages.name)) {
          console.info('get CalendarPickerDialogBackgroundShadowTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push CalendarPickerDialogBackgroundShadowTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerDialogBackgroundShadowTest page error:' + err);
      }
      console.info('CalendarPickerDialogBackgroundShadowTest beforeEach end');
      done();
    });

    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_001
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_001
    * @tc.desc  : To test the CalendarPickerDialog shadow color: Color.Red
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_001', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow.color;
      expect(shadow).assertEqual('#FFFF0000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_002
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_002
    * @tc.desc  : To test the CalendarPickerDialog shadow ShadowStyle.OUTER_DEFAULT_XS
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_002', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      console.info("[CalendarPickerDialogBackgroundShadowTest_002] obj is: " + column.$attrs.shadow);
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_003
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_003
    * @tc.desc  : To test the CalendarPickerDialog shadow ShadowStyle.OUTER_DEFAULT_SM
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_003', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_004
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_004
    * @tc.desc  : To test the CalendarPickerDialog shadow ShadowStyle.OUTER_DEFAULT_MD
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_004', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_005
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_005
    * @tc.desc  : To test the CalendarPickerDialog shadow ShadowStyle.OUTER_DEFAULT_LG
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_005', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_006
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_006
    * @tc.desc  : To test the CalendarPickerDialog shadow ShadowStyle.OUTER_FLOATING_SM
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_006', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundShadowTest_007
    * @tc.name  : CalendarPickerDialogBackgroundShadowTest_007
    * @tc.desc  : To test the CalendarPickerDialog shadow ShadowStyle.OUTER_FLOATING_MD
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundShadowTest_007', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerShadowID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      await Utils.sleep(1000);
      done();
    })
  })
}