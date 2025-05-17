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

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

async function ComparisonPostAssert() {
  let GridRow: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_001');
  let GridCol_1: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_0');
  let GridCol_2: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_1');
  let GridCol_3: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_2');
  let GridCol_4: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_3');
  let GridCol_5: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_4');
  let GridCol_6: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_5');
  let GridCol_7: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_6');
  let GridCol_8: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_7');
  let GridCol_9: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_8');
  let GridCol_10: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_9');
  let GridCol_11: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_10');
  let GridCol_12: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_11');
  let GridCol_13: RectValue = CommonFunc.getComponentRect('GridRow_No_Columns_12');
  
  expect(Math.abs(GridCol_1.left - GridRow.left) <= 1).assertTrue();
  expect(Math.abs(GridCol_1.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_2.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_3.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_4.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_5.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_6.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_7.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_8.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_9.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_10.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_11.top - GridRow.top) <= 1).assertTrue();
  expect(Math.abs(GridCol_12.top - GridRow.top) <= 1).assertTrue();
  
  expect(Math.abs(GridCol_13.left - GridRow.left) <= 1).assertTrue();
  expect(Math.abs(GridCol_13.top - GridCol_1.bottom) <= 1).assertTrue();
}

export default function GridRowColumnsTest() {
  describe('GridRowColumnsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GridRowColumnsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridRow/GridRowColumnsPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowColumnsTest state pages:" + JSON.stringify(pages));
        if (!("GridRowColumnsPage" == pages.name)) {
          console.info("get GridRowColumnsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowColumnsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowColumnsTest page error:" + err);
      }
      console.info("GridRowColumnsTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number    GridRowColumnsTest_0100
     * @tc.name      GridRowColumnsTest_0100
     * @tc.desc      test Flex LayoutPolicy
     * @tc.level:    Level 1
     * @tc.type :    GridRowNoColumns
     * @tc.size :
     */
    it('GridRowColumnsTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[GridRowColumnsTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // change to xxl
      let button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_1'));
      await button.click();
      console.info("[GridRowColumnsTest_0100] click GridRow_No_Columns_001_Btn_1");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[GridRowColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('xxl');
      await ComparisonPostAssert();

      // change to xl
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_2'));
      await button.click();
      console.info("[GridRowColumnsTest_0100] click GridRow_No_Columns_001_Btn_2");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('xl');
      await ComparisonPostAssert();

      // change to lg
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_3'));
      await button.click();
      console.info("[GridRowColumnsTest_0100] click GridRow_No_Columns_001_Btn_3");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('lg');
      await ComparisonPostAssert();

      // change to md
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_4'));
      await button.click();
      console.info("[GridRowColumnsTest_0100] click GridRow_No_Columns_001_Btn_4");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('md');
      await ComparisonPostAssert();

      // change to sm
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_5'));
      await button.click();
      console.info("[GridRowColumnsTest_0100] click GridRow_No_Columns_001_Btn_5");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('sm');
      await ComparisonPostAssert();

      // change to xs
      button = await driver.findComponent(ON.id('GridRow_No_Columns_001_Btn_6'));
      await button.click();
      console.info("[GridRowColumnsTest_0100] click GridRow_No_Columns_001_Btn_6");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('GridRow_No_Columns_001_currentBp');
      obj = JSON.parse(strJson);
      console.info("[GridRowColumnsTest_0100] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('xs');
      await ComparisonPostAssert();

      console.info('[GridRowColumnsTest_0100] END');
      done();
    });
  })
}