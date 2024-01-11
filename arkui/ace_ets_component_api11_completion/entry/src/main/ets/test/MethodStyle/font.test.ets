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
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
// import Utils from '../../utils/Common'
import CommonFunc from "../../MainAbility/common/Common";
import { Driver, ON } from '@ohos.UiTest';

export default function font() {
  describe('font', function () {
    beforeEach(async function (done) {
      console.info("font beforeEach start");
      let options = {
        uri: 'MainAbility/pages/MethodStyle/font',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get font state success " + JSON.stringify(pages));
        if (!("font" == pages.name)) {
          console.info("get font state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push font page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push font page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("font after each called");
    });

    /**
     * @tc.number      font_001
     * @tc.name        font_001
     * @tc.desc        font test
     * @tc.level       Level 2
     */
    it('font_001', 0, async function (done) {
      console.info('[font_001] START');

      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('font_test'));
      await button.click();
      await CommonFunc.sleep(1000);


      let strJson2 = getInspectorByKey('adjust_test');
      await CommonFunc.sleep(200);
      let obj2 = JSON.parse(strJson2);
      await CommonFunc.sleep(1000);
      expect(obj2.$attrs.content).assertEqual('50');


      let strJson3 = getInspectorByKey('fontSetName_test');
      await CommonFunc.sleep(200);
      let obj3 = JSON.parse(strJson3);
      await CommonFunc.sleep(1000);
      expect(obj3.$attrs.content).assertEqual('');



      let strJson4 = getInspectorByKey('fallback_test');
      await CommonFunc.sleep(200);
      let obj4 = JSON.parse(strJson4);
      await CommonFunc.sleep(1000);
      expect(obj4.$attrs.content).assertEqual('');

      console.info('[font_001] END');
      done();
    });




  })
}


