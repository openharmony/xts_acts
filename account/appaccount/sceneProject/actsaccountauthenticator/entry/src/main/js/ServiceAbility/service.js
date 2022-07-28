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
import {MyAuthenticator} from '../Common/utils'

var TAG = "[AccountTest]"
var authenticator = null
export default {
    async onStart(want) {
        console.info('ServiceAbility onStart');
        var accountMgr = account_appAccount.createAppAccountManager();
        try {
            await accountMgr.addAccount("zhangsan", "");
            await accountMgr.enableAppAccess("zhangsan", "com.example.accounttest");
            await accountMgr.addAccount("lisi", "");
            await accountMgr.enableAppAccess("lisi", "com.example.accounttest");
            await accountMgr.addAccount("wangwu", "");
            await accountMgr.enableAppAccess("wangwu", "com.example.accounttest");
        } catch(err) {
            console.error(TAG + "addAccount or enableAppAccess failed, error: " + JSON.stringify(err))
        }
        console.info('ServiceAbility onStart end');
    },
    async onStop() {
        console.info('ServiceAbility onStop');
    },
    onConnect(want) {
        console.info('ServiceAbility onConnect');
        authenticator = new MyAuthenticator();
        return authenticator.getRemoteObject();
    },
    onReconnect(want) {
        console.info('ServiceAbility onReconnect');
    },
    onDisconnect() {
        console.info('ServiceAbility onDisconnect');
    },
    onCommand(want, restart, startId) {
        console.info('ServiceAbility onCommand');
    }
};