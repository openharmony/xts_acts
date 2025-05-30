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
import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';

export default class Hap2MainAbility3 extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] Hap2MainAbility3 onCreate")
        globalThis.abilityWant = want;

        setTimeout(() => {
            this.context.terminateSelf().then((data) => {
                console.log("Hap2MainAbility3 EventTest terminateSelf data: " + JSON.stringify(data));
            }).catch((error) => {
                console.log("Hap2MainAbility3 EventTest terminateSelf error: " + JSON.stringify(error));
            })
        }, 2000)
    }

    onDestroy() {
        console.log("[Demo] Hap2MainAbility3 onDestroy")
        commonEvent.publish('Hap2MainAbility3onDestroy', (err) => {
            console.log('Hap2MainAbility3onDestroy');
        });
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] Hap2MainAbility3 onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/Hap2MainAbility3_pages", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] Hap2MainAbility3 onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] Hap2MainAbility3 onForeground")
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] Hap2MainAbility3 onBackground")
    }
};
