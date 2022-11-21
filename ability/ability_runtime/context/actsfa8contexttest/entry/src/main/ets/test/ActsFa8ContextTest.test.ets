/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import resourceManager from '@ohos.resourceManager';
import bundle from '@ohos.bundle';
import bundleManager from '@ohos.bundle.bundleManager';

export default function actsFa8ContextTest() {
    describe('ActsFa8ContextTest', function () {
        /*
        * @tc.number    : ACTS_FA8Context_0100
        * @tc.name      : get resource by $r
        * @tc.desc      : get resource by $r
        */
        it('ACTS_FA8Context_0100',0, async function (done) {
            await resourceManager.getResourceManager().then(rm => {
                return rm.getString($r("app.string.fa").id)
            }).then(str => {
                console.info("ACTS_FA8Context_0100 str: " + str)
                expect(str).assertEqual("fa_name")
                done()
            }).catch(err => {
                console.info("ACTS_FA8Context_0100 err: " + err)
                expect().assertFail()
                done();
            })
        })

        /*
        * @tc.number    : ACTS_FA8Context_0200
        * @tc.name      : get resource by labelId in applicationInfo
        * @tc.desc      : get resource by labelId in applicationInfo
        */
        it('ACTS_FA8Context_0200',0, async function (done) {
            await Promise.all([
                resourceManager.getResourceManager(),
                bundleManager.getApplicationInfo("com.example.fa8_context", 0)
            ]).then(results => {
                return results[0].getString(Number(results[1].labelId))
            }).then(str => {
                console.info("ACTS_FA8Context_0200 label: " + str)
                expect(str).assertEqual("fa8_module1")
                done()
            }).catch(e => {
                console.info("ACTS_FA8Context_0200 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_FA8Context_0300
        * @tc.name      : get resource by labelId in abilityInfo
        * @tc.desc      : get resource by labelId in abilityInfo
        */
        it('ACTS_FA8Context_0300',0, async function (done) {
            await Promise.all([
                resourceManager.getResourceManager(),
                bundle.getAbilityInfo("com.example.fa8_context", "com.example.module1.MainAbility")
            ]).then(results => {
                return results[0].getString(Number(results[1].labelId))
            }).then(str => {
                console.info("ACTS_FA8Context_0300 label: " + str)
                expect(str).assertEqual("fa8_module1")
                done()
            }).catch(e => {
                console.info("ACTS_FA8Context_0300 error: " + e)
                expect().assertFail()
                done()
            })
        })
    })
}