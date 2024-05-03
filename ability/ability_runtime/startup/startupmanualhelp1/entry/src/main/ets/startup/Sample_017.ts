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

import StartupTask from '@ohos.app.appstartup.StartupTask'
import hilog from '@ohos.hilog';
import commonEventManager from '@ohos.commonEventManager';

const NAME = "Sample_017";

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

@Sendable
export default class Sample_017 extends StartupTask {

  async init(context) {
    hilog.info(0x0000, 'StartupTest', '%{public}s', NAME);
    console.info("StartupTest Sample_017 init");
    await sleep(2000);
    commonEventManager.publish('StartupSample_017', (err, data)=>{
      console.log("StartupTest Sample_017 init, publish msg, err=" + JSON.stringify(err));
      console.log("StartupTest Sample_017 init, publish msg, data=" + JSON.stringify(data));
    })
  }

  onDependencyCompleted(dependence: string, result) {
    hilog.info(0x0000, 'StartupTest', '%{public}s, dependence:%{public}s, result:%{public}s', NAME, dependence,
      JSON.stringify(result));
    console.info("StartupTest Sample_017 onDependencyCompleted dependence=" + dependence);
    console.info("StartupTest Sample_017 onDependencyCompleted result=" + JSON.stringify(result));
  }
}