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
import commonEvent from '@ohos.commonEvent'

let connectionId = -1;

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        // Ability is creating, initialize resources for this ability
        console.log("MainAbility onCreate")
        globalThis.abilityWant = want;
    }

    onDestroy() {
        // Ability is destroying, release resources for this ability
        console.log("MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("MainAbility onWindowStageCreate")
        globalThis.abilityContext = this.context;

        let context = this.context;

        windowStage.setUIContent(this.context, "pages/index/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("MainAbility onWindowStageDestroy")
    }

    onForeground() {
        // Ability has brought to foreground
        console.log("ACTS_Process_MultiInstance_HapBE MainAbility onForeground")
        commonEvent.publish("HapBE_To_Test_CommonEvent", () => {
            console.log("ACTS_Process_MultiInstance_HapBE Publish CallBack HapBE_To_Test_CommonEvent")
        });
    }

    onBackground() {
        // Ability has back to background
        console.log("MainAbility onBackground")
    }
};