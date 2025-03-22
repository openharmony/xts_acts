import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextPickerDialogBGBlurStyleTest() {
  describe('TextPickerDialogBGBlurStyleTest', () => {

    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/TextPickerDialogBGBlurStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("TextPickerDialogBGBlurStyle" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerDialogBGBlurStyle page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputTest after each called");
    });

    it('TextPickerDialogBGBlurStyleTest_001',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_002',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_003',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_004',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_005',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_006',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_007',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_008',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_009',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0010',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0011',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0012',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0013',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0014',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0015',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0016',Level.LEVEL0, async (done: Function) => {
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
    it('TextPickerDialogBGBlurStyleTest_0017',Level.LEVEL0, async (done: Function) => {
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
