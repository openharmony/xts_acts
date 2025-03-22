import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Driver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function TimePickerDialogBGColorTest() {
  describe('TimePickerDialogBGColorTest', () => {
    beforeAll(async () => {
      console.info("TimePickerDialogBGColorTest beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/timePickerDialog/TimePickerDialogBGColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("TimePickerDialogBGColor" == pages.name)) {
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePickerDialogBGColor page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("textAreaInputTest after each called");
    });

    it('TimePickerDialogBGColorTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('ColorWhiteID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('rgb(255, 100, 255)ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFF64FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('0x008080ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF008080');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('00FFFFID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF00FFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('colorBlueID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FF0000FF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('nullID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#00FFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('undefinedID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#00FFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_008',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('xxxID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#00FFFFFF');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })

    it('TimePickerDialogBGColorTest_009',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('-100ID'));
      await button.click();
      await CommonFunc.sleep(1000);
      let tree: ESObject = await getInspectorTree();
      let dialog: ESObject = tree.$children[1];
      let column: ESObject = dialog.$children[0];
      let backgroundColor: string = column.$attrs.backgroundColor;
      expect(backgroundColor).assertEqual('#FFFFFF9C');
      let btn1 = await driver.findComponent(ON.text('确定'));
      await btn1?.click();
      done();
    })
  })
}