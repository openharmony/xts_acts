/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
export default struct FeatureAbilityAbilityName {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear FeatureAbilityAbilityName start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear FeatureAbilityAbilityName end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("featureAbility-SubscribeMessageResponse-DeviceId")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeMessageResponseDeviceIdText")
        .onClick(() => {
          FeatureAbility.subscribeMsg({
            success: (data) => {
              console.log(`deviceId: ${data.deviceId}`)
            },
            fail: (data, code) => {
              console.log(`data: ${data} code: ${code}`)
            }
          })
        })

      Text("featureAbility-SubscribeMessageResponse-AbilityName")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeMessageResponseAbilityNameText")
        .onClick(() => {
          FeatureAbility.subscribeMsg({
            success: (data) => {
              console.log(`deviceId: ${data.abilityName}`)
            },
            fail: (data, code) => {
              console.log(`data: ${data} code: ${code}`)
            }
          })
        })

      Text("featureAbility-CallAbilityParam-AbilityName")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("callAbilityParamAbilityNameText")
        .onClick(() => {
          FeatureAbility.callAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1001,
            data: {
              firstNum: 1024,
              secondNum: 2048
            },
            abilityType: 0,
            syncOption: 0
          })
        })

      Text("featureAbility-CallAbilityParam-MessageCode")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("callAbilityParamMessageCodeText")
        .onClick(() => {
          FeatureAbility.callAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1001,
            data: {
              firstNum: 1024,
              secondNum: 2048
            },
            abilityType: 0,
            syncOption: 0
          })
        })

      Text("featureAbility-CallAbilityParam-AbilityType")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("callAbilityParamAbilityTypeText")
        .onClick(() => {
          FeatureAbility.callAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1001,
            data: {
              firstNum: 1024,
              secondNum: 2048
            },
            abilityType: 0,
            syncOption: 0
          })
        })

      Text("featureAbility-CallAbilityParam-SyncOption")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("callAbilityParamSyncOptionText")
        .onClick(() => {
          FeatureAbility.callAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1001,
            data: {
              firstNum: 1024,
              secondNum: 2048
            },
            abilityType: 0,
            syncOption: 0
          })
        })

      Text("featureAbility-SubscribeAbilityEventParam-AbilityName")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeAbilityEventParamAbilityNameText")
        .onClick(() => {
          FeatureAbility.subscribeAbilityEvent({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1005,
            abilityType: 0,
            syncOption: 0
          }, (callbackData) => {
            var callbackJson = JSON.parse(callbackData);
            console.info('eventData is: ' + JSON.stringify(callbackJson.data));
          })
        })

      Text("featureAbility-SubscribeAbilityEventParam-MessageCode")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeAbilityEventParammessageCodeText")
        .onClick(() => {
          FeatureAbility.subscribeAbilityEvent({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1005,
            abilityType: 0,
            syncOption: 0
          }, (callbackData) => {
            var callbackJson = JSON.parse(callbackData);
            console.info('eventData is: ' + JSON.stringify(callbackJson.data));
          })
        })

      Text("featureAbility-SubscribeAbilityEventParam-AbilityType")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeAbilityEventParamAbilityTypeText")
        .onClick(() => {
          FeatureAbility.subscribeAbilityEvent({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1005,
            abilityType: 0,
            syncOption: 0
          }, (callbackData) => {
            var callbackJson = JSON.parse(callbackData);
            console.info('eventData is: ' + JSON.stringify(callbackJson.data));
          })
        })

      Text("featureAbility-SubscribeAbilityEventParam-SyncOption")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("subscribeAbilityEventParamSyncOptionText")
        .onClick(() => {
          FeatureAbility.subscribeAbilityEvent({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            messageCode: 1005,
            abilityType: 0,
            syncOption: 0
          }, (callbackData) => {
            var callbackJson = JSON.parse(callbackData);
            console.info('eventData is: ' + JSON.stringify(callbackJson.data));
          })
        })


      Text("featureAbility-SendMessageOptions-DeviceId")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sendMessageOptionsDeviceIdText")
        .onClick(() => {
          FeatureAbility.sendMsg({
            deviceId: '1001',
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility'
          })
        })

      Text("featureAbility-SendMessageOptions-AbilityName")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("sendMessageOptionsAbilityNameText")
        .onClick(() => {
          FeatureAbility.sendMsg({
            deviceId: '1001',
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility'
          })
        })

      Text("featureAbility-RequestParams-AbilityName")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("requestParamsAbilityNameText")
        .onClick(() => {
          FeatureAbility.startAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility'
          })
        })

      Text("featureAbility-Entities")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("entitiesText")
        .onClick(() => {
          FeatureAbility.startAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            entities: ["this is a test"]
          })
        })

      Text("featureAbility-DeviceType")
        .width(320)
        .height(50)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("deviceTypeText")
        .onClick(() => {
          FeatureAbility.startAbility({
            bundleName: 'com.example.hiaceservice',
            abilityName: 'com.example.hiaceservice.ComputeServiceAbility',
            deviceType: 1001
          })
        })

    }.width("100%").height("100%")
  }
}

