/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'

const injectRef = Object.getPrototypeOf(global) || global
injectRef.regeneratorRuntime = require('@babel/runtime/regenerator')

export default {
    data: {
    },
    onInit() {
        this.title = "scene accessible second application";
    },
    onShow() {
        console.info('====>scene accessible second application start====');
        let appAccountManager = account.createAppAccountManager();
        console.info("====>creat second scene manager finish====");
        let enableBundle = "com.example.actsgetallaccessiblemultiple";
        let enableBundle_2 = "com.example.getmultipleaccountstest"
        console.info("====>add second account start====");
        appAccountManager.createAccount("account_name_scene_second_first", (err)=>{
            console.info("====>add second account err:" + JSON.stringify(err));
            appAccountManager.setAppAccess("account_name_scene_second_first", enableBundle, true, (err)=>{
                console.info("====>enableAppAccess second account err:" + JSON.stringify(err));
                appAccountManager.setAppAccess("account_name_scene_second_first", enableBundle_2, true, (err) => {
                    appAccountManager.createAccount("account_name_scene_second_second", (err)=>{
                        console.info("====>add second account err:" + JSON.stringify(err));
                        appAccountManager.setAppAccess("account_name_scene_second_second", enableBundle, true, (err)=>{
                            appAccountManager.setAppAccess("account_name_scene_second_second", enableBundle_2, true, async (err) => {
                                console.info("====>enableAppAccess second account err:" + JSON.stringify(err));
                                console.info("====>terminateSelfWithResult second");
                                featureAbility.terminateSelfWithResult({
                                    resultCode: 1,
                                    want:
                                    {
                                        bundleName: "com.example.actsaccountaccessiblesecond",
                                        abilityName: "com.example.actsaccountaccessiblesecond.MainAbility"
                                    }
                                })
                            })
                        })
                    })
                })
            })  
        })
    },
    onReady() {
    },
}