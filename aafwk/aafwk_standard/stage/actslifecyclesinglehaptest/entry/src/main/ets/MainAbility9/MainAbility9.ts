/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import Ability from '@ohos.application.Ability'

export default class MainAbility9 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility9 onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        console.log("[Demo] MainAbility9 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility9 onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index9", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility9 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility9 onForeground")

        var listKey9 = [];
        var abilityName = "";
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityCreate")
                listKey9.push(abilityName + " onAbilityCreate");
            },
            onAbilityWindowStageCreate(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityWindowStageCreate")
                listKey9.push(abilityName + " onAbilityWindowStageCreate");
            },
            onAbilityForeground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityForeground")
                listKey9.push(abilityName + " onAbilityForeground");
            },
            onAbilityBackground(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityBackground")
                listKey9.push(abilityName + " onAbilityBackground");
            },
            onAbilityWindowStageDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityWindowStageDestroy")
                listKey9.push(abilityName + " onAbilityWindowStageDestroy");
            },
            onAbilityDestroy(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityDestroy")
                listKey9.push(abilityName + " onAbilityDestroy");
            },
            onAbilityContinue(ability) {
                abilityName = ability.context.abilityInfo.name;
                console.log(abilityName + " onAbilityContinue")
                listKey9.push(abilityName + " onAbilityContinue");
            }
        }
        var callBackId = this.context.getApplicationContext()
            .registerAbilityLifecycleCallback(AbilityLifecycleCallback);

        console.log("callBackId is aaa :" + callBackId);
        setTimeout(() => {
            globalThis.mainAbility9ListKey = listKey9
            globalThis.mainAbility9CallBackId = callBackId
            console.log("listKey is :" + listKey9);
            console.log("callBackId is :" + callBackId);
        }, 3000)
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility9 onBackground")
    }
};
