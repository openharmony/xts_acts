/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import ServiceExtension from '@ohos.app.ability.ServiceExtensionAbility'
import commonEventManager from '@ohos.commonEventManager'
import IdlServiceExtStub from '../IdlServiceExt/idl_service_ext_stub';
import { addCallback } from '../IdlServiceExt/i_idl_service_ext';
import Logger from '../util/Logger';

class ServiceExtStub extends IdlServiceExtStub{

  add(num1: number, num2: number, callback: addCallback): void{
      let res = num1 + num2;
      callback(0,res);
      Logger.info(`add result: ${res}`);
  }
}

let testServiceDestroyEvent = 'testServiceDestroyEvent';

export default class TestServiceExtAbilityEvent extends ServiceExtension {
  onCreate(want) {
    Logger.info(`tss onCreate, want: ${want.abilityName}`);
  }

  onRequest(want, startId) {
    Logger.info(`tss onRequest, want: ${want.abilityName}`);
  }

  onConnect(want) {
    Logger.info(`TestServiceExtAbilityEvent___onConnect , want: ${want.abilityName}`);
    return new ServiceExtStub("add service stub");
  }

  onDisconnect(want) {
    commonEventManager.publish(testServiceDestroyEvent, (err) => { });
    Logger.info(`TestServiceExtAbilityEvent___onDisconnect, want: ${want.abilityName}`);
  }

  onDestroy() {
    commonEventManager.publish(testServiceDestroyEvent, (err) => { 
      Logger.info(`TestServiceExtAbilityEvent___onDestroy subServiceDestroyEvent publish success`);
    });
    let start1 = (new Date()).getTime();
    while((new Date()).getTime() - start1 < 1000){};
    Logger.info(`TestServiceExtAbilityEvent___onDestroy`);
  }
}