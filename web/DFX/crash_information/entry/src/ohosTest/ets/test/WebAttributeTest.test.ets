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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONRENDEREXITED_0100
    * @tc.name        : testOnRenderExited001
    * @tc.desc        : test onRenderExited RenderExitReason.ProcessCrashed
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnRenderExited001', 0, async (done: Function) => {
      Utils.emitEvent("emitOnRenderExited", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testOnRenderExited001", RenderExitReason.ProcessCrashed, 60106, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
    /*
    * @tc.number     : SUB_WEB_RENDEREXITREASONPROCESSCRASHED_0100
    * @tc.name       : testRenderExitReasonProcessCrashed001
    * @tc.desc       : test RenderExitReasonProcessCrashed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testRenderExitReasonProcessCrashed001', 0, async (done: Function) => {
      Utils.emitEvent("emitRenderExitReasonProcessCrashed", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testRenderExitReasonProcessCrashed001", 2, 901, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
