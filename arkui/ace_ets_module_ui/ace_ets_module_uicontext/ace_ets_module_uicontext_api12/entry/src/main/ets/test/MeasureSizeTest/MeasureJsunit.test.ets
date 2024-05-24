/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function MeasureJsunit() {
  describe('MeasureJsunit', function () {
    beforeEach(async function (done) {
      console.info('measureJsunit beforeEach start');
      let options = {
        uri: 'MainAbility/pages/MeasureSize/measureSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get measureJsunit state pages: ' + JSON.stringify(pages));
        if (!('measureSize' == pages.name)) {
          console.info('get measureJsunit state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info('push measureJsunit page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push measureJsunit page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: ArkUI_Stage_Measure_0100
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test measureTextSize function
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Measure_0100', 0, async function (done) {
      console.info('ArkUI_Stage_Measure_0100 START');
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parse(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parse(strJsonMaxLine3);
      
      console.log('[ArkUI_Stage_Measure_0100] component strJsonMaxLine2 is: ' + JSON.stringify(strJsonMaxLine2Obj));
      console.log('[ArkUI_Stage_Measure_0100] component strJsonMaxLine3 is: ' + JSON.stringify(strJsonMaxLine3Obj));
      expect(strJsonMaxLine2Obj.$attrs.content).assertEqual(strJsonMaxLine3Obj.$attrs.content);
      done();
    });

    /**
     * @tc.number: ArkUI_Stage_Measure_0200
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test measureTextSize function
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Measure_0200', 0, async function (done) {
      console.info('ArkUI_Stage_Measure_0200 START');
      await CommonFunc.sleep(2000);
      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let testForTextIndentButton = await driver.findComponent(ON.id('testForTextIndent'));
      await CommonFunc.sleep(500);
      testForTextIndentButton.click();
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parse(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parse(strJsonMaxLine3);
      
      console.log('[ArkUI_Stage_Measure_0200] component strJsonMaxLine2 is: ' + JSON.stringify(strJsonMaxLine2Obj));
      console.log('[ArkUI_Stage_Measure_0200] component strJsonMaxLine3 is: ' + JSON.stringify(strJsonMaxLine3Obj));
      expect(Number.parseInt(strJsonMaxLine3Obj.$attrs.content)).assertLarger(Number.parseInt(strJsonMaxLine2Obj.$attrs.content));
      done();
    });
    
    /**
     * @tc.number: ArkUI_Stage_Measure_0300
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test measureTextSize function
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Measure_0300', 0, async function (done) {
      console.info('ArkUI_Stage_Measure_0300 START');
      await CommonFunc.sleep(2000);      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('reset'));
      await CommonFunc.sleep(500);
      resetButton.click();
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parse(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parse(strJsonMaxLine3);
      
      console.log('[ArkUI_Stage_Measure_0300] component strJsonMaxLine2 is: ' + JSON.stringify(strJsonMaxLine2Obj));
      console.log('[ArkUI_Stage_Measure_0300] component strJsonMaxLine3 is: ' + JSON.stringify(strJsonMaxLine3Obj));
      expect(strJsonMaxLine2Obj.$attrs.content).assertEqual(strJsonMaxLine3Obj.$attrs.content);
      
      let testForWordBreakButton = await driver.findComponent(ON.id('testForWordBreak'));
      await CommonFunc.sleep(500);
      testForWordBreakButton.click();
      await CommonFunc.sleep(2000);
      
      strJsonMaxLine2 = getInspectorByKey('textSizeMaxLine2');
      strJsonMaxLine3 = getInspectorByKey('textSizeMaxLine3');
      strJsonMaxLine2Obj = JSON.parse(strJsonMaxLine2);
      strJsonMaxLine3Obj = JSON.parse(strJsonMaxLine3);
      
      console.log('[ArkUI_Stage_Measure_0300] component strJsonMaxLine2 is: ' + JSON.stringify(strJsonMaxLine2Obj));
      console.log('[ArkUI_Stage_Measure_0300] component strJsonMaxLine3 is: ' + JSON.stringify(strJsonMaxLine3Obj));
      expect(Number.parseInt(strJsonMaxLine3Obj.$attrs.content)).assertLarger(Number.parseInt(strJsonMaxLine2Obj.$attrs.content));
      done();
    });
    
    /**
     * @tc.number: ArkUI_Stage_Measure_0400
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test measureTextSize function
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Measure_0400', 0, async function (done) {
      console.info('ArkUI_Stage_Measure_0400 START');
      await CommonFunc.sleep(2000);      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('resetInChinese'));
      await CommonFunc.sleep(500);
      resetButton.click();
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parse(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parse(strJsonMaxLine3);
      
      console.log('[ArkUI_Stage_Measure_0400] component strJsonMaxLine2 is: ' + JSON.stringify(strJsonMaxLine2Obj));
      console.log('[ArkUI_Stage_Measure_0400] component strJsonMaxLine3 is: ' + JSON.stringify(strJsonMaxLine3Obj));
      expect(strJsonMaxLine2Obj.$attrs.content).assertEqual(strJsonMaxLine3Obj.$attrs.content);
      done();
    });

    /**
     * @tc.number: ArkUI_Stage_Measure_0500
     * @tc.name  : Test the text computing power of the context
     * @tc.desc  : Test measureTextSize function
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('ArkUI_Stage_Measure_0500', 0, async function (done) {
      console.info('ArkUI_Stage_Measure_0500 START');
      await CommonFunc.sleep(2000);      
      let driver = await Driver.create();
      await CommonFunc.sleep(500);
      let resetButton = await driver.findComponent(ON.id('resetInChinese'));
      await CommonFunc.sleep(500);
      resetButton.click();
      await CommonFunc.sleep(2000);
      
      let testForTextIndentButton = await driver.findComponent(ON.id('testForTextIndentInChinese'));
      await CommonFunc.sleep(500);
      testForTextIndentButton.click();
      await CommonFunc.sleep(2000);

      let strJsonMaxLine2 = getInspectorByKey('textSizeMaxLine2');
      let strJsonMaxLine3 = getInspectorByKey('textSizeMaxLine3');
      let strJsonMaxLine2Obj = JSON.parse(strJsonMaxLine2);
      let strJsonMaxLine3Obj = JSON.parse(strJsonMaxLine3);
      
      console.log('[ArkUI_Stage_Measure_0500] component strJsonMaxLine2 is: ' + JSON.stringify(strJsonMaxLine2Obj));
      console.log('[ArkUI_Stage_Measure_0500] component strJsonMaxLine3 is: ' + JSON.stringify(strJsonMaxLine3Obj));
      expect(Number.parseInt(strJsonMaxLine3Obj.$attrs.content)).assertLarger(Number.parseInt(strJsonMaxLine2Obj.$attrs.content));
      done();
    });

  })
}
