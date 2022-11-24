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

import bundle from '@ohos.bundle'
import account from '@ohos.account.osAccount'
import { describe, beforeAll, it, expect } from '@ohos/hypium'

const LAUNCHER_BUNDLE_NAME = 'com.example.myapplication1';
const LAUNCHER_MAIN_ABILITY = 'com.example.myapplication1.MainAbility';
const DEFAULT_FLAG = bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const INVALID_CODE = 1;
let userId = 0;

export default function ActsBmsJsUnPermissionTest() {
describe('ActsBmsJsUnPermissionTest', function () {

    beforeAll(async function (done) {
        await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
            console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
            userId = account;
            done();
          }).catch(err=>{
            console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
            done();
          })
    });

    /*
     * @tc.number: SUB_BMS_APPINFO_GETABILITYINFO_0006
     * @tc.name: getAbilityInfoUnPermission
     * @tc.desc: test getAbilityInfo
     */
    it('getAbilityInfo_100', 0, async function (done) {
        await bundle.getAbilityInfo(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY).then(data => {
            expect().assertFail();
        }).catch(err => {
            expect(err).assertEqual(INVALID_CODE);
        });
        bundle.getAbilityInfo(LAUNCHER_BUNDLE_NAME, LAUNCHER_MAIN_ABILITY, (err, data) => {
            expect(err).assertEqual(INVALID_CODE);
            expect(data).assertEqual(undefined);
            done();
        });
    });
})
}
