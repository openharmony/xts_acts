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
import osAccount from '@ohos.account.osAccount'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('ActsOsAccountThirdPartyTest', function () {

    /*
     * @tc.number    : ActsOsAccountDeviceId_0100
     * @tc.name      : getDistributedVirtualDeviceId callback
     * @tc.desc      : get distributed virtual device ID
     */
    it('ActsOsAccountDeviceId_0100', 0, async function(done){
        console.debug("====>ActsOsAccountDeviceId_0100 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.getDistributedVirtualDeviceId((err, deviceId)=>{
            console.debug("====>getDistributedVirtualDeviceId err:" + JSON.stringify(err));
            console.debug("====>getDistributedVirtualDeviceId deviceId:" + deviceId);
            expect(err.code).assertEqual(0);
            expect(deviceId).assertEqual("0");
            console.debug("====>ActsOsAccountDeviceId_0100 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountDeviceId_0200
     * @tc.name      : getDistributedVirtualDeviceId promise
     * @tc.desc      : get distributed virtual device ID
     */
    it('ActsOsAccountDeviceId_0200', 0, async function(done){
        console.debug("====>ActsOsAccountDeviceId_0200 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            var deviceId = await AccountManager.getDistributedVirtualDeviceId();
        }
        catch(err){
            console.error("====>catch getDistributedVirtualDeviceId err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>getDistributedVirtualDeviceId:" + deviceId);
        expect(deviceId).assertEqual("0");
        console.debug("====>ActsOsAccountDeviceId_0200 end====");
        done();
    })

    /*
     * @tc.number    : ActsOsAccountIsActived_0100
     * @tc.name      : isOsAccountActived callback
     * @tc.desc      : Verify that users are not switched and query 100 users as active
     */
    it('ActsOsAccountIsActived_0100', 0, async function(done){
        console.debug("====>ActsOsAccountIsActived_0100 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isOsAccountActived(100, (err, isActived)=>{
            console.debug("====>isOsAccountActived err:" + JSON.stringify(err));
            console.debug("====>isOsAccountActived isActived:" + isActived);
            expect(err.code).assertEqual(0);
            expect(isActived).assertEqual(true);
            console.debug("====>ActsOsAccountIsActived_0100 end");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsActived_0200
     * @tc.name      : isOsAccountActived promise
     * @tc.desc      : Verify that users are not switched and query 100 users as active
     */
    it('ActsOsAccountIsActived_0200', 0, async function(done){
        console.debug("====>ActsOsAccountIsActived_0200 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            var isActived = await AccountManager.isOsAccountActived(100);
        }
        catch(err){
            console.debug("====>catch isOsAccountActived err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>isOsAccountActived:" + isActived);
        expect(isActived).assertEqual(true);
        console.debug("====>ActsOsAccountIsActived_0200 end");
        done();
    })

    /*
     * @tc.number    : ActsOsAccountIsActived_0300
     * @tc.name      : isOsAccountActived callback
     * @tc.desc      : Authentication query 0 user active status failed
     */
    it('ActsOsAccountIsActived_0300', 0, async function(done){
        console.debug("====>ActsOsAccountIsActived_0300 start");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isOsAccountActived(0, (err)=>{
            console.debug("====>isOsAccountActived err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertEqual(true);
            console.debug("====>ActsOsAccountIsActived_0300 end");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsActived_0400
     * @tc.name      : isOsAccountActived promise
     * @tc.desc      : Authentication query 0 user active status failed
     */
    it('ActsOsAccountIsActived_0400', 0, async function(done){
        console.debug("====>isOsAccountActived_0400 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            await AccountManager.isOsAccountActived(0);
        }
        catch(err){
            console.debug("====>isOsAccountActived err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertTrue();
            done();
        }
    })

    /*
     * @tc.number    : ActsOsAccountIsMulty_0100
     * @tc.name      : isMultiOsAccountEnable callback
     * @tc.desc      : Check whether the function of supporting multiple os account is enabled
     */
    it('ActsOsAccountIsMulty_0100', 0, async function(done){
        console.debug("====>ActsOsAccountIsMulty_0100 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isMultiOsAccountEnable((err, data)=>{
            console.debug("====>isMultiOsAccountEnable err:" + JSON.stringify(err));
            console.debug("====>isMultiOsAccountEnable data:" + data);
            expect(err.code).assertEqual(0);
            expect(data).assertEqual(true);
            console.debug("====>ActsOsAccountIsMulty_0100 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsMulty_0200
     * @tc.name      : isMultiOsAccountEnable promise
     * @tc.desc      : Check whether the function of supporting multiple os account is enabled
     */
    it('ActsOsAccountIsMulty_0200', 0, async function(done){
        console.debug("====>ActsOsAccountIsMulty_0200 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            var data = await AccountManager.isMultiOsAccountEnable();
        }
        catch(err){
            console.debug("====>catch isMultiOsAccountEnable err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>isMultiOsAccountEnable data:" + JSON.stringify(data));
        expect(data).assertEqual(true);
        console.debug("====>ActsOsAccountIsMulty_0200 end====");
        done();
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0300
     * @tc.name      : isOsAccountVerified callback
     * @tc.desc      : Verify query 0 user is unlocked failed
     */
    it('ActsOsAccountIsVerified_0300', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0300 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isOsAccountVerified(0, (err)=>{
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertEqual(true);
            console.debug("====>ActsOsAccountIsVerified_0300 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0400
     * @tc.name      : isOsAccountVerified promise
     * @tc.desc      : Verify query 0 user is unlocked failed
     */
    it('ActsOsAccountIsVerified_0400', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0400 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            await AccountManager.isOsAccountVerified(0);
        }
        catch(err){
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertTrue();
            console.debug("====>ActsOsAccountIsVerified_0400 end====");
            done();
        }
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0500
     * @tc.name      : isOsAccountVerified callback
     * @tc.desc      : Verify query "100" user is unlocked failed
     */
    it('ActsOsAccountIsVerified_0500', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0500 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isOsAccountVerified("100", (err)=>{
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertEqual(true);
            console.debug("====>ActsOsAccountIsVerified_0500 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0600
     * @tc.name      : isOsAccountVerified promise
     * @tc.desc      : Verify query "100" user is unlocked failed
     */
    it('ActsOsAccountIsVerified_0600', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0600 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            await AccountManager.isOsAccountVerified("100");
        }
        catch(err){
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertTrue();
            console.debug("====>ActsOsAccountIsVerified_0600 end====");
            done();
        }
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0700
     * @tc.name      : isOsAccountVerified callback
     * @tc.desc      : Verify query undefined user is unlocked failed
     */
    it('ActsOsAccountIsVerified_0700', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0700 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isOsAccountVerified(undefined, (err)=>{
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertEqual(true);
            console.debug("====>ActsOsAccountIsVerified_0700 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0800
     * @tc.name      : isOsAccountVerified promise
     * @tc.desc      : Verify query undefined user is unlocked failed
     */
    it('ActsOsAccountIsVerified_0800', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0800 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        try{
            await AccountManager.isOsAccountVerified(undefined);
        }
        catch(err){
            console.debug("====>ActsOsAccountIsVerified_0800 err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertTrue();
            console.debug("====>ActsOsAccountIsVerified_0800 end====");
            done();
        }
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_0900
     * @tc.name      : isOsAccountVerified callback
     * @tc.desc      : Verify query does not exist user unlock failed
     */
    it('ActsOsAccountIsVerified_0900', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_0900 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        var osAccountLocalId = 1000;
        AccountManager.isOsAccountVerified(osAccountLocalId, (err)=>{
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertEqual(true);
            console.debug("====>ActsOsAccountIsVerified_0900 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsVerified_1000
     * @tc.name      : isOsAccountVerified promise
     * @tc.desc      : Verify query does not exist user unlock failed
     */
    it('ActsOsAccountIsVerified_1000', 0, async function(done){
        console.debug("====>ActsOsAccountIsVerified_1000 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        var osAccountLocalId = 1000;
        try{
            await AccountManager.isOsAccountVerified(osAccountLocalId);
        }
        catch(err){
            console.debug("====>isOsAccountVerified err:" + JSON.stringify(err));
            expect(err.code !=0 ).assertTrue();
            console.debug("====>ActsOsAccountIsVerified_1000 end====");
            done();
        }
    })

    /*
     * @tc.number    : ActsOsAccountIsTest_0100
     * @tc.name      : isTestOsAccount callback
     * @tc.desc      : check whether this OS account is a test OS account
     */
    it('ActsOsAccountIsTest_0100', 0, async function(done){
        console.debug("====>ActsOsAccountIsTest_0100 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        AccountManager.isTestOsAccount((err, data)=>{
            console.debug("====>isTestOsAccount err:" + JSON.stringify(err));
            console.debug("====>isTestOsAccount data:" + JSON.stringify(data));
            expect(err.code).assertEqual(0);
            expect(data).assertEqual(false);
            console.debug("====>ActsOsAccountIsTest_0100 end====");
            done();
        })
    })

    /*
     * @tc.number    : ActsOsAccountIsTest_0200
     * @tc.name      : isTestOsAccount promise
     * @tc.desc      : check whether this OS account is a test OS account
     */
    it('ActsOsAccountIsTest_0200', 0, async function(done){
        console.debug("====>ActsOsAccountIsTest_0200 start====");
        var AccountManager = osAccount.getAccountManager();
        console.debug("====>get os AccountManager finish====");
        var isTest = await AccountManager.isTestOsAccount();
        expect(isTest).assertFalse();
        console.debug("====>ActsOsAccountIsTest_0200 end====");
        done();
    })
})

