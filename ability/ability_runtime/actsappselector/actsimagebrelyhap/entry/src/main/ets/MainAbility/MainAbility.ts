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
// import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
// import { Hypium } from 'hypium/index'
// import testsuite from '../test/List.test'
import commonEvent from '@ohos.commonEvent'

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        console.log('MainAbility onCreate')
        globalThis.abilityWant = want;
        AppStorage.SetOrCreate('bundleName', want.bundleName);
        AppStorage.SetOrCreate('abilityName', want.abilityName);
        AppStorage.SetOrCreate('type', want.type);
        AppStorage.SetOrCreate('uri', want.parameters.uri);

        // globalThis.abilityWant = want;
        // var abilityDelegator: any
        // abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        // var abilityDelegatorArguments: any
        // abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        // console.info('start run testcase!!!')
        // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    }

    onDestroy() {
        console.log('MainAbility onDestroy')
    }

    onWindowStageCreate(windowStage) {
        console.log('MainAbility onWindowStageCreate')
        windowStage.setUIContent(this.context, 'MainAbility/pages/index', null)
    }

    onWindowStageDestroy() {
        console.log('MainAbility onWindowStageDestroy')
    }

    onForeground() {
        console.log('MainAbility onForeground')
        console.log("[Demo] MainAbility onForeground want: " + JSON.stringify(globalThis.abilityWant))
        let commonEventData = {
            code: 0,
            data: 'imagebrelyhap',
            parameters: {
                abilityName: globalThis.abilityWant.abilityName,
                bundleName: globalThis.abilityWant.bundleName,
                type: globalThis.abilityWant.type,
                uri: globalThis.abilityWant.parameters.uri
            }
        }
        commonEvent.publish('AppSelector', commonEventData, (err) => {
            console.log('======>imagebrelyhap MainAbility published<======')
        })
    }

    onBackground() {
        console.log('MainAbility onBackground')
    }
};