/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'testTag-MainAbility1 ';
let num:number=0
export default class MainAbility1 extends UIAbility {
    onCreate(want, launchParam) {
        console.log("[Demo] MainAbility1 onCreate");

    }

    onDestroy() {
        console.log("[Demo] MainAbility1 onDestroy");
    }

    onWindowStageCreate(windowStage) {
        // Main window is created, set main page for this ability
        console.log("[Demo] MainAbility1 onWindowStageCreate");
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
        console.log("[Demo] MainAbility1 onWindowStageDestroy");
    }

    onForeground() {
        console.log("[Demo] MainAbility1 onForeground");
        setTimeout(()=>{
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
        },1000);
    }

    onBackground() {
        // Ability has back to background
        console.log("[Demo] MainAbility1 onBackground");
    }

    onWindowStageWillDestroy(){
        num+=1;
        console.log("[Demo] MainAbility1 onWindowStageWillDestroy");
        let options: commonEventManager.CommonEventPublishData = {
            code: 1,
            parameters: {
                'result': num
            }
        };
        commonEventManager.publish('OnWindowStageWillDestory01', options, (err: BusinessError) => {
            if (err) {
                hilog.info(0x0000, TAG, "[%{public}s] PublishCallBack err: %{public}s", TAG, JSON.stringify(err));
            } else {
                hilog.info(0x0000, TAG, "[%{public}s] Publish success", TAG);
            }
        });
    }
};
