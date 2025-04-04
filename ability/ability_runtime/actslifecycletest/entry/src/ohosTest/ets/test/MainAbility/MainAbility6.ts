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
import UIAbility from '@ohos.app.ability.UIAbility';
import base, { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit';
import window from '@ohos.window';
import { Want } from '@kit.AbilityKit';

const TAG: string = 'testTag-MainAbility6 ';
let result:number = 0;
export default class MainAbility6 extends UIAbility {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility6 onCreate")

    }
    onDestroy() {
        result+=1;
        console.log("[Demo] MainAbility6 onDestroy")
        console.log("[Demo] MainAbility6 result=",result)
    }
    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility6 onWindowStageCreate")
        windowStage.loadContent('testability/pages/MainAbility1_pages', (err, data) => {
            if (err.code) {
                hilog.error(0x0000, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, TAG, 'Succeeded in loading the content. Data: %{public}s',
                JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        // Main window is destroyed, release UI related resources
        console.log("[Demo] MainAbility6 onWindowStageDestroy")
    }

    onForeground() {
        console.log("[Demo] MainAbility6 onForeground")
        try {
            this.context.terminateSelf((err: BusinessError) => {
                if (err.code) {
                    // 处理业务逻辑错误
                    console.error(`terminateSelf failed, code is ${err.code}, message is ${err.message}`);
                    return;
                }
                // 执行正常业务
                console.info('terminateSelf succeed');
            });
        } catch (err) {
            // 捕获同步的参数错误
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`terminateSelf failed, code is ${code}, message is ${message}`);
        }
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility6 onBackground")
    }

    onWindowStageWillDestroy(){
        console.log("[Demo] MainAbility6 onWindowStageWillDestroy")
    }
};
