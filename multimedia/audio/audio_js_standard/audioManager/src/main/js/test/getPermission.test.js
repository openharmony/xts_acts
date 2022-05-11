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

import { describe, beforeAll,afterAll, it, expect } from 'deccjsunit/index';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';

describe("get_permission", function () {

    /**
   * @tc.number SUB_DF_GRANT_USER_GRANTED_PERMISSION_0000
   * @tc.name grant_user_granted_permission_async_000
   * @tc.desc Test grantUserGrantedPermission() interfaces, grant permission.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
    it("grant_user_granted_permission_async_000", 0, async function (done) {
        let appInfo = await bundle.getApplicationInfo('ohos.acts.multimedia.audio.audiomanager', 0, 100);
        let tokenID = appInfo.accessTokenId;
        let atManager = abilityAccessCtrl.createAtManager();
        let result1 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.MEDIA_LOCATION",1);
        let result2 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.READ_MEDIA",1);
        let result3 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.WRITE_MEDIA",1);
        let result4 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.GRANT_SENSITIVE_PERMISSIONS",1);
        let result5 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.REVOKE_SENSITIVE_PERMISSIONS",1);
        let result6 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.MICROPHONE",1);
        let result7 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.ACCESS_NOTIFICATION_POLICY",1);
        let result8 = await atManager.grantUserGrantedPermission(tokenID, "ohos.permission.MODIFY_AUDIO_SETTINGS",1);
        let isGranted1 = await atManager.verifyAccessToken(tokenID, "ohos.permission.MEDIA_LOCATION");
        let isGranted2 = await atManager.verifyAccessToken(tokenID, "ohos.permission.READ_MEDIA");
        let isGranted3 = await atManager.verifyAccessToken(tokenID, "ohos.permission.WRITE_MEDIA");
        let isGranted4 = await atManager.verifyAccessToken(tokenID, "ohos.permission.GRANT_SENSITIVE_PERMISSIONS");
        let isGranted5 = await atManager.verifyAccessToken(tokenID, "ohos.permission.REVOKE_SENSITIVE_PERMISSIONS");
        let isGranted6 = await atManager.verifyAccessToken(tokenID, "ohos.permission.MICROPHONE");
        let isGranted7 = await atManager.verifyAccessToken(tokenID, "ohos.permission.ACCESS_NOTIFICATION_POLICY");
        let isGranted8 = await atManager.verifyAccessToken(tokenID, "ohos.permission.MODIFY_AUDIO_SETTINGS");
	console.info("AudioManagerLog: Perm1:"+result1);
        console.info("AudioManagerLog: Perm2:"+result2);
        console.info("AudioManagerLog: Perm3:"+result3);
        console.info("AudioManagerLog: Perm1G:"+isGranted1);
        console.info("AudioManagerLog: Perm2G:"+isGranted2);
        console.info("AudioManagerLog: Perm3G:"+isGranted3);
	console.info("AudioManagerLog: Perm4:"+result4);
        console.info("AudioManagerLog: Perm5:"+result5);
        console.info("AudioManagerLog: Perm6:"+result6);
        console.info("AudioManagerLog: Perm4G:"+isGranted4);
        console.info("AudioManagerLog: Perm5G:"+isGranted5);
        console.info("AudioManagerLog: Perm6G:"+isGranted6);
	console.info("AudioManagerLog: Perm7:"+result7);
        console.info("AudioManagerLog: Perm8:"+result8);
        console.info("AudioManagerLog: Perm7G:"+isGranted7);
        console.info("AudioManagerLog: Perm8G:"+isGranted8);
        done();
    });
});