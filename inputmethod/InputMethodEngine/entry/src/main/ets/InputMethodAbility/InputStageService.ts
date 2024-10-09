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
import InputMethodExtensionAbility from '@ohos.InputMethodExtensionAbility';
import { KeyboardDelegate } from './KeyboardDelegate';

export default class InputDemoService extends InputMethodExtensionAbility {
  private keyboardDelegate: KeyboardDelegate;

  onCreate(want) {
    this.keyboardDelegate = new KeyboardDelegate(this.context);
    this.keyboardDelegate.onCreate(); // 初始化窗口
  }

  onDestroy() {
    console.log("onDestroy inputStageService**");
  }
}