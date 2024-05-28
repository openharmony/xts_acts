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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function marqueeOptionsTest() {
  describe('marqueeOptionsTest', function () {
    beforeEach(async function (done) {
      console.info("marqueeOptionsTest beforeEach start");
      let options = {
        url: "MainAbility/pages/Text/TextAPI/marquee",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get marqueeOptionsTest state pages:" + JSON.stringify(pages));
        if (!("marqueeOptionsTest" == pages.name)) {
          console.info("get marqueeOptionsTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push marqueeOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marqueeOptionsTest page error:" + err);
      }
      console.info("marqueeOptionsTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("marqueeOptionsTest after each called");
    });

    /**
     * @tc.number    marqueeOptionsTest
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */
    it('marqueeOptionsTest_001', 0, async function (done) {
      console.info('[marqueeOptionsTest_001] START');
      await CommonFunc.sleep(1000);
      let marqueeOptions = getInspectorByKey('marqueeOptions');
      console.info('marqueeOptions-----' + JSON.parse(marqueeOptions).$attrs.marqueeOptions);
      await CommonFunc.sleep(2000);
      expect(JSON.parse(marqueeOptions).$attrs.marqueeOptions).assertEqual('{"start":true,"step":"9.00","loop":"-1","direction":"MarqueeDirection.LEFT","delay":"0","fadeout":false,"startPolicy":"MarqueeStartPolicy.DEFAULT"}');
      console.info('[marqueeOptionsTest_001] END');
      done();
    });

    it('onMarqueeStateChangeTest_001', 0, async function (done) {
      console.info('[onMarqueeStateChangeTest_001] START');
      await CommonFunc.sleep(1000);
      let MarqueeState = getInspectorByKey('MarqueeState');
      await CommonFunc.sleep(2000);
      console.info('MarqueeState-----' + JSON.parse(MarqueeState).$attrs.content);
      await CommonFunc.sleep(1000);
      expect(JSON.parse(MarqueeState).$attrs.content).assertEqual('START');
      console.info('[onMarqueeStateChangeTest_001] END');
      done();
    });

  })
}
