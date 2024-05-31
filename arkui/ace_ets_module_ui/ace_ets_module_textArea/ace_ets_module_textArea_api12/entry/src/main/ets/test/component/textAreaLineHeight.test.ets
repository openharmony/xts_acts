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

export default function textAreaLineHeight() {
  describe('textAreaLineHeight', function () {
    beforeEach(async function (done) {
      console.info("textAreaLineHeightTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaLineHeight',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaLineHeight state pages: " + JSON.stringify(pages));
        if (!("searchLineHeight" == pages.name)) {
          console.info("get textAreaLineHeight pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaLineHeight page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaLineHeight page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textAreaLineHeight beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textAreaLineHeight after each called");
    })

    /**
       * @tc.number textAreaLineHeight_0100
       * @tc.name   Test the properties of components
       * @tc.desc   Set attribute values
       * @tc.size   MediumTest
       * @tc.type   Function
       * @tc.level  0
       */
    it('textAreaLineHeight_0100', 0, async function (done) {
      console.info('[textAreaLineHeight_0100] START');
      let strJson = getInspectorByKey('key_textArea_lineHeight_001');
      let obj = JSON.parse(strJson);
      console.info("[textAreaLineHeight_0100] obj is: " + JSON.stringify(obj.$attrs));
      expect(obj.$attrs.lineHeight).assertEqual('30.00fp');
      console.info('[textAreaLineHeight_0100] END');
      done();
    });
  })
}
