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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

const TIMEOUT = 5000;
const LENGTHLIMIT = 1024;
const EACHTIMEOUT = 500;
describe('ActsAccountOAuthToken', function () {
    function sleep(delay) {
        var start = (new Date()).getTime();
        while((new Date()).getTime() - start < delay) {
            continue;
        }
    }

    beforeAll(async function (done) {
        console.debug("====>beforeAll start====");
        sleep(TIMEOUT);
        console.debug("====>beforeAll end====");
        done();
    });

    beforeEach(async function (done) {
        console.debug("====>beforeEach enter====");
        sleep(EACHTIMEOUT);
        done();
    })

    /*
     * @tc.number    : ActsAccountOAuthToken_0100
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Clear the oauth token after obtaining the oauth token that has been set by the application
     *                 account 
     */
    it('ActsAccountOAuthToken_0100', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("accountToken_callback_normal", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_0100 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("accountToken_callback_normal", "token_callback_normal", (err)=>{
                console.debug("====>setOAuthToken ActsAccountOAuthToken_0100 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.getOAuthToken("accountToken_callback_normal", (err, data)=>{
                    console.debug("====>getOAuthToken 0100 err:" + JSON.stringify(err));
                    console.debug("====>getOAuthToken 0100 data:" + data);
                    expect(err.code).assertEqual(0);
                    expect(data).assertEqual("token_callback_normal");
                    appAccountManager.clearOAuthToken("accountToken_callback_normal", (err)=>{
                        console.debug("====>clearOAuthToken 0100 err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        appAccountManager.deleteAccount("accountToken_callback_normal", (err)=>{
                            console.debug("====>delete Account ActsAccountOAuthToken_0100 err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(0);
                            console.debug("====>ActsAccountOAuthToken_0100 end====");
                            done();
                        });
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0200
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Clear the oauth token after obtaining the oauth token that has been set by the application
     *                 account 
     */
    it('ActsAccountOAuthToken_0200', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_0200 start====");
        await appAccountManager.addAccount("accountToken_promise_normal");
        console.debug("====>setOAuthToken ActsAccountOAuthToken_0200 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_normal", "token_promise_normal");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_0200 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_normal");
        console.debug("====>getOAuthToken 0200 data:" + data);     
        expect(data).assertEqual("token_promise_normal");
        console.debug("====>clearOAuthToken ActsAccountOAuthToken_0200 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_normal");
        await appAccountManager.deleteAccount("accountToken_promise_normal");   
        console.debug("====>ActsAccountOAuthToken_0200 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0300
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Get the oauth token of the unset oauth token application account
     */
    it('ActsAccountOAuthToken_0300', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0300 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("accountToken_callback_noset", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_0300 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.getOAuthToken("accountToken_callback_noset", (err, data)=>{
                console.debug("====>getOAuthToken 0300 err:" + JSON.stringify(err));
                console.debug("====>getOAuthToken 0300 data:" + data);
                expect(err.code).assertEqual(0);
                expect(data).assertEqual("");
                appAccountManager.deleteAccount("accountToken_callback_noset", (err)=>{
                    console.debug("====>delete Account ActsAccountOAuthToken_0300 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    console.debug("====>ActsAccountOAuthToken_0300 end====");
                    done();
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0400
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Get the oauth token of the unset oauth token application account
     */
    it('ActsAccountOAuthToken_0400', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0400 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_0400 start====");
        await appAccountManager.addAccount("accountToken_promise_noset");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_0400 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_noset");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_0400 data:" + data);   
        expect(data).assertEqual("");
        await appAccountManager.deleteAccount("accountToken_promise_noset");
        console.debug("====>ActsAccountOAuthToken_0400 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0500
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Obtain the oauth token of the unadded application account
     */
    it('ActsAccountOAuthToken_0500', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0500 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_0500 start====");
        appAccountManager.getOAuthToken("accountToken_callback_noadd", (err, data)=>{
            console.debug("====>getOAuthToken 0500 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_0500 end====");
            done();
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0600
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Obtain the oauth token of the unadded application account
     */
    it('ActsAccountOAuthToken_0600', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0600 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_0600 start====");
        try{
            var data = await appAccountManager.getOAuthToken("accountToken_promise_noadd");
        }
        catch(err){
            console.debug("====>getOAuthToken 0600 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_0600 end====");
            done();
        }
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0700
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Get repeated settings of the same oauth token for the same account
     */
    it('ActsAccountOAuthToken_0700', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0700 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("accountToken_callback_setsame", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_0700 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("accountToken_callback_setsame", "tokenCallback_setsame", (err)=>{
                console.debug("====>setOAuthToken first 0700 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.setOAuthToken("accountToken_callback_setsame", "tokenCallback_setsame", (err)=>{
                    console.debug("====>setOAuthToken second 0700 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    appAccountManager.getOAuthToken("accountToken_callback_setsame", (err, data)=>{
                        console.debug("====>getOAuthToken 0700 err:" + JSON.stringify(err));
                        console.debug("====>getOAuthToken 0700 data:" + data);
                        expect(err.code).assertEqual(0);
                        expect(data).assertEqual("tokenCallback_setsame");
                        appAccountManager.deleteAccount("accountToken_callback_setsame", (err)=>{
                            console.debug("====>delete Account ActsAccountOAuthToken_0700 err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(0);
                            console.debug("====>ActsAccountOAuthToken_0700 end====");
                            done();
                        });
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0800
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Get repeated settings of the same oauth token for the same account
     */
    it('ActsAccountOAuthToken_0800', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0800 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_0800 start====");
        await appAccountManager.addAccount("accountToken_promise_setsame");
        console.debug("====>setOAuthToken first 0800 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_setsame", "tokenPromise_setsame");
        console.debug("====>setOAuthToken second 0800 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_setsame", "tokenPromise_setsame");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_0800 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_setsame");
        console.debug("====>getOAuthToken 0800 data:" + data);   
        expect(data).assertEqual("tokenPromise_setsame");
        console.debug("====>clearOAuthToken ActsAccountOAuthToken_0800 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_setsame");
        console.debug("====>deleteAccount ActsAccountOAuthToken_0800 start====");
        await appAccountManager.deleteAccount("accountToken_promise_setsame");   
        console.debug("====>ActsAccountOAuthToken_0800 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_0900
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Get repeated settings of different oauth tokens for the same account
     */
    it('ActsAccountOAuthToken_0900', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_0900 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("accountToken_callback_setdiff", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("accountToken_callback_setdiff", "callback_setdiff_fir", (err)=>{
                console.debug("====>setOAuthToken first 0900 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.setOAuthToken("accountToken_callback_setdiff", "callback_setdiff_sec", (err)=>{
                    console.debug("====>setOAuthToken second 0900 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    appAccountManager.getOAuthToken("accountToken_callback_setdiff", (err, data)=>{
                        console.debug("====>getOAuthToken 0900 err:" + JSON.stringify(err));
                        console.debug("====>getOAuthToken 0900 data:" + data);
                        expect(err.code).assertEqual(0);
                        expect(data).assertEqual("callback_setdiff_sec");
                        appAccountManager.deleteAccount("accountToken_callback_setdiff", (err)=>{
                            console.debug("====>delete Account ActsAccountOAuthToken_0900 err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(0);
                            console.debug("====>ActsAccountOAuthToken_0900 end====");
                            done();
                        });
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1000
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Get repeated settings of different oauth tokens for the same account
     */
    it('ActsAccountOAuthToken_1000', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1000 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_1000 start====");
        await appAccountManager.addAccount("accountToken_promise_setdiff");
        console.debug("====>setOAuthToken first 1000 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_setdiff", "promise_setdiff_fir");  
        console.debug("====>setOAuthToken second 1000 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_setdiff", "promise_setdiff_sec");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_1000 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_setdiff");
        console.debug("====>getOAuthToken 1000 data:" + data);
        expect(data).assertEqual("promise_setdiff_sec");
        console.debug("====>clearOAuthToken ActsAccountOAuthToken_1000 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_setdiff");
        await appAccountManager.deleteAccount("accountToken_promise_setdiff");   
        console.debug("====>ActsAccountOAuthToken_1000 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1100
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Obtain the oauth token after clearing the oauth token that has been set
     */
    it('ActsAccountOAuthToken_1100', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("accountToken_callback_setclear", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("accountToken_callback_setclear", "callback_setclear_token", (err)=>{
                console.debug("====>setOAuthToken 1100 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.clearOAuthToken("accountToken_callback_setclear", (err)=>{
                    console.debug("====>clearOAuthToken 1100 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    appAccountManager.getOAuthToken("accountToken_callback_setclear", (err, data)=>{
                        console.debug("====>getOAuthToken 1100 err:" + JSON.stringify(err));
                        console.debug("====>getOAuthToken 1100 data:" + data);
                        expect(err.code).assertEqual(0);
                        expect(data).assertEqual("");
                        appAccountManager.deleteAccount("accountToken_callback_setclear", (err)=>{
                            console.debug("====>delete Account ActsAccountOAuthToken_1100 err:" + JSON.stringify(err));
                            console.debug("====>ActsAccountOAuthToken_1100 end====");
                            done();
                        });
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1200
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Obtain the oauth token after clearing the oauth token that has been set
     */
    it('ActsAccountOAuthToken_1200', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_1200 start====");
        await appAccountManager.addAccount("accountToken_promise_setclear");
        console.debug("====>setOAuthToken 1200 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_setclear", "promise_setclear_token");
        console.debug("====>clearOAuthToken 1200 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_setclear");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_1200 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_setclear");
        console.debug("====>getOAuthToken 1200 data:" + data);
        expect(data).assertEqual("");
        await appAccountManager.deleteAccount("accountToken_promise_setclear");
        console.debug("====>ActsAccountOAuthToken_1200 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1300
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Set the oauth token of the unadded application account
     */
    it('ActsAccountOAuthToken_1300', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1300 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var accountNotExist = "accountToken_callback_notExist";
        appAccountManager.setOAuthToken(accountNotExist, "account_notExist_token", (err)=>{
            console.debug("====>setOAuthToken 1300 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_1300 end====");
            done();  
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1400
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Set the oauth token of the unadded application account
     */
    it('ActsAccountOAuthToken_1400', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1400 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var accountNotExist = "accountToken_promise_notExist"
        console.debug("====>setOAuthToken 1400 start====");
        try{
            await appAccountManager.setOAuthToken(accountNotExist, "account_notExist_token");
        }
        catch(err){
            console.debug("====>setOAuthToken 1400 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_1400 end====");
            done();
        }   
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1500
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Clear the oauthtoken of the unadded application account
     */
    it('ActsAccountOAuthToken_1500', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1500 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var accountNotExist = "accountToken_callback_notExist";
        appAccountManager.clearOAuthToken(accountNotExist, (err)=>{
            console.debug("====>clearOAuthToken 1500 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_1500 end====");
            done();  
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1600
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Clear the oauthtoken of the unadded application account
     */
    it('ActsAccountOAuthToken_1600', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1600 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        var accountNotExist = "accountToken_promise_notExist"
        console.debug("====>clearOAuthToken 1600 start====");
        try{
            await appAccountManager.clearOAuthToken(accountNotExist);
        }
        catch(err){
            console.debug("====>clearOAuthToken 1600 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_1600 end====");
            done();
        }   
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1700
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Obtain the oauth token after clearing the unset oauth token
     */
    it('ActsAccountOAuthToken_1700', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1700 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("accountToken_callback_clearget", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_1700 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.clearOAuthToken("accountToken_callback_clearget", (err)=>{
                console.debug("====>clearOAuthToken 1700 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.getOAuthToken("accountToken_callback_clearget", (err)=>{
                    console.debug("====>getOAuthToken 1700 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    appAccountManager.deleteAccount("accountToken_callback_clearget", (err)=>{
                        console.debug("====>delete Account ActsAccountOAuthToken_1700 err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.debug("====>ActsAccountOAuthToken_1700 end====");
                        done();
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1800
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Obtain the oauth token after clearing the unset oauth token
     */
    it('ActsAccountOAuthToken_1800', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1800 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_1800 start====");
        await appAccountManager.addAccount("accountToken_promise_clearget");
        console.debug("====>clearOAuthToken 1800 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_clearget");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_1800 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_clearget");
        console.debug("====>getOAuthToken 1800 dataGet:" + data);
        expect(data).assertEqual("");
        await appAccountManager.deleteAccount("accountToken_promise_clearget");   
        console.debug("====>ActsAccountOAuthToken_1800 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_1900
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Repeatedly clear the oauth token that has been set for the same account
     */
    it('ActsAccountOAuthToken_1900', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_1900 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("account_callback_repeatClear", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_1900 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("account_callback_repeatClear", "callback_repeatClear", (err)=>{
                console.debug("====>setOAuthToken 1900 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.clearOAuthToken("account_callback_repeatClear", (err)=>{
                    console.debug("====>clearOAuthToken first 1900 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    appAccountManager.getOAuthToken("account_callback_repeatClear", (err, data)=>{
                        console.debug("====>getOAuthToken first 1900 err:" + JSON.stringify(err));
                        console.debug("====>getOAuthToken first 1900 data:" + data);
                        expect(err.code).assertEqual(0);
                        expect(data).assertEqual("");
                        appAccountManager.clearOAuthToken("account_callback_repeatClear", (err)=>{
                            console.debug("====>clearOAuthToken second 1900 err:" + JSON.stringify(err));
                            expect(err.code).assertEqual(0);
                            appAccountManager.getOAuthToken("account_callback_repeatClear", (err, data)=>{
                                console.debug("====>getOAuthToken second 1900 err:" + JSON.stringify(err));
                                console.debug("====>getOAuthToken second 1900 data:" + data);
                                expect(err.code).assertEqual(0);
                                expect(data).assertEqual("");
                                appAccountManager.deleteAccount("account_callback_repeatClear", (err)=>{
                                    console.debug("====>delete Account 1900 err:" + JSON.stringify(err));
                                    expect(err.code).assertEqual(0);
                                    console.debug("====>ActsAccountOAuthToken_1900 end====");
                                    done();
                                });
                            });
                        });
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2000
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Repeatedly clear the oauth token that has been set for the same account
     */
    it('ActsAccountOAuthToken_2000', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2000 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_2000 start====");
        await appAccountManager.addAccount("accountToken_promise_setclear");
        console.debug("====>setOAuthToken 2000 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_setclear", "promise_setclear_token");
        console.debug("====>clearOAuthToken first 2000 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_setclear");
        console.debug("====>clearOAuthToken second 2000 start====");
        await appAccountManager.clearOAuthToken("accountToken_promise_setclear");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_2000 start====");
        var dataGet = await appAccountManager.getOAuthToken("accountToken_promise_setclear");
        expect(dataGet).assertEqual("");
        await appAccountManager.deleteAccount("accountToken_promise_setclear");
        console.debug("====>ActsAccountOAuthToken_2000 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2100
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Get the token after setting the token to an empty string
     */
    it('ActsAccountOAuthToken_2100', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("account_callback_empty", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_2100 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("account_callback_empty", "", (err)=>{
                console.debug("====>setOAuthToken 2100 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.getOAuthToken("account_callback_empty", (err, data)=>{
                    console.debug("====>getOAuthToken 2100 err:" + JSON.stringify(err));
                    console.debug("====>getOAuthToken 2100 data:" + data);
                    expect(err.code).assertEqual(0);
                    expect(data).assertEqual("");
                    appAccountManager.deleteAccount("account_callback_empty", (err)=>{
                        console.debug("====>delete Account 2100 err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.debug("====>ActsAccountOAuthToken_2100 end====");
                        done();
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2200
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Get the token after setting the token to an empty string
     */
    it('ActsAccountOAuthToken_2200', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_2200 start====");
        await appAccountManager.addAccount("accountToken_promise_empty");
        console.debug("====>setOAuthToken 2200 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_empty", "");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_2200 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_empty");
        expect(data).assertEqual("");
        await appAccountManager.deleteAccount("accountToken_promise_empty");
        console.debug("====>ActsAccountOAuthToken_2200 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2300
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Get the token after setting the token to a space string
     */
    it('ActsAccountOAuthToken_2300', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2300 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("account_callback_space", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_2300 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("account_callback_space", " ", (err)=>{
                console.debug("====>setOAuthToken 2300 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.getOAuthToken("account_callback_space", (err, data)=>{
                    console.debug("====>getOAuthToken 2300 err:" + JSON.stringify(err));
                    console.debug("====>getOAuthToken 2300 data:" + data);
                    expect(err.code).assertEqual(0);
                    expect(data).assertEqual(" ");
                    appAccountManager.deleteAccount("account_callback_space", (err)=>{
                        console.debug("====>delete Account 2300 err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.debug("====>ActsAccountOAuthToken_2300 end====");
                        done();
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2400
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Get the token after setting the token to a space string
     */
    it('ActsAccountOAuthToken_2400', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2400 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_2400 start====");
        await appAccountManager.addAccount("accountToken_promise_space");
        console.debug("====>setOAuthToken 2400 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_space", " ");
        console.debug("====>getOAuthToken ActsAccountOAuthToken_2400 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_space");
        expect(data).assertEqual(" ");
        await appAccountManager.deleteAccount("accountToken_promise_space");
        console.debug("====>ActsAccountOAuthToken_2400 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2500
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Set the length of the token to exceed the length limit of 1024 characters
     */
    it('ActsAccountOAuthToken_2500', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2500 start====");
        var limitToken = '';
        for (var i = 0; i < LENGTHLIMIT + 1; i++) {
            limitToken += 't';
        }
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("account_callback_lengthlimit", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_2500 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("account_callback_lengthlimit", limitToken, (err)=>{
                console.debug("====>setOAuthToken 2500 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true);
                appAccountManager.deleteAccount("account_callback_lengthlimit", (err)=>{
                    console.debug("====>delete Account 2500 err:" + JSON.stringify(err));
                    expect(err.code).assertEqual(0);
                    console.debug("====>ActsAccountOAuthToken_2500 end====");
                    done();
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2600
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Set the length of the token to exceed the length limit of 1024 characters
     */
    it('ActsAccountOAuthToken_2600', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2600 start====");
        var limitToken = '';
        for (var i = 0; i < LENGTHLIMIT + 1; i++) {
            limitToken += 't';
        }
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_2600 start====");
        await appAccountManager.addAccount("account_promise_lengthlimit");
        console.debug("====>setOAuthToken 2600 start====");
        try{
            await appAccountManager.setOAuthToken("account_promise_lengthlimit", limitToken);
        }
        catch(err){
            console.debug("====>setOAuthToken ActsAccountOAuthToken_2600 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>delete account ActsAccountOAuthToken_2600 start====");
            await appAccountManager.deleteAccount("account_promise_lengthlimit");
            console.debug("====>ActsAccountOAuthToken_2600 end====");
            done();
        }
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2700
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Set the length of the token to just reach the length limit of 1024 characters
     */
    it('ActsAccountOAuthToken_2700', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2700 start====");
        var tokenLimit = '';
        for (var i = 0; i < LENGTHLIMIT; i++) {
            tokenLimit += 't';
        }
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.addAccount("account_callback_limit", (err)=>{
            console.debug("====>add account ActsAccountOAuthToken_2700 err:" + JSON.stringify(err));
            expect(err.code).assertEqual(0);
            appAccountManager.setOAuthToken("account_callback_limit", tokenLimit, (err)=>{
                console.debug("====>setOAuthToken 2700 err:" + JSON.stringify(err));
                expect(err.code).assertEqual(0);
                appAccountManager.getOAuthToken("account_callback_limit", (err, data)=>{
                    console.debug("====>getOAuthToken 2700 err:" + JSON.stringify(err));
                    console.debug("====>getOAuthToken 2700 data:" + data);
                    expect(err.code).assertEqual(0);
                    expect(data).assertEqual(tokenLimit);
                    appAccountManager.deleteAccount("account_callback_limit", (err)=>{
                        console.debug("====>delete Account 2700 err:" + JSON.stringify(err));
                        expect(err.code).assertEqual(0);
                        console.debug("====>ActsAccountOAuthToken_2700 end====");
                        done();
                    });
                });
            });
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2800
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Set the length of the token to just reach the length limit of 1024 characters
     */
    it('ActsAccountOAuthToken_2800', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2800 start====");
        var tokenLimit = '';
        for (var i = 0; i < LENGTHLIMIT; i++) {
            tokenLimit += 't';
        }
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add account ActsAccountOAuthToken_2800 start====");
        await appAccountManager.addAccount("accountToken_promise_limit");
        console.debug("====>setOAuthToken 2800 start====");
        await appAccountManager.setOAuthToken("accountToken_promise_limit", tokenLimit);
        console.debug("====>getOAuthToken ActsAccountOAuthToken_2800 start====");
        var data = await appAccountManager.getOAuthToken("accountToken_promise_limit");
        expect(data).assertEqual(tokenLimit);
        await appAccountManager.deleteAccount("accountToken_promise_limit");
        console.debug("====>ActsAccountOAuthToken_2800 end====");
        done();
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_2900
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Clear token parameter name is an empty string
     */
    it('ActsAccountOAuthToken_2900', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_2900 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.clearOAuthToken("", (err)=>{
            console.debug("====>clearOAuthToken 2900 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_2900 end====");
            done();
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_3000
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Clear token parameter name is an empty string
     */
    it('ActsAccountOAuthToken_3000', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_3000 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>clearOAuthToken 3000 start====");
        try{
            await appAccountManager.clearOAuthToken("");
        }
        catch(err){
            console.debug("====>clearOAuthToken ActsAccountOAuthToken_3000 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_3000 end====");
            done();
        }
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_3100
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : The clear token parameter name is a space string
     */
    it('ActsAccountOAuthToken_3100', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_3100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.clearOAuthToken(" ", (err)=>{
            console.debug("====>clearOAuthToken 3100 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_3100 end====");
            done();
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_3200
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : The clear token parameter name is a space string
     */
    it('ActsAccountOAuthToken_3200', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_3200 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>clearOAuthToken 3200 start====");
        try{
            await appAccountManager.clearOAuthToken(" ");
        }
        catch(err){
            console.debug("====>clearOAuthToken ActsAccountOAuthToken_3200 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_3200 end====");
            done();
        }
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_3300
     * @tc.name      : Test oauth token in callback form
     * @tc.desc      : Clear the token parameter name exceeds the length limit of 1024 characters
     */
    it('ActsAccountOAuthToken_3300', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_3300 start====");
        var nameLimit = '';
        for (var i = 0; i < LENGTHLIMIT + 1; i++) {
            nameLimit += 't';
        }
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        appAccountManager.clearOAuthToken(nameLimit, (err)=>{
            console.debug("====>clearOAuthToken first 3300 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_3300 end====");
            done();
        });
    });

    /*
     * @tc.number    : ActsAccountOAuthToken_3400
     * @tc.name      : Test oauth token in promise form
     * @tc.desc      : Clear the token parameter name exceeds the length limit of 1024 characters
     */
    it('ActsAccountOAuthToken_3400', 0, async function (done) {
        console.debug("====>ActsAccountOAuthToken_3400 start====");
        var nameLimit = '';
        for (var i = 0; i < LENGTHLIMIT + 1; i++) {
            nameLimit += 't';
        }
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>clearOAuthToken first 3400 start====");
        try{
            await appAccountManager.clearOAuthToken(nameLimit);
        }
        catch(err){
            console.debug("====>clearOAuthToken ActsAccountOAuthToken_3400 err:" + JSON.stringify(err));
            expect(err.code != 0).assertEqual(true);
            console.debug("====>ActsAccountOAuthToken_3400 end====");
            done();
        }
    });
})