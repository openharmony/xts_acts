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
import router from '@system.router';
import Utils from './Utils';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import events_emitter from '@ohos.events.emitter';

export default function gridColJsunit() {
  describe('gridColTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/gridCol',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridCol state success " + JSON.stringify(pages));
        if (!("gridCol" == pages.name)) {
          console.info("get gridCol state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push gridCol page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridCol page error: " + err);
      }
      done();
    });

    /**
     * @tc.number gridColTest_0001
     * @tc.name   Test the properties of components
     * @tc.desc   Set order values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('gridColTest_0001', 0, async function (done) {
      console.info('gridColTest_0001 START');
      let strJsonNew = getInspectorByKey('gridCol');
      let objNew = JSON.parse(strJsonNew);
      console.info("gridColTest_0001 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.order).assertEqual("1");
      console.info('gridColTest_0001 END');
      done();
    });

    /**
     * @tc.number gridColTest_0002
     * @tc.name   Test the properties of components
     * @tc.desc   Set gridColOffset values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('gridColTest_0002', 0, async function (done) {
      console.info('gridColTest_0002 START');
      let strJsonNew = getInspectorByKey('gridCol');
      let objNew = JSON.parse(strJsonNew);
      console.info("gridColTest_0002 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.gridColOffset).assertEqual("1");
      console.info('gridColTest_0002 END');
      done();
    });

    /**
     * @tc.number gridColTest_0003
     * @tc.name   Test the properties of components
     * @tc.desc   Set span values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('gridColTest_0003', 0, async function (done) {
      console.info('gridColTest_0003 START');
      let strJsonNew = getInspectorByKey('gridCol');
      let objNew = JSON.parse(strJsonNew);
      console.info("gridColTest_0003 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.span).assertEqual("10");
      console.info('gridColTest_0003 END');
      done();
    });

    /**
     * @tc.number gridColTest_0004
     * @tc.name   Test the properties of components
     * @tc.desc   Change order values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('gridColTest_0004', 0, async function (done) {

      console.info('gridColTest_0004 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)

      let strJsonNew = getInspectorByKey('gridCol');
      let objNew = JSON.parse(strJsonNew);
      console.info("gridColTest_0004 component  is: " + JSON.stringify(objNew.$attrs));

      expect(objNew.$attrs.order).assertEqual("2");
      console.info('gridColTest_0004 END');
      done();
    });
  })
}