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


export default function routerObserver11() {
  describe('routerObserver11', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver11',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver11 state success " + JSON.stringify(pages));
        if (!("routerObserver11" == pages.name)) {
          console.info("get routerObserver11 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver11 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver11 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver11 after each called");
    });

    /**
     * @tc.number    routerObserver11_0100
     * @tc.name      routerObserver11_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver11_0100', 0, async (done: Function) => {
      console.info('[routerObserver11_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOn = await driver.findComponent(ON.id('routerObserver11_on'));
      await btnOn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver11_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver11_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver11_0100] btn click');

      let btn2 = await driver.findComponent(ON.id('routerObserver011a_btn'));
      await btn2.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver11_0100] btn2 click');

      let str = AppStorage.get('routerObserver11_observer') + ''
      expect(str).assertEqual('routerObserver11_observer:index:3;name:MainAbility/pages/router/routerObserver/routerObserver011a;path:MainAbility/pages/router/routerObserver/routerObserver011a.js;state:0;index:2;name:MainAbility/pages/router/routerObserver/routerObserver11;path:MainAbility/pages/router/routerObserver/routerObserver11.js;state:3;index:3;name:MainAbility/pages/router/routerObserver/routerObserver011a;path:MainAbility/pages/router/routerObserver/routerObserver011a.js;state:2;index:4;name:MainAbility/pages/router/routerObserver/routerObserver011b;path:MainAbility/pages/router/routerObserver/routerObserver011b.js;state:0;index:3;name:MainAbility/pages/router/routerObserver/routerObserver011a;path:MainAbility/pages/router/routerObserver/routerObserver011a.js;state:3;index:4;name:MainAbility/pages/router/routerObserver/routerObserver011b;path:MainAbility/pages/router/routerObserver/routerObserver011b.js;state:2;');

      let str2 = AppStorage.get('routerObserver11_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver011a_aboutToAppear;routerObserver011a_onPageShow;routerObserver011b_aboutToAppear;routerObserver011a_onPageHide;routerObserver011b_onPageShow');

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver11_0100] pressBack');

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver11_0100] pressBack2');

      let btnOff = await driver.findComponent(ON.id('routerObserver11_off'));
      await btnOff.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver11_0100] btnOff click');

      console.info('[routerObserver11_0100] END');
      done();
    });
  })
}

