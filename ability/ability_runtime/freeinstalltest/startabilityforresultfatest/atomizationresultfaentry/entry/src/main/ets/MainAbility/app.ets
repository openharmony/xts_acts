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

class Test {
  onCreate() {
    console.info('Application onCreate')
  }
  onDestroy() {
    console.info('Application onDestroy')
  }
  onStartContinuation() {
    console.info('onStartContinuation');
    return true;
  }

  onActive(){
    console.info('onActive');
    setTimeout(() => {
      console.info('fAStartAbilityForResultPromise terminateSelfWithResult START');
      featureAbility.terminateSelfWithResult(
        {
          resultCode: 1,
          want:
          {
            bundleName: "com.example.qianyiyingyong.hmservice",
            abilityName: "com.example.qianyiyingyong.hmservice.MainAbility",
          },
        }
      );
      console.info('fAStartAbilityForResultPromise terminateSelfWithResult END');
    }, 1000);
  }

  onRestoreData(data:string) {
    console.info('onRestoreData' + data);
    return true;
  }
  onSaveData(data:string) {
    console.info('onSaveData' + data);
    return true;
  }
  onCompleteContinuation(result:string) {
    console.info('onCompleteContinuation:' + result);
  }
}

export default new Test()