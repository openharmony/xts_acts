/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';
import account from '@ohos.account.osAccount';


// apply permission for test hap
export async function applyPermission(applictionName, permissionNames) {
    let userId = await account.getAccountManager().getOsAccountLocalIdFromProcess();
    console.info(`userid is :${userId}`)
    let appInfo = await bundle.getApplicationInfo(applictionName, 0, userId);
    let atManager = abilityAccessCtrl.createAtManager();
    if (atManager != null) {
        let tokenID = appInfo.accessTokenId;
        console.info(`[permission] case accessTokenID is ${tokenID}`);
        for (let i = 0; i < permissionNames.length; i++) {
            await atManager.grantUserGrantedPermission(tokenID, permissionNames[i], 1).then((result) => {
                console.info(`[permission] case grantUserGrantedPermission success : ${result}`);
            }).catch((err) => {
                console.info(`[permission] case grantUserGrantedPermission failed : ${err}`);
            });
        }
    } else {
        console.info(`[permission] case apply permission failed, createAtManager failed`);
    }
}