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

import StartupTask from '@ohos.app.appstartup.StartupTask';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';

@Sendable
export default class Sample_003 extends StartupTask {
  constructor() {
    super();
  }
  async init(context: common.AbilityStageContext) {
    console.info('StartupTest Sample_003 init'); 
    PersistentStorage.persistProp('Sample_003_init', 'Sample_003_init');
    return 'Sample_003';
  }

  onDependencyCompleted(dependence: string, result: Object): void {
    PersistentStorage.persistProp('Sample_003_onDependencyCompleted', 1);
    console.info('StartupTest Sample_003 onDependencyCompleted dependence=' + dependence);
    console.info('StartupTest Sample_003 onDependencyCompleted result=' + JSON.stringify(result));
  }
}