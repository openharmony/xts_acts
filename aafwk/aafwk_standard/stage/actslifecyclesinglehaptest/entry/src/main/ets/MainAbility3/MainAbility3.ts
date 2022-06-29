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

export default class MainAbility3 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility3 onCreate")
        globalThis.abilityWant = want;

        console.log("[Demo] MainAbility3 context: " + JSON.stringify(this.context));
        var listKey3 = [];
        let AbilityLifecycleCallback = {
            onAbilityCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityCreate");
                listKey3.push(abilityname + " onAbilityCreate");
                console.log("[Demo] 1listKey3:" + JSON.stringify(listKey3));
            },
            onAbilityWindowStageCreate(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityWindowStageCreate ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityWindowStageCreate abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityWindowStageCreate");
                listKey3.push(abilityname + " onAbilityWindowStageCreate");
                console.log("[Demo] 2listKey3:" + JSON.stringify(listKey3));
            },
            onAbilityWindowStageDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityWindowStageDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityWindowStageDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityWindowStageDestroy");
                listKey3.push(abilityname + " onAbilityWindowStageDestroy");
                console.log("[Demo] 3listKey3:" + JSON.stringify(listKey3));
            },
            onAbilityDestroy(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityDestroy ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityDestroy abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityDestroy");
                listKey3.push(abilityname + " onAbilityDestroy");
                console.log("[Demo] 4listKey3:" + JSON.stringify(listKey3));
            },
            onAbilityForeground(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityForeground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityForeground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityForeground");
                listKey3.push(abilityname + " onAbilityForeground");
                console.log("[Demo] 5listKey3:" + JSON.stringify(listKey3));
            },
            onAbilityBackground(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityBackground ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityBackground abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityBackground");
                listKey3.push(abilityname + " onAbilityBackground");
                console.log("[Demo] 6listKey3:" + JSON.stringify(listKey3));
            },
            onAbilityContinue(ability) {
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityContinue ability:"
                + JSON.stringify(ability));
                let abilityname = ability.context.abilityInfo.name;
                console.log("[Demo] AbilityLifecycleCallback3 onAbilityContinue abilityname:"
                + JSON.stringify(abilityname));
                console.log("[Demo] " + abilityname + " onAbilityContinue");
                listKey3.push(abilityname + " onAbilityContinue");
                console.log("[Demo] 7listKey3:" + JSON.stringify(listKey3));
            }
        }
        let applicationContext = this.context.getApplicationContext();
        console.log("[Demo] MainAbility3 applicationContext: " + JSON.stringify(applicationContext));
        let lifecycleid = applicationContext.registerAbilityLifecycleCallback(AbilityLifecycleCallback);
        console.log("[Demo] registerAbilityLifecycleCallback3 number: " + JSON.stringify(lifecycleid));
        setTimeout(function () {
            console.log("[Demo] registerAbilityLifecycleCallback3 listKey : " + JSON.stringify(listKey3));
            globalThis.list3 = listKey3;
            globalThis.callbackid3 = lifecycleid;
        }, 2000);
    }

    onDestroy() {
        console.log("[Demo] MainAbility3 onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility3 onWindowStageCreate")
        globalThis.ability3 = this.context
        windowStage.setUIContent(this.context, "pages/index3", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility3 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility onBackground")
    }
};
