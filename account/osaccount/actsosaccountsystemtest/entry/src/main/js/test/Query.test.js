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
import osaccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const OSACCOUNTMAXNUMBER = 999;
describe('ActsOsAccountSystemTest', function () {

    /*
     * @tc.number  : ActsOsAccountQuery_0100
     * @tc.name    : queryOsAccountById callback
     * @tc.desc    : Authenticate to get local user 100 information and compare
     */
    it('ActsOsAccountQuery_0100', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0100 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        osAccountManager.queryOsAccountById(100, (err, data)=>{
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            console.debug("====>queryOsAccountById data:" + JSON.stringify(data));
            expect(err.code).assertEqual(0);
            expect(data.localId).assertEqual(100);
            expect(data.type.ADMIN).assertEqual(0);
            var serialNumberStr = data.serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.debug("====>truncate the last eight characters: " + serialIntercept);
            expect(serialIntercept).assertEqual("00000001");
            expect(data.isCreateCompleted).assertTrue();
            console.debug("====>ActsOsAccountQuery_0100 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0200
     * @tc.name    : queryOsAccountById promise
     * @tc.desc    : Authenticate to get local user 100 information and compare
     */
    it('ActsOsAccountQuery_0200', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0200 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        var osAccountInfo = await osAccountManager.queryOsAccountById(100);
        console.debug("====>queryOsAccountById osAccountInfo:" + JSON.stringify(osAccountInfo));
        expect(osAccountInfo.localId).assertEqual(100);
        expect(osAccountInfo.type.ADMIN).assertEqual(0);
        var serialNumberStr = osAccountInfo.serialNumber.toString();
        var serialIntercept = serialNumberStr.substring(8);
        console.debug("====>truncate the last eight characters: " + serialIntercept);
        expect(serialIntercept).assertEqual("00000001");
        expect(osAccountInfo.isCreateCompleted).assertTrue();
        console.debug("====>ActsOsAccountQuery_0200 end====");
        done();
    });

     /*
     * @tc.number  : ActsOsAccountQuery_0300
     * @tc.name    : queryOsAccountById callback
     * @tc.desc    : Authenticate failed to obtain local user 0 information
     */
    it('ActsOsAccountQuery_0300', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0300 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        osAccountManager.queryOsAccountById(0, (err)=>{
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0300 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0400
     * @tc.name    : queryOsAccountById promise
     * @tc.desc    : Authenticate failed to obtain local user 0 information
     */
    it('ActsOsAccountQuery_0400', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0400 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        try{
            await osAccountManager.queryOsAccountById(0);
        }catch(err){
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0400 end====");
            done();
        }
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0500
     * @tc.name    : queryOsAccountById callback
     * @tc.desc    : Authenticate failed to obtain local user -1 information
     */
    it('ActsOsAccountQuery_0500', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0500 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        osAccountManager.queryOsAccountById(-1, (err)=>{
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0500 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0600
     * @tc.name    : queryOsAccountById promise
     * @tc.desc    : Authenticate failed to obtain local user 0 information
     */
    it('ActsOsAccountQuery_0600', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0600 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        try{
            await osAccountManager.queryOsAccountById(-1);
        }catch(err){
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0600 end====");
            done();
        }
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0700
     * @tc.name    : queryOsAccountById callback
     * @tc.desc    : Authenticate failed to obtain local user "100" information
     */
    it('ActsOsAccountQuery_0700', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0700 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        osAccountManager.queryOsAccountById("100", (err)=>{
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0700 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0800
     * @tc.name    : queryOsAccountById promise
     * @tc.desc    : Authenticate failed to obtain local user "100" information
     */
    it('ActsOsAccountQuery_0800', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0800 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        try{
            await osAccountManager.queryOsAccountById("100");
        }catch(err){
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0800 end====");
            done();
        }
    });

    /*
     * @tc.number  : ActsOsAccountQuery_0900
     * @tc.name    : queryOsAccountById callback
     * @tc.desc    : Authenticate failed to obtain local user undefined information
     */
    it('ActsOsAccountQuery_0900', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_0900 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        osAccountManager.queryOsAccountById(undefined, (err)=>{
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_0900 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1000
     * @tc.name    : queryOsAccountById promise
     * @tc.desc    : Authenticate failed to obtain local user undefined information
     */
    it('ActsOsAccountQuery_1000', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1000 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        try{
            await osAccountManager.queryOsAccountById(undefined);
        }catch(err){
            console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsOsAccountQuery_1000 end====");
            done();
        }
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1100
     * @tc.name    : queryAllCreatedOsAccounts callback
     * @tc.desc    : Verify that all local users contain 100 user
     */
    it('ActsOsAccountQuery_1100', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1100 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        let dataMap = new Map();
        osAccountManager.queryAllCreatedOsAccounts((err, data)=>{
            console.debug("====>queryAllCreatedOsAccounts err:" + JSON.stringify(err));
            console.debug("====>queryAllCreatedOsAccounts data:" + JSON.stringify(data));
            expect(err.code).assertEqual(0);
            for (let i = 0, len = data.length; i < len; i++) {
                dataMap.set(data[i].localId, data[i].localName)
            }
            expect(dataMap.has(100)).assertTrue();
            console.debug("====>ActsOsAccountQuery_1100 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1200
     * @tc.name    : queryAllCreatedOsAccounts promise
     * @tc.desc    : Verify that all local users contain 100 user
     */
    it('ActsOsAccountQuery_1200', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1200 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        let dataMap = new Map();
        var osAccountCreated = await osAccountManager.queryAllCreatedOsAccounts();
        console.debug("====>queryAllCreatedOsAccounts:" + JSON.stringify(osAccountCreated));
        for (let i = 0, len = osAccountCreated.length; i < len; i++) {
            dataMap.set(osAccountCreated[i].localId, osAccountCreated[i].localName)
        }
        expect(dataMap.has(100)).assertTrue();
        console.debug("====>ActsOsAccountQuery_1200 end====");
        done();
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1300
     * @tc.name    : queryAllCreatedOsAccounts callback
     * @tc.desc    : Verify that all local users contain 100 user and created users
     */
    it('ActsOsAccountQuery_1300', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1300 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        var createIocalId;
        let dataMap = new Map();
        osAccountManager.createOsAccount("osAccountNameQueryA", 1, (err, osAccountInfo)=>{
            console.debug("====>createOsAccount err:" + JSON.stringify(err));
            console.debug("====>createOsAccount osAccountInfo:" + JSON.stringify(osAccountInfo));
            createIocalId = osAccountInfo.localId;
            expect(err.code).assertEqual(0);
            expect(osAccountInfo.localName).assertEqual("osAccountNameQueryA");
            osAccountManager.queryAllCreatedOsAccounts((err, data)=>{
                console.debug("====>queryAllCreatedOsAccounts err:" + JSON.stringify(err));
                console.debug("====>queryAllCreatedOsAccounts data:" + JSON.stringify(data));
                expect(err.code).assertEqual(0);
                for (let i = 0, len = data.length; i < len; i++) {
                    dataMap.set(data[i].localId, data[i].localName)
                }
                expect(dataMap.has(100)).assertTrue();
                expect(dataMap.has(createIocalId)).assertTrue();
                if (dataMap.has(createIocalId)) {
                    let createdlocalName = dataMap.get(createIocalId);
                    console.debug("====>query all local users containing localId: " + createIocalId);
                    console.debug("====>created localName" + createdlocalName);
                    expect(createdlocalName).assertEqual("osAccountNameQueryA");
                    osAccountManager.removeOsAccount(createIocalId, (err)=>{
                        console.debug("====>remove localId: " + createIocalId + " err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.debug("====>ActsOsAccountQuery_1300 end====");
                        done();
                    })
                }
            })
        });
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1400
     * @tc.name    : queryAllCreatedOsAccounts promise
     * @tc.desc    : Verify that all local users contain 100 user and created users
     */
    it('ActsOsAccountQuery_1400', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1400 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        var createIocalId;
        let dataMap = new Map();
        var osAccountInfo = await osAccountManager.createOsAccount("osAccountNameQueryB", 1);
        console.debug("====>createOsAccount osAccountInfo:" + JSON.stringify(osAccountInfo));
        createIocalId = osAccountInfo.localId;
        expect(osAccountInfo.localName).assertEqual("osAccountNameQueryB");
        var data = await osAccountManager.queryAllCreatedOsAccounts();
        console.debug("====>queryAllCreatedOsAccounts data:" + JSON.stringify(data));
        for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].localId, data[i].localName)
        }
        expect(dataMap.has(100)).assertTrue();
        expect(dataMap.has(createIocalId)).assertTrue();
        if (dataMap.has(createIocalId)) {
            let createdlocalName = dataMap.get(createIocalId);
            console.debug("====>query all local users containing localId: " + createIocalId);
            expect(createdlocalName).assertEqual("osAccountNameQueryB");
        }
        await osAccountManager.removeOsAccount(createIocalId);
        console.debug("====>ActsOsAccountQuery_1400 end====");
        done();
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1500
     * @tc.name    : queryMaxOsAccountNumber callback
     * @tc.desc    : Query the maximum number of users that can be created on the device
     */
    it('ActsOsAccountQuery_1500', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1500 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        osAccountManager.queryMaxOsAccountNumber((err, data)=>{
            console.debug("====>queryMaxOsAccountNumber err:" + JSON.stringify(err));
            console.debug("====>queryMaxOsAccountNumber data:" + data);
            expect(err.code).assertEqual(0);
            expect(data).assertEqual(OSACCOUNTMAXNUMBER);
            console.debug("====>ActsOsAccountQuery_1500 end====");
            done();
        })
    });

    /*
     * @tc.number  : ActsOsAccountQuery_1600
     * @tc.name    : queryMaxOsAccountNumber callback
     * @tc.desc    : Query the maximum number of users that can be created on the device
     */
    it('ActsOsAccountQuery_1600', 0, async function (done) {
        console.debug("====>ActsOsAccountQuery_1600 start====");
        var osAccountManager = osaccount.getAccountManager();
        console.debug("====>get AccountManager finish====");
        var maxOsAccount = await osAccountManager.queryMaxOsAccountNumber();
        console.debug("====>queryMaxOsAccountNumber:" + maxOsAccount);
        expect(maxOsAccount).assertEqual(OSACCOUNTMAXNUMBER);
        console.debug("====>ActsOsAccountQuery_1600 end====");
        done();
    });

    /*
     * @tc.number    : ActsOsAccountIsVerified_0100
     * @tc.name      : isOsAccountVerified callback
     * @tc.desc      : create a os account and check whether the initial state of the os account is verified
     */
    it('ActsOsAccountIsVerified_0100', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0100 start====");
        var AccountManager = osaccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        var osLocalId;
        AccountManager.createOsAccount("OsAccountNameVerfiedA", 1, (err, osAccountInfo)=>{
            console.debug("====>createOsAccount err:" +JSON.stringify(err));
            console.debug("====>createOsAccount data:" +JSON.stringify(osAccountInfo));
            osLocalId = osAccountInfo.localId;
            expect(err.code).assertEqual(0);
            expect(osAccountInfo.localName).assertEqual("OsAccountNameVerfiedA");
            AccountManager.isOsAccountVerified(osLocalId, (err, data)=>{
                console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
                console.debug("====>isOsAccountVerified data:" + JSON.stringify(data));
                expect(err.code).assertEqual(0);
                expect(data).assertEqual(false);
                AccountManager.removeOsAccount(osLocalId, (err)=>{
                    console.debug("====>removeOsAccount err:" +JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    console.debug("====>ActsOsAccountIsVerified_0100 end====");
                    done();
                })
            })
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0200
     * @tc.name      : isOsAccountVerified promise
     * @tc.desc      : create a os account and check whether the initial state of the os account is verified
     */
    it('ActsOsAccountIsVerified_0200', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0200 start====");
        var AccountManager = osaccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        var data = await AccountManager.createOsAccount("OsAccountNameVerfiedB", 1);
        console.debug("====>createOsAccount data:" + JSON.stringify(data));
        expect(data.localName).assertEqual("OsAccountNameVerfiedB");
        var osAccountLocalId = data.localId;
        try{
            var data = await AccountManager.isOsAccountVerified(osAccountLocalId);
        }
        catch(err){
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>isOsAccountVerified data:" + data);
        expect(data).assertEqual(false);
        await AccountManager.removeOsAccount(osAccountLocalId);
        console.debug("====>ActsOsAccountIsVerified_0200 end====");
        done();
    })
})