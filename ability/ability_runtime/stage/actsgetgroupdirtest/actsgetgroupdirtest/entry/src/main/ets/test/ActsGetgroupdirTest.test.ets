/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsGetgroupdirTest() {
  describe('ActsGetgroupdirTest', function () {
    beforeAll(function () {})
    beforeEach(function () {})
    afterEach(function () {})
    afterAll(function () {})
    /*
     * @tc.number  AMS_getGroupDir_001
     * @tc.name    getGroupDir
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('AMS_getGroupDir_001',0, async function (done) {
      console.log("start AMS_getGroupDir_001 =====>");
      let res;
      await globalThis.myContext.getGroupDir("context_test1").then(data => {
        console.error("getGroupDir AMS_getGroupDir_001 ====> result data" + data);
        expect(data).assertContain("/data/storage/el2/group");
      }).catch((error) => {
        console.error("getGroupDir AMS_getGroupDir_001 ====> result err" + JSON.stringify(error));
        expect().assertFail();
      });
      done();
    })

    /*
     * @tc.number  AMS_getGroupDir_002
     * @tc.name    getGroupDir
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('AMS_getGroupDir_002',0, async function (done) {
      console.log("start AMS_getGroupDir_002 =====>");
      await globalThis.myContext.getGroupDir("111").then(data => {
        console.error("getGroupDir AMS_getGroupDir_002 ====> result data" + data);
        expect(data).assertEqual("");
      }).catch((error) => {
        console.error("getGroupDir AMS_getGroupDir_002 ====> result err" + JSON.stringify(error));
        expect().assertFail();
      });
      done();
    })

    /*
     * @tc.number  AMS_getGroupDir_003
     * @tc.name    getGroupDir
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('AMS_getGroupDir_003',0, async function (done) {
      console.log("start AMS_getGroupDir_003 =====>");
      await globalThis.myContext.getGroupDir("context_hap1").then(data => {
        console.error("getGroupDir AMS_getGroupDir_003 ====> result data" + data);
        expect(data).assertEqual("");
      }).catch((error) => {
        console.error("getGroupDir AMS_getGroupDir_003 ====> result err" + JSON.stringify(error));
        expect().assertFail();
      });
      done();
    })

    /*
     * @tc.number  AMS_getGroupDir_004
     * @tc.name    getGroupDir
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('AMS_getGroupDir_004',0, async function (done) {
      console.log("start AMS_getGroupDir_004 =====>");
      await globalThis.myContext.getGroupDir("context_test1", (err, data) => {
        console.error("AMS_getGroupDir_004 ====> result data" + data);
        console.error("AMS_getGroupDir_004 ====> result err" + JSON.stringify(err));
        expect(data).assertContain("/data/storage/el2/group");
        expect(err).assertNull();
        done();
      })
    })

    /*
     * @tc.number  AMS_getGroupDir_005
     * @tc.name    getGroupDir
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('AMS_getGroupDir_005',0, async function (done) {
      console.log("start AMS_getGroupDir_005 =====>");
      await globalThis.myContext.getGroupDir("", (err, data) => {
        console.error("AMS_getGroupDir_005 ====> result data" + data);
        console.error("AMS_getGroupDir_005 ====> result err" + JSON.stringify(err));
        expect(data).assertEqual("");
        expect(err).assertNull();
        done();
      })
    })

    /*
     * @tc.number  AMS_getGroupDir_006
     * @tc.name    getGroupDir
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('AMS_getGroupDir_006',0, async function (done) {
      console.log("start AMS_getGroupDir_006 =====>");
      await globalThis.myContext.getGroupDir("context_hap1", (err, data) => {
        console.error("AMS_getGroupDir_006 ====> result data" + data);
        console.error("AMS_getGroupDir_006 ====> result err" + JSON.stringify(err));
        expect(data).assertEqual("");
        expect(err).assertNull();
        done();
      })
    })
  })
}