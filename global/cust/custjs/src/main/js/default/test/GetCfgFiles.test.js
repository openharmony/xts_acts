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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

import cust from '@ohos.cust'

describe('GetCfgFilesTest', function () {

    /* *
    * @tc.number SUB_CUST_JS_003
    * @tc.name test getCfgFiles method in callback mode
    * @tc.desc get getCfgFiles in callback mode
    */
    it('getCfgFiles_test_003', 0, async function (done) {
        cust.getCfgFiles('custxml/none.xml', (error, value) => {
            expect(value.length == 0).assertTrue();
            console.log('CustTest getCfgFiles_test_003, none.xml:' + value);
        });
        cust.getCfgFiles('custxml/system.xml', (error, value) => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getCfgFiles_test_003, system.xml:' + value);
        });
        cust.getCfgFiles('custxml/both.xml', (error, value) => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getCfgFiles_test_003, both.xml:' + value);
        });
        cust.getCfgFiles('custxml/user.xml', (error, value) => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getCfgFiles_test_003, user.xml:' + value);
        });
        done();
    })

    /* *
    * @tc.number SUB_CUST_JS_004
    * @tc.name test getCfgFiles method in promise mode
    * @tc.desc get getCfgFiles in promise mode
    */
    it('getCfgFiles_test_004', 0, async function (done) {
        cust.getCfgFiles('custxml/none.xml').then(value => {
            expect(value.length == 0).assertTrue();
            console.log('CustTest getCfgFiles_test_004, none.xml:' + value);
        });
        cust.getCfgFiles('custxml/system.xml').then(value => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getCfgFiles_test_004, system.xml:' + value);
        });
        cust.getCfgFiles('custxml/both.xml').then(value => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getCfgFiles_test_004, both.xml:' + value);
        });
        cust.getCfgFiles('custxml/user.xml').then(value => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getCfgFiles_test_004, user.xml:' + value);
        });
        done();
    })
})
