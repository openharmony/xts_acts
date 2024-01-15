/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import common from '@ohos.app.ability.common'
import context from '@ohos.app.ability.common'

// 构造单例对象
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import common from '@ohos.app.ability.common';

export default class GlobalContext {
  private constructor() {
  }

  private static instance: GlobalContext;
  private _abilityContext: common.Context = getContext(this);

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getAbility(): common.Context {
    return this._abilityContext;
  }

  setAbility(ability: common.UIAbilityContext): void {
    this._abilityContext = ability;
  }
}
/*
export default class GlobalContext {
  private constructor() {
  }
  private static instance: GlobalContext;
  private _objects = new Map<string, Object>();

  static  _abilityContext:context.UIAbilityContext  = undefined;
  static  _context: context.Context = getContext(this);

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getObject(value: string): Object | undefined {
    return this._objects.get(value);
  }

  setObject(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }

  setUIAbility(ability: common.UIAbilityContext): void {
    GlobalContext._abilityContext = ability;
  }

  getUIAbility(): common.UIAbilityContext {
    return GlobalContext._abilityContext;
  }

  getAbility(): common.Context {
    return GlobalContext._context = ability;
  }

  setAbility(ability: common.Context): void {
    GlobalContext._context = ability;
  }
}
*/