/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import TestRunner from '@ohos.application.testRunner';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let abilityDelegator = undefined;
let abilityDelegatorArguments = undefined;

function translateParamsToString(parameters) {
    const keySet = new Set([
        '-s class', '-s notClass', '-s suite', '-s it',
        '-s level', '-s testType', '-s size', '-s timeout',
        '-s dryRun'
    ]);
    let targetParams = '';
    for (const key in parameters) {
        if (keySet.has(key)) {
            targetParams = `${targetParams} ${key} ${parameters[key]}`;
        }
    }
    return targetParams.trim();
}

async function onAbilityCreateCallback() {
    console.log("onAbilityCreateCallback");
}

async function addAbilityMonitorCallback(err: any) {
    console.info("addAbilityMonitorCallback : " + JSON.stringify(err));
}

export default class OpenHarmonyTestRunner implements TestRunner {
    constructor() {
    }

    onPrepare() {
        console.info("OpenHarmonyTestRunner OnPrepare ");
    }

    async onRun() {
        console.log('OpenHarmonyTestRunner onRun run');
        abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        var testAbilityName = abilityDelegatorArguments.bundleName + '.MainAbility';
        let lMonitor = {
            abilityName: testAbilityName,
            onAbilityCreate: onAbilityCreateCallback,
        };
        abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
        var cmd = 'aa start -d 0 -a com.arkui.ace.platform.api20.MainAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
        cmd += ' ' + translateParamsToString(abilityDelegatorArguments.parameters);
        var debug = abilityDelegatorArguments.parameters["-D"];
        if (debug == 'true') {
            cmd += ' -D';
        }
        console.info('cmd : ' + cmd);
        abilityDelegator.executeShellCommand(cmd,
            (err: any, d: any) => {
                console.info('executeShellCommand : err : ' + JSON.stringify(err));
                console.info('executeShellCommand : data : ' + d.stdResult);
                console.info('executeShellCommand : data : ' + d.exitCode);
            });
        console.info('OpenHarmonyTestRunner onRun end');
    }
};