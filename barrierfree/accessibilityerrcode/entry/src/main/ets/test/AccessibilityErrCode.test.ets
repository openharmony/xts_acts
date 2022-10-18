/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import accessibility from '@ohos.accessibility'

const bundleName = 'com.sample.testfora11y';
const triggerAction = 'accessibilityFocus';
const eventType = 'accessibilityFocus';

export default function abilityTest() {
    describe('AccessibilityErrCode', function () {

        beforeEach(async function (done) {
            console.info(`AccessibilityErrCode: beforeEach starts`);
            done();
        })
    
        afterEach(async function (done) {
            console.info(`AccessibilityErrCode: afterEach starts`);
            setTimeout(done, 1000);
        })
    
        /* Cases for namespace accessibility */
        /*
        * @tc.number  AbilityExtensionList_0100
        * @tc.name    AbilityExtensionList_0100
        * @tc.desc    The parameters input are 'audible' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0100', 0, async function (done) {
            console.info('AbilityExtensionList_0100');
            accessibility.getAccessibilityExtensionList('audible', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0100 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0200
        * @tc.name    AbilityExtensionList_0200
        * @tc.desc    The parameters input are 'audible' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0200', 0, async function (done) {
            console.info('AbilityExtensionList_0200');
            accessibility.getAccessibilityExtensionList('audible', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0200 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0300
        * @tc.name    AbilityExtensionList_0300
        * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0300', 0, async function (done) {
            console.info('AbilityExtensionList_0300');
            accessibility.getAccessibilityExtensionList('generic', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0300 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0400
        * @tc.name    AbilityExtensionList_0400
        * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0400', 0, async function (done) {
            console.info('AbilityExtensionList_0400');
            accessibility.getAccessibilityExtensionList('generic', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0400 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0500
        * @tc.name    AbilityExtensionList_0500
        * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0500', 0, async function (done) {
            console.info('AbilityExtensionList_0500');
            accessibility.getAccessibilityExtensionList('generic', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0500 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0600
        * @tc.name    AbilityExtensionList_0600
        * @tc.desc    The parameters input are 'generic' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0600', 0, async function (done) {
            console.info('AbilityExtensionList_0600');
            accessibility.getAccessibilityExtensionList('generic', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0600 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0700
        * @tc.name    AbilityExtensionList_0700
        * @tc.desc    The parameters input are 'haptic' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0700', 0, async function (done) {
            console.info('AbilityExtensionList_0700');
            accessibility.getAccessibilityExtensionList('haptic', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0700 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0800
        * @tc.name    AbilityExtensionList_0800
        * @tc.desc    The parameters input are 'haptic' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0800', 0, async function (done) {
            console.info('AbilityExtensionList_0800');
            accessibility.getAccessibilityExtensionList('haptic', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0800 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_0900
        * @tc.name    AbilityExtensionList_0900
        * @tc.desc    The parameters input are 'spoken' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_0900', 0, async function (done) {
            console.info('AbilityExtensionList_0900');
            accessibility.getAccessibilityExtensionList('spoken', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_0900 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_0900 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1000
        * @tc.name    AbilityExtensionList_1000
        * @tc.desc    The parameters input are 'spoken' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1000', 0, async function (done) {
            console.info('AbilityExtensionList_1000');
            accessibility.getAccessibilityExtensionList('spoken', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1000 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1000 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1100
        * @tc.name    AbilityExtensionList_1100
        * @tc.desc    The parameters input are 'visual' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1100', 0, async function (done) {
            console.info('AbilityExtensionList_1100');
            accessibility.getAccessibilityExtensionList('visual', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1100 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1100 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1200
        * @tc.name    AbilityExtensionList_1200
        * @tc.desc    The parameters input are 'visual' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1200', 0, async function (done) {
            console.info('AbilityExtensionList_1200');
            accessibility.getAccessibilityExtensionList('visual', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1200 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1200 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1300
        * @tc.name    AbilityExtensionList_1300
        * @tc.desc    The parameters input are 'all' and 'enable', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1300', 0, async function (done) {
            console.info('AbilityExtensionList_1300');
            accessibility.getAccessibilityExtensionList('all', 'enable', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1300 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1300 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1400
        * @tc.name    AbilityExtensionList_1400
        * @tc.desc    The parameters input are 'all' and 'enable', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1400', 0, async function (done) {
            console.info('AbilityExtensionList_1400');
            accessibility.getAccessibilityExtensionList('all', 'enable').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1400 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1400 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1500
        * @tc.name    AbilityExtensionList_1500
        * @tc.desc    The parameters input are 'all' and 'disable', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1500', 0, async function (done) {
            console.info('AbilityExtensionList_1500');
            accessibility.getAccessibilityExtensionList('all', 'disable', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1500 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1500 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1600
        * @tc.name    AbilityExtensionList_1600
        * @tc.desc    The parameters input are 'all' and 'disable', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1600', 0, async function (done) {
            console.info('AbilityExtensionList_1600');
            accessibility.getAccessibilityExtensionList('all', 'disable').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1600 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1600 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1700
        * @tc.name    AbilityExtensionList_1700
        * @tc.desc    The parameters input are 'all' and 'install', test the getAccessibilityExtensionList()
        *             function, and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1700', 0, async function (done) {
            console.info('AbilityExtensionList_1700');
            accessibility.getAccessibilityExtensionList('all', 'install', (err, data) => {
                if (err && err.code != 0) {
                    console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1700 has error: ${err.code}`);
                    expect(null).assertFail();
                    done();
                }
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1700 result ${data.length}`);
                expect(Array.isArray(data)).assertEqual(true);
                done();
            });
        })

        /*
        * @tc.number  AbilityExtensionList_1800
        * @tc.name    AbilityExtensionList_1800
        * @tc.desc    The parameters input are 'all' and 'install', test the getAccessibilityExtensionList() function,
        *             and the output is the list of AccessibilityAbilityInfo
        * @tc.size    SmallTest
        * @tc.type    User
        */
        it('AbilityExtensionList_1800', 0, async function (done) {
            console.info('AbilityExtensionList_1800');
            accessibility.getAccessibilityExtensionList('all', 'install').then((result) => {
                console.info(`AccessibilityErrCodeTest: AbilityExtensionList_1800 result ${result.length}`);
                expect(Array.isArray(result)).assertEqual(true);
                done();
            }).catch((err) => {
                console.error(`AccessibilityErrCodeTest: AbilityExtensionList_1800 has error: ${err}`);
                expect(null).assertFail();
                done();
            });
        })
    })
}