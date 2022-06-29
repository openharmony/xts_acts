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

export default class MainAbility1 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility1 onCreate")
        globalThis.abilityWant = want;
        console.log("[Demo] MainAbility1 context: " + JSON.stringify(this.context));
        var listKey1 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                listKey1.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityWindowStageCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityWindowStageCreate");
                listKey1.push(abilityname + " onAbilityWindowStageCreate");
                console.log("[Demo] 2listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityWindowStageDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityWindowStageDestroy");
                listKey1.push(abilityname + " onAbilityWindowStageDestroy");
                console.log("[Demo] 3listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                listKey1.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                listKey1.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                listKey1.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey1:" + JSON.stringify(listKey1));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback1 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                listKey1.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey1:" + JSON.stringify(listKey1));
            }
        }
        let applicationContext = this.context.getApplicationContext();
        console.log("[Demo] MainAbility1 applicationContext: " + JSON.stringify(applicationContext));
        let lifecycleid = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback1 number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] registerAbilityLifecycleCallback1 listKey: " + JSON.stringify(listKey1));
            globalThis.list1 = listKey1;
            globalThis.callbackid1 = lifecycleid;
        }, 2500);
    }

    onDestroy() {
        console.log("[Demo] MainAbility1 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility1 onWindowStageCreate")
        globalThis.ability1context = this.context;
        windowStage.setUIContent(this.context, "pages/index1", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility1 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility1 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility1 onBackground")
    }
};
