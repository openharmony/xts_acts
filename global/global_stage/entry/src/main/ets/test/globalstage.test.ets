/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function globalStageTest() {
    describe("globalStageTest", function () {
        beforeAll(async function () {
            console.info("beforeAll case");
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
        });
        afterAll(function () {
            console.info("afterAll case");
        });

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_0400
         * @tc.name      : getStringSync with resource object and format value
         * @tc.desc      : getStringSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringSync_test_0400', 0, async function (done) {
        let mgr = globalThis.yq.resourceManager;
        try{
            let value = mgr.getStringSync(
            { bundleName:"ohos.acts.globalstage",
                moduleName:"phone",
                id:0x01000000}, 100);
            console.log('getStringSync_test_0400 1' + value);
            expect(value != null).assertTrue();
        }catch(error){
            console.log('getStringSync_test_0400 3' + error.code);
            expect(error.code == 401).assertTrue();
            console.log('getStringSync_test_0400 3' + error.message);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_0410
         * @tc.name      : getStringSync with resource object
         * @tc.desc      : getStringSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringSync_test_0410', 0, async function (done) {
        let mgr = globalThis.yq.resourceManager;
        try{
            let value = mgr.getStringSync(
            { bundleName:"ohos.acts.globalstage",
                moduleName:"phone",
                id:0x01000000});
            console.log('getStringSync_test_0410 1' + value);
            expect(value != null).assertTrue();
        }catch(error){
            console.log('getStringSync_test_0410 2' + error.code);
            expect(error.code == 401).assertTrue();
            console.log('getStringSync_test_0410 3' + error.message);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_0411
         * @tc.name      : getStringByNameSync with resource name
         * @tc.desc      : getStringByNameSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringSync_test_0411', 0, async function (done) {
        try{
            let value = globalThis.yq.resourceManager.getStringByNameSync('app_name');
            console.log('getStringSync_test_0411 1' + value);
            expect(value != null).assertTrue();
        }
        catch(e){
            console.log('getStringSync_test_0411 2' + e.code);
            console.log('getStringSync_test_0411 3' + e.code);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_0411
         * @tc.name      : getStringByNameSync with resource name and format value
         * @tc.desc      : getStringByNameSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringSync_test_0412', 0, async function (done) {
        try{
            let value = globalThis.yq.resourceManager.getStringByNameSync('app_name',100);
            console.log('getStringSync_test_0412 1' + value);
            expect(value != null).assertTrue();
        }
        catch(e){
            console.log('getStringSync_test_0412 2' + e.code);
            console.log('getStringSync_test_0412 3' + e.code);
        }
        done();
        })
    });
}
