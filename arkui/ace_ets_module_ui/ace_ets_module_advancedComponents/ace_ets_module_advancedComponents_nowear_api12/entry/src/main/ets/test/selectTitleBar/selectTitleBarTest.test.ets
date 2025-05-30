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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';

export default function SelectTitleBarTest() {
  describe('SelectTitleBarTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SelectTitleBarTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectTitleBar/selectTitleBarPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SelectTitleBarTest state pages: ' + JSON.stringify(pages));
        if (!('selectTitleBarPage' == pages.name)) {
          console.info('get SelectTitleBarTest pages.name: ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push SelectTitleBarTest page result successful');
        }
      } catch (err) {
        console.error('push SelectTitleBarTest page error: ' + err);
      }

      await Utils.sleep(1000)
      console.info('SelectTitleBarTest beforeEach end');
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('SelectTitleBarTest after each called');
    })

    /**
     * @tc.number SelectTitleBarTest
     * @tc.name SelectTitleBarTest_0100
     * @tc.desc Test SelectTitleBar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('selectTitleBarTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[selectTitleBarTest_0100] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      // 查看是否存在以下入口。
      let found = await driver.findComponent(ON.text('所有照片'));
      expect(found !== null).assertTrue();
      let button = await driver.findComponent(ON.text('所有照片'));
      await button.click();
      let select = await driver.findComponent(ON.text('本地（设备）'));
      expect(select !== null).assertTrue();
      console.info('[selectTitleBarTest_0100] END');
      done();
    });
  })
}