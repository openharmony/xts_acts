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

import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebInitTest afterEach end");
      done();
    })

    /*
     *@tc.number SUB_ACE_WEB_AVOIDAREA_API_0005
     *@tc.name testWebViewAvoidArea05
     *@tc.desc test onAvoidAreaChange
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 0
     */
    it('testWebViewAvoidArea05', 0, async (done: Function) => {
      Utils.emitEvent("emitWebViewAvoidArea05", 10)
      await Utils.sleep(2000);
      Utils.registerEvent('testWebViewAvoidArea05', 'success', 6205, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
  })
}
