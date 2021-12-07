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
import bundle from '@ohos.bundle'
import { Core, ExpectExtend, ReportExtend } from 'deccjsunit/index'

export default {
    currentCase: "",
    data: {
        title: "AbilityA1",
        logmessage: "this is log message",
        testcase: [
            "ACTS_AppPermission_0100",
            "ACTS_AppPermission_0200",
            "ACTS_AppPermission_0300",
            "ACTS_AppPermission_0400",
            "ACTS_AppPermission_0500",
            "ACTS_AppPermission_0600",
            "ACTS_AppPermission_0700",
            "ACTS_AppPermission_0800",
            "ACTS_AppPermission_0900",
            "ACTS_AppPermission_1000",
            "ACTS_AppPermission_1100",
            "ACTS_AppPermission_1200",
            "ACTS_AppPermission_1300",
            "ACTS_AppPermission_1400",
            "ACTS_AppPermission_1500",
            "ACTS_AppPermission_1600",
            "ACTS_AppPermission_1700",
            "ACTS_AppPermission_1800",
            "ACTS_AppPermission_1900",
            "ACTS_AppPermission_2000",
            "ACTS_AppPermission_2100",
            "ACTS_AppPermission_2200",
            "ACTS_AppPermission_2300",
            "ACTS_AppPermission_2400",
            "ACTS_AppPermission_2500",
            "ACTS_AppPermission_2600",
            "ACTS_AppPermission_2700",
            "ACTS_AppPermission_2800",
        ],
    },
    onInit() {
        this.title = "AbilityA1";
        this.logmessage = "this is log message";
    },
    onShow() {
    },
    onReady() {
        console.info('====per onReady finish====>')
    },
    onBackPress() {
    },
    async stopAbility() {
        console.info('===========per close===========>')
        await featureAbility.terminateAbility();
        await app.killProcessesByBundleName();
    },
    clickAction() {
        router.replace({
            uri: 'pages/index/index'
        })
    },
    runCase(caseName) {
        console.debug("======per runCase======>:" + JSON.stringify(caseName))
        this.logmessage += caseName + "\n"
        console.debug("======per runallcase======<:")
        let { runAllCase } = require('./permissioncase.js')
        runAllCase(caseName, this)

    }
}
