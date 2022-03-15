/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';

export default function customDialogControllerJsunit() {
  describe('customDialogControllerTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/customDialogController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customDialogController state success " + JSON.stringify(pages));
        if (!("customDialogController" == pages.name)) {
          console.info("get customDialogController state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(4000);
          console.info("push customDialogController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customDialogController page error " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("customDialogControllers after each called");
    });

    it('testCustomDialogControllers_100', 0, async function (done) {
      console.info('[testCustomDialogControllers_100] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('dialogController');
      let obj = JSON.parse(strJson);
      console.info("testCustomDialogControllers_100 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual("100.000000vp");
      console.info('testCustomDialogControllers_100 END');
      done();
    });

    it('testCustomDialogControllers_200', 0, async function (done) {
      console.info('[testCustomDialogControllers_200] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('dialogController');
      let obj = JSON.parse(strJson);
      console.info("testCustomDialogControllers_200 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual("100.000000vp");
      console.info('testCustomDialogControllers_200 END');
      done();
    });

    it('testCustomDialogControllers_300', 0, async function (done) {
      console.info('[testCustomDialogControllers_300] START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('dialogController');
      let obj = JSON.parse(strJson);
      console.info("testCustomDialogControllers_300 component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.width).assertEqual("100.000000vp");
      console.info('testCustomDialogControllers_300 END');
      done();
    });
  })
}