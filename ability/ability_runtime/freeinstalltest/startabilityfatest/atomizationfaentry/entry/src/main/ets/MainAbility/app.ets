/**
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
import featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';

class Test {
  onCreate() {
    console.info('Application onCreate')
    setTimeout(() => {
      featureAbility.terminateSelf()
        .then((data) => {
          console.info('entry terminateself succeeded: ' + data);
        }).catch((error:BusinessError) => {
        console.error('entry terminateself failed. Cause: ' + error);
      })
    }, 1000);
  }
  onDestroy() {
    console.info('Application onDestroy')
  }
  onStartContinuation() {
    console.info('onStartContinuation');
    return true;
  }
  onRestoreData(data:string) {
    console.info('onRestoreData' + data);
    return true;
  }
  onSaveData() {
    console.info('onSaveData');
    return true;
  }
  onCompleteContinuation(result:string) {
    console.info('onCompleteContinuation:' + result);
  }
}

export default new Test()