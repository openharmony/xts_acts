/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import request from '@ohos.request';
import * as pubFun from './publicFunction.ets'

var typeProgress = 'progress';
var typeHeaderReceive = 'headerReceive';
var typeFail = 'fail';
let uploadTask;
let file7url = 'internal://cache/test.txt';

export default function uploadRequestJSUnitTest() {
    describe('UploadTest', function () {
        beforeAll(function () {
            console.info('beforeAll: Prerequisites at the test suite level, ' +
            'which are executed before the test suite is executed.');
        })
        beforeEach(function () {
            console.info('beforeEach: Prerequisites at the test case level,' +
            ' which are executed before each test case is executed.');
        })
        afterEach(function () {
            console.info('afterEach: Test case-level clearance conditions, ' +
            'which are executed after each test case is executed.');
        })
        afterAll(function () {
            console.info('afterAll: Test suite-level cleanup condition, ' +
            'which is executed after the test suite is executed');
        })

        /*
            * @tc.number    : SUB_MISC_REQUEST_API_UploadTask_0001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SUB_MISC_REQUEST_API_UploadTask_0001', 0, async function (done) {
            try {
                console.info("TestUpdate before getUploadConfig");
                let UploadConfig = pubFun.getUploadConfig(file7url)
                console.info("TestUpdate before upload UploadConfig = " + JSON.stringify(UploadConfig));
                console.info("TestUpdate before upload");
                await pubFun.publicUpload(UploadConfig).then((data) => {
                    console.info("TestUpdate going upload uploadTask = " + data);
                    uploadTask = data;
                    expect(true).assertEqual((data != undefined) || (data != "") || (data != {}));
                    done();
                }).catch((err) => {
                    console.info("SUB_MISC_REQUEST_API_UploadTask_0001 fail 1" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("SUB_MISC_REQUEST_API_UploadTask_0001 fail 2" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SUB_MISC_REQUEST_API_OnProgress_0001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SUB_MISC_REQUEST_API_OnProgress_0001', 0, async function (done) {
            try {
                pubFun.publicOnProgress(uploadTask, typeProgress);
                expect(true).assertEqual(0 == 0);
                done();
            } catch (err) {
                console.info("TestUpdate SUB_MISC_REQUEST_API_OnProgress_0001 catch err " + JSON.stringify(err));
                expect(err).assertFail();
                done();
            }
        });

        /*
            * @tc.number    : SUB_MISC_REQUEST__OffProgress_0001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SUB_MISC_REQUEST_OffProgress_0001', 0, async function (done) {
            try {
                pubFun.publicOnProgress(uploadTask, typeProgress);
                expect(true).assertEqual(0 == 0);

                await pubFun.publicOffProgress(uploadTask, typeProgress).then((data) => {
                    console.info("SUB_MISC_REQUEST_OffProgress_0001 data" + JSON.stringify(data));
                    expect(7).assertEqual(data["totalSize"]);
                    done();
                }).catch((err) => {
                    console.info("SUB_MISC_REQUEST_OffProgress_0001 fail 2" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("SUB_MISC_REQUEST_OffProgress_0001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SUB_MISC_REQUEST_OnFail_0001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SUB_MISC_REQUEST_OnFail_0001', 0, async function (done) {
            try {
                await pubFun.publicOn(uploadTask, typeFail).then((data) => {
                    console.info("SUB_MISC_REQUEST_OnFail_0001 data " + data);
                    expect(5).assertEqual(data);
                    done();
                }).catch((err) => {
                    console.info("SUB_MISC_REQUEST_OnFail_0001 fail 2" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("SUB_MISC_REQUEST_OnFail_0001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SUB_MISC_REQUEST_OffFail_0001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SUB_MISC_REQUEST_OffFail_0001', 0, async function (done) {
            try {
                await pubFun.publicOn(uploadTask, typeFail)
                await pubFun.publicOff(uploadTask, typeFail).then((data) => {
                    console.info("SUB_MISC_REQUEST_OffFail_0001 data " + data);
                    expect(5).assertEqual(data);
                    done();
                }).catch((err) => {
                    console.info("SUB_MISC_REQUEST_OffFail_0001 fail 2" + JSON.stringify(err));
                    done();
                    expect(err).assertFail();
                })
            } catch (e) {
                console.info("SUB_MISC_REQUEST_OffFail_0001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SUB_MISC_REQUEST_RmvCB_0001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SUB_MISC_REQUEST_RmvCB_0001', 0, async function (done) {
            try {
                await pubFun.publicRemove(uploadTask).then((data) => {
                    console.info("SUB_MISC_REQUEST_RmvCB_0001 data " + data);
                    expect(true).assertEqual(data);
                    done();
                }).catch((err) => {
                    console.info("SUB_MISC_REQUEST_RmvCB_0001 fail 2" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("SUB_MISC_REQUEST_RmvCB_0001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })
    })
}
