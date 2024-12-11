/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import worker, { ThreadWorkerGlobalScope, MessageEvents } from '@ohos.worker';
import hilog from '@ohos.hilog';
import application from '@ohos.app.ability.application';
import { commonEventManager } from '@kit.BasicServicesKit';

let workerPort: ThreadWorkerGlobalScope = worker.workerPort;

workerPort.onmessage = (e : MessageEvents): void => {
    hilog.info(0x0000, 'testTag', 'worker start!');
    let context1 = application.getApplicationContext();
    hilog.info(0x0000, 'testTag', 'context1: %{public}s', JSON.stringify(context1));
    if (context1.applicationInfo.name == 'com.example.getapplicationcontexthap') {
      commonEventManager.publish('0400', (err, data)=>{
        hilog.info(0x0000, 'testTag', 'customData, 0400 msg, err=' + JSON.stringify(err));
        hilog.info(0x0000, 'testTag', 'customData, 0400 msg, data=' + JSON.stringify(data));
      })
    } else {
      hilog.info(0x0000, 'testTag', 'context1.applicationInfo.name = %{public}s', context1.applicationInfo.name);
    }
}