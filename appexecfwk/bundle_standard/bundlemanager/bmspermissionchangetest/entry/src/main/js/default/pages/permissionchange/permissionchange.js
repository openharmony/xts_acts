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
import router from '@system.router';

export default {
    data: {
        title: "Bms permission change",
        logmessage: "This is log message:\n",
        testcase: [
                [
                        "registerPermissionChange",
                        "requestPermissions",
                        "unregisterPermissionChange",
                ],
                [
                        "registerPermissionChange",
                        "requestNotExistPermissions",
                        "unregisterPermissionChange",
                ],
                [
                        "registerThreeAppsPermissionChange",
                        "requestPermissionsFirst",
                        "startFirstRequestPermissions",
                        "startSecondRequestPermissions",
                        "unregisterThreeAppsPermissionChange",
                ],
                [
                        "registerErrPermissionChange",
                        "requestPermissionsSecond",
                ],
                [
                        "registerPermissionChangeRepeat",
                        "requestPermissionsThird",
                        "unregisterPermissionChange",
                ],
                [
                        "registerThreePermissionChangeCallback",
                        "requestPermissionsFourth",
                        "unregisterThreePermissionChangeCallback",
                ],
                [
                        "registerThreePermissionChangeCallback",
                        "requestPermissionsFifth",
                        "unregisterPermissionChangeNoCallback",
                ],
                [
                        "registerPermissionChangeRepeat",
                        "requestPermissionsSixth",
                        "unregisterPermissionChangeNoCallback",
                ],
                [
                        "registerAnyPermissionChange",
                        "requestPermissionsSeventh",
                        "unregisterAnyPermissionChange",
                ],
                [
                        "registerAnyPermissionChange",
                        "requestNotExistPermissions",
                        "unregisterAnyPermissionChange",
                ],
                [
                        "registerThreeAnyPermissionChange",
                        "requestPermissionsEighth",
                        "startFirstRequestPermissions",
                        "startSecondRequestPermissions",
                        "unregisterThreeAnyPermissionChange",
                ],
                [
                        "registerErrAnyPermissionChange",
                        "requestPermissionsNinth",
                ],
                [
                        "registerAnyPermissionChangeRepeat",
                        "requestPermissionsTenth",
                        "unregisterAnyPermissionChange",
                ],
                [
                        "registerThreeAnyPermissionChangeCallback",
                        "requestPermissionsEleventh",
                        "unregisterThreeAnyPermissionChangeCallback",
                ],
                [
                        "registerAnyPermissionChangeRepeat",
                        "requestPermissionsTwelfth",
                        "unregisterAnyPermissionChangeNoCallback",
                ],
                [
                        "registerThreeAnyPermissionChangeCallback",
                        "requestPermissionsThirteenth",
                        "unregisterAnyPermissionChangeNoCallback",
                ],
                [
                        "registerPermissionChange",
                        "requestPermissionsFifteenth",
                        "unregisterErrPermissionChange",
                        "unregisterPermissionChange",
                ],
                [
                        "registerAnyPermissionChange",
                        "requestPermissionsFourteenth",
                        "unregisterErrAnyPermissionChange",
                        "unregisterAnyPermissionChange",
                ]
        ],
    },
    onInit() {
        this.title = "Bms permission change";
        this.logmessage = "This is log message:\n";
        this.caseNum = this.num;
        this.caseItem = this.item;
    },
    onShow() {
    },
    onReady() {
        console.info('onReady finish')
    },
    onBackPress() {
    },
    async stopAbility() {
    },
    backIndex() {
        router.replace({
            uri: 'pages/index/index'
        })
    },
    async runTest(funcName) {
        console.debug("======Run func ======:" + JSON.stringify(funcName))
        let { runFunc } = require('./testfunc.js')
        this.logmessage += await runFunc(funcName, this) + '\n';
    },
    clearLog() {
        this.logmessage = "";
    }
}
