/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textInputDecoration() {
  describe('textInputDecoration', function () {
    beforeEach(async function (done) {
      console.info("textInputDecorationTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textInputDecoration',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textInputDecoration state pages: " + JSON.stringify(pages));
        if (!("textInputDecoration" == pages.name)) {
          console.info("get textInputDecoration pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textInputDecoration page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textInputDecoration page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textInputDecoration beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textInputDecoration after each called");
    })

    /**
     * @tc.number textInputDecoration_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textInputDecoration_0100', 0, async function (done) {
      console.info('[textInputDecoration_0100] START');
      let strJson = getInspectorByKey('key_textInput_decoration_001');
      let obj = JSON.parse(strJson);
      console.info("[textInputDecoration_0100] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.decoration).assertEqual('{\"type\":\"TextDecorationType.Underline\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.SOLID\"}');
      console.info('[textInputDecoration_0100] END');
      done();
    });
  })
}