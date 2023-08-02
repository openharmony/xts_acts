/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ServiceExtensionAbility from '@ohos.app.ability.ServiceExtensionAbility';
import rpc from '@ohos.rpc';

class StubTest extends rpc.RemoteObject {
  constructor(des) {
    super(des);
  }
  onRemoteRequest(code, data, reply, option) {
    return true;
  }
}

export default class ServiceExtAbility extends ServiceExtensionAbility {
  onCreate(want) {
    console.log(`onCreate: ${JSON.stringify(want)}`);
  }
  onRequest(want, startId) {
    console.log(`onRequest: ${JSON.stringify(want)}`);
  }
  onConnect(want) {
    console.log('onConnect END');
    return new StubTest('stub');
  }
  onDisconnect(want): void {
    console.log(`HXW onDisconnect: ${JSON.stringify(want)}`);
  }
  onDestroy() {
    console.log('onDestroy');
  }
}