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

import featureAbility from '@ohos.ability.featureability'
import bundle from '@ohos.bundle'
import { Core, ExpectExtend, ReportExtend } from 'deccjsunit/index'

export default {
    data: {
        title: "checkPermission Test",
        logmessage: "check permission test: \n"
    },
    onInit() {
        this.title =  "checkPermission Test";
        this.logmessage = "check permission test: \n";
    },
    onReady() {
    },
    async requestPermissons() {
        this.logmessage += 'requestPermissons\n'
        console.debug("==========begin request permissions==========")
        var context = await featureAbility.getContext();
        await context.requestPermissionsFromUser(["com.permission.PERMISSION_THIRD1",
            "com.permission.LOCATION_IN_BACKGROUND", "com.permission.MICROPHONE"], 1,
            (err, data) => {
                console.log("RequestPermissionForUser：requestCode=" + data.requestCode);
                for (var j = 0; j < data.permissions.length; j++) {
                    console.log("RequestPermissionForUser permissions : " + data.permissions[j]);
                }

                for (var j = 0; j < data.grantResults.length; j++) {
                    console.log("RequestPermissionForUser grantResults : " + data.grantResults[j]);
                }
            });
    },

    /*
     * @tc.number: bms_checkPermission_1700
     * @tc.name: check whether the permission is granted
     * @tc.desc: verify the requested permission whose availableScope is user_grant whether is granted. (by promise)
     */
    async bms_checkPermission_1700() {
        console.info('=====================bms_checkPermission_1700==================');
        var data = await bundle.checkPermission("com.example.bmscheckpermissiontest",
            'com.permission.LOCATION_IN_BACKGROUND')
        if (data == 0) {
            this.logmessage += 'bms_checkPermission_1700 result: PERMISSION_GRANTED\n'
        } else {
            this.logmessage += 'bms_checkPermission_1700 result: PERMISSION_NOT_GRANTED\n'
        }

    },

    /*
     * @tc.number: bms_checkPermission_1800
     * @tc.name: check whether the permission is granted
     * @tc.desc: verify the requested permission whose availableScope is user_grant whether is granted. (by callback)
     */
    bms_checkPermission_1800() {
        console.info('=====================bms_checkPermission_1800==================');
        bundle.checkPermission("com.example.bmscheckpermissiontest", 'com.permission.MICROPHONE', (err, data) => {
            console.debug("======err code======:" + err.code);
            console.debug("======result======:" + data);
            if (data == 0 && err.code == 0) {
                this.logmessage += 'bms_checkPermission_1800 result: PERMISSION_GRANTED\n'
            } else {
                this.logmessage += 'bms_checkPermission_1800 result: PERMISSION_NOT_GRANTED\n'
            }

        })
    },
    /*
     * @tc.number: bms_checkPermission_1900
     * @tc.name: check whether the permission is granted
     * @tc.desc: Verify that permissions which availableScope is user_grant requested
     *                   from other apps are granted.  (by promise)
     */
    async bms_checkPermission_1900() {
        console.info('=====================bms_checkPermission_1900==================');
        var data = await bundle.checkPermission("com.example.bmscheckpermissiontest",
            'com.permission.PERMISSION_THIRD1')
        if (data == 0) {
            this.logmessage += 'bms_checkPermission_1900 result: PERMISSION_GRANTED\n'
        } else {
            this.logmessage += 'bms_checkPermission_1900 result: PERMISSION_NOT_GRANTED\n'
        }

    },

    /*
     * @tc.number: bms_checkPermission_2000
     * @tc.name: check whether the permission is granted
     * @tc.desc: Verify that permissions which availableScope is user_grant requested
     *                   from other apps are granted.  (by callback)
     */
    bms_checkPermission_2000() {
        console.info('=====================bms_checkPermission_2000==================');
        bundle.checkPermission("com.example.bmscheckpermissiontest", 'com.permission.PERMISSION_THIRD1',
            (err, data) => {
                console.debug("======err code======:" + err.code);
                console.debug("======result======:" + data);
                if (data == 0 && err.code == 0) {
                    this.logmessage += 'bms_checkPermission_2000 result: PERMISSION_GRANTED\n'
                } else {
                    this.logmessage += 'bms_checkPermission_2000 result: PERMISSION_NOT_GRANTED\n'
                }

            })
    },
    clearLog() {
        this.logmessage = "";
    }
}