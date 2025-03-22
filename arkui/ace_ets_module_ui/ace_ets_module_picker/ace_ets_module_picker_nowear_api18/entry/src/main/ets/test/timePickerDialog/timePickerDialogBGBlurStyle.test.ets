import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function TimePickerDialogBGBlurStyleTest() {
  describe('TimePickerDialogBGBlurStyleTest', () => {
    beforeAll(async () => {
      console.info("TimePickerDialogBGBlurStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePickerDialog/TimePickerDialogBGBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("TimePickerDialogBGBlurStyle" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePickerDialogBGBlurStyle page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputTest after each called");
    });

    it('TimePickerDialogBGBlurStyleTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThinID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('RegularID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ThickID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_REGULAR_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('BACKGROUND_ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_008',Level.LEVEL0, async (done: Function) => {
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
    it('TimePickerDialogBGBlurStyleTest_009',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0010',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THIN_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0011',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_REGULAR_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0012',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0013',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('COMPONENT_ULTRA_THICK_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0014',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0015',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0016',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
    it('TimePickerDialogBGBlurStyleTest_0017',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundBlurStyle: string = column.$attrs.backgroundBlurStyle.value;
      expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}