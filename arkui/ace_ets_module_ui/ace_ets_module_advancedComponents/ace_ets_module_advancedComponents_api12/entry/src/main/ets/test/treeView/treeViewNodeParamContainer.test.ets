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
import { Driver, ON } from '@ohos.UiTest';
import router from '@system.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function treeViewNodeParamContainer() {
  describe('treeViewNodeParamContainer', function () {
    beforeEach(async function (done: Function) {
      console.info('treeViewNodeParamContainer beforeEach start');
      let options = {
        uri: 'MainAbility/pages/treeView/treeViewNodeParamContainer',
      }
      let result;
      try {
        router.clear();
        let pages = router.getState();
        console.info('get treeViewNodeParamContainer state pages: ' + JSON.stringify(pages));
        if (!('treeViewNodeParamContainer' == pages.name)) {
          console.info('get treeViewNodeParamContainer pages.name: ' + JSON.stringify(pages.name));
          result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push treeViewNodeParamContainer page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push treeViewNodeParamContainer page error: ' + err);
      }

      await Utils.sleep(1000)
      console.info('treeViewNodeParamContainer beforeEach end');
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info('treeViewNodeParamContainer after each called');
    })

    /**
     * @tc.number treeViewNodeParamContainer
     * @tc.name   treeViewNodeParamContainer_0100
     * @tc.desc   Test treeViewNodeParamContainer
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('treeViewNodeParamContainer_0100', 0, async function (done) {
      console.info('[treeViewNodeParamContainer_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看treeViewNodeParamContainer是否存在以下入口。
      let addButton = await driver.findComponent(ON.text('Add'));
      let modifyButton = await driver.findComponent(ON.text('Modify'));
      let RemoveButton = await driver.findComponent(ON.text('Remove'));
      expect(addButton !== null).assertTrue();
      expect(modifyButton !== null).assertTrue();
      expect(RemoveButton !== null).assertTrue();
      await driver.delayMs(2000);
      console.info('[treeViewNodeParamContainer_0100] END');
      done();
    });
  })
}