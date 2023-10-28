/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import router from '@system.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function LinkHight() {
  describe('LinkHight', function () {
    beforeEach(async function (done) {
      console.info("LinkHight beforeEach start");
      let options = {
        uri: 'MainAbility/pages/@state/LinkHight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get LinkHight state pages: " + JSON.stringify(pages));
        if (!("LinkHight" == pages.name)) {
          console.info("get LinkHight state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push LinkHight success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkHight page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('LinkHight_0100', 0, async function (done) {
      console.info('LinkHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state1');
      let obj = JSON.parse(strJson);
      console.info("[LinkHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('40.00vp');
      console.info('[LinkHight_0100] END');
      done();
    });

    it('LinkHight_0200', 0, async function (done) {
      console.info('LinkHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state2');
      let obj = JSON.parse(strJson);
      console.info("[LinkHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('200.00vp');
      console.info('[LinkHight_0100] END');
      done();
    });

    it('LinkHight_0300', 0, async function (done) {
      console.info('LinkHight_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('state3');
      let obj = JSON.parse(strJson);
      console.info("[LinkHight_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkHight_0100] title: " + JSON.stringify(obj.$attrs.height));
      expect(obj.$attrs.height).assertEqual('200.00vp');
      console.info('[LinkHight_0100] END');
      done();
    });


  })
}

