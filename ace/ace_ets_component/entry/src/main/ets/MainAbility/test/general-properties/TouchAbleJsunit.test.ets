// @ts-nocheck
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
import Utils from '../Utils.ets';

export default function touchAbleJsunit() {
  beforeEach(async function (done) {
    console.info("touchAble beforeEach start");
    let options = {
      uri: 'pages/general-properties/touchAble',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info("get touchAble state pages:" + JSON.stringify(pages));
      if (!("touchAble" == pages.name)) {
        console.info("get touchAble state pages.name:" + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2000);
        console.info("push touchAble page result:" + JSON.stringify(result));
      }
    } catch (err) {
      console.error("push touchAble page error:" + JSON.stringify(result));
    }
    done()
  });

  afterEach(async function () {
    await Utils.sleep(1000);
    console.info("touchAble after each called");
  });

  it('testTouchAble001', 0, async function (done) {
    await Utils.sleep(1000)
    let strJson = getInspectorByKey('ellipse');
    let obj = JSON.parse(strJson);
    console.info("[testTouchAble001] component obj is: " + JSON.stringify(obj));
    expect(obj.$attrs.touchable).assertEqual(false);
    done();
  });
}