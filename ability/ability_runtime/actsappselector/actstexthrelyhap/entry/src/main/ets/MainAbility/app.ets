/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import featureAbility from "@ohos.ability.featureAbility"
import commonEvent from '@ohos.commonEvent'
export default {
  onCreate() {
    console.info('Application onCreate')
    try{
      featureAbility.getWant((err, data) => {
        var want = data;
        try{
          console.log("[Demo] MainAbility onForeground want: " + JSON.stringify(want))
          let commonEventData = {
            code: 0,
            data: 'texthrelyhap',
            parameters: {
              abilityName: want.abilityName,
              bundleName: want.bundleName,
              type: want.type,
              uri:want.parameters.uri
            }
          }
          commonEvent.publish('AppSelector', commonEventData, (err) => {
            console.log('======>texthrelyhap MainAbility published<======')
          })

          AppStorage.SetOrCreate('bundleName', want.bundleName);
          AppStorage.SetOrCreate('abilityName', want.abilityName);
          AppStorage.SetOrCreate('type', want.type);
          AppStorage.SetOrCreate('uri', want.parameters.uri);
        }catch(error)
        {
          console.info('Application onCreate error ='+ error);
          AppStorage.SetOrCreate('err1', error.message);
        }
      });
    }catch(err)
    {
      console.info('Application onCreate err ='+ err);
      AppStorage.SetOrCreate('err2', err.message);
    }
  },
  onDestroy() {
    console.info('Application onDestroy')
  },
}