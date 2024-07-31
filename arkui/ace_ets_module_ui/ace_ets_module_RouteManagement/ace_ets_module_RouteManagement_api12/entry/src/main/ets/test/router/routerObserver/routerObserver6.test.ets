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


export default function routerObserver6() {
  describe('routerObserver6', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver6',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver6 state success " + JSON.stringify(pages));
        if (!("routerObserver6" == pages.name)) {
          console.info("get routerObserver6 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver6 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver6 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver6 after each called");
    });

    /**
     * @tc.number    routerObserver6_0100
     * @tc.name      routerObserver6_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver6_0100', 0, async (done: Function) => {
      console.info('[routerObserver6_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOn = await driver.findComponent(ON.id('routerObserver6_on'));
      await btnOn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver6_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver6_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver6_0100] btn click');

      let btn2 = await driver.findComponent(ON.id('routerObserver06a_btn'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver6_0100] btn2 click');

      let str = AppStorage.get('routerObserver6_observer') + ''
      expect(str).assertEqual('routerObserver6_observer:index:3;name:MainAbility/pages/router/routerObserver/routerObserver06a;path:MainAbility/pages/router/routerObserver/routerObserver06a.js;state:0;index:2;name:MainAbility/pages/router/routerObserver/routerObserver6;path:MainAbility/pages/router/routerObserver/routerObserver6.js;state:3;index:3;name:MainAbility/pages/router/routerObserver/routerObserver06a;path:MainAbility/pages/router/routerObserver/routerObserver06a.js;state:2;index:4;name:MainAbility/pages/router/routerObserver/routerObserver06b;path:MainAbility/pages/router/routerObserver/routerObserver06b.js;state:0;index:3;name:MainAbility/pages/router/routerObserver/routerObserver06a;path:MainAbility/pages/router/routerObserver/routerObserver06a.js;state:3;index:4;name:MainAbility/pages/router/routerObserver/routerObserver06b;path:MainAbility/pages/router/routerObserver/routerObserver06b.js;state:2;index:4;name:MainAbility/pages/router/routerObserver/routerObserver06a;path:MainAbility/pages/router/routerObserver/routerObserver06a.js;state:1;');

      let str2 = AppStorage.get('routerObserver6_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver06a_aboutToAppear;routerObserver06a_onPageShow;routerObserver06b_aboutToAppear;routerObserver06a_onPageHide;routerObserver06b_onPageShow;routerObserver06a_aboutToDisappear');

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver6_0100] pressBack');

      let btnOff = await driver.findComponent(ON.id('routerObserver6_off'));
      await btnOff.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver6_0100] btnOff click');

      console.info('[routerObserver6_0100] END');
      done();
    });
  })
}

