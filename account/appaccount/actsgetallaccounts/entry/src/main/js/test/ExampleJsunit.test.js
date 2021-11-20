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

const TIMEOUT = 2000;
const STRCOUNT = 1025;
describe('ActsGetAllAccounts', function () {

    /*
     * @tc.number    : ActsGetAllAccounts_0100
     * @tc.name      : getAllAccounts callback
     * @tc.desc      : This application gets its own application information after adding an account
     */
    it('ActsGetAllAccounts_0100', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var selfBundle = "com.example.actsgetallaaccounts";
        appAccountManager.addAccount("Account_this_application_callback", (err)=>{
            console.debug("====>add account 0100 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
                console.debug("====>getAllAccounts 0100 err:" + JSON.stringify(err));
                console.debug("====>getAllAccounts 0100 data:" + JSON.stringify(data));
                expect(err.code).assertEqual(0);
                try{
                    expect(data[0].name).assertEqual("Account_this_application_callback");
                    expect(data[0].owner).assertEqual("com.example.actsgetallaaccounts");
                }
                catch(err){
                    console.error("====>getAllAccounts 0100 fail err:" + JSON.stringify(err));
                    expect().assertFail();
                    done();
                }
                appAccountManager.deleteAccount("Account_this_application_callback", (err)=>{
                    console.debug("====>delete account 0100 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    console.debug("====>ActsGetAllAccounts_0100 end====");
                    done();
                });
            })
        });
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0200
     * @tc.name      : getAllAccounts promise
     * @tc.desc      : This application gets its own application information after adding an account
     */
    it('ActsGetAllAccounts_0200', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var selfBundle = "com.example.actsgetallaaccounts";
        console.debug("====>add account 0200 start====");
        await appAccountManager.addAccount("Account_this_application_promise");
        console.debug("====>getAllAccounts 0200 start====");
        try{
            var data = await appAccountManager.getAllAccounts(selfBundle);
        }
        catch(err){
            console.error("====>getAllAccounts 0200 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }       
        try{
            expect(data[0].name).assertEqual("Account_this_application_promise");
            expect(data[0].owner).assertEqual("com.example.actsgetallaaccounts");
        }
        catch(err){
            console.error("====>check data 0200 fail err:" + JSON.stringify(err));
            expect().assertFail();
            done();
        }
        console.debug("====>delete account 0200 start====");
        await appAccountManager.deleteAccount("Account_this_application_promise");      
        console.debug("====>ActsGetAllAccounts_0200 end====");
        done();
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0300
     * @tc.name      : getAllAccounts callback
     * @tc.desc      : No account has been added to this application and it is not authorized by other applications to
     *                 obtain account information for this application
     */
    it('ActsGetAllAccounts_0300', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0300 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var selfBundle = "com.example.actsgetallaaccounts";
        appAccountManager.getAllAccounts(selfBundle, (err, data)=>{
            console.debug("====>getAllAccounts 0300 err:" + JSON.stringify(err));
            console.debug("====>getAllAccounts 0300 data:" + JSON.stringify(data));
            expect(err.code).assertEqual(0);
            expect(data.length).assertEqual(0);
            console.debug("====>ActsGetAllAccounts_0300 end====");
            done();
        })
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0400
     * @tc.name      : getAllAccounts promise
     * @tc.desc      : No account has been added to this application and it is not authorized by other applications to
     *                 obtain account information for this application
     */
    it('ActsGetAllAccounts_0400', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0400 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var selfBundle = "com.example.actsgetallaaccounts";
        var data = await appAccountManager.getAllAccounts(selfBundle);
        console.debug("====>getAllAccounts 0400 data:" + JSON.stringify(data));   
        expect(data.length).assertEqual(0);
        console.debug("====>ActsGetAllAccounts_0400 end====");
        done();
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0500
     * @tc.name      : getAllAccounts callback
     * @tc.desc      : The parameter owner is an empty string
     */
    it('ActsGetAllAccounts_0500', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0500 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var emptyBundle = "";
        appAccountManager.getAllAccounts(emptyBundle, (err, data)=>{
            console.debug("====>getAllAccounts 0500 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsGetAllAccounts_0500 end====");
            done();
        })
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0600
     * @tc.name      : getAllAccounts promise
     * @tc.desc      : The parameter owner is an empty string
     */
    it('ActsGetAllAccounts_0600', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0600 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var emptyBundle = "";
        try{
            var data = await appAccountManager.getAllAccounts(emptyBundle);
        }
        catch(err){
            console.debug("====>getAllAccounts 0600 err:" + JSON.stringify(err));   
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsGetAllAccounts_0600 end====");
            done();
        }
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0700
     * @tc.name      : getAllAccounts callback
     * @tc.desc      : The parameter owner is a string that exceeds the length limit
     */
    it('ActsGetAllAccounts_0700', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0700 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var bigBundleName = '';
        for (var i = 0; i < STRCOUNT; i++) {
            bigBundleName += 't';
        }
        appAccountManager.getAllAccounts(bigBundleName, (err, data)=>{
            console.debug("====>getAllAccounts 0700 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsGetAllAccounts_0700 end====");
            done();
        })
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0800
     * @tc.name      : getAllAccounts promise
     * @tc.desc      : The parameter owner is a string that exceeds the length limit
     */
    it('ActsGetAllAccounts_0800', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0800 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var bigBundleName = '';
        for (var i = 0; i < STRCOUNT; i++) {
            bigBundleName += 't';
        }
        try{
            var data = await appAccountManager.getAllAccounts(bigBundleName);
        }
        catch(err){
            console.debug("====>getAllAccounts 0800 err:" + JSON.stringify(err));   
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsGetAllAccounts_0800 end====");
            done();
        }
    });

    /*
     * @tc.number    : ActsGetAllAccounts_0900
     * @tc.name      : getAllAccounts
     * @tc.desc      : This application adds an account, and after other applications authorize an account to this
     *                 application, this application obtains the information of its own application
     */
    it('ActsGetAllAccounts_0900', 0, async function (done) {
        console.debug("====>ActsGetAllAccounts_0900 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var selfBundle = "com.example.actsgetallaaccounts";
        console.debug("====>add account 0900 start====");
        await appAccountManager.addAccount("Account_this_application");
        console.debug("====>startAbility 0900 start====");
        await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsscenegetallaccounts",
                    abilityName: "com.example.actsscenegetallaccounts.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
        );
        setTimeout(async function(){
            console.debug("====>getAllAccounts 0900 start====");
            try{
                var data = await appAccountManager.getAllAccounts(selfBundle);
            }
            catch(err){
                console.error("====>getAllAccounts 0900 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAllAccounts 0900 data:" + JSON.stringify(data));
            try{
                expect(data[0].name).assertEqual("Account_this_application");
                expect(data[0].owner).assertEqual("com.example.actsgetallaaccounts");
            }
            catch(err){
                console.error("====>check data 0900 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>delete account 0900 start====");
            await appAccountManager.deleteAccount("Account_this_application");
            console.debug("====>ActsGetAllAccounts_0900 end====");
            done();
        }, TIMEOUT); 
    });
})