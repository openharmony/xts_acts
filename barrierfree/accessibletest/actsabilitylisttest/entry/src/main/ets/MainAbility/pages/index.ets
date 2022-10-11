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
import file from '@system.file'
import config from '@ohos.accessibility.config'
import accessibility from '@ohos.accessibility'
import prompt from '@ohos.prompt'

const AUDIBLE_BUNDLE_NAME = 'com.example.accessibleaudibleability.hmservice/ServiceExtAbility'
const GENERIC_BUNDLE_NAME = 'com.example.accessiblegenericability.hmservice/ServiceExtAbility'
const HAPTIC_BUNDLE_NAME = 'com.example.accessiblehapticability.hmservice/ServiceExtAbility'
const SPOKEN_BUNDLE_NAME = 'com.example.accessiblespokenability.hmservice/ServiceExtAbility'
const VISUAL_BUNDLE_NAME = 'com.example.accessiblevisualability.hmservice/ServiceExtAbility'
const LOG_PREFIX = '[CQH-ABILITY-LIST-TEST-MANUAL]'

@Entry
@Component
struct Index {
  @State message: string = 'AbilityListTest'
  @State abilityListsCallBack: string = ''
  @State abilityListsPromise: string = ''

  aboutToAppear() {
    console.info("start run aboutToAppear")
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('AbilityList_0170-0180启动辅助应用')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
          .margin(5)
          .onClick((e) => {
            this.enableAbility(LOG_PREFIX, [AUDIBLE_BUNDLE_NAME, GENERIC_BUNDLE_NAME])
          })
        Button('AbilityList_0170-0180关闭辅助应用')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
          .margin(5)
          .onClick((e) => {
            this.disableAbility(LOG_PREFIX, [AUDIBLE_BUNDLE_NAME])
          })
        Button('AbilityList_0170(callback)查询辅助应用')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
          .margin(5)
          .onClick((e) => {
            accessibility.getAbilityLists('all', 'enable', (err, data) => {
              if (err.code != 0) {
                console.error(LOG_PREFIX + 'failed to getAbilityLists because ' + JSON.stringify(err))
                return
              }
              console.error(LOG_PREFIX + 'success data:getAbilityLists : ' + JSON.stringify(data))
              console.error(LOG_PREFIX + 'data.length : ' + JSON.stringify(data.length))
              this.abilityListsCallBack = JSON.stringify(data)
            })
          })
        Text(this.abilityListsCallBack)
          .fontSize(25)
        Button('AbilityList_0180(promise)查询辅助应用')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
          .margin(5)
          .onClick((e) => {
            accessibility.getAbilityLists('all', 'enable').then((data) => {
              console.error(LOG_PREFIX + 'success data:getAbilityLists : ' + JSON.stringify(data))
              console.error(LOG_PREFIX + 'data.length : ' + JSON.stringify(data.length))
              this.abilityListsPromise = JSON.stringify(data)
            }).catch((err) => {
              console.error(LOG_PREFIX + 'failed to getAbilityLists because ' + JSON.stringify(err))
            })
          })
        Text(this.abilityListsPromise)
          .fontSize(25)
      }
      .width('100%')
    }
    .height('100%')
  }

  enableAbility(logTag, bundleNameArr) {
    for (let bundleName of bundleNameArr) {
      config.enableAbility(bundleName, ['retrieve']).then((data) => {
        console.error(logTag + 'enableAbility ' + bundleName + ' success. data: ' + JSON.stringify(data))
        prompt.showToast({ message: '启动应用成功'})
      }).catch((error) => {
        console.error(logTag + 'enableAbility ' + bundleName + ' failed. Cause: ' + JSON.stringify(error))
        prompt.showToast({ message: '启动应用异常'})
        return
      })
    }
  }

  disableAbility(logTag, bundleNameArr) {
    for (let bundleName of bundleNameArr) {
      config.disableAbility(bundleName).then((data) => {
        console.error(logTag + 'disableAbility ' + bundleName + ' success. data: ' + JSON.stringify(data))
        prompt.showToast({ message: '关闭应用成功'})
      }).catch((error) => {
        console.error(logTag + 'disableAbility ' + bundleName + ' failed. Cause: ' + JSON.stringify(error))
        prompt.showToast({ message: '关闭应用异常'})
        return
      })
    }
  }
}
