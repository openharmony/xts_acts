/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Ability from '@ohos.application.Ability'
import commonEvent from '@ohos.commonEvent'
export default class SecondAbility extends Ability {
    onCreate(want, launchParam) {
        console.log("[Demo] SecondAbility onCreate")
        globalThis.abilityWant = want;
        AppStorage.SetOrCreate('bundleName', want.bundleName);
        AppStorage.SetOrCreate('abilityName', want.abilityName);
        AppStorage.SetOrCreate('type', want.type);
        AppStorage.SetOrCreate('uri', want.parameters.uri);
    }

    onDestroy() {
        console.log("[Demo] SecondAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] SecondAbility onWindowStageCreate")

        windowStage.setUIContent(this.context, "pages/index", null)
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] SecondAbility onWindowStageDestroy")

    }

    onForeground() {
        // Ability has brought to foreground
        console.log("[Demo] SecondAbility onForeground")
        console.log("[Demo] SecondAbility onForeground want: " + JSON.stringify(globalThis.abilityWant))
        let commonEventData = {
            code: 0,
            data: 'imageerelyhap',
            parameters: {
                abilityName: globalThis.abilityWant.abilityName,
                bundleName: globalThis.abilityWant.bundleName,
                type: globalThis.abilityWant.type,
                uri: globalThis.abilityWant.parameters.uri
            }
        }
        commonEvent.publish('AppSelector', commonEventData, (err) => {
            console.log('======>imageerelyhap SecondAbility published<======')
        })
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] SecondAbility onBackground")
    }
};