/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackSafeAreaTest() {
  describe('StackSafeAreaTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackSafeAreaTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackSafeArea',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackSafeAreaTest state pages:" + JSON.stringify(pages));
        if (!("StackSafeAreaTest" == pages.name)) {
          console.info("get StackSafeAreaTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackSafeAreaTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackSafeAreaTest page error:" + err);
      }
      console.info("StackSafeAreaTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    
     it('StackSafeAreaTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackSafeAreaTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('SystemButton1'));
      await button1.click();
      await Utils.sleep(2000)
      let strJson1 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber1 is:' + JSON.stringify(JSON.parse(strJson1).$attrs.content));

      let button2 = await driver.findComponent(ON.id('KeyboardButton1'));
      await button2.click();
      await Utils.sleep(2000)
      let strJson2 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber2 is:' + JSON.stringify(JSON.parse(strJson2).$attrs.content));

      let button3 = await driver.findComponent(ON.id('AllButton1'));
      await button3.click();
      await Utils.sleep(2000)
      let strJson3 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber3 is:' + JSON.stringify(JSON.parse(strJson3).$attrs.content));

      let button4 = await driver.findComponent(ON.id('NullButton1'));
      await button4.click();
      await Utils.sleep(2000)
      let strJson4 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber4 is:' + JSON.stringify(JSON.parse(strJson4).$attrs.content));

      let button5 = await driver.findComponent(ON.id('UndefinedButton1'));
      await button5.click();
      await Utils.sleep(2000)
      let strJson5 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber5 is:' + JSON.stringify(JSON.parse(strJson5).$attrs.content));

      let button6 = await driver.findComponent(ON.id('TopButton1'));
      await button6.click();
      await Utils.sleep(2000)
      let strJson6 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber6 is:' + JSON.stringify(JSON.parse(strJson6).$attrs.content));

      let button7 = await driver.findComponent(ON.id('BottomButton1'));
      await button7.click();
      await Utils.sleep(2000)
      let strJson7 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber7 is:' + JSON.stringify(JSON.parse(strJson7).$attrs.content));

      let button8 = await driver.findComponent(ON.id('StartButton1'));
      await button8.click();
      await Utils.sleep(2000)
      let strJson8 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber8 is:' + JSON.stringify(JSON.parse(strJson8).$attrs.content));

      let button9 = await driver.findComponent(ON.id('EndButton1'));
      await button9.click();
      await Utils.sleep(2000)
      let strJson9 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber9 is:' + JSON.stringify(JSON.parse(strJson9).$attrs.content));

      let button10 = await driver.findComponent(ON.id('VerticalButton1'));
      await button10.click();
      await Utils.sleep(2000)
      let strJson10 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber10 is:' + JSON.stringify(JSON.parse(strJson10).$attrs.content));

      let button11 = await driver.findComponent(ON.id('HorizontalButton1'));
      await button11.click();
      await Utils.sleep(2000)
      let strJson11 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber11 is:' + JSON.stringify(JSON.parse(strJson11).$attrs.content));

      let button12 = await driver.findComponent(ON.id('AllButton2'));
      await button12.click();
      await Utils.sleep(2000)
      let strJson12 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber12 is:' + JSON.stringify(JSON.parse(strJson12).$attrs.content));

      let button13 = await driver.findComponent(ON.id('NullButton2'));
      await button13.click();
      await Utils.sleep(2000)
      let strJson13 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber13 is:' + JSON.stringify(JSON.parse(strJson13).$attrs.content));

      let button14 = await driver.findComponent(ON.id('UndefinedButton2'));
      await button14.click();
      await Utils.sleep(2000)
      let strJson14 = getInspectorByKey('GetSafeAreaNumber1');
      console.log('[IgnoreStackSafeAreaTest_0100] GetSafeAreaNumber14 is:' + JSON.stringify(JSON.parse(strJson14).$attrs.content));

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('2');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('null');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('undefined');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('1');
      expect(JSON.parse(strJson8).$attrs.content).assertEqual('2');
      expect(JSON.parse(strJson9).$attrs.content).assertEqual('3');
      expect(JSON.parse(strJson10).$attrs.content).assertEqual('4');
      expect(JSON.parse(strJson11).$attrs.content).assertEqual('5');
      expect(JSON.parse(strJson12).$attrs.content).assertEqual('6');
      expect(JSON.parse(strJson13).$attrs.content).assertEqual('null');
      expect(JSON.parse(strJson14).$attrs.content).assertEqual('undefined');
      
      console.info('[StackSafeAreaTest_0100] END');
      done();
    });


  })
}