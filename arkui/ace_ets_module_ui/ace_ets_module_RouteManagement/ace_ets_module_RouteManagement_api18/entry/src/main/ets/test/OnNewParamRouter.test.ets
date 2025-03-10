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

import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function OnNewParamRouter() {
  describe('OnNewParamRouter', () => {
    beforeEach(async (done: Function) => {
      console.info("OnNewParamRouter beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/OnNewParamRouter',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OnNewParamRouter state pages:" + JSON.stringify(pages));
        if (!("OnNewParamRouter" == pages.name)) {
          console.info("get OnNewParamRouter pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push OnNewParamRouter page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OnNewParamRouter page error:" + err);
      }
      console.info("OnNewParamRouter beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("OnNewParamRouter after each called");
    });


    /**
     * @tc.number    OnNewParamRouter_0100
     * @tc.name      OnNewParamRouter_0100
     * @tc.desc      Test Router OnNewParam by pushUrl router.RouterMode.Single
     * @tc.level     Level 2
     */
    it('OnNewParamRouter_0100', 0, async (done: Function) => {
      console.info('OnNewParamRouter_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushId'));
      await btn1.click()
      console.info('[OnNewParamRouter_0100] btn1 click');
      await driver.delayMs(1000);

      let btn2: Component = await driver.findComponent(ON.id('pushUrlId'));
      await btn2.click()
      console.info('[OnNewParamRouter_0100] btn2 click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('paramId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[OnNewParamRouter_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[OnNewParamRouter_0100] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('{"msg":"pushUrl One Single"}');

      console.info('OnNewParamRouter_0100 END');
      done();
    });

    /**
     * @tc.number    OnNewParamRouter_0200
     * @tc.name      OnNewParamRouter_0200
     * @tc.desc      Test Router OnNewParam by replaceUrl router.RouterMode.Single
     * @tc.level     Level 2
     */
    it('OnNewParamRouter_0200', 0, async (done: Function) => {
      console.info('OnNewParamRouter_0200 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn2: Component = await driver.findComponent(ON.id('replaceUrlId'));
      await btn2.click()
      console.info('[OnNewParamRouter_0200] btn2 click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('paramId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[OnNewParamRouter_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[OnNewParamRouter_0200] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('test string');

      console.info('OnNewParamRouter_0200 END');
      done();
    });

    /**
     * @tc.number    OnNewParamRouter_0300
     * @tc.name      OnNewParamRouter_0300
     * @tc.desc      Test Router OnNewParam by pushNamedRoute router.RouterMode.Single
     * @tc.level     Level 2
     */
    it('OnNewParamRouter_0300', 0, async (done: Function) => {
      console.info('OnNewParamRouter_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn2: Component = await driver.findComponent(ON.id('pushNamedId'));
      await btn2.click()
      console.info('[OnNewParamRouter_0300] btn2 click');
      await driver.delayMs(1000);

      let strJson: string = getInspectorByKey('paramId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[OnNewParamRouter_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[OnNewParamRouter_0300] content obj is: ' + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('20');

      console.info('OnNewParamRouter_0300 END');
      done();
    });


  })
}