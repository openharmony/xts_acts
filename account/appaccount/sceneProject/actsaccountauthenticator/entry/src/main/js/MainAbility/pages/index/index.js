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
import account_appAccount from '@ohos.account.appAccount';
import featureAbility from '@ohos.ability.featureAbility'

export default {
    data: {
        title: "Hello World"
    },
    onInit() {
        this.title = this.$t('strings.world');
    },
    onShow() {
        console.info('ServiceAbility onStart');
        var accountMgr = account_appAccount.createAppAccountManager();
        console.info('ServiceAbility lcc addAccount 01 onStart');
        accountMgr.addAccount("zhangsan", "",(data)=>{
            console.info('ServiceAbility lcc enableAppAccess 01 onStart');
            accountMgr.enableAppAccess("zhangsan", "com.example.actsaccounttest");
            console.info('ServiceAbility lcc addAccount 02 onStart');
            accountMgr.addAccount("lisi", "",(err)=>{
                console.info('ServiceAbility lcc enableAppAccess 02 onStart');
                accountMgr.enableAppAccess("lisi", "com.example.actsaccounttest");
                console.info('ServiceAbility lcc addAccount 03 onStart');
                accountMgr.addAccount("wangwu", "",(err)=>{
                    console.info('ServiceAbility lcc enableAppAccess 03 onStart');
                    accountMgr.enableAppAccess("wangwu", "com.example.actsaccounttest",(err)=>{
                        featureAbility.terminateSelf();
                        console.info('ServiceAbility add end');
                    });
                });
            });
        });
        console.info('ServiceAbility onStart end');
    },
    onReady() {
    },
}