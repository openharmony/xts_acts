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


export default function routerObserver9() {
  describe('routerObserver9', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver9 state success " + JSON.stringify(pages));
        if (!("routerObserver9" == pages.name)) {
          console.info("get routerObserver9 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver9 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver9 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver9 after each called");
    });

    /**
     * @tc.number    routerObserver9_0100
     * @tc.name      routerObserver9_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver9_0100', 0, async (done: Function) => {
      console.info('[routerObserver9_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let clear = await driver.findComponent(ON.id('routerObserver9_clear'));
      await clear.click()
      await CommonFunc.sleep(1000);
      console.info('[routerObserver9_0100] clear click');

      let btnOn = await driver.findComponent(ON.id('routerObserver9_on'));
      await btnOn.click()
      await CommonFunc.sleep(1000);
      console.info('[routerObserver9_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver9_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver9_0100] btn click');

      let clear2 = await driver.findComponent(ON.id('routerObserver09_clear'));
      await clear2.click()
      await CommonFunc.sleep(1000);
      console.info('[routerObserver9_0100] clear2 click');

      let str = AppStorage.get('routerObserver9_observer') + ''
      expect(str).assertEqual('routerObserver9_observer:index:2;name:MainAbility/pages/router/routerObserver/routerObserver09;path:MainAbility/pages/router/routerObserver/routerObserver09.js;state:0;index:1;name:MainAbility/pages/router/routerObserver/routerObserver9;path:MainAbility/pages/router/routerObserver/routerObserver9.js;state:3;index:2;name:MainAbility/pages/router/routerObserver/routerObserver09;path:MainAbility/pages/router/routerObserver/routerObserver09.js;state:2;index:1;name:MainAbility/pages/router/routerObserver/routerObserver9;path:MainAbility/pages/router/routerObserver/routerObserver9.js;state:1;');

      let str2 = AppStorage.get('routerObserver9_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver9_aboutToAppear;routerObserver9_onPageShow;routerObserver09_aboutToAppear;routerObserver9_onPageHide;routerObserver09_onPageShow;routerObserver9_aboutToDisappear');

      console.info('[routerObserver9_0100] END');
      done();
    });
  })
}

