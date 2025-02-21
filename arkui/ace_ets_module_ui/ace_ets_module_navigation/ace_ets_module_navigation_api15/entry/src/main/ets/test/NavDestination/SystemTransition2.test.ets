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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SystemTransition() {
  describe('SystemTransition', () => {
    beforeEach(async (done: Function) => {
      console.info('SystemTransition beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SystemTransition2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SystemTransition state pages:' + JSON.stringify(pages));
        if (!('SystemTransition' == pages.name)) {
          console.info('get SystemTransition pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(1000);
          console.info('push SystemTransition page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SystemTransition page error:' + err);
      }
      console.info('SystemTransition beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SystemTransition after each called');
    });


    /**
     * @tc.number    SystemTransition_0100
     * @tc.name      SystemTransition_0100
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.FADE
     * @tc.level     Level 2
     */
    it('SystemTransition_0100', 0, async (done: Function) => {
      console.info('SystemTransition_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('btnOneId'));
      await btn1.click()
      console.info('[SystemTransition_0100] btn1 click');
      await CommonFunc.sleep(200);


      let strJson: string = getInspectorByKey('pageOneId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SystemTransition_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_0100] systemTransition obj is: ' + JSON.stringify(obj.$attrs.systemTransition));
      expect(obj.$attrs.enableModeChangeAnimation).assertEqual(4);

      console.info('SystemTransition_0100 END');
      done();
    });

    /**
     * @tc.number    SystemTransition_0200
     * @tc.name      SystemTransition_0200
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.FADE
     * @tc.level     Level 2
     */
    it('SystemTransition_0200', 0, async (done: Function) => {
      console.info('SystemTransition_0200 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('popId'));
      await btn1.click()
      console.info('[SystemTransition_0100] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('btnTwoId'));
      await btn2.click()
      console.info('[SystemTransition_0200] btn2 click');
      await CommonFunc.sleep(200);


      let strJson: string = getInspectorByKey('pageTwoId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SystemTransition_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_0200] systemTransition obj is: ' + JSON.stringify(obj.$attrs.systemTransition));
      expect(obj.$attrs.enableModeChangeAnimation).assertEqual(5);;

      console.info('SystemTransition_0200 END');
      done();
    });

    /**
     * @tc.number    SystemTransition_0300
     * @tc.name      SystemTransition_0300
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.FADE
     * @tc.level     Level 2
     */
    it('SystemTransition_0300', 0, async (done: Function) => {
      console.info('SystemTransition_0300 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('popId'));
      await btn1.click()
      console.info('[SystemTransition_0100] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('btnThreeId'));
      await btn2.click()
      console.info('[SystemTransition_0200] btn2 click');
      await CommonFunc.sleep(200);


      let strJson: string = getInspectorByKey('btnThreeId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SystemTransition_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_0300] systemTransition obj is: ' + JSON.stringify(obj.$attrs.systemTransition));
      expect(obj.$attrs.enableModeChangeAnimation).assertEqual(6);

      console.info('SystemTransition_0300 END');
      done();
    });

    /**
     * @tc.number    SystemTransition_0400
     * @tc.name      SystemTransition_0400
     * @tc.desc      Test systemTransition and NavigationSystemTransitionType.FADE
     * @tc.level     Level 2
     */
    it('SystemTransition_0400', 0, async (done: Function) => {
      console.info('SystemTransition_0400 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('popId'));
      await btn1.click()
      console.info('[SystemTransition_0100] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await driver.findComponent(ON.id('btnFourId'));
      await btn2.click()
      console.info('[SystemTransition_0200] btn2 click');
      await CommonFunc.sleep(200);


      let strJson: string = getInspectorByKey('pageFourId');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SystemTransition_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[SystemTransition_0400] systemTransition obj is: ' + JSON.stringify(obj.$attrs.systemTransition));
      expect(obj.$attrs.enableModeChangeAnimation).assertEqual(7);

      console.info('SystemTransition_0400 END');
      done();
    });


  })
}