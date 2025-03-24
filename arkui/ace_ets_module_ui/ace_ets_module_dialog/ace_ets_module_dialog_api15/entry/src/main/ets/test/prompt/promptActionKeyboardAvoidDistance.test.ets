/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { BY, Driver, UiDriver, ON, Component } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';

export default function promptActionKeyboardAvoidDistance() {
  describe('promptActionKeyboardAvoidDistance', () => {
    beforeEach(async (done: Function) => {
      console.info("promptActionKeyboardAvoidDistance beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/prompt/promptActionKeyboardAvoidDistance",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get promptActionKeyboardAvoidDistance state pages: " + JSON.stringify(pages));
        if (!("promptActionKeyboardAvoidDistance" == pages.name)) {
          console.info("get promptActionKeyboardAvoidDistance state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push promptActionKeyboardAvoidDistance success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push promptActionKeyboardAvoidDistance page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    promptActionKeyboardAvoidDistance_0100
     * @tc.name      promptActionKeyboardAvoidDistance_0100
     * @tc.desc      set keyboardAvoidDistance:20vp,levelUniqueId: Normal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('promptActionKeyboardAvoidDistance_0100', 0, async (done: Function) => {
      console.info('promptActionKeyboardAvoidDistance_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn4 = await driver.findComponent(ON.id('btn4'));
      await btn4.click();
      await CommonFunc.sleep(2000);
      let input1 = await driver.findComponent(ON.id('input1'));
      await input1.click();
      await CommonFunc.sleep(2000);
      let customDialog = Utils.getComponentRect('customDialog');
      let top = customDialog.top
      let bottom = customDialog.bottom
      let right = customDialog.right
      let middle = (bottom - top) / 2 + top
      let left = customDialog.left
      console.info('[CustomDialog_distance0_001] left: ' + customDialog.left + ', top: ' + customDialog.top +
        ', right:' + customDialog.right + ', bottom:' + customDialog.bottom + ',middle:' + middle);
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      await CommonFunc.sleep(2000);
      let btn1 = await driver.findComponent(ON.id('btn1'));
      await btn1.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let customDialog1 = Utils.getComponentRect('customDialog');
      let top1 = customDialog1.top
      let bottom1 = customDialog1.bottom
      let right1 = customDialog1.right
      let middle1 = (bottom1 - top1) / 2 + top1
      let left1 = customDialog1.left
      console.info('[CustomDialog_keyboard_001] left: ' + customDialog1.left + ', top: ' + customDialog1.top +
        ', right:' + customDialog1.right + ', bottom:' + customDialog1.bottom + ',middle:' + middle1);
      let keyboardAvoidDistance = customDialog.top - customDialog1.top;
      let str = vp2px(20);
      let str1 = JSON.stringify(Math.ceil(str))
      let cancelButton1: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton1?.click();
      expect(JSON.stringify(keyboardAvoidDistance)).assertEqual(str1);
      console.info('promptActionKeyboardAvoidDistance_0100 END');
      done();
    });

    /**
     * @tc.number    promptActionKeyboardAvoidDistance_0200
     * @tc.name      promptActionKeyboardAvoidDistance_0200
     * @tc.desc      set keyboardAvoidDistance:undefined,levelUniqueId: Abnormal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('promptActionKeyboardAvoidDistance_0200', 0, async (done: Function) => {
      console.info('promptActionKeyboardAvoidDistance_0200 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn4 = await driver.findComponent(ON.id('btn4'));
      await btn4.click();
      await CommonFunc.sleep(2000);
      let input1 = await driver.findComponent(ON.id('input1'));
      await input1.click();
      await CommonFunc.sleep(2000);
      let customDialog2 = Utils.getComponentRect('customDialog');
      let top2 = customDialog2.top
      let bottom2 = customDialog2.bottom
      let right2 = customDialog2.right
      let middle2 = (bottom2 - top2) / 2 + top2
      let left = customDialog2.left
      console.info('[CustomDialog_distance0_001] left: ' + customDialog2.left + ', top: ' + customDialog2.top +
        ', right:' + customDialog2.right + ', bottom:' + customDialog2.bottom + ',middle:' + middle2);
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      await CommonFunc.sleep(2000);
      let btn2 = await driver.findComponent(ON.id('btn2'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let customDialog3 = Utils.getComponentRect('customDialog');
      let top3 = customDialog3.top
      let bottom3 = customDialog3.bottom
      let right3 = customDialog3.right
      let middle3 = (bottom3-top3) / 2 + top3
      let left3 =customDialog3.left
      console.info('[CustomDialog_keyboard_001] left: ' + customDialog3.left + ', top: ' + customDialog3.top +
        ', right:' + customDialog3.right + ', bottom:' + customDialog3.bottom + ',middle:' + middle3);
      let keyboardAvoidDistance = customDialog2.top - customDialog3.top;
      let str = vp2px(16);
      let str1 = JSON.stringify(Math.ceil(str))
      let cancelButton1: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton1?.click();
      expect(JSON.stringify(keyboardAvoidDistance)).assertEqual(str1);
      console.info('promptActionKeyboardAvoidDistance_0200 END');
      done();
    });

    /**
     * @tc.number    promptActionKeyboardAvoidDistance_0300
     * @tc.name      promptActionKeyboardAvoidDistance_0300
     * @tc.desc      set keyboardAvoidDistance:null,levelUniqueId: Abnormal value
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
     it('promptActionKeyboardAvoidDistance_0300', 0, async (done: Function) => {
      console.info('promptActionKeyboardAvoidDistance_0300 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn4 = await driver.findComponent(ON.id('btn4'));
      await btn4.click();
      await CommonFunc.sleep(2000);
      let input1 = await driver.findComponent(ON.id('input1'));
      await input1.click();
      await CommonFunc.sleep(2000);
      let customDialog4 = Utils.getComponentRect('customDialog');
      let top4 = customDialog4.top
      let bottom4 = customDialog4.bottom
      let right4 = customDialog4.right
      let middle4 = (bottom4 - top4) / 2 + top4
      let left4 = customDialog4.left
      console.info('[CustomDialog_distance0_001] left: ' + customDialog4.left + ', top: ' + customDialog4.top +
        ', right:' + customDialog4.right + ', bottom:' + customDialog4.bottom + ',middle:' + middle4);
      let cancelButton: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton?.click();
      await CommonFunc.sleep(2000);
      let btn3 = await driver.findComponent(ON.id('btn3'));
      await btn3.click();
      await CommonFunc.sleep(2000);
      let input = await driver.findComponent(ON.id('input1'));
      await input.click();
      await CommonFunc.sleep(2000);
      let customDialog5 = Utils.getComponentRect('customDialog');
      let top5 = customDialog5.top
      let bottom5 = customDialog5.bottom
      let right5 = customDialog5.right
      let middle5 = (bottom5-top5) / 2 + top5
      let left5 =customDialog5.left
      console.info('[CustomDialog_keyboard_001] left: ' + customDialog5.left + ', top: ' + customDialog5.top +
        ', right:' + customDialog5.right + ', bottom:' + customDialog5.bottom + ',middle:' + middle5);
      let keyboardAvoidDistance = customDialog4.top - customDialog5.top;
      let str = vp2px(16);
      let str1 = JSON.stringify(Math.ceil(str))
      let cancelButton1: Component = await driver.findComponent(ON.text('取消'));
      await CommonFunc.sleep(300);
      await cancelButton1?.click();
      expect(JSON.stringify(keyboardAvoidDistance)).assertEqual(str1);
      console.info('promptActionKeyboardAvoidDistance_0300 END');
      done();
    });
  })
}