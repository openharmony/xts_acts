/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
export default function NavigationStack03Jsunit() {
  describe('NavigationStack03Jsunit', function () {
    beforeEach(async function (done) {
      console.info("NavigationStack03Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Navigation/NavigationStack03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack03Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack03" == pages.name)) {
          console.info("get NavigationStack03Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationStack03Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack03Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0140 ； SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_HIDENAVBAR_0150
    * @tc.name  : NavigationStack03Jsunit_0100
    * @tc.desc  : If NavPathStack is not used, set the navigation background color backgroundColor.
    * @tc.level : Level 3
    */
    it('NavigationStack03Jsunit_0100', 0, async function (done) {
      console.info('NavigationStack03Jsunit_0100 START')
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(BY.key('NavigationStack03ListItemText1'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack03True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack03Navigation');
      let textobj = JSON.parse(textcontent);
      console.info('NavigationStack03Jsunit_0100 component textobj is: ' + textobj.$attrs.backgroundColor);
      expect(textobj.$attrs.backgroundColor).assertEqual('#00000000');
      let strblur = getInspectorByKey('NavigationStack03Blur');
      let blurobj = JSON.parse(strblur);
      console.info('NavigationStack03Jsunit_0100 component blurobj is: ' + blurobj.$attrs.content);
      expect(blurobj.$attrs.content).assertEqual('BlurDone');
      console.info('NavigationStack03Jsunit_0100 END')
      done();
    });

  })
}