/*
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

import {describe, beforeAll, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium'
import {UiComponent, UiDriver, Component, Driver, ON, BY, } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function getDisplayId() {
  describe('getDisplayIdTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Drag/getDisplayId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get getDisplayIdTest state pages: ' + JSON.stringify(pages));
        if (!('getDisplayId' == pages.name)) {
          console.info('get getDisplayIdTest state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push getDisplayIdTest success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push getDisplayIdTest page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreDragTest after each called');
    });

    /**
     * @tc.number    getDisplayIdTest_0010
     * @tc.name      getDisplayIdTest_0010
     * @tc.desc      api getDisplayId
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */
    it('getDisplayIdTest_0010', Level.LEVEL1, async (done: Function) => {
      console.info('getDisplayIdTest_0010 START');
      let driver = await Driver.create();
      let grid = await driver.findComponent(ON.id('drag'));
      let button = await driver.findComponent(ON.id('button'));
      await grid.dragTo(button);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('drag');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('button');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[getDisplayIdTest_0010] PreDrag: ' + JSON.stringify(obj));
      console.info('[getDisplayIdTest_0010] PreDrag: ' + JSON.stringify(obj1.$attrs));
      expect(obj1.$attrs.label).assertEqual('0');
      console.info('[getDisplayIdTest_0010] END');
      done();
    });
  })
}