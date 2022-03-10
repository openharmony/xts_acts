/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import accessibility from '@ohos.accessibility'
const abilityType = 'all';
const abilityState = 'install';

describe('AccessibleAbilityList', function () {

    beforeAll(async function (done) {
        console.info(`AccessibleAbilityList: beforeAll starts`);
        setTimeout(done, 30000);
    })

    beforeEach(async function (done) {
        console.info(`AccessibleAbilityList: beforeEach starts`);
        done();
    })

    afterEach(async function (done) {
        console.info(`AccessibleAbilityList: afterEach starts`);
        setTimeout(done, 1000);
    })

    /******************************************************************************** */
    /* Cases AbilityList_0210-0300 are for accessibility.getAbilityLists() API test   */
    /******************************************************************************** */

    /*
    * @tc.number  AbilityList_0210
    * @tc.name    AbilityList_0210
    * @tc.desc    The parameters input are 'audible' and 'enable', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0210', 0, async function (done) {
        console.info('AbilityList_0210');
        let abilityType = 'audible';
        let abilityState = 'enable';
        accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleAbilityList: AbilityList_0210 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleAbilityList: AbilityList_0210 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(true);
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0220
    * @tc.name    AbilityList_0220
    * @tc.desc    The parameters input are 'audible' and '', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0220', 0, async function (done) {
        console.info('AbilityList_0220');
        let abilityType = 'audible';
        let abilityState = '';
        accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleAbilityList: AbilityList_0220 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleAbilityList: AbilityList_0220 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(true);
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0230
    * @tc.name    AbilityList_0230
    * @tc.desc    The parameters input are 'audible' and null, test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0230', 0, async function (done) {
        console.info('AbilityList_0230');
        let abilityType = 'audible';
        let abilityState = null;
        accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleAbilityList: AbilityList_0230 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleAbilityList: AbilityList_0230 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(true);
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0240
    * @tc.name    AbilityList_0240
    * @tc.desc    The parameters input are '' and 'enable', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0240', 0, async function (done) {
        console.info('AbilityList_0240');
        let abilityType = '';
        let abilityState = 'enable';
        accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleAbilityList: AbilityList_0240 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleAbilityList: AbilityList_0240 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(true);
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0250
    * @tc.name    AbilityList_0250
    * @tc.desc    The parameters input are null and 'enable', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0250', 0, async function (done) {
        console.info('AbilityList_0250');
        let abilityType = null;
        let abilityState = 'enable';
        accessibility.getAbilityLists(abilityType, abilityState, (err, data) => {
            if (err.code != 0) {
                console.error(`AccessibleAbilityList: AbilityList_0250 has error: ${err.code}`);
                expect(null).assertFail();
                done();
            }
            console.info(`AccessibleAbilityList: AbilityList_0250 result ${data.length}`);
            expect(Array.isArray(data)).assertEqual(true);
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0260
    * @tc.name    AbilityList_0260
    * @tc.desc    The parameters input are 'audible' and 'enable', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0260', 0, async function (done) {
        console.info('AbilityList_0260');
        let abilityType = 'audible';
        let abilityState = 'enable';
        accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
            console.info(`AccessibleAbilityList: AbilityList_0260 result ${result.length}`);
            expect(Array.isArray(result)).assertEqual(true);
            done();
        }).catch((err) => {
            console.error(`AccessibleAbilityList: AbilityList_0260 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0270
    * @tc.name    AbilityList_0270
    * @tc.desc    The parameters input are 'audible' and '', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0270', 0, async function (done) {
        console.info('AbilityList_0270');
        let abilityType = 'audible';
        let abilityState = '';
        accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
            console.info(`AccessibleAbilityList: AbilityList_0270 result ${result.length}`);
            expect(Array.isArray(result)).assertEqual(true);
            done();
        }).catch((err) => {
            console.error(`AccessibleAbilityList: AbilityList_0270 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0280
    * @tc.name    AbilityList_0280
    * @tc.desc    The parameters input are 'audible' and null, test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0280', 0, async function (done) {
        console.info('AbilityList_0280');
        let abilityType = 'audible';
        let abilityState = null;
        accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
            console.info(`AccessibleAbilityList: AbilityList_0280 result ${result.length}`);
            expect(Array.isArray(result)).assertEqual(true);
            done();
        }).catch((err) => {
            console.error(`AccessibleAbilityList: AbilityList_0280 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0290
    * @tc.name    AbilityList_0290
    * @tc.desc    The parameters input are '' and 'enable', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0290', 0, async function (done) {
        console.info('AbilityList_0290');
        let abilityType = '';
        let abilityState = 'enable';
        accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
            console.info(`AccessibleAbilityList: AbilityList_0290 result ${result.length}`);
            expect(Array.isArray(result)).assertEqual(true);
            done();
        }).catch((err) => {
            console.error(`AccessibleAbilityList: AbilityList_0290 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })

    /*
    * @tc.number  AbilityList_0300
    * @tc.name    AbilityList_0300
    * @tc.desc    The parameters input are null and 'enable', test the getAbilityLists() function,
    *             and the output is the list of AccessibilityAbilityInfo
    * @tc.size    SmallTest
    * @tc.type    User
    */
    it('AbilityList_0300', 0, async function (done) {
        console.info('AbilityList_0300');
        let abilityType = null;
        let abilityState = 'enable';
        accessibility.getAbilityLists(abilityType, abilityState).then((result) => {
            console.info(`AccessibleAbilityList: AbilityList_0300 result ${result.length}`);
            expect(Array.isArray(result)).assertEqual(true);
            done();
        }).catch((err) => {
            console.error(`AccessibleAbilityList: AbilityList_0300 has error: ${err}`);
            expect(null).assertFail();
            done();
        });
    })
})

