/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import Utils from './common/Utils'
import router from '@system.router';

export default function ActsgetcomponentTest() {
  describe('ActsgetcomponentTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'TestAbility/pages/getcomponent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getcomponent state success " + JSON.stringify(pages));
        if (!("getcomponent" == pages.name)) {
          console.info("get getcomponent state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push getcomponent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getcomponent page error: " + err);
      }
      done()
    });
    afterEach(function () {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    it('ArkUX_Get_component_0010', 0, async function (done) {
      console.info('ArkUX_Get_component_0010 START');
      setTimeout(()=>{
        try{
          let strJson = Utils.getComponentRect('ArkUX_Get_component_0010');
          expect(parseInt(strJson.width)).assertEqual(vp2px(100));
          expect(parseInt(strJson.height)).assertEqual(vp2px(100));
          expect(parseInt(strJson.localOffsetY)).assertEqual(30);
          expect(parseInt(strJson.windowOffsetX)).assertEqual(234);
          expect(parseInt(strJson.windowOffsetY)).assertEqual(102);
          expect(parseInt(strJson.screenOffsetX)).assertEqual(234);
          expect(parseInt(strJson.screenOffsetY)).assertEqual(234);
          console.info('ArkUX_Get_component_0010 END ');
        } catch(err) {
          expect().assertFail()
          console.info('ArkUX_Get_component_0010 ERR  '+ JSON.stringify(err));
        }
        done();
      },500)
    });
  })
}