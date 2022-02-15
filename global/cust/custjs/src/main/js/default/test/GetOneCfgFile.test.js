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

import configPolicy from '@ohos.configPolicy'

describe('GetOneCfgFileTest', function () {

    /* *
    * @tc.number SUB_CUST_JS_001
    * @tc.name test getOneCfgFile method in callback mode
    * @tc.desc get getOneCfgFile in callback mode
    */
    it('getOneCfgFile_test_001', 0, async function (done) {
        configPolicy.getOneCfgFile('custxmltest/none.xml', (error, value) => {
            expect(value.length == 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_001, none.xml:' + value);
        });
        configPolicy.getOneCfgFile('custxmltest/system.xml', (error, value) => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_001, system.xml:' + value);
        });
        configPolicy.getOneCfgFile('custxmltest/both.xml', (error, value) => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_001, both.xml:' + value);
        });
        configPolicy.getOneCfgFile('custxmltest/user.xml', (error, value) => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_001, user.xml:' + value);
        });
        done();
    })

    /* *
    * @tc.number SUB_CUST_JS_002
    * @tc.name test getOneCfgFile method in promise mode
    * @tc.desc get getOneCfgFile in promise mode
    */
    it('getOneCfgFile_test_002', 0, async function (done) {
        configPolicy.getOneCfgFile('custxmltest/none.xml').then(value => {
            expect(value.length == 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_002, none.xml:' + value);
        });
        configPolicy.getOneCfgFile('custxmltest/system.xml').then(value => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_002, system.xml:' + value);
        });
        configPolicy.getOneCfgFile('custxmltest/both.xml').then(value => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_002, both.xml:' + value);
        });
        configPolicy.getOneCfgFile('custxmltest/user.xml').then(value => {
            expect(value.length != 0).assertTrue();
            console.log('CustTest getOneCfgFile_test_002, user.xml:' + value);
        });
        done();
    })
})
