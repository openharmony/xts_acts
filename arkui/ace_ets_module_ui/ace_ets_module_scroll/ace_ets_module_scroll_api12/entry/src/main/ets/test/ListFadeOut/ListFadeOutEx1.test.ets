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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';

export default function ListFadeOutEx1() {
  const SUITE: string = 'ListFadeOutEx1';

  describe('ListFadeOutEx1', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ListFadeOut/ListFadeOutEx1',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListFadeOutEx1" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          }).catch((err: BusinessError) => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error("push ListFadeOutEx1 page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      console.info("ListFadeOutEx1 after each called");
    });
    /**
     * @tc.number    hore_race_test_001
     * @tc.name      fadingEdge_null
     * @tc.desc      list.fadingEdge
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('hore_race_test_003', 0, async (done: Function) => {
      console.info("hore_race_test_003 START");
      let strJson: string = getInspectorByKey('list3');
      expect(JSON.parse(strJson).$attrs.fadingEdge).assertFalse();
      console.info('hore_race_test_003 END');
      done()
    });
  })
}