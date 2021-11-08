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
import abilityManager from '@ohos.app.abilitymanager'

import { Core, ExpectExtend, ReportExtend } from 'deccjsunit/index'

export default {
    currentCase: "",
    data: {
        title: "AbilityA1",
        logmessage: "this is log message",
        testcase: [
            "AppPermission_0100",
            "AppPermission_0200",
            "AppPermission_0300",
            "AppPermission_0400",
            "AppPermission_0500",
            "AppPermission_0600",
            "AppPermission_0700",
            "AppPermission_0800",
            "AppPermission_0900",
            "AppPermission_1000",
            "AppPermission_1100",
            "AppPermission_1200",
            "AppPermission_1300",
            "AppPermission_1400",
            "AppPermission_1500",
            "AppPermission_1600",
            "AppPermission_1700",
            "AppPermission_1800",
            "AppPermission_1900",
            "AppPermission_2000",
            "AppPermission_2100",
            "AppPermission_2200",
            "AppPermission_2300",
            "AppPermission_2400",
            "AppPermission_2500",
            "AppPermission_2600_ResPermission",
            "AppPermission_2600",
            "AppPermission_2700_ResPermission",
            "AppPermission_2700",
            "AppPermission_2800_ResPermission",
            "AppPermission_2800",
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
    testAction() {
        console.info('===========per testAction===========>')
        const core = Core.getInstance()
        const expectExtend = new ExpectExtend({
            'id': 'extend'
        })
        const reportExtend = new ReportExtend(file)
        core.addService('expect', expectExtend)
        core.addService('report', reportExtend)
        core.init()
        const configService = core.getDefaultService('config')
        configService.setConfig(this)

        require('../../../test/List.test')
        core.execute()
    },
    runCase(caseName) {
        console.debug("======per runCase======>:" + JSON.stringify(caseName))
        this.logmessage += caseName + "\n"
        console.debug("======per runallcase======<:")
        let { runAllCase } = require('./permissioncase.js')
        runAllCase(caseName, this)

    },
    CaseChange(newValue) {
        let { GetCaseInfo } = require('./permissioncase.js')
        this.logmessage = newValue.value
        this.logmessage += GetCaseInfo(newValue.value)
        this.currentCase = newValue.value
    },
    RunSelectCase() {
        let { runAllCase } = require('./permissioncase.js')
        runAllCase(this.currentCase, this)
    },
    ShowMenu() {
        this.logmessage = "show"
        this.$element("menu-wraper").show({ x: 200, y: 200 })
    }
}
