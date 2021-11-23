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

const TIMEOUT = 3000;
const TIMEOUTEND = 5000;

describe('ActsGetAllAccessibleMultiple', function () {
    beforeAll(async function (done) {
        console.debug("====>startAbility first 0100 start====");
        await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsaccountaccessiblefirst",
                    abilityName: "com.example.actsaccountaccessiblefirst.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            },
        );
        setTimeout(done(), 5000);
    });

    /*
     * @tc.number    : ActsGetAllAccessibleMultiple_0100
     * @tc.name      : getAllAccessibleAccounts
     * @tc.desc      : This application adds multiple account, other applications authorizes multiple accounts to this
     *                 application and this application obtains authorization
     */
    it('ActsGetAllAccessibleMultiple_0100', 0, async function (done) {
        console.debug("====>ActsGetAllAccessibleMultiple_0100 start====");
        var appAccountManager = account.createAppAccountManager();
        console.debug("====>creat finish====");
        console.debug("====>add first account 0100 start====");
        await appAccountManager.addAccount("accessibleAccount_this_application_first");
        console.debug("====>add second account 0100 start====");
        await appAccountManager.addAccount("accessibleAccount_this_application_second");
        console.debug("====>add third account 0100 start====");
        await appAccountManager.addAccount("accessibleAccount_this_application_third");
        console.debug("====>startAbility second 0100 start====");
        await featureAbility.startAbility(
            {
                want:
                {
                    deviceId: "",
                    bundleName: "com.example.actsaccountaccessiblesecond",
                    abilityName: "com.example.actsaccountaccessiblesecond.MainAbility",
                    action: "action1",
                    parameters:
                    {},
                },
            }
        );
        setTimeout(async function(){
            console.debug("====>getAllAccessibleAccounts 0100 start====");
            try{
                var data = await appAccountManager.getAllAccessibleAccounts();
            }
            catch(err){
                console.error("====>getAllAccessibleAccounts 0100 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>getAllAccessibleAccounts 0100 data:" + JSON.stringify(data));
            expect(data.length).assertEqual(7);
            try{
                expect(data[0].name).assertEqual("account_name_scene_first_first");
                expect(data[0].owner).assertEqual("com.example.actsaccountaccessiblefirst");
                expect(data[1].name).assertEqual("account_name_scene_first_second");
                expect(data[1].owner).assertEqual("com.example.actsaccountaccessiblefirst");
                expect(data[2].name).assertEqual("account_name_scene_second_first");
                expect(data[2].owner).assertEqual("com.example.actsaccountaccessiblesecond");
                expect(data[3].name).assertEqual("account_name_scene_second_second");
                expect(data[3].owner).assertEqual("com.example.actsaccountaccessiblesecond");
                expect(data[4].name).assertEqual("accessibleAccount_this_application_first");
                expect(data[4].owner).assertEqual("com.example.actsgetallaccessiblemultiple");
                expect(data[5].name).assertEqual("accessibleAccount_this_application_second");
                expect(data[5].owner).assertEqual("com.example.actsgetallaccessiblemultiple");
                expect(data[6].name).assertEqual("accessibleAccount_this_application_third");
                expect(data[6].owner).assertEqual("com.example.actsgetallaccessiblemultiple");
            }
            catch(err){
                console.error("====>check data 0100 fail err:" + JSON.stringify(err));
                expect().assertFail();
                done();
            }
            console.debug("====>delete account 0100 start====");
            await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
            await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
            await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
            console.debug("====>ActsGetAllAccessibleAccounts_0100 end====");
            done();
        }, TIMEOUT);
        setTimeout(function(){
            console.debug("====>time out ActsGetAllAccessibleMultiple_0100====>");
        }, TIMEOUTEND);
    });
})