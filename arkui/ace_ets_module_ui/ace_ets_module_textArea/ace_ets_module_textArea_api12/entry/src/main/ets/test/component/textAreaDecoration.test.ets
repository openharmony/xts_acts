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

export default function textAreaDecoration() {
  describe('textAreaDecoration', function () {
    beforeEach(async function (done) {
      console.info("textAreaDecorationTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaDecoration',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaDecoration state pages: " + JSON.stringify(pages));
        if (!("textAreaDecoration" == pages.name)) {
          console.info("get textAreaDecoration pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaDecoration page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaDecoration page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textAreaDecoration beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textAreaDecoration after each called");
    })

    /**
     * @tc.number textAreaDecoration_0100
     * @tc.name   Test the properties of components
     * @tc.desc   Set attribute values
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textAreaDecoration_0100', 0, async function (done) {
      console.info('[textAreaDecoration_0100] START');
      let strJson = getInspectorByKey('key_textArea_decoration_001');
      let obj = JSON.parse(strJson);
      console.info("[textAreaDecoration_0100] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.decoration).assertEqual('{\"type\":\"TextDecorationType.Underline\",\"color\":\"#FFFF0000\",\"style\":\"TextDecorationStyle.SOLID\"}');
      console.info('[textAreaDecoration_0100] END');
      done();
    });
  })
}