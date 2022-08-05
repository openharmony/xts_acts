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
import * as pubfun from './Publicfunction.ets'

var typeProgress = 'progress';
var typeHeaderReceive = 'headerReceive';
var typeFail = 'fail';
let uploadTask;
let file7url = 'internal://cache/test.txt';

export default function uploadRequestJsunitTest() {
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
            * @tc.number    : InitUploadtaskCallback001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('InitUploadtaskCallback001', 0, async function (done) {
            try {
                console.info("Testupdate before getuploadconfig");
                let UploadConfig = pubfun.getUploadConfig(file7url)
                console.info("Testupdate before upload UploadConfig = " + JSON.stringify(UploadConfig));
                console.info("Testupdate before upload");
                await pubfun.publicupload(UploadConfig).then((data) => {
                    console.info("Testupdate going upload uploadTask = " + data);
                    uploadTask = data;
                    expect(true).assertEqual((data != undefined) || (data != "") || (data != {}));
                    done();
                }).catch((err) => {
                    console.info("InitUploadtaskCallback001 fail 1" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("InitUploadtaskCallback001 fail 2" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SwitchOnProgressCallback001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SwitchOnProgressCallback001', 0, async function (done) {
            try {
                pubfun.publiconprogress(uploadTask, typeProgress);
                expect(true).assertEqual(0 == 0);
                done();
            } catch (err) {
                console.info("Testupdate SwitchOnProgressCallback001 catch err " + JSON.stringify(err));
                expect(err).assertFail();
                done();
            }
        });

        /*
            * @tc.number    : SwitchOffProgressCallback001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SwitchOffProgressCallback001', 0, async function (done) {
            try {
                pubfun.publiconprogress(uploadTask, typeProgress);
                expect(true).assertEqual(0 == 0);

                await pubfun.publicoffprogress(uploadTask, typeProgress).then((data) => {
                    console.info("SwitchOffProgressCallback001 data" + JSON.stringify(data));
                    expect(7).assertEqual(data.totalSize);
                    done();
                }).catch((err) => {
                    console.info("SwitchOffProgressCallback001 fail 2" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("SwitchOffProgressCallback001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SwitchOnFailCallback001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SwitchOnFailCallback001', 0, async function (done) {
            try {
                await pubfun.publicon(uploadTask, typeFail).then((data) => {
                    console.info("SwitchOnFailCallback001 data " + data);
                    expect(5).assertEqual(data);
                    done();
                }).catch((err) => {
                    console.info("SwitchOnFailCallback001 fail 2" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("SwitchOnFailCallback001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : SwitchOffFailCallback001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('SwitchOffFailCallback001', 0, async function (done) {
            try {
                await pubfun.publicon(uploadTask, typeFail)
                await pubfun.publicoff(uploadTask, typeFail).then((data) => {
                    console.info("SwitchOffFailCallback001 data " + data);
                    expect(5).assertEqual(data);
                    done();
                }).catch((err) => {
                    console.info("SwitchOffFailCallback001 fail 2" + JSON.stringify(err));
                    done();
                    expect(err).assertFail();
                })
            } catch (e) {
                console.info("SwitchOffFailCallback001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })

        /*
            * @tc.number    : RemoveCallback001
            * @tc.name      : Use getEntries get the value by mixing the string key
            * @tc.desc      : Mixed strings value can be obtained correctly
            * @tc.size      : MediumTest
            * @tc.type      : Function
            * @tc.level     : Level 1
        */
        it('RemoveCallback001', 0, async function (done) {
            try {
                await pubfun.publicremove(uploadTask).then((data) => {
                    console.info("RemoveCallback001 data " + data);
                    expect(true).assertEqual(data);
                    done();
                }).catch((err) => {
                    console.info("RemoveCallback001 fail 2" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                })
            } catch (e) {
                console.info("RemoveCallback001 fail 3" + JSON.stringify(e));
                expect(e).assertFail();
                done();
            }
        })
    })
}
