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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function tabTitleBarLabelTest() {
  describe('tabTitleBarLabelTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabTitleBarLabelTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/tabTitleBar/tabTitleBarLabelTest',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabTitleBarLabelTest state pages: " + JSON.stringify(pages));
        if (!("tabTitleBarLabelTest" == pages.name)) {
          console.info("get tabTitleBarLabelTest pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push tabTitleBarLabelTest page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("tabTitleBarLabelTest beforeEach end");
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("tabTitleBarLabelTest after each called");
    })

    /**
     * @tc.number tabTitleBarLabelTest
     * @tc.name tabTitleBarLabelTest_0100
     * @tc.desc Test tabTitleBarLabelPage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('tabTitleBarLabelTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[tabTitleBarLabelTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看tabTitleBarLabelTest是否存在以下入口。
      let tab1 = await driver.findComponent(ON.text("tab1"));
      expect(tab1 !== null).assertTrue();
      console.info('[tabTitleBarLabelTest_0100] END');
      done();
    });
  })
}