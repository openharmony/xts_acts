/*
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
import CommonFunc from '../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function Navigation() {
  describe('Navigation', () => {
    beforeEach(async (done: Function) => {
      console.info("Navigation beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Navigation state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get Navigation pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Navigation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Navigation page error:" + err);
      }
      console.info("Navigation beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number    : ArkUI_Navigation_0001
     * @tc.name      : test initial state
     * @tc.desc      : expect dialog at 88vp to bottom
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('ArkUI_Navigation_0001', 0, async (done: Function) => {
      let CASE = 'ArkUI_Navigation_0001'
      console.info(`${SUITE} ${CASE} START`);

      await CommonFunc.sleep(2000)
      let baseKey = 'Navigation_Dialog1'
      let strJson = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.isBlurEnabled).assertEqual('false')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}
