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


export default function routerObserver18() {
  describe('routerObserver18', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver18 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver18',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver18 state success " + JSON.stringify(pages));
        if (!("routerObserver18" == pages.name)) {
          console.info("get routerObserver18 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver18 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver18 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver18 after each called");
    });

    /**
     * @tc.number    routerObserver18_0100
     * @tc.name      routerObserver18_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver18_0100', 0, async (done: Function) => {
      console.info('[routerObserver18_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let clear = await driver.findComponent(ON.id('routerObserver18_clear'));
      await clear.click()
      await CommonFunc.sleep(1000);
      console.info('[routerObserver18_0100] clear click');

      let btnOn = await driver.findComponent(ON.id('routerObserver18_on'));
      await btnOn.click()
      await CommonFunc.sleep(1000);
      console.info('[routerObserver18_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver18_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver18_0100] btn click');

      let clear2 = await driver.findComponent(ON.id('routerObserver018_clear'));
      await clear2.click()
      await CommonFunc.sleep(1000);
      console.info('[routerObserver18_0100] clear2 click');

      let str = AppStorage.get('routerObserver18_observer') + ''
      expect(str).assertEqual('routerObserver18_observer:index:2;name:MainAbility/pages/router/routerObserver/routerObserver018;path:MainAbility/pages/router/routerObserver/routerObserver018.js;state:0;index:1;name:MainAbility/pages/router/routerObserver/routerObserver18;path:MainAbility/pages/router/routerObserver/routerObserver18.js;state:3;index:2;name:MainAbility/pages/router/routerObserver/routerObserver018;path:MainAbility/pages/router/routerObserver/routerObserver018.js;state:2;index:1;name:MainAbility/pages/router/routerObserver/routerObserver18;path:MainAbility/pages/router/routerObserver/routerObserver18.js;state:1;');

      let str2 = AppStorage.get('routerObserver18_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver18_aboutToAppear;routerObserver18_onPageShow;routerObserver018_aboutToAppear;routerObserver18_onPageHide;routerObserver018_onPageShow;routerObserver18_aboutToDisappear');

      console.info('[routerObserver18_0100] END');
      done();
    });
  })
}

