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

export default function CalendarPickerDialogBackgroundBlurStyleTest() {
  describe('CalendarPickerDialogBackgroundBlurStyleTest', async () => {
    beforeEach(async (done: Function) => {
      console.info('CalendarPickerDialogBackgroundBlurStyleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBackgroundStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get CalendarPickerDialogBackgroundBlurStyleTest state pages:' + JSON.stringify(pages));
        if (!('CalendarPickerDialogBackgroundColor' == pages.name)) {
          console.info('get CalendarPickerDialogBackgroundBlurStyleTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push CalendarPickerDialogBackgroundBlurStyleTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push CalendarPickerDialogBackgroundBlurStyleTest page error:' + err);
      }
      console.info('CalendarPickerDialogBackgroundBlurStyleTest beforeEach end');
      done();
    });

    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_001
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_001
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.Thin
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_001', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_002
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_002
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.Regular
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_002', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_003
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_003
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.Thick
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_003', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_004
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_004
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THIN
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_004', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_005
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_005
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_REGULAR
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_005', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_006
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_006
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_006', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_007
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_007
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_ULTRA_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_007', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      console.info("[CalendarPickerDialogBackgroundBlurStyleTest_007] obj is: " + backgroundBlurStyle);
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_008
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_008
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.NONE
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_008', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_009
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_009
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_ULTRA_THIN
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_009', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_010
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_010
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_THIN
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_010', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_011
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_011
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_REGULAR
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_011', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_013
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_013
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_013', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_014
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_014
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_ULTRA_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_014', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_015
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_015
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle null
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_015', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_016
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_016
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle undefined
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_016', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_017
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_017
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle -1
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_017', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBackgroundBlurStyleTest_018
    * @tc.name  : CalendarPickerDialogBackgroundBlurStyleTest_018
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle 100
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBackgroundBlurStyleTest_018', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('showCalendarPickerBackgroundBlurStyleID'));
      await button.click();
      await Utils.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      await driver.pressBack();
      await Utils.sleep(1000);
      done();
    })
  })
}