/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  WindowMode, PointerMatrix, UiDirection, MouseButton } from '@ohos.UiTest';
export default function Waterflow_WaterflowFrictionTest() {
  describe('Waterflow_WaterflowFrictionTest', function () {
    beforeEach(async function (done) {
      console.info("Waterflow_WaterflowFrictionTest beforeEach start");
      let options = {
        url: 'MainAbility/pages/Waterflow/Waterflow_attribute/WaterflowFrictionPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Waterflow_WaterflowFrictionTest state pages:" + JSON.stringify(pages));
        if (!("Waterflow_WaterflowFrictionTest" == pages.name)) {
          console.info("get Waterflow_WaterflowInitialIndex1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Waterflow_WaterflowFrictionTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Waterflow_WaterflowFrictionTest page error:" + err);
      }
      console.info("Waterflow_WaterflowFrictionTest beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("Waterflow_WaterflowFrictionTest after each called");
    });
    /**
     * @tc.number    SUB_ACE_WATERFLOW_WATERFLOWFRICTION_001
     * @tc.name      testWaterflowFriction
     * @tc.desc      set friction to -1
     */
    it('testWaterflowFriction', 0, async function (done) {
      console.info('[testWaterflowFriction] START');
      globalThis.value.message.notify({name:'friction', value:-1})
      let scrollContainerStrJson = getInspectorByKey('Waterflow_WaterflowFriction');
      let scrollContainerObj = JSON.parse(scrollContainerStrJson);
      expect(scrollContainerObj.$type).assertEqual('Waterflow');
      expect(scrollContainerObj.$friction).assertEqual(0.6);
      console.info('[testWaterflowFriction] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_WATERFLOW_WATERFLOWFRICTION_002
     * @tc.name      testWaterflowFriction
     * @tc.desc      set friction to 10
     */
    it('testWaterflowFriction', 0, async function (done) {
      console.info('[testWaterflowFriction] START');
      globalThis.value.message.notify({name:'friction', value:10})
      let scrollContainerStrJson = getInspectorByKey('Waterflow_WaterflowFriction');
      let scrollContainerObj = JSON.parse(scrollContainerStrJson);
      expect(scrollContainerObj.$type).assertEqual('Waterflow');
      expect(scrollContainerObj.$friction).assertEqual(10);
      console.info('[testWaterflowFriction] END');
      done();
    });
  })


}
