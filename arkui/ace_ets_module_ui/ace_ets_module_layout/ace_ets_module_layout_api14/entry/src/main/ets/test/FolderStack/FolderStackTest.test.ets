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

import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FolderStackTest() {
  describe('FolderStackTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FolderStackTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FolderStack/FolderStackTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FolderStackTest state pages:" + JSON.stringify(pages));
        if (!("FolderStackTest" == pages.name)) {
          console.info("get FolderStackTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FolderStackTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FolderStackTest page error:" + err);
      }
      console.info("FolderStackTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number FolderStackTest_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('FolderStackTest_0100', 0, async (done: Function) => {
      console.info('[FolderStackTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('FolderStackTest_FolderStackId');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[FolderStackTest_0100] FolderStack obj is: " + JSON.stringify(obj));
      console.info("[FolderStackTest_0100] FolderStack upperItems is: " + JSON.stringify(obj.$attrs.upperItems));
      expect(obj.$attrs.upperItems).assertContain('upperitemsId');

      console.info('[FolderStackTest_0100] END');
      done();
    });

  })
}