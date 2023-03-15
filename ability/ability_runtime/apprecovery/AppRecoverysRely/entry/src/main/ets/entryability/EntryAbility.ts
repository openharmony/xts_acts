/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog'
import Ability from '@ohos.app.ability.UIAbility'
import Window from '@ohos.window'
import commonEvent from '@ohos.commonEvent'
import appRecovery from '@ohos.app.ability.appRecovery'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
let message;
let commonEventData={
    parameters:{
        message:message,
    }
}

let strAction = "";

export default class EntryAbility extends Ability {
    onCreate(want, launchParam) {
        globalThis.contextFirst = this.context;
        strAction = want.action;
        console.log(strAction + "Rely1====> want:" + JSON.stringify(want));
        console.log(strAction + "Rely1====> launchParam:" + JSON.stringify(launchParam));
        commonEventData.parameters.message = want.parameters;
    }

    onDestroy() {
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage: Window.WindowStage) {
        // Main window is created, set main page for this ability
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.ERROR);
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
    }

    onForeground() {
        // Ability has brought to foreground
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
        if (strAction == "Acts_AppRecovery_0200_once" || strAction == "Acts_AppRecovery_0400_once" ||
            strAction == "Acts_AppRecovery_0800_once" ||
            strAction == "Acts_AppRecovery_1000_once" || strAction == "Acts_AppRecovery_1200_once") {
            if (strAction == "Acts_AppRecovery_0200_once" ||
                strAction == "Acts_AppRecovery_0400_once" ||
                strAction == "Acts_AppRecovery_1200_once") {
                appRecovery.saveAppState(this.context);
                console.log(strAction + "Rely1====> saveAppState");
            } else {
                console.log(strAction + "Rely1====> not saveAppState");
            }
            setTimeout(() => {
                commonEvent.publish("ACTS_AppRecovery_First",commonEventData,(err)=>{
                    console.log(strAction + "Rely1====> publish err:" + JSON.stringify(err));
                })
            }, 200);
        }
        if (strAction == "Acts_AppRecovery_0200_twice" || strAction == "Acts_AppRecovery_0400_twice" ||
            strAction == "Acts_AppRecovery_0800_twice" ||
            strAction == "Acts_AppRecovery_1000_twice" || strAction == "Acts_AppRecovery_1200_twice") {
            setTimeout(() => {
                commonEvent.publish("ACTS_AppRecovery_Second", commonEventData, (err) => {
                    console.log(strAction + "Rely1====> second publish err:" + JSON.stringify(err));
                })
            }, 200);
        }
        this.context.startAbility({
            bundleName: "com.example.apprecoverysrely",
            abilityName: "EntryAbilitySec",
            action: strAction
        },(err) => {
            console.debug(strAction + "Rely1====> startAbility err:"+JSON.stringify(err));
            if (strAction == "Acts_AppRecovery_0200_once" || strAction == "Acts_AppRecovery_0200_twice" ||
                strAction == "Acts_AppRecovery_0400_twice" ||
                strAction == "Acts_AppRecovery_0800_once" || strAction == "Acts_AppRecovery_0800_twice" ||
                strAction == "Acts_AppRecovery_1000_twice" || strAction == "Acts_AppRecovery_1200_twice") {
                setTimeout(()=>{
                    globalThis.contextFirst.terminateSelf().then(() => {
                        console.info(strAction + "Rely1====> terminateSelf end");
                    }).catch((err) => {
                        console.info(strAction + "Rely1====> terminateSelf err:" + JSON.stringify(err));
                    });
                }, 200)
            }
        });
    }

    onBackground() {
        // Ability has back to background
        hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
        hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    }

    onSaveState(reason, wantParam: {[key:string]: any}) {
        console.log(strAction + "Rely1onSaveStage====> wantParam:" + JSON.stringify(wantParam));
        return AbilityConstant.OnSaveResult.RECOVERY_AGREE;
    }
}
