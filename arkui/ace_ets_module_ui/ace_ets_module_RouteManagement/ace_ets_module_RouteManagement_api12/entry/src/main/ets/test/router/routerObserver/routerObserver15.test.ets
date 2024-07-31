/**
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import CommonFunc from '../../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function routerObserver15() {
  describe('routerObserver15', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver15 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver15',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver15 state success " + JSON.stringify(pages));
        if (!("routerObserver15" == pages.name)) {
          console.info("get routerObserver15 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver15 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver15 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver15 after each called");
    });

    /**
     * @tc.number    routerObserver15_0100
     * @tc.name      routerObserver15_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver15_0100', 0, async (done: Function) => {
      console.info('[routerObserver15_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOn = await driver.findComponent(ON.id('routerObserver15_on'));
      await btnOn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver15_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver15_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver15_0100] btn click');

      let btn2 = await driver.findComponent(ON.id('routerObserver015a_btn'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver15_0100] btn2 click');

      let str = AppStorage.get('routerObserver15_observer') + ''
      expect(str).assertEqual('routerObserver15_observer:index:3;name:MainAbility/pages/router/routerObserver/routerObserver015a;path:MainAbility/pages/router/routerObserver/routerObserver015a.js;state:0;index:2;name:MainAbility/pages/router/routerObserver/routerObserver15;path:MainAbility/pages/router/routerObserver/routerObserver15.js;state:3;index:3;name:MainAbility/pages/router/routerObserver/routerObserver015a;path:MainAbility/pages/router/routerObserver/routerObserver015a.js;state:2;index:4;name:MainAbility/pages/router/routerObserver/routerObserver015b;path:MainAbility/pages/router/routerObserver/routerObserver015b.js;state:0;index:3;name:MainAbility/pages/router/routerObserver/routerObserver015a;path:MainAbility/pages/router/routerObserver/routerObserver015a.js;state:3;index:4;name:MainAbility/pages/router/routerObserver/routerObserver015b;path:MainAbility/pages/router/routerObserver/routerObserver015b.js;state:2;index:4;name:MainAbility/pages/router/routerObserver/routerObserver015a;path:MainAbility/pages/router/routerObserver/routerObserver015a.js;state:1;');

      let str2 = AppStorage.get('routerObserver15_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver015a_aboutToAppear;routerObserver015a_onPageShow;routerObserver015b_aboutToAppear;routerObserver015a_onPageHide;routerObserver015b_onPageShow;routerObserver015a_aboutToDisappear');

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver15_0100] pressBack');

      let btnOff = await driver.findComponent(ON.id('routerObserver15_off'));
      await btnOff.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver15_0100] btnOff click');

      console.info('[routerObserver15_0100] END');
      done();
    });
  })
}

