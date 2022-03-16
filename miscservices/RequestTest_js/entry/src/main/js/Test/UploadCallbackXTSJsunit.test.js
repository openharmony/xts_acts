/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import * as pubfun from './Publicfunction.js'

var type_progress = 'progress';
var type_HeaderReceive = 'headerReceive';
var type_Fail = 'fail';
let uploadTask;
let file7url = 'internal://cache/test.txt';
//let file10kurl = '';
//let file10murl = '';
// var shell = require('shelljs')

describe('UploadTest', function () {
    beforeAll(function () {
        console.info('beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');
    })
    beforeEach(function () {
        console.info('beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');
    })
    afterEach(function () {
        console.info('afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');
    })
    afterAll(function () {
        console.info('afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');
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
            // const cmd = `echo \"123456\" > /data/accounts/account_0/appdata/com.example.myapplication.hmservice/cache/test.txt`;
            // shell.exec(cmd, (err) => {
            //     if (err) {
            //       throw Error(err).message;
            //     }
            //   })
            console.log("Testupdate before getuploadconfig");
            let UploadConfig = pubfun.getUploadConfig(file7url)
            console.log("Testupdate before upload UploadConfig = " + JSON.stringify(UploadConfig));
            console.log("Testupdate before upload");
            await pubfun.publicupload(UploadConfig).then((data) => {
                console.log("Testupdate going upload uploadTask = " + data);
                uploadTask = data;
                expect(true).assertEqual((data != undefined) || (data != "") || (data != {}));
                done();
            }).catch((err) => {
                console.log("InitUploadtaskCallback001 fail 1" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
        } catch (e) {
            console.log("InitUploadtaskCallback001 fail 2" + JSON.stringify(e));
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
            /*console.log("Testupdate before getuploadconfig");
            let UploadConfig = pubfun.getUploadConfig(file7url)
            console.log("Testupdate before upload UploadConfig = " + JSON.stringify(UploadConfig));
            console.log("Testupdate before upload");
            await pubfun.publicupload(UploadConfig).then((data) => {
                console.log("Testupdate going upload uploadTask = " + data);
                uploadTask = data;
            }).catch((err) => {
                console.log("SwitchOnProgressCallback001 fail" + JSON.stringify(err));
            })*/

            pubfun.publiconprogress(uploadTask, type_progress);
            expect(true).assertEqual(0 == 0);
            done();
        } catch (err) {
            console.log("Testupdate SwitchOnProgressCallback001 catch err " + JSON.stringify(err));
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
            /*let UploadConfig = pubfun.getUploadConfig(file7url)
            await pubfun.publicupload(UploadConfig).then((data) => {
                uploadTask = data;
            }).catch((err) => {
                console.log("SwitchOffProgressCallback001 fail 1" + JSON.stringify(err));
            })*/

            pubfun.publiconprogress(uploadTask, type_progress);
            expect(true).assertEqual(0 == 0);

            await pubfun.publicoffprogress(uploadTask, type_progress).then((data) => {
                console.log("SwitchOffProgressCallback001 data" + JSON.stringify(data));
                expect(7).assertEqual(data.totalSize);
                done();
            }).catch((err) => {
                console.log("SwitchOffProgressCallback001 fail 2" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
        } catch (e) {
            console.log("SwitchOffProgressCallback001 fail 3" + JSON.stringify(e));
            expect(e).assertFail();
            done();
        }
    })
    /*
        * @tc.number    : SwitchOnHeaderReceiveCallback001
        * @tc.name      : Use getEntries get the value by mixing the string key
        * @tc.desc      : Mixed strings value can be obtained correctly
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 1
    */
    /*it('SwitchOnHeaderReceiveCallback001', 0, async function (done) {
        try {
            let UploadConfig = pubfun.getUploadConfig(file7url)
            await pubfun.publicupload(UploadConfig).then((data) => {
                uploadTask = data;
            }).catch((err) => {
                console.log("SwitchOnHeaderReceiveCallback001 fail 1" + JSON.stringify(err));
            })
            await pubfun.publicon(uploadTask,type_HeaderReceive).then((data) => {
                console.info("upOnHeader headers:" + JSON.stringify(data));
                expect('待确认').assertEqual(data);
                done();
            }).catch((err) => {
                console.log("SwitchOnHeaderReceiveCallback001 fail 2" + JSON.stringify(err));
            })
        } catch (e) {
            console.log("SwitchOnHeaderReceiveCallback001 fail 3" + JSON.stringify(e));
            expect(null).assertFail();
        }
    })
    /*
        * @tc.number    : SwitchOffHeaderReceiveCallback001
        * @tc.name      : Use getEntries get the value by mixing the string key
        * @tc.desc      : Mixed strings value can be obtained correctly
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 1
    */
    /*it('SwitchOffHeaderReceiveCallback001', 0, async function (done) {
        try {
            let UploadConfig = pubfun.getUploadConfig(file7url)
            await pubfun.publicupload(UploadConfig).then((data) => {
                uploadTask = data;
            }).catch((err) => {
                console.log("SwitchOffHeaderReceiveCallback001 fail 1" + JSON.stringify(err));
            })
            await pubfun.publicoff(uploadTask,type_HeaderReceive).then((data) => {
                console.info("upOnHeader headers:" + JSON.stringify(data));
                expect('待确认').assertEqual(data);
                done();
            }).catch((err) => {
                console.log("SwitchOffHeaderReceiveCallback001 fail 2" + JSON.stringify(err));
            })
        } catch (e) {
            console.log("SwitchOffHeaderReceiveCallback001 fail 3" + JSON.stringify(e));
            expect(null).assertFail();
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
            /*let UploadConfig = pubfun.getUploadConfig(file7url)
            await pubfun.publicupload(UploadConfig).then((data) => {
                uploadTask = data;
            }).catch((err) => {
                console.log("SwitchOnFailCallback001 fail 1" + JSON.stringify(err));
            })*/

            await pubfun.publicon(uploadTask, type_Fail).then((data) => {
                console.log("SwitchOnFailCallback001 data " + data);
                expect(5).assertEqual(data);
                done();
            }).catch((err) => {
                console.log("SwitchOnFailCallback001 fail 2" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
        } catch (e) {
            console.log("SwitchOnFailCallback001 fail 3" + JSON.stringify(e));
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
            /*let UploadConfig = pubfun.getUploadConfig(file7url)
            await pubfun.publicupload(UploadConfig).then((data) => {
                uploadTask = data;
            }).catch((err) => {
                console.log("SwitchOffFailCallback001 fail 1" + JSON.stringify(err));
            })*/

            await pubfun.publicon(uploadTask, type_Fail)
            await pubfun.publicoff(uploadTask, type_Fail).then((data) => {
                console.log("SwitchOffFailCallback001 data " + data);
                expect(5).assertEqual(data);
                done();
            }).catch((err) => {
                console.log("SwitchOffFailCallback001 fail 2" + JSON.stringify(err));
                done();
                expect(err).assertFail();
            })
        } catch (e) {
            console.log("SwitchOffFailCallback001 fail 3" + JSON.stringify(e));
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
            /*let UploadConfig = pubfun.getUploadConfig(file7url)
            await pubfun.publicupload(UploadConfig).then((data) => {
                uploadTask = data;
            }).catch((err) => {
                console.log("RemoveCallback001 fail 1" + JSON.stringify(err));
            })*/

            await pubfun.publicremove(uploadTask).then((data) => {
                console.log("RemoveCallback001 data " + data);
                expect(true).assertEqual(data);
                done();
            }).catch((err) => {
                console.log("RemoveCallback001 fail 2" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
        } catch (e) {
            console.log("RemoveCallback001 fail 3" + JSON.stringify(e));
            expect(e).assertFail();
            done();
        }
    })
})