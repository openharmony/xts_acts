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
import file from '@system.file'
import app from '@system.app'
import router from '@system.router';
import featureAbility from '@ohos.ability.featureability'

import { Core, ExpectExtend, ReportExtend } from 'deccjsunit/index'

export default {
    currentCase: "",
    data: {
        title: "AbilityA1",
        logmessage: "this is log message",
        testcase: [
            "AppPermission_1300",
            "AppPermission_1400",
            "AppPermission_1500",
            "AppPermission_1600",
            "AppPermission_1700",
            "AppPermission_1800",
        ],
    },
    onInit() {
        this.title = "AbilityA1";
        this.logmessage = "this is log message";

    },
    onShow() {
    },
    onReady() {
        console.info('onReady finish')
    },
    onBackPress() {
    },
    async stopAbility() {
        console.info('===========AmsJsStSubPermission close===========<')
        await featureAbility.terminateAbility();
        await app.killProcessesByBundleName();
    },
    runCase(caseName) {
        console.debug("======runCase======>:" + JSON.stringify(caseName))
        this.logmessage += caseName + "\n"
        console.debug("======runallcase======<:")
        let { runAllCase } = require('./permissioncase.js')
        runAllCase(caseName, this)

    },
    CaseChange(newValue) {
        let { GetCaseInfo } = require('./permissioncase.js')
        this.logmessage = newValue.value
        this.logmessage += GetCaseInfo(newValue.value)
        this.currentCase = newValue.value
    },
}
