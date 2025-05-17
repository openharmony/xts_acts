/*
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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function XComponentLifeCycleTest(){
  describe('XComponentLifeCycleTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_LIFECYCLE_0100
     * @tc.name       : testXComponentLifeCycle_001
     * @tc.desc       : testing XComponent LifeCycle
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentLifeCycle_001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage('XComponent/XComponentLifeCyclePage');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      let button = await driver.findComponent(ON.id('xcomponent_create'));
      await button.click();
      await Utils.sleep(2000);

      // attach to tree
      button = await driver.findComponent(ON.id('xcomponent_attach'));
      await button.click();
      await Utils.sleep(2000);

      // XComponent exist
      await driver.assertComponentExist(ON.type('XComponent'));

      // detach from tree
      button = await driver.findComponent(ON.id('xcomponent_detach'));
      await button.click();
      await Utils.sleep(2000);

      // XComponent is not exist
      let xc = await driver.findComponent(ON.type('XComponent'));
      await Utils.sleep(500);
      expect(xc).assertNull();

      // attach to tree again
      button = await driver.findComponent(ON.id('xcomponent_attach'));
      await button.click();
      await Utils.sleep(2000);

      // XComponent exist
      await driver.assertComponentExist(ON.type('XComponent'));

      // dispose XComponent
      button = await driver.findComponent(ON.id('xcomponent_dispose'));
      await button.click();
      await Utils.sleep(2000);

      // try attach to tree
      button = await driver.findComponent(ON.id('xcomponent_attach'));
      await button.click();
      await Utils.sleep(2000);

      // attach fail, XComponent has been destroyed.
      xc = await driver.findComponent(ON.type('XComponent'));
      await Utils.sleep(500);
      expect(xc).assertNull();

      await Utils.sleep(2000);

      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_XCOMPONENT_LIFECYCLE_0200
     * @tc.name       : testXComponentLifeCycle_002
     * @tc.desc       : testing XComponent LifeCycle
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXComponentLifeCycle_002', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage('XComponent/XComponentLifeCyclePage');
      let driver = await Driver.create()
      await Utils.sleep(1000);

      // initialize: Error Code 401
      let button = await driver.findComponent(ON.id('xcomponent_initialize'));
      await button.click();
      await Utils.sleep(1000);

      let strJson = getInspectorByKey('xcomponent_initialize_status');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[testXComponentLifeCycle_002] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('401');

      // finalize: Error Code 401
      let button_2 = await driver.findComponent(ON.id('xcomponent_finalize'));
      await button_2.click();
      await Utils.sleep(1000);

      let strJson_2 = getInspectorByKey('xcomponent_finalize_status');
      let obj_2: ESObject = JSON.parse(strJson_2);
      console.info("[testXComponentLifeCycle_002] obj_2.$attrs.content:" + obj_2.$attrs.content);
      expect(obj_2.$attrs.content).assertEqual('401');

      // initialize: Normal Value 0
      let button_create = await driver.findComponent(ON.id('xcomponent_create'));
      await button_create.click();
      await Utils.sleep(1000);

      button = await driver.findComponent(ON.id('xcomponent_initialize'));
      await button.click();
      await Utils.sleep(1000);

      strJson = getInspectorByKey('xcomponent_initialize_status');
      obj = JSON.parse(strJson);
      console.info("[testXComponentLifeCycle_002] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');

      // initialize: Error Code 103501
      button = await driver.findComponent(ON.id('xcomponent_initialize'));
      await button.click();
      await Utils.sleep(1000);

      strJson = getInspectorByKey('xcomponent_initialize_status');
      obj = JSON.parse(strJson);
      console.info("[testXComponentLifeCycle_002] obj.$attrs.content:" + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('103501');

      // finalize: Normal Value 0
      button_2 = await driver.findComponent(ON.id('xcomponent_finalize'));
      await button_2.click();
      await Utils.sleep(1000);

      strJson_2 = getInspectorByKey('xcomponent_finalize_status');
      obj_2 = JSON.parse(strJson_2);
      console.info("[testXComponentLifeCycle_002] obj_2.$attrs.content:" + obj_2.$attrs.content);
      expect(obj_2.$attrs.content).assertEqual('0');

      // finalize: Error Code 103501
      button_2 = await driver.findComponent(ON.id('xcomponent_finalize'));
      await button_2.click();
      await Utils.sleep(1000);

      strJson_2 = getInspectorByKey('xcomponent_finalize_status');
      obj_2 = JSON.parse(strJson_2);
      console.info("[testXComponentLifeCycle_002] obj_2.$attrs.content:" + obj_2.$attrs.content);
      expect(obj_2.$attrs.content).assertEqual('103501');

      await Utils.sleep(1000);
      done();
    });
  })
}