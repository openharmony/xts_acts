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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import request from '@ohos.request';
import * as pubfun from './kvStoreBackupPromisePublicFunction.test'
import distributedData from '@ohos.data.distributedData';
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

const optionLock = {
    createIfMissing: true,
    encrypt: true,
    backup: true,
    autoSync: false,
    kvStoreType: distributedData.KVStoreType.SINGLE_VERSION,
    securityLevel: distributedData.SecurityLevel.S0,
}

var file = '';

var files =new Array();

var key = {
    data1: 'number',
    data2: 456789,
};
var value = {
    data1: 123456,
    data2: 456789,
};

export default function kvStoreBackupPromiseJsunittest(context) {
describe('kvStoreBackupPromiseJsunittest', function () {
    beforeAll( async function () {
        console.info('TestDFX beforeAll: Prerequisites at the test suite level, ' +
        'which are executed before the test suite is executed.');
        await pubfun.publicgetKvStore(optionLock);
        await sleep(5000);
        console.info("TestDFX kvstore = " + globalThis.kvStore)
    })
    beforeEach(function () {
        console.info('beforeEach: Prerequisites at the test case level,' +
        ' which are executed before each test case is executed.');
    })
    afterEach( async function () {
        console.info('afterEach: Test case-level clearance conditions, ' +
        'which are executed after each test case is executed.');
        pubfun.publicdeleteBackup(globalThis.kvStore,files);
        await sleep(5000);
    })
    afterAll(function () {
        console.info('afterAll: Test suite-level cleanup condition, ' +
        'which is executed after the test suite is executed');
        console.info("TestDFX kvstore = " + globalThis.kvStore)
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORE_PROMISE_0100
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestorePromise0001', 0, async function (done) {
        try {
            console.log("testManalRestorePromise0001 before restore");
            await pubfun.publicrestore(globalThis.kvStore).then((data) => {
                console.log("testManalRestorePromise0001 going restore = " + JSON.stringify(data));
                expect(true).assertEqual(data == 'code数字');
                done();
            }).catch((err) => {
                console.log("testManalRestorePromise0001 Manualrestore fail 1" + err);
                expect(true).assertEqual(JSON.stringify(err) == '{}');
                done();
            })
        } catch (e) {
            console.log("testManalRestorePromise0001 Manualrestore fail 2" + JSON.stringify(e));
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORE_PROMISE_0200
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestorePromise0002', 0, async function (done) {
        try {
            console.log("testManalRestorePromise0002 before getname");
            file  = '123' ;
            files[0] = file ;
            pubfun.publicbackup(globalThis.kvStore,file) ;
            console.log("testManalRestorePromise0002 before restore");
            await sleep(1000);
            pubfun.publicrestore(globalThis.kvStore);
            console.log("testManalRestorePromise0002 going restore ");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalRestorePromise0002 delResult = " + delResult);
                console.info("testManalRestorePromise0002 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalRestorePromise0002 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalRestorePromise0002 Manualrestore fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0100
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0001', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0001 before getname");
            file = 'legal' ;
            files[0] = "legal" ;
            console.log("testManalBackupPromise0001 before backup");
            pubfun.publicbackup(globalThis.kvStore,file) ;
            console.log("testManalBackupPromise0001 going backup");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalBackupPromise0001 delResult = " + delResult);
                console.info("testManalBackupPromise0001 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalBackupPromise0001 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0001 export fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0200
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0002', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0002 before getname");
            file  = 'true' ;
            files[0] = file ;
            console.log("testManalBackupPromise0002 before backup");
            pubfun.publicbackup(globalThis.kvStore,file) ;
            console.log("testManalBackupPromise0002 going backup");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalBackupPromise0002 delResult = " + delResult);
                console.info("testManalBackupPromise0002 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalBackupPromise0002 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0002 fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0300
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0003', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0003 before getname");
            file  = '1' ;
            files[0] = file ;
            console.log("testManalBackupPromise0003 before backup");
            pubfun.publicbackup(globalThis.kvStore,file) ;
            console.log("testManalBackupPromise0003 going backup");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalBackupPromise0003 delResult = " + delResult);
                console.info("testManalBackupPromise0003 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalBackupPromise0003 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0003 fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0400
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0004', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0004 before getname");
            file  = '1.0' ;
            files[0] = file ;
            console.log("testManalBackupPromise0004 before backup");
            pubfun.publicbackup(globalThis.kvStore,file) ;
            console.log("testManalBackupPromise0004 going backup");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalBackupPromise0004 delResult = " + delResult);
                console.info("testManalBackupPromise0004 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalBackupPromise0004 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0004 fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0500
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0005', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0005 before getname");
            file  = '' ;
            console.log("testManalBackupPromise0005 before backup");
            await pubfun.publicbackup(globalThis.kvStore,file).then((data) => {
                console.log("testManalBackupPromise0005 going backup");
                expect(true).assertEqual(data == "code数字");
                done();
            }).catch((err) => {
                console.log("testManalBackupPromise0005 fail1 " + err);
                expect(true).assertEqual(JSON.stringify(err) == "{}");
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0005 fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0600
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0006', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0006 before getname");
            file  = '1' ;
            var file1 = '2';
            var file2 = '3';
            var file3 = '4';
            var file4 = '5';
            files[0] = file ;
            files[1] = file1 ;
            files[2] = file2 ;
            files[3] = file3 ;
            files[4] = file4 ;
            console.log("testManalBackupPromise0006 before backup");
            pubfun.publicbackup(globalThis.kvStore,file);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file1);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file2);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file3);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file4);
            await sleep(500);
            console.log("testManalBackupPromise0006 before publicdeleteBackup");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {

                expect("1").assertEqual(globalThis.delresult[0][0])
                expect(0).assertEqual(globalThis.delresult[0][1]);
                
                expect("2").assertEqual(globalThis.delresult[1][0])
                expect(0).assertEqual(globalThis.delresult[1][1])
                
                expect("3").assertEqual(globalThis.delresult[2][0])
                expect(0).assertEqual(globalThis.delresult[2][1])
                
                expect("4").assertEqual(globalThis.delresult[3][0])
                expect(0).assertEqual(globalThis.delresult[3][1])
                
                expect("5").assertEqual(globalThis.delresult[4][0])
                expect(27459591).assertEqual(globalThis.delresult[4][1])

                console.log("testManalBackupPromise0006 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0006 fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALBACKUP_PROMISE_0700
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalBackupPromise0007', 0, async function (done) {
        try {
            console.log("testManalBackupPromise0007 before getname");
            file  = '1' ;
            var file1 = '2';
            var file2 = '3';
            var file3 = '4';
            var file4 = '5';
            var file5 = '6';
            files[0] = file ;
            files[1] = file1 ;
            files[2] = file2 ;
            files[3] = file3 ;
            files[4] = file4 ;
            files[5] = file5 ;
            console.log("testManalBackupPromise0007 before backup");
            pubfun.publicbackup(globalThis.kvStore,file);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file1);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file2);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file3);
            await sleep(500);
            pubfun.publicbackup(globalThis.kvStore,file4);
            await sleep(500);
            console.log("testManalBackupPromise0007 before Sixth backup");
            await pubfun.publicbackup(globalThis.kvStore,file5).then((data) => {
                console.log("testManalBackupPromise0007 going backup");
                expect(true).assertEqual(data == "code数字");
                done();
            }).catch((err) => {
                console.log("testManalBackupPromise0007  fail1 " + err);
                expect(true).assertEqual(JSON.stringify(err) == "{}");
                console.log("testManalBackupPromise0007 Sixth backup err");
            })
            await sleep(1000);
            console.log("testManalBackupPromise0007 before publicdeleteBackup");
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {

                expect("1").assertEqual(globalThis.delresult[0][0])
                expect(0).assertEqual(globalThis.delresult[0][1]);

                expect("5").assertEqual(globalThis.delresult[4][0])
                expect(27459591).assertEqual(globalThis.delresult[4][1]);

                expect("6").assertEqual(globalThis.delresult[5][0])
                expect(27459591).assertEqual(globalThis.delresult[5][1]);

                console.log("testManalBackupPromise0007 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalBackupPromise0007 fail 2 " + e);
            expect(e).assertFail();
            done();
        }
    })
    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORESPECIFIEDVERSION_PROMISE_0100
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestoreSpecifiedVersionPromise0001', 0, async function (done) {
        try {
            console.log("testManalRestoreSpecifiedVersionPromise0001 before getname");
            file  = 'legal' ;
            files[0] = file ;
            pubfun.publicbackup(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0001 before restoresp");
            await sleep(1000);
            pubfun.publicrestoresp(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0001 going restoresp");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[5];
                console.info("testManalRestoreSpecifiedVersionPromise0001 delResult = " + delResult);
                console.info("testManalRestoreSpecifiedVersionPromise0001 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalRestoreSpecifiedVersionPromise0001 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalRestoreSpecifiedVersionPromise0001 Manualrestoresp fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORESPECIFIEDVERSION_PROMISE_0200
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestoreSpecifiedVersionPromise0002', 0, async function (done) {
        try {
            console.log("testManalRestoreSpecifiedVersionPromise0002 before getname");
            file  = 'true' ;
            files[0] = file ;
            pubfun.publicbackup(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0002 before restoresp");
            await sleep(1000);
            pubfun.publicrestoresp(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0002 going restoresp");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[5];
                console.info("testManalRestoreSpecifiedVersionPromise0002 delResult = " + delResult);
                console.info("testManalRestoreSpecifiedVersionPromise0002 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalRestoreSpecifiedVersionPromise0002 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalRestoreSpecifiedVersionPromise0002 fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
        * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORESPECIFIEDVERSION_PROMISE_0300
        * @tc.name      : Use getEntries get the value by mixing the string key
        * @tc.desc      : Mixed strings value can be obtained correctly
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 3
    */
    it('testManalRestoreSpecifiedVersionPromise0003', 0, async function (done) {
        try {
            console.log("testManalRestoreSpecifiedVersionPromise0003 before getname");
            file  = '1' ;
            files[0] = file ;
            pubfun.publicbackup(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0003 before restoresp");
            await sleep(1000);
            pubfun.publicrestoresp(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0003 going restoresp");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalRestoreSpecifiedVersionPromise0003 delResult = " + delResult);
                console.info("testManalRestoreSpecifiedVersionPromise0003 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalRestoreSpecifiedVersionPromise0003 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalRestoreSpecifiedVersionPromise0003 fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORESPECIFIEDVERSION_PROMISE_0400
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestoreSpecifiedVersionPromise0004', 0, async function (done) {
        try {
            console.log("testManalRestoreSpecifiedVersionPromise0004 before getname");
            file  = '1.0' ;
            files[0] = file ;
            pubfun.publicbackup(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0004 before restoresp");
            await sleep(1000);
            pubfun.publicrestoresp(globalThis.kvStore,file);
            console.log("testManalRestoreSpecifiedVersionPromise0004 going restoresp");
            await sleep(1000);
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testManalRestoreSpecifiedVersionPromise0004 delResult = " + delResult);
                console.info("testManalRestoreSpecifiedVersionPromise0004 delResult[1] = " + delResult[1]);
                expect(0).assertEqual(delResult[1]);
                console.log("testManalRestoreSpecifiedVersionPromise0004 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
        } catch (e) {
            console.log("testManalRestoreSpecifiedVersionPromise0004 Manualrestoresp fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORESPECIFIEDVERSION_PROMISE_0500
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestoreSpecifiedVersionPromise0005', 0, async function (done) {
        try {
            console.log("testManalRestoreSpecifiedVersionPromise0005 before getname");
            file  = '' ;
            pubfun.publicbackup(globalThis.kvStore,file) ;
            console.log("testManalRestoreSpecifiedVersionPromise0005 before restoresp");
            await sleep(1000);
            await pubfun.publicrestoresp(globalThis.kvStore,file).then((data) => {
                console.log("testManalRestoreSpecifiedVersionPromise0005 going restoresp = " + JSON.stringify(data));
                expect(true).assertEqual(false);
                done();
            }).catch((err) => {
                console.log("testManalRestoreSpecifiedVersionPromise0005 Manualrestoresp fail 1" + err);
                expect(true).assertEqual(JSON.stringify(err) == "{}");
                done();
            })
        } catch (e) {
            console.log("testManalRestoreSpecifiedVersionPromise0005 Manualrestoresp fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_MANALRESTORESPECIFIEDVERSION_PROMISE_0600
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testManalRestoreSpecifiedVersionPromise0006', 0, async function (done) {
        try {
            console.log("testManalRestoreSpecifiedVersionPromise0006 before getname");
            file  = 'legal' ;
            console.log("testManalRestoreSpecifiedVersionPromise0006 before restoresp");
            await pubfun.publicrestoresp(globalThis.kvStore,file).then((data) => {
                console.log("testManalRestoreSpecifiedVersionPromise0006 going restoresp = " + JSON.stringify(data));
                expect(true).assertEqual(false);
                done();
            }).catch((err) => {
                console.log("testManalRestoreSpecifiedVersionPromise0006 Manualrestoresp fail 1" + err);
                expect(true).assertEqual(JSON.stringify(err) == "{}");
                done();
            })
        } catch (e) {
            console.log("testManalRestoreSpecifiedVersionPromise0006 Manualrestoresp fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })



    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_DELETEBUCKUP_PROMISE_0100
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testDeleteBuckupPromise0001', 0, async function (done) {
        try {
            console.log("testDeleteBuckupPromise0001 before deleteBackup");
            file  = '123' ;
            files[0] = file ;
            await pubfun.publicdeleteBackup(globalThis.kvStore,files).then((data) => {
                let delResult = globalThis.delresult[0];
                console.info("testDeleteBuckupPromise0001 delResult = " + delResult);
                console.info("testDeleteBuckupPromise0001 delResult[1] = " + delResult[1]);
                expect(27459591).assertEqual(delResult[1]);
                console.log("testDeleteBuckupPromise0001 publicdeleteBackup" + JSON.stringify(data));
                done();
            })
            console.log("testDeleteBuckupPromise0001 going deleteBackup");
        } catch (err) {
            console.log("testDeleteBuckupPromise0001 deleteBackup fail 2" + err);
            expect(err).assertFail();
            done();
        }
    })

    /*
        * @tc.number    : SUB_DISTRIBUTEDDATAMGR_DBBUCKUPPUT_PROMISE_0100
        * @tc.name      : Use getEntries get the value by mixing the string key
        * @tc.desc      : Mixed strings value can be obtained correctly
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('testDbBuckupPutPromise0001', 0, async function (done) {
        try {
            console.log("testDbBuckupPutPromise0001 before putdata");
            pubfun.publicput(globalThis.kvStore,"key1","value1") ;
            console.log("testDbBuckupPutPromise0001 going putdata");
            done();
        } catch (e) {
            console.log("testDbBuckupPutPromise0001 Backupinfo fail" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_DBBUCKUPPUT_PROMISE_0200
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testDbBuckupPutPromise0002', 0, async function (done) {
        try {
            console.log("testDbBuckupPutPromise0002 before putdata");
            pubfun.publicput(globalThis.kvStore,"PutPromise0002","value") ;
            console.log("testDbBuckupPutPromise0002 going putdata");
            await pubfun.publicget(globalThis.kvStore,"PutPromise0002").then((data) => {
                console.log("testDbBuckupPutPromise0002 going getdata" + JSON.stringify(data));
                expect(true).assertEqual(data == "value");
                done();
            }).catch((err) => {
                console.log("testDbBuckupPutPromise0002 Get fail 1 " + err);
                expect(err).assertFail();
                done();
            })
        } catch (e) {
            console.log("testDbBuckupPutPromise0002 Get fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })

    /*
    * @tc.number    : SUB_DISTRIBUTEDDATAMGR_DBBUCKUPPUT_PROMISE_0400
    * @tc.name      : Use getEntries get the value by mixing the string key
    * @tc.desc      : Mixed strings value can be obtained correctly
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('testDbBuckupPutPromise0004', 0, async function (done) {
        try {
            console.log("testDbBuckupPutPromise0004 before putdata");
            pubfun.publicput(globalThis.kvStore,"PutPromise0004","value1") ;
            console.log("TestestDbBuckupPutPromise0004tDFX going putdata");
            await pubfun.publicget(globalThis.kvStore,"PutPromise").then((data) => {
                console.log("testDbBuckupPutPromise0004 going getdata" + JSON.stringify(data));
                expect(true).assertEqual(JSON.stringify(data) == '{}');
                done();
            }).catch((err) => {
                console.log("testDbBuckupPutPromise0004 Get fail 1 " + err);
                expect(true).assertEqual(JSON.stringify(err) == "{}");
                done();
            })
        } catch (e) {
            console.log("testDbBuckupPutPromise0004 Get fail 2" + e);
            expect(e).assertFail();
            done();
        }
    })
})
}
