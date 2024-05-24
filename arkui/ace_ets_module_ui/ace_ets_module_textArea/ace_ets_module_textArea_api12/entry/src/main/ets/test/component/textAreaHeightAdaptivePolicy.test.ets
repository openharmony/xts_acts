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
import events_emitter from '@ohos.events.emitter'
import Utils from '../Utils';

export default function textAreaHeightAdaptivePolicyTest() {
  describe('textAreaHeightAdaptivePolicyTest', function () {
    beforeEach(async function (done) {
      console.info("textAreaHeightAdaptivePolicyTest beforeEach start");
      let options = {
        uri: 'MainAbility/pages/component/textAreaHeightAdaptivePolicy',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info("get textAreaHeightAdaptivePolicy state pages: " + JSON.stringify(pages));
        if (!("textAreaHeightAdaptivePolicy" == pages.name)) {
          console.info("get textAreaHeightAdaptivePolicy pages.name: " + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push textAreaHeightAdaptivePolicy page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textAreaHeightAdaptivePolicy page error: " + err);
      }

      await Utils.sleep(1000)
      console.info("textAreaHeightAdaptivePolicy beforeEach end");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("textAreaHeightAdaptivePolicy after each called");
    })

    /**
     * @tc.number textAreaHeightAdaptivePolicy0100
     * @tc.name   Test the TextInputHeightAdaptivePolicy property of the textInput component
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textAreaHeightAdaptivePolicy0100', 0, async function (done) {
      var tagName = 'textAreaHeightAdaptivePolicy0100';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textArea_heightAdaptivePolicy_001');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.LAYOUT_CONSTRAINT_FIRST")

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
     * @tc.number textAreaHeightAdaptivePolicy0200
     * @tc.name   Test the textOverflow property of the textInput component
     * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.MAX_LINES_FIRST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('textAreaHeightAdaptivePolicy0200', 0, async function (done) {
      var tagName = 'textAreaHeightAdaptivePolicy0200';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textArea_heightAdaptivePolicy_002');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.MAX_LINES_FIRST")

      console.info('[' + tagName + '] END ===========================');
      done();
    });

    /**
    * @tc.number textAreaHeightAdaptivePolicy0300
    * @tc.name   Test the textOverflow property of the textInput component
    * @tc.desc   set the textOverflow property value is TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  0
    */
    it('textAreaHeightAdaptivePolicy0300', 0, async function (done) {
      var tagName = 'textAreaHeightAdaptivePolicy0300';
      console.info('[' + tagName + '] START============================');

      let strJsonNew = getInspectorByKey('key_textArea_heightAdaptivePolicy_003');
      let obj = JSON.parse(strJsonNew);
      console.info('[' + tagName + '] TextArea heightAdaptivePolicy is: ' + JSON.stringify(obj.$attrs.heightAdaptivePolicy));

      expect(obj.$attrs.heightAdaptivePolicy).assertEqual("TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST")

      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}
