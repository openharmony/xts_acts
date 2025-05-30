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
import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
export default function APIUIContextGetSync() {
  describe('APIUIContextGetSync', () => {
    beforeEach(async (done: Function) => {
      console.info("APIUIContextGetSync beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/componentSnapshot/APIUIContextGetSync',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get APIUIContextGetSync state success " + JSON.stringify(pages));
        if (!("APIUIContextGetSync" == pages.name)) {
          console.info("get APIUIContextGetSync state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push APIUIContextGetSync page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push APIUIContextGetSync page error: " + err);
      }
      done()
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("APIUIContextGetSync after each called");
    });
    /**
     * @tc.number    APIUIContextGetSync_0100
     * @tc.name      APIUIContextGetSync_0100
     * @tc.desc      Test api getSync of componentSnapshot
     * @tc.level     Level 2
     */
    it('APIUIContextGetSync_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[APIUIContextGetSync_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let btn1 = await scrollBar.scrollSearch(ON.id('APIUIContextGetSync_button'));
      await btn1.click()
      await CommonFunc.sleep(3000);
      console.info('[APIUIContextGetSync_0100] btn1 click');
      let strJson1 = getInspectorByKey('APIUIContextGetSync_text');
      await CommonFunc.sleep(1000);
      console.info("[APIUIContextGetSync_0100] obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[APIUIContextGetSync_0100] obj2 is: " + JSON.parse(strJson1).$attrs.content);
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('end');
      console.info('[APIUIContextGetSync_0100] END');
      done();
    });
  })
}