import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextPickerDialogShadowTest() {
  describe('TextPickerDialogShadowTest', () => {

    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/textPickerDialog/TextPickerDialogShadow',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("TextPickerDialogShadow" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPickerDialogShadow page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputTest after each called");
    });

    it('TextPickerDialogShadowTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('shadowOptionID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow.color;
      expect(shadow).assertEqual('#FFFF0000');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TextPickerDialogShadowTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_XS_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TextPickerDialogShadowTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_SM_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TextPickerDialogShadowTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_MD_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TextPickerDialogShadowTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_DEFAULT_LG_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultLG');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TextPickerDialogShadowTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_SM_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TextPickerDialogShadowTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('OUTER_FLOATING_MD_ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let shadow: string = column.$attrs.shadow;
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingMD');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

  })
}