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
import Ability from '@ohos.app.ability.UIAbility';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import {FloatWindowFun} from '../pages/model/FloatWindowFun';
import BundleManager from '../pages/model/BundleMangerUtils';

export default class MainAbility extends Ability {
    onCreate(want, launchParam) {
        globalThis.dir=this.context.filesDir;
        console.log("[Demo] MainAbility onCreate")
        globalThis.abilityWant = want;
        globalThis.abilityContext = this.context;
        globalThis.showFloatingWindow = false;
        BundleManager.getAppList().then(appList =>{
            globalThis.appList = appList
        })
    }

    onDestroy() {
        console.log("[Demo] MainAbility onDestroy")
    }

    onWindowStageCreate(windowStage) {

        console.log("[Demo] MainAbility onWindowStageCreate")
        let AtManager = abilityAccessCtrl.createAtManager();
        AtManager.requestPermissionsFromUser(this.context,["ohos.permission.READ_MEDIA","ohos.permission.WRITE_MEDIA",
        "ohos.permission.CAPTURE_SCREEN","ohos.permission.INTERNET","ohos.permission.CAMERA",
        "ohos.permission.MICROPHONE", "ohos.permission.START_INVISIBLE_ABILITY",
        "ohos.permission.SYSTEM_FLOAT_WINDOW","ohos.permission.GET_BUNDLE_INFO_PRIVILEGED"]).then(() => {})
        windowStage.loadContent("pages/index", (err, data) => {
            if (err.code) {
                console.error('Failed to load the content. Cause:' + JSON.stringify(err));
                return;
            }
            console.info('Succeeded in loading the content. Data: ' + JSON.stringify(data))
        });
    }

    onWindowStageDestroy() {
        console.log("[Demo] MainAbility onWindowStageDestroy")
    }

    onForeground() {
        FloatWindowFun.initAllFun();
        console.log("[Demo] MainAbility onForeground")
    }

    onBackground() {
        console.log("[Demo] MainAbility onBackground")
    }
};
