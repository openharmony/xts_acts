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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../Utils';
export default function themePageSliderTest() {
  describe('themePageSliderTest', function () {
    beforeEach(async function (done) {
      console.info("themePageTest beforeEach start");
      let options : router.RouterOptions = {
        url: "MainAbility/pages/theme/themePageSliderTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get themePageSliderTest state pages: " + JSON.stringify(pages));
        if (!("themePageSliderTest" == pages.name)) {
          console.info("get themePageSliderTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await Utils.sleep(2000);
          console.info("push themePageSliderTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push themePageSliderTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    themeColorTest
     * @tc.name      themeInterfaceSliderIsValidTest_0100
     * @tc.desc      theme Test
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('themeInterfaceSliderIsValidTest_0100', 0, async function (done) {
      console.info('themeInterfaceSliderIsValidTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      // click to change the skin
      let button = await driver.findComponent(ON.id('themeSliderClick'));
      await button.click();
      await Utils.sleep(2000);
      // test the color whether change
      let strJson = getInspectorByKey('sliderBg');
      let obj = JSON.parse(strJson);
      console.info("[themeInterfaceIsValidTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[themeInterfaceIsValidTest_0100] component obj is: " + obj.$attrs.backgroundColor);
      console.info("[themeInterfaceIsValidTest_0100] component obj is: " + obj.$attrs.blockBorderColor);
      console.info("[themeInterfaceIsValidTest_0100] component obj is: " + obj.$attrs.trackColor);
      console.info("[themeInterfaceIsValidTest_0100] component obj is: " + obj.$attrs.selectedColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000');
      expect(obj.$attrs.blockBorderColor).assertEqual('#00000000');
      expect(obj.$attrs.trackColor).assertEqual('#1111FF11');
      expect(obj.$attrs.selectedColor).assertEqual('#FF007DFF');
      console.info('[themeInterfaceIsValidTest_0100] END');
      done();
    });

  })
}

