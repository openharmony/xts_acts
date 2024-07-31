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


export default function routerObserver7() {
  describe('routerObserver7', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver7',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver7 state success " + JSON.stringify(pages));
        if (!("routerObserver7" == pages.name)) {
          console.info("get routerObserver7 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver7 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver7 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver7 after each called");
    });

    /**
     * @tc.number    routerObserver7_0100
     * @tc.name      routerObserver7_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver7_0100', 0, async (done: Function) => {
      console.info('[routerObserver7_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOn = await driver.findComponent(ON.id('routerObserver7_on'));
      await btnOn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver7_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver7_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver7_0100] btn click');

      let btn2 = await driver.findComponent(ON.id('routerObserver07_btn'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver7_0100] btn2 click');

      let str = AppStorage.get('routerObserver7_observer') + ''
      expect(str).assertEqual('routerObserver7_observer:index:3;name:MainAbility/pages/router/routerObserver/routerObserver07;path:MainAbility/pages/router/routerObserver/routerObserver07.js;state:0;index:2;name:MainAbility/pages/router/routerObserver/routerObserver7;path:MainAbility/pages/router/routerObserver/routerObserver7.js;state:3;index:3;name:MainAbility/pages/router/routerObserver/routerObserver07;path:MainAbility/pages/router/routerObserver/routerObserver07.js;state:2;index:3;name:MainAbility/pages/router/routerObserver/routerObserver07;path:MainAbility/pages/router/routerObserver/routerObserver07.js;state:3;index:2;name:MainAbility/pages/router/routerObserver/routerObserver7;path:MainAbility/pages/router/routerObserver/routerObserver7.js;state:2;index:3;name:MainAbility/pages/router/routerObserver/routerObserver07;path:MainAbility/pages/router/routerObserver/routerObserver07.js;state:1;');

      let str2 = AppStorage.get('routerObserver7_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver7_aboutToAppear;routerObserver7_onPageShow;routerObserver07_aboutToAppear;routerObserver7_onPageHide;routerObserver07_onPageShow;routerObserver07_onPageHide;routerObserver7_onPageShow;routerObserver07_aboutToDisappear');

      let btnOff = await driver.findComponent(ON.id('routerObserver7_off'));
      await btnOff.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver7_0100] btnOff click');

      console.info('[routerObserver7_0100] END');
      done();
    });
  })
}

