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
        console.log('*************end globalStageTest*************');

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
         * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0100
         * @tc.name      : getStringSync with resource object and format value
         * @tc.desc      : getStringSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringSync_stagetest_0100', 0, async function (done) {
        let mgr = globalThis.yq.resourceManager;
        try{
            let value = mgr.getStringSync(
            { bundleName:"ohos.acts.globalstage",
                moduleName:"phone",
                id:0x01000000}, 100);
            console.log('getStringSync_stagetest_0100 1' + value);
            expect(value).assertEqual('ohosProject 100');
        }catch(error){
            console.log('getStringSync_stagetest_0100 3' + error.code);
            expect(error.code == 401).assertTrue();
            console.log('getStringSync_stagetest_0100 3' + error.message);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGSYNC_STAGE_0200
         * @tc.name      : getStringSync with resource object
         * @tc.desc      : getStringSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringSync_stagetest_0200', 0, async function (done) {
        let mgr = globalThis.yq.resourceManager;
        try{
            let value = mgr.getStringSync(
            { bundleName:"ohos.acts.globalstage",
                moduleName:"phone",
                id:0x01000000});
            console.log('getStringSync_stagetest_0200 1' + value);
            expect(value).assertEqual('ohosProject %d');
        }catch(error){
            console.log('getStringSync_stagetest_0200 2' + error.code);
            expect(error.code == 401).assertTrue();
            console.log('getStringSync_stagetest_0200 3' + error.message);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0100
         * @tc.name      : getStringByNameSync with resource name
         * @tc.desc      : getStringByNameSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringByNameSync_stagetest_0100', 0, async function (done) {
        try{
            let value = globalThis.yq.resourceManager.getStringByNameSync('app_name');
            console.log('getStringByNameSync_stagetest_0100 1' + value);
            expect(value).assertEqual('ohosProject %d');
        }
        catch(e){
            console.log('getStringByNameSync_stagetest_0100 2' + e.code);
            console.log('getStringByNameSync_stagetest_0100 3' + e.code);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGBYNAME_STAGE_0200
         * @tc.name      : getStringByNameSync with resource name and format value
         * @tc.desc      : getStringByNameSync
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringByNameSync_stagetest_0200', 0, async function (done) {
        try{
            let value = globalThis.yq.resourceManager.getStringByNameSync('app_name',100);
            console.log('getStringByNameSync_stagetest_0200 1' + value);
            expect(value).assertEqual('ohosProject 100');
        }
        catch(e){
            console.log('getStringByNameSync_stagetest_0200 2' + e.code);
            console.log('getStringByNameSync_stagetest_0200 3' + e.code);
        }
        done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_0100
         * @tc.name      : getStringValue with resource name in callback mode
         * @tc.desc      : getStringValue
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringValue_stage_test_0100', 0, async function (done) {
            globalThis.yq.resourceManager.getStringValue({ bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000000}, (err, value) => {
            expect(value !== null).assertTrue();
            console.log('getStringValue_stage_test_0100 ' + value);
            expect(value).assertEqual('ohosProject %d');
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGVALUE_STAGE_0200
         * @tc.name      : getStringValue with resource name in promise mode
         * @tc.desc      : getStringValue
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringValue_stage_test_0200', 0, async function (done) {
            globalThis.yq.resourceManager.getStringValue({ bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000000}).then(value => {
            expect(value !== null).assertTrue();
            console.log('getStringValue_stage_test_0200 ' + value);
            expect(value).assertEqual('ohosProject %d');
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0100
         * @tc.name      : getStringArrayValue with resource name in callback mode
         * @tc.desc      : getStringArrayValue
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringArrayValue_stage_test_0100', 0, async function (done) {
            globalThis.yq.resourceManager.getStringArrayValue({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x0100000A}, (err, value) => {
            expect(value !== null).assertTrue();
            console.log('getStringArrayValue_stage_test_0100 ' + value);
            expect(value[0]).assertEqual('small');
            expect(value[1]).assertEqual('middle');
            expect(value[2]).assertEqual('large');
            expect(value[3]).assertEqual('extra large');
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETSTRINGARRAYVALUE_STAGE_0200
         * @tc.name      : getStringArrayValue with resource name in promise mode
         * @tc.desc      : getStringArrayValue
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getStringArrayValue_stage_test_0200', 0, async function (done) {
            globalThis.yq.resourceManager.getStringArrayValue({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x0100000A}).then(value => {
            expect(value !== null).assertTrue();
            console.log('getStringArrayValue_stage_test_0200 ' + value);
            expect(value[0]).assertEqual('small');
            expect(value[1]).assertEqual('middle');
            expect(value[2]).assertEqual('large');
            expect(value[3]).assertEqual('extra large');
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0100
         * @tc.name      : getMediaContent with resource name in callback mode
         * @tc.desc      : getMediaContent
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContent_stage_test_0100', 0, async function (done) {
            globalThis.yq.resourceManager.getMediaContent({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}, (err, value) => {
            expect(value.length == 6790).assertTrue();
            console.log('getMediaContent_stage_test_0100 ' + value.length);
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0200
         * @tc.name      : getMediaContent with resource name in promise mode
         * @tc.desc      : getMediaContent
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContent_stage_test_0200', 0, async function (done) {
            globalThis.yq.resourceManager.getMediaContent({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}).then(value => {
            expect(value.length == 6790).assertTrue();
            console.log('getMediaContent_stage_test_0200 ' + value.length);
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0300
         * @tc.name      : getMediaContent with resource name and density in callback mode
         * @tc.desc      : getMediaContent
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContent_stage_test_0300', 0, async function (done) {
        globalThis.yq.resourceManager.getMediaContent({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}, 0 , (err, value) => {
            expect(value.length == 6790).assertTrue();
            console.log('getMediaContent_stage_test_0300 ' + value.length);
            done();
        })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENT_STAGE_0400
         * @tc.name      : getMediaContent with resource name and density in promise mode
         * @tc.desc      : getMediaContent
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContent_stage_test_0400', 0, async function (done) {
        globalThis.yq.resourceManager.getMediaContent({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}, 0).then(value => {
            expect(value.length == 6790).assertTrue();
            console.log('getMediaContent_stage_test_0400 ' + value.length);
            done();
        })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0100
         * @tc.name      : getMediaContentBase64 with resource name in callback mode
         * @tc.desc      : getMediaContentBase64
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContentBase64_stage_test_0100', 0, async function (done) {
        globalThis.yq.resourceManager.getMediaContentBase64({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}, (err, value) => {
            expect(value.length == 9078).assertTrue();
            console.log('getMediaContentBase64_stage_test_0100 ' + value.length);
            done();
        })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0200
         * @tc.name      : getMediaContentBase64 with resource name in promise mode
         * @tc.desc      : getMediaContentBase64
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContentBase64_stage_test_0200', 0, async function (done) {
        globalThis.yq.resourceManager.getMediaContentBase64({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}).then(value => {
            expect(value.length == 9078).assertTrue();
            console.log('getMediaContentBase64_stage_test_0200 ' + value.length);
            done();
        })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0300
         * @tc.name      : getMediaContentBase64 with resource name and density in callback mode
         * @tc.desc      : getMediaContentBase64
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContentBase64_stage_test_0300', 0, async function (done) {
        globalThis.yq.resourceManager.getMediaContentBase64({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}, 0 , (err, value) => {
            expect(value.length == 9078).assertTrue();
            console.log('getMediaContentBase64_stage_test_0300 ' + value.length);
            done();
        })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETMEDIACONTENTBASE64_STAGE_0400
         * @tc.name      : getMediaContentBase64 with resource name and density in promise mode
         * @tc.desc      : getMediaContentBase64
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getMediaContentBase64_stage_test_0400', 0, async function (done) {
        globalThis.yq.resourceManager.getMediaContentBase64({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000012}, 0).then(value => {
            expect(value.length == 9078).assertTrue();
            console.log('getMediaContentBase64_stage_test_0400 ' + value.length);
            done();
        })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0100
         * @tc.name      : getPluralStringValue with resource name in callback mode
         * @tc.desc      : getPluralStringValue
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getPluralStringValue_stage_test_0100', 0, async function (done) {
            globalThis.yq.resourceManager.getPluralStringValue({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000011}, 2, (error, value) => {
            expect(value !== null).assertTrue();
            console.log('getPluralStringValue_stage_test_0100 ' + value);
            expect(value).assertEqual('2 apples');
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETPLURALSTRINGVALUE_STAGE_0200
         * @tc.name      : getPluralStringValue with resource name in promise mode
         * @tc.desc      : getPluralStringValue
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getPluralStringValue_stage_test_0200', 0, async function (done) {
            globalThis.yq.resourceManager.getPluralStringValue({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000011}, 2).then(value => {
            expect(value !== null).assertTrue();
            console.log('getPluralStringValue_stage_test_0200 ' + value);
            expect(value).assertEqual('2 apples');
            done();
            })
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETBOOLEAN_STAGE_0100
         * @tc.name      : getBoolean with resource name
         * @tc.desc      : getBoolean
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getBoolean_stage_test_0100', 0, async function (done) {
            let value = globalThis.yq.resourceManager.getBoolean({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x0100000C});
            console.log('getBoolean_stage_test_0100 ' + value);
            expect(value).assertTrue();
            done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETNUMBER_STAGE_0100
         * @tc.name      : getNumber with resource name
         * @tc.desc      : getNumber
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getNumber_stage_test_0100', 0, async function (done) {
            let value = globalThis.yq.resourceManager.getNumber({bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000002});
            console.log('getinteger_stage_test_0100 ' + value);
            expect(value).assertEqual(100);
            done();
        })

        /**
         * @tc.number    : SUB_GLOBAL_GETDRAWABLEDESCRIPTOR_STAGE_0100
         * @tc.name      : getDrawableDescriptor with resource name
         * @tc.desc      : getDrawableDescriptor
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('getDrawableDescriptor_stage_test_0100', 0, async function (done) {
            let out = true;
            let value = globalThis.yq.resourceManager.getDrawableDescriptor(
            { bundleName:"ohos.acts.globalstage", moduleName:"phone", id:0x01000012});
            console.log('getDrawableDescriptor_stage_test_0100 ' + value);
            if(value == null){
            out = false;
            }
            console.log('getDrawableDescriptor_test_2100 ' + out);
            expect(out).assertTrue();
            done();
        })

        /* *
        * @tc.number  SUB_GLOBAL_GETCOLOR_STAGE_JS_0100
        * @tc.name    test getColor method with resource param in callback mode
        * @tc.desc    get the color in callback mode
        */
        it('getColor_test_0100', 0, async function (done) {
            globalThis.yq.resourceManager.getColor({ bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000010}, (err, value) => {
            expect(value !== null).assertTrue();
            console.log('getColor_test_0100 ' + value);
            expect(value).assertEqual(4294967295);
            done();
        })
        })

        /* *
        * @tc.number  SUB_GLOBAL_GETCOLOR_STAGE_JS_0200
        * @tc.name    test getColor method with resource param in promise mode
        * @tc.desc    get the color in promise mode
        */
        it('getColor_test_0200', 0, async function (done) {
            globalThis.yq.resourceManager.getColor({ bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000010}).then(value => {
            expect(value !== null).assertTrue();
            console.log('getColor_test_0200 ' + value);
            expect(value).assertEqual(4294967295);
            done();
        })
        })

        /* *
        * @tc.number  SUB_GLOBAL_GETCOLORSYNC_STAGE_JS_0100
        * @tc.name    test getColorSync method with resource param in promise mode
        * @tc.desc    get the sync color in promise mode
        */
        it('getColorSync_test_0100', 0, async function (done) {
            let value = globalThis.yq.resourceManager.getColorSync({ bundleName:"ohos.acts.globalstage",
            moduleName:"phone",
            id:0x01000010});
            expect(value !== null).assertTrue();
            console.log('getColorSync_test_0100 ' + value);
            expect(value).assertEqual(4294967295);
            done();
        })

        console.log('*************end globalStageTest*************');
    })
}
