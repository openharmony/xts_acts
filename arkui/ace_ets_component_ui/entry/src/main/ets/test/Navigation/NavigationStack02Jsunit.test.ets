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
export default function NavigationStack02Jsunit() {
  describe('NavigationStack02Jsunit', function () {
    beforeEach(async function (done) {
      console.info("NavigationStack02Jsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Navigation/NavigationStack02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get NavigationStack02Jsunit state pages:" + JSON.stringify(pages));
        if (!("NavigationStack02" == pages.name)) {
          console.info("get NavigationStack02Jsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push NavigationStack02Jsunit success " + JSON.stringify(result));
          await CommonFunc.sleep(3000);
        }
      } catch (err) {
        console.error("push NavigationStack02Jsunit page error:" + err);
        expect().assertFail();
      }
      done();
    });
    it('NavigationStack02Jsunit_0100', 0, async function (done) {
      console.info('NavigationStack02Jsunit_0100 START')
      await CommonFunc.sleep(1000);
      let driver = await UiDriver.create()
      await CommonFunc.sleep(500);
      let CZbutton = await driver.findComponent(BY.key('NavigationStack02ListItemText1'));
      await CZbutton.click();
      await CommonFunc.sleep(2000);
      let YCbutton = await driver.findComponent(BY.key('NavigationStack02True'));
      await YCbutton.click();
      await CommonFunc.sleep(2000);
      let textcontent = getInspectorByKey('NavigationStack02Navigation');
      let textobj = JSON.parse(textcontent);
      console.info('NavigationStack02Jsunit_0100 component textobj is: ' + textobj.$attrs.backgroundColor);
      expect(textobj.$attrs.backgroundColor).assertEqual('#00000000');
      let strblur = getInspectorByKey('NavigationStack02Blur');
      let blurobj = JSON.parse(strblur);
      console.info('NavigationStack02Jsunit_0100 component blurobj is: ' + blurobj.$attrs.content);
      expect(blurobj.$attrs.content).assertEqual('BlurDone');
      console.info('NavigationStack02Jsunit_0100 END')
      done();
    });

  })
}