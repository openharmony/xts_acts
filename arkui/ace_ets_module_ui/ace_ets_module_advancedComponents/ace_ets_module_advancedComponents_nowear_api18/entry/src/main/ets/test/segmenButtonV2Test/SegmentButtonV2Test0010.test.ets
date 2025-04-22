/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, 
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function SegmentButtonV2Test0010() {
  describe('SegmentButtonV2Test0010', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonV2Test0010 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/SegmentButtonV20010",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonV20010" == pages.name)) {
          console.info("get SegmentButtonV2Test0010 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonV2Test0010 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonV2Test0010 page error:" + err);
      }
      console.info("SegmentButtonV2Test0010 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonV2Test0010 after each called");
    });

    /**
     * @tc.number    SegmentButtonV2Test0010_001
     * @tc.name      SegmentButtonV2Test0010_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonV2Test0010_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonV2Test0010_001] START');
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()))
        .$children[0]
        .$children[0]
        .$children[0]
        .$children[5]
        .$children[0]
        .$children[0]
        .$children[1];
      console.info("[SegmentButtonV2Test0010_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('100');
      console.info('[SegmentButtonV2Test0010_001] END');
      done();
    });
  })
}
