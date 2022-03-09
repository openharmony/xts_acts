// @ts-nocheck
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
import events_emitter from '@ohos.emitter';

@Entry
@Component
struct EllipseExample {

  onActive(){
    console.log("lifecycle-->onActive")
  }
  onInactive(){
    console.log("lifecycle-->onInactive")
  }
  onShow(){
    console.log("lifecycle-->onShow")
  }
  onCastTempToNormal(){
    console.log("lifecycle-->onCastTempToNormal")
  }
  onVisibilityChanged(){
    console.log("lifecycle-->onVisibilityChanged")
  }
  onTriggerEvent(){
    console.log("lifecycle-->onTriggerEvent")
  }
  onDelete(){
    console.log("lifecycle-->onDelete")
  }
  onAcquireFormState(){
    console.log("lifecycle-->onAcquireFormState")
  }
  onHide(){
    console.log("lifecycle-->onHide")
  }
  onWindowDisplayModeChanged(){
    console.log("lifecycle-->onWindowDisplayModeChanged")
  }
  onStartContinuation(){
    console.log("lifecycle-->onStartContinuation")
  }
  onSaveData(){
    console.log("lifecycle-->onSaveData")
  }
  onCompleteContinuation(){
    console.log("lifecycle-->onCompleteContinuation")
  }
  onRestoreData(){
    console.log("lifecycle-->onRestoreData")
  }
  onRemoteTerminated(){
    console.log("lifecycle-->onRemoteTerminated")
  }
  onSaveAbilityState(){
    console.log("lifecycle-->onSaveAbilityState")
  }
  onRestoreAbilityState(){
    console.log("lifecycle-->onRestoreAbilityState")
  }
  onInactive(){
    console.log("lifecycle-->onInactive")
  }
  onActive(){
    console.log("lifecycle-->onActive")
  }
  onNewWant(){
    console.log("lifecycle-->onNewWant")
  }
  onMemoryLevel(){
    console.log("lifecycle-->onMemoryLevel")
  }
  onCommand(){
    console.log("lifecycle-->onCommand")
  }
  onStop(){
    console.log("lifecycle-->onStop")
  }
  onConnect(){
    console.log("lifecycle-->onConnect")
  }
  onDisconnect(){
    console.log("lifecycle-->onDisconnect")
  }
  onReconnect(){
    console.log("lifecycle-->onReconnect")
  }
  update(){
    console.log("lifecycle-->update")
  }
  normalizeUri(){
    console.log("lifecycle-->normalizeUri")
  }
  batchInsert(){
    console.log("lifecycle-->batchInsert")
  }
  denormalizeUri(){
    console.log("lifecycle-->denormalizeUri")
  }
  openFile(){
    console.log("lifecycle-->openFile")
  }
  getFileTypes(){
    console.log("lifecycle-->getFileTypes")
  }
  onInitialized(){
    console.log("lifecycle-->onInitialized")
  }
  getType(){
    console.log("lifecycle-->getType")
  }

  build(){
    Column(){
      Button('click')
        .key('button')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({top: 20})
    }
  }
}