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
import CommonFunc from '../../MainAbility/common/Common';

export default function CalendarPickerDialogBGBlurStyleTest() {
  describe('CalendarPickerDialogBGBlurStyleTest', () => {

    beforeAll(async () => {
      console.info("CalendarPickerDialogBGBlurStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/calendarPickerDialogBGBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("calendarPickerDialogBGBlurStyle" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push CalendarPickerDialogBGBlurStyleTest page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("CalendarPickerDialogBGBlurStyleTest after each called");
    });


    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_001
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_001
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.Thin
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_001', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThinID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_002
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_002
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.Regular
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_002', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('RegularID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_003
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_003
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.Thick
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_003', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThickID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_004
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_004
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THIN
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_004', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_005
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_005
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_REGULAR
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_005', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_REGULAR_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_006
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_006
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_006', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_007
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_007
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.BACKGROUND_ULTRA_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_007', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_008
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_008
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.NONE
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_008', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('NONE_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_009
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_009
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_ULTRA_THIN
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_009', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_010
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_010
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_THIN
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0010', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_011
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_011
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_REGULAR
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0011', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_REGULAR_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_012
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_012
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0012', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_013
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_013
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle BlurStyle.COMPONENT_ULTRA_THICK
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0013', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_014
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_014
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle null
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0014', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_015
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_015
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle undefined
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0015', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_016
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_016
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle -1
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0016', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    /* *
    * @tc.number: CalendarPickerDialogBGBlurStyleTest_017
    * @tc.name  : CalendarPickerDialogBGBlurStyleTest_017
    * @tc.desc  : To test the CalendarPickerDialog backgroundBlurStyle 100
    * @tc.level : Level 0
    */
    it('CalendarPickerDialogBGBlurStyleTest_0017', Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      let uniRenderFlag: string = dialog.$attrs.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      }
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}