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
import bundle from '@ohos.bundle';
import bundleManager from '@ohos.bundle.bundleManager';

export default function actsStageContextTest() {
    describe('ActsStageContextTest', function () {
        /*
        * @tc.number    : ACTS_StageContext_0100
        * @tc.name      : get resource by $r
        * @tc.desc      : get resource by $r
        */
        it('ACTS_StageContext_0100',0, async function (done) {
            await globalThis.abilityContext.resourceManager.getString($r("app.string.stage").id).then(str => {
                console.info("ACTS_StageContext_0100 str: " + str)
                expect(str).assertEqual("stage_name")
                done()
            }).catch(err => {
                console.info("ACTS_StageContext_0100 err: " + err)
                expect().assertFail()
                done();
            })
        })

        /*
       * @tc.number    : ACTS_StageContext_0200
       * @tc.name      : get resource by labelId in applicationInfo
       * @tc.desc      : get resource by labelId in applicationInfo
       */
        it('ACTS_StageContext_0200',0, async function (done) {
            await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
                return globalThis.abilityContext.resourceManager.getString(Number(appInfo.labelId))
            }).then(str => {
                console.info("ACTS_StageContext_0200 labelId: " + str)
                expect(str).assertEqual("stage_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_0200 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_0300
        * @tc.name      : get resource by labelId in abilityInfo
        * @tc.desc      : get resource by labelId in abilityInfo
        */
        it('ACTS_StageContext_0300',0, async function (done) {
            await bundle.getAbilityInfo("com.example.stage_app", "MainAbility").then(abilityInfo => {
                return globalThis.abilityContext.resourceManager.getString(Number(abilityInfo.labelId))
            }).then(str => {
                console.info("ACTS_StageContext_0300 labelId: " + str)
                expect(str).assertEqual("stage_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_0300 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_0400
        * @tc.name      : get resource by labelId in applicationInfo from applicationContext
        * @tc.desc      : get resource by labelId in applicationInfo from applicationContext
        */
        it('ACTS_StageContext_0400',0, async function (done) {
            await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
                return globalThis.abilityContext.getApplicationContext().resourceManager.getString(Number(appInfo.labelId))
            }).then(str => {
                console.info("ACTS_StageContext_0400 labelId: " + str)
                expect(str).assertEqual("stage_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_0400 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_0500
        * @tc.name      : get resource by labelId in abilityInfo from applicationContext
        * @tc.desc      : get resource by labelId in abilityInfo from applicationContext
        */
        it('ACTS_StageContext_0500',0, async function (done) {
            await bundle.getAbilityInfo("com.example.stage_app", "MainAbility").then(abilityInfo => {
                return globalThis.abilityContext.getApplicationContext().resourceManager.getString(Number(abilityInfo.labelId))
            }).then(str => {
                console.info("ACTS_StageContext_0500 labelId: " + str)
                expect(str).assertEqual("stage_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_0500 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_0600
        * @tc.name      : get resource by Resource in applicationInfo
        * @tc.desc      : get resource by Resource in applicationInfo
        */
        it('ACTS_StageContext_0600',0, async function (done) {
            await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
                return globalThis.abilityContext.resourceManager.getString(appInfo.labelResource)
            }).then(str => {
                console.info("ACTS_StageContext_0600 labelId: " + str)
                expect(str).assertEqual("stage_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_0600 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_0700
        * @tc.name      : get resource by Resource in applicationInfo
        * @tc.desc      : get resource by Resource in applicationInfo
        */
        it('ACTS_StageContext_0700',0, async function (done) {
            await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
                return globalThis.abilityContext.getApplicationContext().resourceManager.getString(appInfo.labelResource)
            }).then(str => {
                console.info("ACTS_StageContext_0700 labelId: " + str)
                expect(str).assertEqual("stage_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_0700 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_1500
        * @tc.name      : get resource by Resource in applicationInfo from context(API8)
        * @tc.desc      : get resource by Resource in applicationInfo from context(API8)
        */
        it('ACTS_StageContext_1500',0, async function (done) {
            await bundleManager.getApplicationInfo("com.example.fa8_app", 0).then(appInfo => {
                return globalThis.abilityContext.resourceManager.getString(appInfo.labelResource)
            }).then(str => {
                console.info("ACTS_StageContext_1500 labelId: " + str)
                expect(str).assertEqual("fa8_app")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_1500 error: " + e)
                expect().assertFail()
                done()
            })
        })

        /*
        * @tc.number    : ACTS_StageContext_2200
        * @tc.name      : get resource by Resource in applicationInfo from context
        * @tc.desc      : get resource by Resource in applicationInfo from context
        */
        it('ACTS_StageContext_2200',0, async function (done) {
            await bundleManager.getApplicationInfo("com.example.contextapp", 0).then(appInfo => {
                return globalThis.abilityContext.resourceManager.getString(appInfo.labelResource)
            }).then(str => {
                console.info("ACTS_StageContext_2200 labelId: " + str)
                expect(str).assertEqual("ContextApp")
                done()
            }).catch(e => {
                console.info("ACTS_StageContext_2200 error: " + e)
                expect().assertFail()
                done()
            })
        })
    })
}