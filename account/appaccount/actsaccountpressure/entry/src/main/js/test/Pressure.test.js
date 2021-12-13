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
import account from '@ohos.account.appAccount'
import featureAbility from '@ohos.ability.featureability'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const STRESSLEVEL = 100;
const TIMEOUT = 300;
const ACCOUNTLIMIT = 1000;
describe('ActsAccountPressure', function () {

    beforeAll(async function (done) {
        console.debug("====>startAbility start====");
        await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsaccountsceneappaccess",
                    abilityName: "com.example.actsaccountsceneappaccess.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
        );
        sleep(TIMEOUT);
        setTimeout(done(), TIMEOUT);
    });

    function sleep(delay) {
        var start = (new Date()).getTime();
        while((new Date()).getTime() - start < delay) {
            continue;
        }
    }

    /*
     * @tc.number    : ActsAccountPressure_0100
     * @tc.name      : Stress test add and delete accounts
     * @tc.desc      : Stress test to add and delete accounts, and to determine the success of the addition and
     *                 deletion by obtaining the specified application information
     */
    it('ActsAccountPressure_0100', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0100 start====");
        var appAccountManager = account.createAppAccountManager();
        var selfBundle = "com.example.actsaccountpressure";
        let count;
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>addAccount time: " + count);
            try{
                await appAccountManager.addAccount("account_pressure_promise");
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>addAccount fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            var data = await appAccountManager.getAllAccounts(selfBundle);
            sleep(TIMEOUT);
            console.debug("====>getAllAccounts time: " + count);
            console.debug('====>getAllAccounts data: ' + JSON.stringify(data));
            expect(typeof data).assertEqual('object');
            expect(data[0].name).assertEqual("account_pressure_promise");
            expect(data[0].owner).assertEqual(selfBundle);
            expect(data.length).assertEqual(1);
            console.debug("====>deleteAccount time: " + count);
            try{
                await appAccountManager.deleteAccount("account_pressure_promise");
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>deleteAccount fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            var dataDel = await appAccountManager.getAllAccounts(selfBundle);
            console.debug("====>getAllAccounts time: " + count);
            console.debug('====>getAllAccounts dataDel: ' + JSON.stringify(dataDel));
            expect(typeof data).assertEqual('object');
            expect(dataDel.length).assertEqual(0);
            if(data.length != 1 || dataDel.length != 0){
                break;
            }
            sleep(TIMEOUT);
        }
        console.debug("====>the number of times to complete the stress test is: " + count);
        console.debug("====>ActsAccountPressure_0100 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0200
     * @tc.name      : Stress test add and delete accounts
     * @tc.desc      : Stress test callback form add and delete accounts
     */
    it('ActsAccountPressure_0200', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let flag = true;
        let count = 0;
        for (let i = 0; i < STRESSLEVEL; i++) {
            let accountName = "account_pressure_callback" + i;
            appAccountManager.addAccount(accountName, (err)=>{
                console.debug('====>addAccount name: ' + accountName);
                expect(err.code).assertEqual(0);
                if(err.code != 0){
                    console.error("====>addAccount fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    flag = false;
                    done();
                }
                appAccountManager.deleteAccount(accountName, (err)=>{
                    console.debug('====>deleteAccount name: ' + accountName);
                    expect(err.code).assertEqual(0);
                    if(err.code != 0){
                        console.error("====>deleteAccount fail err:" + JSON.stringify(err));
                        console.error('====>call function level is: ' + count);
                        expect().assertFail();
                        flag = false;
                        done();
                    }
                    if (count == STRESSLEVEL - 1) {
                        count++;
                        console.debug("====>the number of times to complete the stress test is: " + count);
                        console.debug("====>ActsAccountPressure_0200 end====");
                        done();
                    } 
                    count++;
                    sleep(TIMEOUT);
                })
            });
            sleep(TIMEOUT);
            if (!flag) {
                done();
                break;
            }
        }  
    });

    /*
     * @tc.number    : ActsAccountPressure_0300
     * @tc.name      : Stress test add and delete accounts
     * @tc.desc      : Stress testing a large number of adding accounts together and deleting accounts together
     */
    it('ActsAccountPressure_0300', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0300 start====");
        var appAccountManager = account.createAppAccountManager();
        let count;
        let STRESSNUM;
        if(STRESSLEVEL > ACCOUNTLIMIT){
            STRESSNUM = ACCOUNTLIMIT;
        }else{
            STRESSNUM = STRESSLEVEL;
        }
        console.debug("====>addAccount start====");
        for (count = 0; count < STRESSNUM; count++) {
            let accountName = "account_pressure_limit" + count;
            console.debug('====>addAccount name: ' + accountName);
            try{
                await appAccountManager.addAccount(accountName);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>addAccount fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        }
        if(STRESSNUM == ACCOUNTLIMIT){
            try{
                await appAccountManager.addAccount("account_name_limit");
                console.debug("====>the number of added accounts exceeds the limit====");
                expect().assertFail();
                done();
            }
            catch(err){
                console.debug("====>add Account that exceed the limit err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                await appAccountManager.deleteAccount("account_name_limit");
            }
        }
        console.debug("====>deleteAccount start====");
        for (count = 0; count < STRESSNUM; count++) {
            let accountName = "account_pressure_limit" + count;
            console.debug('====>deleteAccount name: ' + accountName);
            try{
                await appAccountManager.deleteAccount(accountName);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>deleteAccount fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        }
        console.debug("====>the number of times to complete the stress test is: " + count)
        console.debug("====>ActsAccountPressure_0300 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0400
     * @tc.name      : Stress test enableAppAccess and disableAppAccess
     * @tc.desc      : Stress test authorize the account to the application and de-authorize the account to the
     *                 application
     */
    it('ActsAccountPressure_0400', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0400 start====");
        var appAccountManager = account.createAppAccountManager();
        var enableBundle = "com.example.actsaccountsceneappaccess";
        let count;
        console.debug("====>addAccount 0400 start====");
        try{
            await appAccountManager.addAccount("account_pressure_enable");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("====>addAccount fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>enableAppAccess time: " + count);
            try{
                await appAccountManager.enableAppAccess("account_pressure_enable", enableBundle);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>enableAppAccess 0400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>disableAppAccess time: " + count);
            try{
                await appAccountManager.disableAppAccess("account_pressure_enable", enableBundle);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>disableAppAccess 0400 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        }
        console.debug("====>deleteAccount 0400 start====");
        try{
            await appAccountManager.deleteAccount("account_pressure_enable");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("====>deleteAccount fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count)
        console.debug("====>ActsAccountPressure_0400 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0500
     * @tc.name      : Stress test setAssociatedData and getAssociatedData
     * @tc.desc      : Stress test setting associated data and obtaining associated data
     */
    it('ActsAccountPressure_0500', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0500 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        let associateKey = "";
        let associateValue = "";
        console.debug("====>add account 0500 start====");
        try{
            await appAccountManager.addAccount("account_pressure_associate");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("====>add Account ActsAccountPressure_0500 err:" + JSON.stringify(err));
            expect().asserFail();
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>setAssociatedData time: " + count);
            associateKey = "key_pre" + count;
            associateValue = "value_pressure" + count;
            try{
                await appAccountManager.setAssociatedData("account_pressure_associate", associateKey, associateValue);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>setAssociatedData ActsAccountPressure_0500 err:" + JSON.stringify(err));
                expect().asserFail();
                done();
            }
            console.debug("====>getAssociatedData time: " + count);
            try{
                var data = await appAccountManager.getAssociatedData("account_pressure_associate", associateKey);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>getAssociatedData ActsAccountPressure_0500 err:" + JSON.stringify(err));
                expect().asserFail();
                done();
            }
            console.debug("====>getAssociatedData data:" + JSON.stringify(data));
            expect(data).assertEqual(associateValue);
        }
        console.debug("====>deleteAccount 0500 start====");
        try{
            await appAccountManager.deleteAccount("account_pressure_associate");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("====>delete account 0500 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count)
        console.debug("====>ActsAccountPressure_0500 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0600
     * @tc.name      : Stress test setAccountExtraInfo and getAccountExtraInfo
     * @tc.desc      : Stress test setting additional information and obtaining additional information
     */
    it('ActsAccountPressure_0600', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0600 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        let extraInfo = "";
        console.debug("====>add account 0600 start====");
        try{
            await appAccountManager.addAccount("account_pressure_extrainfo");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("====>addAccount 0600 err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>setAccountExtraInfo time: " + count);
            extraInfo = "pressure_extra" + count;
            try{
                await appAccountManager.setAccountExtraInfo("account_pressure_extrainfo", extraInfo);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>setAccountExtraInfo 0600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAccountExtraInfo time: " + count);
            try{
                var data = await appAccountManager.getAccountExtraInfo("account_pressure_extrainfo");
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>getAccountExtraInfo 0600 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAccountExtraInfo data:" + JSON.stringify(data));
            expect(data).assertEqual(extraInfo);
        }
        console.debug("====>delete account 0600 start====");
        try{
            await appAccountManager.deleteAccount("account_pressure_extrainfo");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("====>deleteAccount 0600 err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count)
        console.debug("====>ActsAccountPressure_0600 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0700
     * @tc.name      : Stress test setAccountCredential and getAccountCredential
     * @tc.desc      : Stress test setting credential and obtaining credential
     */
    it('ActsAccountPressure_0700', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0700 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        let credentialType = "";
        let credentialvalue = "";
        console.debug("====>addAccount 0700 start====");
        try{
            await appAccountManager.addAccount("account_credential");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("addAccount 0700 err:" + JSON.stringify(err));
            expect().assertFail(); 
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>setAccountCredential time: " + count);
            credentialType = "pressure_credentialType" + count;
            credentialvalue = "pressure_credential" + count;
            try{
                await appAccountManager.setAccountCredential("account_credential", credentialType, credentialvalue);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("setAccountCredential 0700 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAccountCredential time: " + count);
            try{
                var data = await appAccountManager.getAccountCredential("account_credential", credentialType);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("getAccountCredential 0700 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAccountCredential 0700 data:" + JSON.stringify(data));
            expect(data).assertEqual(credentialvalue);
        }
        console.debug("====>delete account 0700 start====");
        try{
            await appAccountManager.deleteAccount("account_credential");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("deleteAccount 0700 err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count)
        console.debug("====>ActsAccountPressure_0700 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0800
     * @tc.name      : setOAuthToken getOAuthToken and clearOAuthToken
     * @tc.desc      : Stress test sets the token, obtains the token and then clears the token
     */
    it('ActsAccountPressure_0800', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0800 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        let oauthToken = "";
        console.debug("====>addAccount 0800 start====");
        try{
            await appAccountManager.addAccount("accountToken_pressure_token");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("addAccount 0800 err:" + JSON.stringify(err));
            expect().assertFail(); 
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>setOAuthToken time: " + count);
            oauthToken = "pressure_token" + count;
            try{
                await appAccountManager.setOAuthToken("accountToken_pressure_token", oauthToken);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("setOAuthToken 0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getOAuthToken time: " + count);
            try{
                var data = await appAccountManager.getOAuthToken("accountToken_pressure_token");
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("getOAuthToken 0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getOAuthToken data: " + data);
            expect(data).assertEqual(oauthToken);
            console.debug("====>clearOAuthToken time: " + count);
            try{
                await appAccountManager.clearOAuthToken("accountToken_pressure_token");
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("clearOAuthToken 0800 err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        }
        console.debug("====>delete account 0800 start====");
        try{
            await appAccountManager.deleteAccount("accountToken_pressure_token");
            sleep(TIMEOUT);
        }
        catch(err){
            console.error("deleteAccount 0800 err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count);
        console.debug("====>ActsAccountPressure_0800 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_0900
     * @tc.name      : Stress test setAppAccountSyncEnable and checkAppAccountSyncEnable
     * @tc.desc      : Stress test setting synchronization flag and obtaining synchronization flag
     */
    it('ActsAccountPressure_0900', 0, async function (done) {
        console.debug("====>ActsAccountPressure_0900 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        console.debug("====>add account 0900 start====");
        try{
            await appAccountManager.addAccount("account_pressure_syncenable");
        }
        catch(err){
            console.error("====>add account 0900 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>setAppAccountSyncEnable time: " + count);
            try{
                await appAccountManager.setAppAccountSyncEnable("account_pressure_syncenable", true);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>setAppAccountSyncEnable 0900 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>checkAppAccountSyncEnable time: " + count);
            try{
                var data = await appAccountManager.checkAppAccountSyncEnable("account_pressure_syncenable");
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>checkAppAccountSyncEnable 0900 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>checkAppAccountSyncEnable data:" + data);
            expect(data).assertEqual(true);
        }
        console.debug("====>delete account 0900 start====");
        try{
            await appAccountManager.deleteAccount("account_pressure_syncenable");
        }
        catch(err){
            console.error("====>delete account 0900 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count);
        console.debug("====>ActsAccountPressure_0900 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_1000
     * @tc.name      : Stress test getAllAccounts
     * @tc.desc      : Stress test to obtain specified application information
     */
    it('ActsAccountPressure_1000', 0, async function (done) {
        console.debug("====>ActsAccountPressure_1000 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        var specifyBundle = "com.example.actsaccountsceneappaccess";
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>getAllAccounts time: " + count);
            try{
                var data = await appAccountManager.getAllAccounts(specifyBundle);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>getAllAccounts 1000 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAllAccounts data: " + JSON.stringify(data));   
            expect(data[0].name).assertEqual("account_name_scene_first");
            expect(data[0].owner).assertEqual(specifyBundle);
            expect(data[1].name).assertEqual("account_name_scene_second");
            expect(data[1].owner).assertEqual(specifyBundle);
        }
        console.debug("====>the number of times to complete the stress test is: " + count);
        console.debug("====>ActsAccountPressure_1000 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_1100
     * @tc.name      : Stress test getAllAccessibleAccounts
     * @tc.desc      : Stress test to obtain the application account information and authorized account information
     */
    it('ActsAccountPressure_1100', 0, async function (done) {
        console.debug("====>ActsAccountPressure_1100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        let count;
        var selfBundle = "com.example.actsaccountpressure";
        var specifyBundle = "com.example.actsaccountsceneappaccess";
        console.debug("====>add account 1100 start====");
        try{
            await appAccountManager.addAccount("account_accessible_first");
            await appAccountManager.addAccount("account_accessible_second");
        }
        catch(err){
            console.error("====>add account 1100 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>getAllAccounts time: " + count);
            try{
                var data = await appAccountManager.getAllAccessibleAccounts();
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>getAllAccounts 1100 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAllAccounts data: " + JSON.stringify(data));
            console.debug("====>getAllAccounts data.length: " + data.length);
            expect(data.length).assertEqual(4); 
            expect(data[0].name).assertEqual("account_name_scene_first");
            expect(data[0].owner).assertEqual(specifyBundle);
            expect(data[1].name).assertEqual("account_name_scene_second");
            expect(data[1].owner).assertEqual(specifyBundle);
            expect(data[2].name).assertEqual("account_accessible_first");
            expect(data[2].owner).assertEqual(selfBundle);
            expect(data[3].name).assertEqual("account_accessible_second");
            expect(data[3].owner).assertEqual(selfBundle);
        }
        console.debug("====>delete account 1100 start====");
        try{
            await appAccountManager.deleteAccount("account_accessible_first");
            await appAccountManager.deleteAccount("account_accessible_second");
        }
        catch(err){
            console.error("====>delete account 1100 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>the number of times to complete the stress test is: " + count);
        console.debug("====>ActsAccountPressure_1100 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountPressure_1200
     * @tc.name      : Stress test on and off
     * @tc.desc      : Stress test receive account information changes
     */
    it('ActsAccountPressure_1200', 0, async function (done) {
        console.debug("====>ActsAccountPressure_1200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat appAccountManager finish");
        console.debug("====>add account 1200 start");
        let count;
        var countSign = 0;
        let changeExtra = "";
        try{
            await appAccountManager.addAccount("account_pressure_onoff");
        }
        catch(err){
            console.error("====>add account 1200 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        function changeOnCallback(data){
            console.debug("====>receive change 1200 data:" + JSON.stringify(data));
            expect(data[0].name).assertEqual("account_pressure_onoff");
            expect(data[0].owner).assertEqual("com.example.actsaccountpressure");
            countSign++;
        }
        console.debug("====>on ActsAccountPressure_1200 start");
        try{
            appAccountManager.on('change', ["com.example.actsaccountpressure"], changeOnCallback);
        }
        catch(err){
            console.error("====>on ActsAccountPressure_1200 err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        for (count = 0; count < STRESSLEVEL; count++) {
            console.debug("====>change account information time: " + count);
            changeExtra = "pressure_extra" + count;
            try{
                await appAccountManager.setAccountExtraInfo("account_pressure_onoff", changeExtra);
                sleep(TIMEOUT);
            }
            catch(err){
                console.error("====>setAccountExtraInfo fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        }
        console.debug("====>off 1200 start====");
        appAccountManager.off('change', async function (){
            console.debug("====>off enter====");
            console.debug("====>countSign is: " + countSign);
            expect(countSign).assertEqual(STRESSLEVEL);
            console.debug("====>delete account====");
            try{
                await appAccountManager.deleteAccount("account_pressure_onoff");
            }
            catch(err){
                console.error("====>delete account 1200 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>the number of times to complete the stress test is: " + count);
            console.debug("====>ActsAccountPressure_1200 end====");
            done();
        });
    });
})