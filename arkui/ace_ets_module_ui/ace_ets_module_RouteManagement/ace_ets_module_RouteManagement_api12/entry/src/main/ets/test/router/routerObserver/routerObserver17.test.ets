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


export default function routerObserver17() {
  describe('routerObserver17', () => {
    beforeEach(async (done: Function) => {
      console.info("routerObserver17 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/routerObserver/routerObserver17',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get routerObserver17 state success " + JSON.stringify(pages));
        if (!("routerObserver17" == pages.name)) {
          console.info("get routerObserver17 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push routerObserver17 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push routerObserver17 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("routerObserver17 after each called");
    });

    /**
     * @tc.number    routerObserver17_0100
     * @tc.name      routerObserver17_0100
     * @tc.desc      Test router observer
     * @tc.level     Level 2
     */
    it('routerObserver17_0100', 0, async (done: Function) => {
      console.info('[routerObserver17_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btnOn = await driver.findComponent(ON.id('routerObserver17_on'));
      await btnOn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver17_0100] btnOn click');

      let btn = await driver.findComponent(ON.id('routerObserver17_btn'));
      await btn.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver17_0100] btn click');

      await driver.pressBack()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver17_0100] pressBack');

      let str = AppStorage.get('routerObserver17_observer') + ''
      expect(str).assertEqual('routerObserver17_observer:index:3;name:MainAbility/pages/router/routerObserver/routerObserver017;path:MainAbility/pages/router/routerObserver/routerObserver017.js;state:0;index:2;name:MainAbility/pages/router/routerObserver/routerObserver17;path:MainAbility/pages/router/routerObserver/routerObserver17.js;state:3;index:3;name:MainAbility/pages/router/routerObserver/routerObserver017;path:MainAbility/pages/router/routerObserver/routerObserver017.js;state:2;index:3;name:MainAbility/pages/router/routerObserver/routerObserver017;path:MainAbility/pages/router/routerObserver/routerObserver017.js;state:4;index:3;name:MainAbility/pages/router/routerObserver/routerObserver017;path:MainAbility/pages/router/routerObserver/routerObserver017.js;state:3;index:2;name:MainAbility/pages/router/routerObserver/routerObserver17;path:MainAbility/pages/router/routerObserver/routerObserver17.js;state:2;index:3;name:MainAbility/pages/router/routerObserver/routerObserver017;path:MainAbility/pages/router/routerObserver/routerObserver017.js;state:1;');

      let str2 = AppStorage.get('routerObserver17_LifeCycle') + ''
      expect(str2).assertEqual('routerObserver17_aboutToAppear;routerObserver17_onPageShow;routerObserver017_aboutToAppear;routerObserver17_onPageHide;routerObserver017_onPageShow;routerObserver017_onBackPress;routerObserver017_onPageHide;routerObserver17_onPageShow;routerObserver017_aboutToDisappear');

      let btnOff = await driver.findComponent(ON.id('routerObserver17_off'));
      await btnOff.click()
      await CommonFunc.sleep(2000);
      console.info('[routerObserver17_0100] btnOff click');

      console.info('[routerObserver17_0100] END');
      done();
    });
  })
}

